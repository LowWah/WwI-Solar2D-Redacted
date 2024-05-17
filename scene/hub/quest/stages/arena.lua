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

    --Set it for convience
    self.categoryName = 'Arena'
    local category = composer.getVariable('quest')
    local COMMON = MAIN.UI.COMMON

    --1 Categories, this isnt really required in the new layout but including anyways
    local categories = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category=self.categoryName,
                key=category
            }
        }
    })
    categories:select(1)

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local smallPanelWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local height = display.contentHeight - y * 2
    --2 Panel
    local smallPanel = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=smallPanelWidth,
        height=height,
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
                text='Arena',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Complete challenges to gain Arena Coin'
            })

            y = y + CONSTANTS.textHeight * 2.5
            --4
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Challenges can be completed on any terrain'
            })

            y = y + CONSTANTS.textHeight * 2.5
            --5
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Challenges and terrain reset daily'
            })

            y = y + CONSTANTS.textHeight * 3
            --6
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Today\'s challenges',
                fontColour=CONSTANTS.textColourPink
            })

            y = y + CONSTANTS.textHeight * 1.5
            for i = 1, 5 do
                --7,8,9,10,11 Challenges
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    text=''
                })

                y = y + CONSTANTS.textHeight * 1.5
            end

        end,
        refresh=function(input)
            local arenaChallenges = MAIN.PLAYER.QUEST.getArenaChallenges()
            for i = 1, #arenaChallenges do
                local fontColour = arenaChallenges[i].isChallengeComplete and CONSTANTS.textColourInvalid or CONSTANTS.textColour
                input.parent[i + 6]:setText(arenaChallenges[i].text, fontColour)
            end
            
        end
    })

    --3 Stages
    local stageWidth = (fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2 + CONSTANTS.rectanglePadding * 2)
    local stages = COMMON.createStagesScrollView({
        parent=sceneGroup,
        x=display.contentWidth-stageWidth,
        y=y,
        width=stageWidth,
        height=height,
        rows=1,
        columns=3,
        numItems=3,
        touch=function(input)
            composer.setVariable('stage', input.index)
            composer.setVariable('stageItem', input.item)

            MAIN.UTILITY.gotoScene('scene.hub.quest.stages.floor.floor')
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
        
        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName=string.upper(self.categoryName),
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.quest.quest')
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        sceneGroup[2]:refresh()
        sceneGroup[3]:setItems(MAIN.PLAYER.QUEST.getStageList(composer.getVariable('quest')))

        UTILITY.removeComposerVariable('stageItem')

        UTILITY.showLoadingLayer(false) 
 
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