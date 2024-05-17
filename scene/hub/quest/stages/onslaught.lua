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
    self.categoryName = 'Onslaught'
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

    --2 Stages
    local items = MAIN.PLAYER.QUEST.getStageList(category)
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --forward declare to be accessable in touch
    local stages
    stages = COMMON.createStagesScrollView({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        rows=1,
        columns=5,
        numItems=5,
        items=items,
        touch=function()
            composer.setVariable('stage', stages.currentIndex)
            composer.setVariable('stageItem', stages:currentItem())

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
        
        sceneGroup[2]:select(0)
        
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