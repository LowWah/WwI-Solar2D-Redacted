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
    local popupRectHeight = CONSTANTS.lineHeight * 4 + CONSTANTS.rectanglePadding * 2
    local popupRectX = (display.contentWidth - popupRectWidth) * 0.5
    local popupRectY = (display.contentHeight - popupRectHeight) * 0.5
    
    --create the add count functions here
    local counter = {
        count=1,
        limit=event.params.item:count(),
        recycleCount=event.params.item:recycleItem().count
    }

    function counter:addCount(count)
        self.count = math.max(1, math.min(self.count + count, self.limit))

        sceneGroup[2][10]:setText(self.count)

        sceneGroup[2][13]:setText(self.count * self.recycleCount)
    end

    --2 Recycle group
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
                text='Recycle',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Recycle '),
                y=y,
                width=input.width-TEXT.textWidth('Recycle  Owned 9999'),
                height=CONSTANTS.lineHeight,
                item={
                    icon=item:icon(),
                    name=item:name()
                }
            })

            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9999'),
                height=CONSTANTS.lineHeight,
                text='Owned',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --5 Owned count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=item:count(),
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --6,7,8,9 Count buttons
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

            --10 count number
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='1',
                alignX='right',
                alginY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --11
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Gain',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            local recycleItem = item:recycleItem()
            --12
            TEXT.drawItemName({
                parent=input.parent,
                x=buttonX-CONSTANTS.textPadding,
                y=y,
                width=(input.width - TEXT.textWidth('10000') - CONSTANTS.textPadding * 2),
                --height=CONSTANTS.lineHeight,
                item={
                    icon=recycleItem.item.icon,
                    name=recycleItem.item.name
                }
            })

            --13 Recycle count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=recycleItem.count,
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
        y=popupRectY+lineHeightOne*2-CONSTANTS.rectanglePadding,
        width=fifthWidth,
        height=lineHeightOne,
        text='No',
        touch=function()
            composer.hideOverlay()
        end
    })

    --4 Yes
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX+popupRectWidth-fifthWidth,
        y=popupRectY+lineHeightOne*2-CONSTANTS.rectanglePadding,
        width=fifthWidth,
        height=lineHeightOne,
        text='Yes',
        touch=function()
            --Maybe also need notification on remove party

            local INVENTORY = MAIN.PLAYER.INVENTORY
            local item = event.params.item
            INVENTORY.loseItem(item.category, item.id, counter.count)

            --same number of items lost for battle rewards, so if it becomes zero we remove from list
            self.count = counter.count

            local recycleItem = item:recycleItem()

            if recycleItem.category == -1 then
                --gain energy
                MAIN.PLAYER.LIVES.gainLives(counter.count * recycleItem.count, true)

            else
                INVENTORY.gainItem(recycleItem.category, recycleItem.item.id, counter.count * recycleItem.count)
    
                --for gems we also erase the item save as gems in slots arent in inventory, this needs to be after gain item as theres still level dependancies
                if item.category == 4 then
                    item.save.uniqueId = 0
                    item.save.itemId = 0
                    item.save.count = 0
                    item.save.level = 0
                    item.save.exp = 0
                end
            end

            
            MAIN.SYSTEM.SAVE.writeSave()

            composer.hideOverlay()
        end
    })

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
        
        event.parent:reselect(self.itemId, self.count)
 
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