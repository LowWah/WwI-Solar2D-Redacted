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

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --1 collection categories
    local collectionCategories = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        rows=1,
        columns=5,
        numItems=5,
        items={
            {
                name='Story',
                nextScene='scene.hub.collection.story.story'
            }, {
                name='Members',
                nextScene='scene.hub.members.members'
            }, {
                name='Items',
                nextScene='scene.hub.inventory.inventory'
            }
        },
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 name
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                alignX='centre',
                alignY='centre'
            })
            
        end,
        refresh=function(input)
            local item = input.item
            if item then
                --2 name
                input.parent[2]:setText(item.name)
            else
                input.parent:enableTouch(false)
            end

        end,
        touch=function(input)
            --set a collection flag which says that its in collection mode (for members and inventory)
            composer.setVariable('collection', true)

            MAIN.UTILITY.gotoScene(input.item.nextScene)
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
            sceneName='COLLECTION',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.hub')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        sceneGroup[1]:select(0)

        UTILITY.removeComposerVariable('collection')

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