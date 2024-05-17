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

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    --2 cancel button
    MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Cancel',
        touch=function()
            composer.hideOverlay()
        end
    })

    --3 party scroll view
    local partyScrollView = event.params.partyScrollView
    sceneGroup:insert(partyScrollView)
    partyScrollView:enableFormation(true)
 
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
        local partyScrollView = sceneGroup[3]
        partyScrollView:enableFormation(false)
        event.parent.view:insert(5, partyScrollView)

        event.parent.labyrinthManager:revealSurroundings()
 
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