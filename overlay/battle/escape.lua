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
                text='ESCAPE',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight

            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Are you sure you want to quit?'
            })

            y = y + CONSTANTS.textHeight
            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='No rewards will be gained!',
                fontColour=CONSTANTS.textColourRed
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
            MAIN.UTILITY.sceneFadeOut({
                onComplete=function()
                    if composer.getVariable('quest') == 'labyrinth' then
                        MAIN.UTILITY.gotoScene('scene.labyrinth.labyrinth')
                    else
                        MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                    end
                end
            })
        end
    })

    local arenaChallenges = event.params.arenaChallenges
    if arenaChallenges then 
        local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
        local skillsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
        local skillsHeight = (display.contentHeight - (CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2) * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5
        --3 Arena challenges
        CONTAINER.createRectangleGroup({
            parent=sceneGroup,
            x=display.contentWidth-skillsWidth,
            y=popupRectY-lineHeightOne,
            width=skillsWidth,
            height=skillsHeight,
            create=function(input)
                local TEXT = MAIN.UI.TEXT
                
                local y = input.y
    
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.lineHeight,
                    text='Arena Challenges',
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })
    
                y = y + CONSTANTS.lineHeight + CONSTANTS.textPadding
                for i = 1, #arenaChallenges do
                    local arenaChallenge = arenaChallenges[i]

                    if arenaChallenge.isChallengeComplete then
                        TEXT.drawText({
                            parent=input.parent,
                            x=input.x,
                            y=y,
                            width=input.width,
                            height=input.height,
                            text=arenaChallenge.text,
                            fontColour=CONSTANTS.textColourInvalid
                        })

                        TEXT.drawText({
                            parent=input.parent,
                            x=input.x,
                            y=y+CONSTANTS.textHeight,
                            width=input.width,
                            height=input.height,
                            text='Completed',
                            fontColour=CONSTANTS.textColourInvalid,
                            alignX='right'
                        })
                    else
                        local isChallengeComplete = false
                        if arenaChallenge.operator == 'lessthan' then
                            isChallengeComplete = arenaChallenge.count <= arenaChallenge.required
                        else
                            isChallengeComplete = arenaChallenge.count >= arenaChallenge.required
                        end
                        
                        TEXT.drawText({
                            parent=input.parent,
                            x=input.x,
                            y=y,
                            width=input.width,
                            height=input.height,
                            text=arenaChallenge.text,
                            fontColour=(isChallengeComplete and CONSTANTS.textColourGreen or CONSTANTS.textColour)
                        })

                        TEXT.drawText({
                            parent=input.parent,
                            x=input.x,
                            y=y+CONSTANTS.textHeight,
                            width=input.width-TEXT.textWidth('/9'),
                            height=input.height,
                            text=arenaChallenge.count,
                            fontColour=(isChallengeComplete and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid),
                            alignX='right'
                        })

                        TEXT.drawText({
                            parent=input.parent,
                            x=input.x,
                            y=y+CONSTANTS.textHeight,
                            width=input.width,
                            height=input.height,
                            text=('/' .. arenaChallenge.required),
                            alignX='right'
                        })
                    end

                    y = y + CONSTANTS.textHeight * 2
                end
            end
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