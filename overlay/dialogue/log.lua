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
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --1 overlay layer
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --2 back rect
    local backRect = MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=CONSTANTS.backWidth,
        height=y,
        text='Back',
        touch=function()
            composer.hideOverlay()
        end
    })

    --create a rectangle for base
    local rectX = CONSTANTS.rectanglePadding
    local rectY = y + CONSTANTS.rectanglePadding
    local rectWidth = display.contentWidth - rectX * 2
    local rectHeight = display.contentHeight - rectY - CONSTANTS.rectanglePadding

    --3 rectangle base as logs will be a scrollview with invisible rectagnles
    local baseRect = display.newRect(sceneGroup, rectX + rectWidth * 0.5, rectY + rectHeight * 0.5, rectWidth, rectHeight)

    local fillColour = CONSTANTS.rectangleFillColour
    local strokeColour = CONSTANTS.rectangleStrokeColourInactive
    baseRect:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
    baseRect.strokeWidth = CONSTANTS.rectangleStrokeWidth
    baseRect:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])

    local items = {}
    local counter = 1

    for i = 1, event.params.step do
        local dataEvent = event.params.data.events[i]
        if dataEvent.event == 'dialogue' then
            local speaker = event.params.data.speakers[dataEvent.value.speaker] or { name='????' }
            
            items[counter] = {
                name=speaker.name,
                face=speaker.face,
                frame=dataEvent.value.frame,
                dialogue=dataEvent.value.dialogue
            }
            counter = counter + 1
        end
    end

    --4 log
    local logScrollView = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=0,
        y=y,
        width=display.contentWidth,
        height=display.contentHeight-y,
        spacing=0,
        rows=3.5,
        columns=1,
        items=items,
        create=function(input)
            --1 hide rect
            input.parent[1].isVisible = false

            --2 face
            local faceGroup = display.newGroup()
            input.parent:insert(faceGroup)
            faceGroup.coords = {
                x=input.x,
                y=input.y
            }

            local x = input.x + CONSTANTS.faceWidth
            local width = input.width - CONSTANTS.faceWidth
            local TEXT = MAIN.UI.TEXT
            --3 speaker
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=width,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourPink
            })

            --4 dialogue
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=x,
                y=input.y+CONSTANTS.textHeight,
                width=width,
                text=''
            })
            
        end,
        refresh=function(input)
            local item = input.item
            if item then
                --2 face
                if item.face then
                    local face = MAIN.IMAGE.loadFacePicture(item.face, item.frame)
                    face.x = input.parent[2].coords.x
                    face.y = input.parent[2].coords.y
                    input.parent[2]:insert(face)
                end

                --3 speaker
                input.parent[3]:setText(item.name)

                --4 dialogue
                input.parent[4]:setText(item.dialogue)
            end
        end
    })

    if event.params.name then
        --5 title
        MAIN.UI.COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=CONSTANTS.backWidth,
            y=0,
            width=display.contentWidth-CONSTANTS.backWidth,
            height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
            text=event.params.name,
            fontColour=CONSTANTS.textColourPink,
        })
    end

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        
        if composer.getSceneName('current') == 'scene.dialogue.dialogue' then
            --BUG there is something wrong wiith stopping all transitions/timers which doesnt make this run if its 0
            --probably need to set the cancel transitions/ timer to dialogue only
            sceneGroup[4]:scrollTo('bottom', { time=2 })
        end
    
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

        event.parent:startProcessing()
 
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