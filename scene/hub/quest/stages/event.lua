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
    self.categoryName = 'Event'
    local category = composer.getVariable('quest')
    local COMMON = MAIN.UI.COMMON

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --1 Categories, this isnt really required in the new layout but including anyways
    local categories = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=0,
        y=y,
        width=CONSTANTS.backWidth,
        height=display.contentHeight-y,
        columns=1,
        rows=9,
        numItems=9,
        items={ 1 },
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Event',
                fontColour=CONSTANTS.textColourPink
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=MAIN.DATA.EVENT.getEventName(),
                alignX='right',
                alignY='bottom'
            })
        end,
        refresh=function(input)
            if not input.item then
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent:enableTouch(false)
            end

        end,
    })

    categories:select(1)

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local items = MAIN.PLAYER.QUEST.getStageList(category)
    local smallPanelWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    local height = display.contentHeight - y * 2
    --2 Panel
    local CONTAINER = MAIN.UI.CONTAINER
    local smallPanel = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=smallPanelWidth,
        height=height,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            if #items > 0 then
                MAIN.DATA.EVENT.drawEventPanel(input)
            else
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height,
                    text='There are no events at this time',
                    fontColour=CONSTANTS.textColourInvalid,
                    alignX='centre'
                })

            end
        end,
        refresh=function(input)
            
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
        items=items,
        touch=function(input)
            if input.index < 3 then
                composer.setVariable('stage', input.index)
                composer.setVariable('stageItem', input.item)
                
                MAIN.UTILITY.gotoScene('scene.hub.quest.stages.floor.floor')
            else
                --Go to event minigame
                MAIN.UTILITY.sceneFadeOut({
                    onComplete=function()
                        MAIN.UTILITY.gotoScene('scene.event.exam')
                    end
                })

            end
        end
    })

    function stages:updateExam()
        self._collectorGroup[3]:enableTouch(#MAIN.SYSTEM.SAVE.getSave().quests.event[3] == 0)
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
        
        --Unselect for touch
        sceneGroup[3]:select(0)
        sceneGroup[3]:updateExam()

        UTILITY.removeComposerVariable('stageItem')

        UTILITY.showLoadingLayer(false) 

        if composer.getSceneName('previous') == 'scene.event.exam' then
            UTILITY.updateBackgroundImages({ MAIN.PLAYER.HUB.hubBackground() })
            UTILITY.sceneFadeIn({time=0})
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