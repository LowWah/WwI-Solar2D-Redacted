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
    --print('start create scene', os.clock())
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        rows=5,
        columns=5,
        numItems=25,
        create=function(input)
            --2 member
            MAIN.UI.TEXT.drawMember({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height
            })
        end,
        refresh=function(input)
            local enableTouch = false
            if input.item then
                input.parent[2].isVisible = true
                --2
                input.parent[2]:setActor(input.item.actor)
                enableTouch = true

                --change face of alpha if not unlocked, for collection
                local alpha = input.item.actor:isSkinUnlocked(1) and 1 or 0.6
                input.parent[2].alpha = alpha
            else
                input.parent[2].isVisible = false
            end
            input.parent:enableTouch(enableTouch)
        end,
        touch=function(input)
            MAIN.UTILITY.gotoScene('scene.hub.members.profile.profile', { member=input.item.actor })
        end
    })

    --print('end create scene', os.clock())
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

        --print('start show scene', os.clock())

        local UTILITY = MAIN.UTILITY
        
        local sceneName = 'MEMBERS'
        local backScene = 'scene.hub.hub'
        if composer.getVariable('collection') then
            sceneName = 'COLLECTION'
            backScene = 'scene.hub.collection.collection'
        elseif composer.getVariable('change') then
            sceneName = 'CHANGE'
        end

        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName=sceneName,
            back=function()
                MAIN.UTILITY.gotoScene(backScene)
            end,
            guild=true,
            gold=true,
            lives=true
        })

        --we only refresh if come from hub or collection
        local previousScene = composer.getSceneName('previous')
        if previousScene == 'scene.hub.hub' then
            sceneGroup[1]:setItems(MAIN.PLAYER.MEMBERS.getAllMembers())
        elseif previousScene == 'scene.hub.collection.collection' then
            sceneGroup[1]:setItems(MAIN.PLAYER.MEMBERS.getCollectionMembers())
        else
            --refresh actor as it could have changed level or rating
            sceneGroup[1]:refreshAtIndex(sceneGroup[1].currentIndex)
            sceneGroup[1]:select(0)
        end

        UTILITY.showLoadingLayer(false)

        --print('end show scene', os.clock())

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