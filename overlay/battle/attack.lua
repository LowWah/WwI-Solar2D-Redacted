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

    self.allAttackTarget = 0
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --1 overlay layer
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    --2 Back
    MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth * 0.8,
        y=display.contentHeight-CONSTANTS.lineHeight*3-CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        width=display.contentWidth*0.2-CONSTANTS.iconWidth-CONSTANTS.rectanglePadding,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Cancel',
        touch=function()
            composer.hideOverlay()
        end
    })

    local TEXT = MAIN.UI.TEXT

    --3 Picture group
    sceneGroup:insert(event.params.pictureGroup)

    --4 target rects
    local targetGroup = display.newGroup()
    sceneGroup:insert(targetGroup)
    local enemies = event.params.enemies

    for i = 1, #enemies do
        if not enemies[i]:isDead() then
            --This is a copy paste from scene.battle createTargetRectangle
            local x = enemies[i].pictureX
            local y = enemies[i].pictureY
            local rectWidth = CONSTANTS.lineHeight * 2
            local diagonal = 0.5 * (2 * rectWidth^2)^0.5
            --1 Rectangle
            local rectGroup = MAIN.UI.CONTAINER.createRectangleGroup({
                parent=targetGroup,
                x=x-rectWidth*0.5,
                y=y-rectWidth*0.5,
                width=rectWidth,
                height=rectWidth,
                create=function(input)
                    input.parent[1].rotation = 45

                end,
                refresh=function(input)

                end,
                touch=function()
                    self.allAttackTarget = i
                    composer.hideOverlay()
                end
            })
        end
    end

    --5 Text
    TEXT.drawText({
        parent=sceneGroup,
        x=0,
        y=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding,
        width=display.contentWidth,
        height=CONSTANTS.lineHeight,
        text='All Attack! Select Target',
        fontColour=CONSTANTS.textColourPink,
        alignX='centre',
        alignY='centre'
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

 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        
        event.parent.view:insert(2, sceneGroup[3])
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

        event.parent:returnFromAllAttack(self.allAttackTarget)
 
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