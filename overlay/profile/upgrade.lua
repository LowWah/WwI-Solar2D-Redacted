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

    self.index = event.params.index
    local item = event.params.item
    local level = item:level()
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
    local lineHeightOne = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2


    local shardDustData = MAIN.DATA.ITEM.getItem(1, 10)
    local shardDustOwned = MAIN.PLAYER.INVENTORY.getItem(1, 10)
    local shardDustOwnedCount = shardDustOwned and shardDustOwned:count() or 0
    local shardDustRequired = level * 20
    local shardDustTextColour = shardDustOwnedCount >= shardDustRequired and CONSTANTS.textColour or CONSTANTS.textColourInvalid

    local shardRequiredItemId = (item:upgrade() - 1) * 3 + math.floor((level + 1) / 2)
    local shardRequiredData = MAIN.DATA.ITEM.getItem(3, shardRequiredItemId)
    local shardRequiredOwned = MAIN.PLAYER.INVENTORY.getItem(3, shardRequiredItemId)
    local shardRequiredOwnedCount = shardRequiredOwned and shardRequiredOwned:count() or 0
    local shardRequiredRequiredCount = (level + 1) * 5
    local shardRequiredTextColour = shardRequiredOwnedCount >= shardRequiredRequiredCount and CONSTANTS.textColour or CONSTANTS.textColourInvalid

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local popupRectWidth = display.contentWidth * 0.5 + CONSTANTS.rectanglePadding * 2
    local popupRectHeight = CONSTANTS.lineHeight * 4 + CONSTANTS.rectanglePadding * 2 + CONSTANTS.iconPadding
    local popupRectX = (display.contentWidth - popupRectWidth) * 0.5
    local popupRectY = (display.contentHeight - popupRectHeight) * 0.5

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

            local y = input.y
            --2 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' Lv 7'),
                height=CONSTANTS.lineHeight,
                item={
                    icon=item:icon(),
                    name=item:name()
                }
            })

            --3 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9'),
                height=CONSTANTS.lineHeight,
                text='Lv',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --4 skill level next
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=(level + 1),
                fontColour=CONSTANTS.textColourGreen,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --5
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Required',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            
            --6 Skill dust
            local shardDustItemName = TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9999/99'),
                height=CONSTANTS.lineHeight
            })

            shardDustItemName:setItem({icon=shardDustData.icon, name=shardDustData.name}, shardDustTextColour)

            --7 shard dust owned count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(('/' .. shardDustRequired)),
                height=CONSTANTS.lineHeight,
                text=shardDustOwnedCount,
                fontColour=shardDustTextColour,
                alignX='right',
                alignY='centre'
            })

            --8 shard dust required
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=('/' .. shardDustRequired),
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight

            
            --9 Skill shard
            local shardItemName = TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9999/99'),
                height=CONSTANTS.lineHeight
            })

            shardItemName:setItem({icon=shardRequiredData.icon, name=shardRequiredData.name}, shardRequiredTextColour)

            --10 shard dust owned count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth('/99'),
                height=CONSTANTS.lineHeight,
                text=shardRequiredOwnedCount,
                fontColour=shardRequiredTextColour,
                alignX='right',
                alignY='centre'
            })

            --8 shard dust required
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=('/' .. shardRequiredRequiredCount),
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
    local yes = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX+popupRectWidth-fifthWidth,
        y=popupRectY+lineHeightOne*2-CONSTANTS.rectanglePadding,
        width=fifthWidth,
        height=lineHeightOne,
        text='Yes',
        touch=function()
            local INVENTORY = MAIN.PLAYER.INVENTORY
            --lose skill dust
            INVENTORY.loseItem(1, 10, shardDustRequired)
            --lost skill shard
            INVENTORY.loseItem(3, shardRequiredItemId, shardRequiredRequiredCount)

            event.params.actor:skillLevelUp(event.params.index)

            --add mission here
            MAIN.PLAYER.MISSION.addMissionCount(1, 7, 1)

            MAIN.SYSTEM.SAVE.writeSave()

            composer.hideOverlay()
        end
    })

    local isYesEnabled = shardDustOwnedCount >= shardDustRequired and shardRequiredOwnedCount >= shardRequiredRequiredCount
    local yesFontColour = isYesEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
    yes:refresh({ fontColour=yesFontColour })
    yes:enableTouch(isYesEnabled)

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

        event.parent:reselect(self.index)
 
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