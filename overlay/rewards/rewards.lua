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

    --instantly write save as items should have been received in event
    if not event.params.ignoreSave then
        --dont save in labyrinth
        MAIN.SYSTEM.SAVE.writeSave()
    end
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local titleWidth = display.contentWidth * 0.5 + CONSTANTS.rectanglePadding * 2
    local titleHeight = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    local x = (display.contentWidth - titleWidth) * 0.5

    local rewardsHeight = CONSTANTS.lineHeight * 4 + CONSTANTS.rectangleSpacing * 3 + CONSTANTS.rectanglePadding * 2
    local y = (display.contentHeight - (CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 5 + CONSTANTS.rectanglePadding * 2)) * 0.5

    local COMMON = MAIN.UI.COMMON
    --2 title rect
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=titleWidth,
        height=titleHeight,
        text='Items received',
        fontColour=CONSTANTS.textColourPink,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive
    })

    --3 background rect
    MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=x,
        y=y+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
        width=titleWidth,
        height=rewardsHeight,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive,
        create=function(input)
            
        end,
        refresh=function(input)
        
        end
    })

    --4 items list
    MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=x,
        y=y+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
        width=titleWidth,
        height=rewardsHeight,
        rows=4,
        columns=2,
        items=event.params.rewards,
        isTouchEnabled=false,
        create=function(input)
            input.parent[1].isVisible = false

            --2 item
            MAIN.UI.TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height
            })
        end,
        refresh=function(input)
            local item = input.item
            if item then
                local dataItem = MAIN.DATA.ITEM.getItem(item.category, item.itemId or item.id)
                local name
                if item.category == 0 then
                    name = item.count
                    MAIN.UTILITY.updateLowerUiGold()
                else
                    name = dataItem.name .. ' x' .. item.count
                end
                input.parent[2]:setItem({ icon=dataItem.icon, name=name })
            end
        end
    })

    local fifthWidth = display.contentWidth * 0.2
    --5 continue
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x+titleWidth-fifthWidth,
        y=y+rewardsHeight+CONSTANTS.rectangleSpacing*2+CONSTANTS.rectanglePadding*2,
        width=fifthWidth,
        height=titleHeight,
        text='Continue',
        touch=function()
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

        event.parent:reselect()
 
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