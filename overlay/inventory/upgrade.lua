--local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )

    --this should only be set on yes
    scene.itemId = event.params.item.id
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local lineHeightOne = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local popupRectWidth = display.contentWidth * 0.5 + CONSTANTS.rectanglePadding * 2
    local popupRectHeight = CONSTANTS.lineHeight * 5 + CONSTANTS.rectanglePadding * 2 - 8
    local popupRectX = (display.contentWidth - popupRectWidth) * 0.5
    local popupRectY = (display.contentHeight - popupRectHeight) * 0.5
    
    local upgradeItemRaw = event.params.item:upgradeItem()
    local upgradeItem = MAIN.PLAYER.INVENTORY.getItem(upgradeItemRaw.category, upgradeItemRaw.id)

    --create the add count functions here
    local counter = {
        count=0,
        --not bothered limiting when already max level
        limit=(upgradeItem and upgradeItem:count() or 0)
    }

    function counter:addCount(count)
        self.count = math.max(0, math.min(self.count + count, self.limit))
        local currentLevel = event.params.item:level()

        local itemClone = MAIN.PLAYER.INVENTORY.getItemClone(event.params.item)--event.params.item.category, event.params.item.id)
        itemClone:gainExp(self.count * 1)
        local newLevel = itemClone:level()

        sceneGroup[2][5]:setText(itemClone:level(), newLevel > currentLevel and CONSTANTS.textColourGreen or CONSTANTS.textColour)

        
        sceneGroup[2][7]:setText(itemClone:requiredExpForNext())

        sceneGroup[2][8]:setRate(itemClone:expRateForNext())

        sceneGroup[2][16]:setText(self.count)

        sceneGroup[4]:enable(self.count > 0)
    end

    --2 Upgrade group
    MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=popupRectX,
        y=popupRectY-lineHeightOne,
        width=popupRectWidth,
        height=popupRectHeight,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local item = event.params.item

            local y = input.y
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Upgrade',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Upgrade '),
                y=y,
                width=input.width-TEXT.textWidth('Upgrade '),
                height=CONSTANTS.lineHeight,
                item={
                    icon=item:icon(),
                    name=item:name()
                }
            })

            y = y + CONSTANTS.lineHeight

            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Level',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --5 level
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Level '),
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=item:level(),
                alignY='centre'
            })

            --6
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Level 10 '),
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Next',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --7 Next
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Level 10 Next '),
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=item:requiredExpForNext(),
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight * 0.5
            local gaugeHeight = 12
            --8 exp gauge
            MAIN.UI.CONTAINER.createRectangleGauge({
                parent=input.parent,
                x=input.x+CONSTANTS.textPadding,
                y=y+(CONSTANTS.lineHeight-gaugeHeight),
                width=input.width-CONSTANTS.textPadding*2,
                height=gaugeHeight,
                colour1=CONSTANTS.textColourGreen,
                rate=item:expRateForNext()
            })

            local upgradeItemRaw = item:upgradeItem()
            local upgradeData = MAIN.DATA.ITEM.getItem(upgradeItemRaw.category, upgradeItemRaw.id)
            local upgradeItem = MAIN.PLAYER.INVENTORY.getItem(upgradeItemRaw.category, upgradeItemRaw.id)
            local upgradeItemCount = 0
            local upgradeItemFOntColour = CONSTANTS.textColourInvalid
            if upgradeItem then
                upgradeItemCount = upgradeItem:count()
                upgradeItemFOntColour = CONSTANTS.textColour
            end
            y = y + CONSTANTS.lineHeight
            --9 Upgrade item
            local upgradeName = TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9999'),
                height=CONSTANTS.lineHeight
            })
            upgradeName:setItem({icon=upgradeData.icon, name=upgradeData.name}, upgradeItemFOntColour)

            --10 upgrade item owned
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=upgradeItemCount,
                fontColour=upgradeItemFOntColour,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --11,12,13,14 Count buttons
            local buttonX = input.x + CONSTANTS.textPadding
            local buttonWidth = TEXT.textWidth('-10') + CONSTANTS.textPadding * 2

            local counts = { -10, -1, 1, 10 }
            for i = 1, #counts do
                local countText = (counts[i] > 0 and '+' or '') .. tostring(counts[i])
                local r = MAIN.UI.COMMON.createRectangleWithText({
                    parent=input.parent,
                    x=buttonX+(i-1)*(buttonWidth+CONSTANTS.rectangleSpacing),
                    y=y,
                    width=buttonWidth,
                    height=CONSTANTS.lineHeight,
                    text=countText,
                    padding=0,
                    touch=function()
                        counter:addCount(counts[i])
                    end
                })
            end

            --15
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9999'),
                height=CONSTANTS.lineHeight,
                text='Use',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --16 count number
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='0',
                alignX='right',
                alignY='centre'
            })
        end
    })

    local COMMON = MAIN.UI.COMMON
    local fifthWidth = display.contentWidth * 0.2
    --3 No
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX,
        y=popupRectY+lineHeightOne*2+14,
        width=fifthWidth,
        height=lineHeightOne,
        text='No',
        touch=function()
            composer.hideOverlay()
        end
    })

    --4 Yes
    local yesRect = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX+popupRectWidth-fifthWidth,
        y=popupRectY+lineHeightOne*2+14,
        width=fifthWidth,
        height=lineHeightOne,
        text='Yes',
        touch=function()
            local item = event.params.item
            local upgradeItemRaw = item:upgradeItem()
            MAIN.PLAYER.INVENTORY.loseItem(upgradeItemRaw.category, upgradeItemRaw.id, counter.count)

            local currentLevel = item:level()

            item:gainExp(counter.count * 1)

            --add mission here
            if item:level() > currentLevel then
                local missionId = item.category == 4 and 9 or 8
                MAIN.PLAYER.MISSION.addMissionCount(1, missionId, 1)
            end

            MAIN.SYSTEM.SAVE.writeSave()

            composer.hideOverlay()
        end
    })

    function yesRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end

    yesRect:enable(false)

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        event.parent:reselect(self.itemId)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene