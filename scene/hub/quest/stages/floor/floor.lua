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

    local COMMON = MAIN.UI.COMMON
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local height = display.contentHeight - y * 2
    local stageWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2 + CONSTANTS.rectanglePadding * 2
    --1 stage picture
    local stage = COMMON.createStagesScrollView({
        parent=sceneGroup,
        x=0,
        y=y,
        width=stageWidth,
        height=height,
        rows=1,
        columns=1,
        isTouchEnabled=false
    })

    --2 floors
    local floorX = stageWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    local floors = COMMON.createFloorsScrollView({
        parent=sceneGroup,
        x=floorX,
        y=y,
        width=display.contentWidth-floorX,
        height=height,
        touch=function(input)
            composer.setVariable('floor', input.index)

            MAIN.UTILITY.gotoScene('scene.hub.party.party')
        end
    })

    --[[
    --3 select
    local selectGroup = COMMON.createSelectRectangle({
        parent=sceneGroup,
        touch=function()
            composer.setVariable('floor', floors.currentIndex)

            MAIN.UTILITY.gotoScene('scene.hub.party.party', { stage=event.params.stage, sceneName=event.params.sceneName })
        end
    })]]

 
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
        
        local quest = composer.getVariable('quest')
        local stage = composer.getVariable('stage')

        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName=string.upper(quest),
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.quest.stages.' .. quest)
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        local currentIndex = sceneGroup[2].currentIndex
        local requireScroll = not sceneGroup[2]:isIndexVisible(currentIndex)
        local x = sceneGroup[2]:getContentPosition()

        sceneGroup[1]:setItems({ composer.getVariable('stageItem') })
        --Select last
        local items = MAIN.PLAYER.QUEST.getStageFloors(quest, stage)
        sceneGroup[2]:setItems(items)

        --scroll - this scrolls so the next stage is at the top, would prefer if its at the bottom
        if requireScroll then
            local floor = composer.getVariable('floor')
            if floor then
                sceneGroup[2]:scrollToIndex(floor)
            else
                --Scroll to next floor
                local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
                local index = #items
                for i = 1, #items do
                    if not isFloorClearedFunc(quest, stage, i) then
                        index = i
                        break
                    end
                end

                sceneGroup[2]:scrollToIndex(index)
            end
        else
            sceneGroup[2]:scrollToPosition({ x=x, time=0 })
        end

        UTILITY.removeComposerVariable('floor')
        
        UTILITY.showLoadingLayer(false) 

        if composer.getSceneName('previous') == 'scene.battle.rewards.rewards' then
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