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
    --1 Categories
    local categoriesScrollView = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category='Main',
                key=1
            }, {
                category='Side',
                key=2
            }, {
                category='Event',
                key=3
            }, {
                category='Other',
                key=4
            } 
        },
        touch=function(input)
            sceneGroup[2]:setItems(MAIN.PLAYER.STORYCOLLECTION.getStageList(input.item.key))
        end
    })

    --2 Stages
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
        items=nil,
        touch=function(input)
            composer.setVariable('stageItem', input.item)
            composer.setVariable('collectionQuest', sceneGroup[1].currentIndex)
            composer.setVariable('collectionStage', input.index)
            
            MAIN.UTILITY.gotoScene('scene.hub.collection.story.floor.floor')
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
            sceneName='STORY',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.collection.collection')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        local index = composer.getVariable('collectionQuest') or 1
        
        sceneGroup[1]:selectAndCall(index)
        sceneGroup[2]:select(0)

        
        UTILITY.removeComposerVariable('stageItem')
        UTILITY.removeComposerVariable('collectionQuest')
        UTILITY.removeComposerVariable('collectionStage')

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