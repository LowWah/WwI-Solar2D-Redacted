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

    self.tag = 'battlelog'
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --1 overlay layer
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    --2 Back
    MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth * 0.8,
        y=display.contentHeight-CONSTANTS.lineHeight*3-CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        width=display.contentWidth*0.2-CONSTANTS.iconWidth-CONSTANTS.rectanglePadding,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Back',
        touch=function()
            composer.hideOverlay()
        end
    })

    
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local skillsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    --create a rectangle for base
    local rectX = CONSTANTS.rectanglePadding
    local rectY = CONSTANTS.lineHeight * 2 + CONSTANTS.rectanglePadding
    local rectWidth = display.contentWidth - skillsWidth - rectX
    local rectHeight = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding * 2 - rectY

    --3 rectangle base as logs will be a scrollview with invisible rectagnles
    local baseRect = display.newRect(sceneGroup, rectX + rectWidth * 0.5, rectY + rectHeight * 0.5, rectWidth, rectHeight)

    local fillColour = CONSTANTS.rectangleFillColour
    local strokeColour = CONSTANTS.rectangleStrokeColourInactive
    baseRect:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
    baseRect.strokeWidth = CONSTANTS.rectangleStrokeWidth
    baseRect:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])

    local CONTAINER = MAIN.UI.CONTAINER
    --4 log
    local logScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=rectX,
        y=rectY,
        width=rectWidth,
        height=rectHeight,
        spacing=0,
        rows=16,
        columns=1,
        items=event.params.log,
        create=function(input)
            --1 hide rect
            input.parent[1].isVisible = false

            --2
            MAIN.UI.TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=''
            })
            
        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2]:setText(item.text, item.fontColour)
            end
        end
    })

    logScrollView.currentLength = #event.params.log


    --5 icon
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.textPadding,
        y=CONSTANTS.lineHeight,
        width=CONSTANTS.iconWidth+CONSTANTS.rectangleStrokeWidth*2,
        height=CONSTANTS.iconHeight+CONSTANTS.rectangleStrokeWidth*2,
        padding=0,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.battleIconLog)
            icon.x=input.x
            icon.y=input.y
            input.parent:insert(icon)
        end,
        touch=function()
            composer.hideOverlay()
        end
    })

    
    sceneGroup[4]:scrollTo('bottom', { time=2 })
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen


        timer.performWithDelay(1, function(event)
            if sceneGroup[4] then
                if sceneGroup[4].currentLength ~= #sceneGroup[4].items then
                    sceneGroup[4]:setItems(sceneGroup[4].items)
    
                    sceneGroup[4]:scrollTo('bottom', { time=2 })
    
                    sceneGroup[4].currentLength = #sceneGroup[4].items
                end
            else
                --it doesnt cancel when running hideOverly on defeat so adding this condition to cancel it
                timer.cancel(event.source)
            end
        end, -1, self.tag)
 
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

    timer.cancel(self.tag)
 
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