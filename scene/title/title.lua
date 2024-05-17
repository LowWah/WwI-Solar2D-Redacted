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

    local TEXT = MAIN.UI.TEXT
    local TERMS = MAIN.TERMS

    --1
    local title = TEXT.drawText({
        parent=sceneGroup,
        text='War with Infinity',
        x=0,
        y=display.contentHeight/4,
        width=display.contentWidth,
        alignX='centre',
        fontSize=72
    })

    --2
    local edition = TEXT.drawText({
        parent=sceneGroup,
        text='Fantasy Heroine Edition',
        x=0,
        y=display.contentHeight/4+CONSTANTS.lineHeight*3,
        width=display.contentWidth,
        alignX='centre',
        fontSize=36,
        fontColour=CONSTANTS.textColourPink
    })

    --3
    local touchToStart = TEXT.drawText({
        parent=sceneGroup,
        text='Touch to start',
        x = 0,
        y = display.contentCenterY + 72,
        width = display.contentWidth,
        alignX='centre',
        fontColour={1,1,1,1}
    })
    touchToStart.alpha = 0

    --4 Invisible touch layer
    local touchLayer = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    touchLayer.isVisible = false
    touchLayer.isHitTestable = true

    touchLayer.canTouch = false
    function touchLayer:touch(event)
        if self.canTouch then
            if event.phase == 'began' then
                --Set stage to focus touch events for this object only
                local stage = display.getCurrentStage()
                stage:setFocus( self )
                self.isFocus = true
            elseif self.isFocus and event.phase == 'ended' then
                transition.cancelAll()

                MAIN.UTILITY.sceneFadeOut({
                    onComplete=function()
                        --TODO dispose audio

                        local isSaveExisting = MAIN.SYSTEM.SAVE.initializeSave()
                        local nextScene
                        if isSaveExisting then
                            nextScene = 'scene.title.initialize.initialize'
                        else
                            composer.setVariable('quest', 'intro')
                            composer.setVariable('stage', 1)
                            composer.setVariable('floor', 1)
                            composer.setVariable('battleResult', 1)

                            nextScene = 'scene.dialogue.dialogue'
                        end

                        MAIN.UTILITY.gotoScene(nextScene)
                    end
                })

                self.isFocus = false
                local stage = display.getCurrentStage()
                stage:setFocus( nil )
            end
        end
    end

    function touchLayer:enableTouch()
        self.canTouch = true
        self:addEventListener('touch', self)
    end

     --5 Options
     local iconRectangleWidth = CONSTANTS.iconWidth + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
     local iconRectangleHeight = CONSTANTS.iconHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
     local optionsRect = MAIN.UI.CONTAINER.createRectangleGroup({
         parent=sceneGroup,
         x=display.contentWidth-iconRectangleWidth,
         y=0,
         width=iconRectangleWidth,
         height=iconRectangleHeight,
         --strokeColourInactive={ 0, 0, 0, 0 },
         strokeWidth=2,
         create=function(input)
             --2
             local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.iconOptions)
             input.parent:insert(icon)
             icon.x=input.x
             icon.y=input.y
         end,
         refresh=function(input)
 
         end,
         touch=function()
             MAIN.UTILITY.gotoScene('scene.options.options')
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
        

        local UTILITY = MAIN.UTILITY
        UTILITY.updateBackgroundImages({ CONSTANTS.pictureTitle })

        UTILITY.sceneFadeIn({
            onComplete=function()
                local touchToStart = sceneGroup[3]

                --Not sure why i cant bind this when its initally created
                local function textFade()
                    transition.fadeIn(touchToStart, { tag='title', time=1000, delay=0})
                    transition.fadeOut(touchToStart, { tag='title', time=1000, delay=1500, onComplete=textFade})
                end
            
                textFade()

                sceneGroup[4]:enableTouch()
            end
        })

        UTILITY.updateLowerUiLayer()
        
        UTILITY.showLoadingLayer(false)

    end
end
 
 
-- hide()
function scene:hide( event )
 
    --local sceneGroup = self.view
    local phase = event.phase
    
    if ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

        composer.removeScene('scene.title')
 
    end
end
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
-- -----------------------------------------------------------------------------------
 
return scene