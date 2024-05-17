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
    self.categoryName = 'Side'
    local category = composer.getVariable('quest')

    --we'll split items into part 1 and part 2
    local items = MAIN.PLAYER.QUEST.getStageList(category)
    local itemParts = {
        { items[1], items[2] },
        { items[3], items[4] }
    }
    local titles = { 'War', 'With' }

    --1 Categories, this isnt really required in the new layout but including anyways
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local categories = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=0,
        y=y,
        width=CONSTANTS.backWidth,
        height=display.contentHeight-y,
        columns=1,
        rows=9,
        numItems=9,
        items={ 1, 2 },
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=('Part ' .. input.index),
                fontColour=CONSTANTS.textColourPink
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=titles[input.index],
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
        touch=function(input)
            sceneGroup[2]:setItems(itemParts[input.index])
        end
    })

    function categories:scrollToCurrent()
        local part, stage, isFinished
        for i = 1, #itemParts do
            part = i
            stage = #itemParts[i]
            for j = 1, stage do
                if itemParts[i][j].percent ~= '100%' then
                    stage = j
                    isFinished = true
                    break
                end
            end
            if isFinished then
                break
            end
        end

        sceneGroup[1]:selectAndCall(part, true)
    end

    --2 stages
    local stages = MAIN.UI.COMMON.createStagesScrollView({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        rows=1,
        columns=5,
        numItems=5,
        items=items,
        touch=function(input)
            --adjust for part 2, hardcoding count
            local stage = (categories.currentIndex - 1) * 2 + input.index
            composer.setVariable('stage', stage)
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

        --This should actually be based on main as part 2 would be locked
        sceneGroup[1]:scrollToCurrent()

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