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
    local TERMS = MAIN.TERMS

    local x = CONSTANTS.backWidth
    local width = display.contentWidth * 0.2
    local height = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    --I looped these before

    --1 Quest
    local questHeight = height + CONSTANTS.lineHeight
    local y = display.contentHeight - questHeight
    x = display.contentWidth - width
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=width,
        height=questHeight,
        text='Quest',
        touch=function()
            MAIN.UTILITY.gotoScene('scene.hub.quest.quest')
        end
    })

    x = x - questHeight
    --2 Party
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=questHeight,
        height=questHeight,
        text='Party',
        touch=function()
            MAIN.UTILITY.gotoScene('scene.hub.party.party')
        end
    })

    x = x - questHeight
    --3 Members
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=questHeight,
        height=questHeight,
        text='Members',
        touch=function()
            MAIN.UTILITY.gotoScene('scene.hub.members.members')
        end
    })

    x = x - questHeight
    --4 Inventory
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=questHeight,
        height=questHeight,
        text='Inventory',
        touch=function()
            MAIN.UTILITY.gotoScene('scene.hub.inventory.inventory')
        end
    })

    x = display.contentWidth - width
    y = display.contentHeight - questHeight - height
    local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
    --5 Recruit
    if isFloorClearedFunc('main', 1, 3) then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=x,
            y=y,
            width=width,
            height=height,
            text='Recruit',
            touch=function()
                MAIN.UTILITY.gotoScene('scene.hub.recruit.recruit')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=x,
            y=y,
            width=width,
            height=height,
            text='Clear Chapter 1 F3',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    y = y - height
    --6 Shop
    if isFloorClearedFunc('main', 1, 6) then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=x,
            y=y,
            width=width,
            height=height,
            text='Shop',
            touch=function()
                MAIN.UTILITY.gotoScene('scene.hub.shop.shop')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=x,
            y=y,
            width=width,
            height=height,
            text='Clear Chapter 1 F6',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    y = height
    --7 Mission
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=width,
        height=height,
        text='Mission',
        touch=function()
            MAIN.UTILITY.gotoScene('scene.hub.mission.mission')
        end
    })

    y = y + height
    --8 Cafe
    if isFloorClearedFunc('main', 2, 4) then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=x,
            y=y,
            width=width,
            height=height,
            text='Cafe',
            touch=function()
                MAIN.UTILITY.gotoScene('scene.hub.cafe.cafe')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=x,
            y=y,
            width=width,
            height=height,
            text='Clear Chapter 2 F4',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    x = 0
    y = height
    --9 Collection
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=CONSTANTS.backWidth,
        height=height,
        text='Collection',
        touch=function()
            MAIN.UTILITY.gotoScene('scene.hub.collection.collection')
        end
    })

    y = display.contentHeight - height
    --10 Change
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=CONSTANTS.backWidth,
        height=height,
        text='Change',
        touch=function()
            composer.setVariable('change', true)

            MAIN.UTILITY.gotoScene('scene.hub.members.members')
        end
    })

    --5 Options
    local iconRectangleWidth = CONSTANTS.iconWidth + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
    local iconRectangleHeight = CONSTANTS.iconHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
    local optionsRect = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-iconRectangleWidth,
        y=0,
        width=iconRectangleWidth,
        height=iconRectangleHeight,
        --strokeColourInactive={ 0, 0, 0, 0 },
        strokeWidth=2,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.iconOptions)
            input.parent:insert(icon)
            icon.x=input.x
            icon.y=input.y
        end,
        refresh=function(input)

        end,
        touch=function()
            MAIN.UTILITY.gotoScene('scene.options.options')
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
        local HUB = MAIN.PLAYER.HUB
        
        UTILITY.updateBackgroundImages({ HUB.hubBackground() })
        UTILITY.updateLowerUiLayer({
            topGradient=true,
            actorPicture=HUB.hubActorPicture(),
            guild=true,
            gold=true,
            lives=true
        })
    
        UTILITY.removeComposerVariable('change')

        UTILITY.sceneFadeIn()
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