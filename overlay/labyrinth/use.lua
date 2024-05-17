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

    local item = event.params.item
    local labyrinthManager = event.params.labyrinthManager
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    local lineHeightOne = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local popupRectWidth = display.contentWidth * 0.5 - CONSTANTS.rectanglePadding
    local popupRectHeight = CONSTANTS.textHeight * 4 + CONSTANTS.rectanglePadding * 2
    local popupRectX = (display.contentWidth - popupRectWidth) * 0.5
    local popupRectY = (display.contentHeight - popupRectHeight) * 0.5
    
    local CONTAINER = MAIN.UI.CONTAINER
    --2 Text
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=popupRectX,
        y=popupRectY-lineHeightOne,
        width=popupRectWidth,
        height=popupRectHeight,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Found',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Found')+CONSTANTS.iconPadding,
                y=y,
                width=input.width-TEXT.textWidth('Found')-CONSTANTS.iconPadding,
                height=CONSTANTS.lineHeight,
                item=item
            })

            y = y + CONSTANTS.lineHeight
            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text=item.description
            })

            y = y + CONSTANTS.textHeight
            --5
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Would you like to use the item?'
            })
        end

    })

    local COMMON = MAIN.UI.COMMON
    local fifthWidth = display.contentWidth * 0.2
    --3 No
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX,
        y=popupRectY+lineHeightOne-CONSTANTS.rectanglePadding,
        width=fifthWidth,
        height=lineHeightOne,
        text='No',
        touch=function()
            composer.hideOverlay()
            labyrinthManager:revealSurroundings()
        end
    })

    --4 Yes
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX+popupRectWidth-fifthWidth,
        y=popupRectY+lineHeightOne-CONSTANTS.rectanglePadding,
        width=fifthWidth,
        height=lineHeightOne,
        text='Yes',
        touch=function()
            composer.hideOverlay()
            labyrinthManager:useItemAtPostiion()
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