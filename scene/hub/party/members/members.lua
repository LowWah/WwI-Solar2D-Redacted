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

    local CONTAINER = MAIN.UI.CONTAINER

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local membersWidth = fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2 + CONSTANTS.rectanglePadding * 2
    --1 Members
    CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=display.contentWidth-membersWidth,
        y=y,
        width=membersWidth,
        height=display.contentHeight-y*2,
        rows=5,
        columns=3,
        numItems=15,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 Members
            TEXT.drawMember({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height
            })

            --3 Remove/ IN party/ Current/ Dispatch
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
            if input.item then
                input.parent:enableTouch(true)
                if input.item.actor then
                    input.parent[2].isVisible = true
                    input.parent[2]:setActor(input.item.actor)
                    if input.item.inParty then
                        input.parent[2].alpha = 0.6
                        input.parent[3].isVisible = true
                        local text = input.item.currentSlot and 'Current' or 'In Party'
                        input.parent[3]:setText(text)
                    elseif input.item.dispatch then
                        input.parent[2].alpha = 0.6
                        input.parent[3].isVisible = true
                        local text = 'Dispatch ' .. input.item.dispatch
                        input.parent[3]:setText(text)
                    else
                        input.parent[2].alpha = 1
                        input.parent[3].isVisible = false
                    end
                else
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = true
                    input.parent[3]:setText('Remove')
                end
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            local imageName = input.item.actor and input.item.actor:skin().picture or nil
            MAIN.UTILITY.updateLowerUiActor(imageName)
            
            sceneGroup[2]:enable(not input.item.dispatch)
            sceneGroup[3].isVisible = not not imageName
        end
    })

    local COMMON = MAIN.UI.COMMON
    --2 Select
    COMMON.createSelectRectangle({
        parent=sceneGroup,
        touch=function()
            if composer.getVariable('partySlot') then
                MAIN.PLAYER.PARTY.setPartySlotActor(composer.getVariable('partySlot'), sceneGroup[1]:currentItem().actorId)
                MAIN.UTILITY.gotoScene('scene.hub.party.party')
            elseif composer.getVariable('cafeActor') then
                local dispatch = MAIN.PLAYER.CAFE.getDispatchAtIndex(composer.getVariable('cafeDispatch'))
                dispatch.party[composer.getVariable('cafeActor')] = sceneGroup[1]:currentItem().actorId or 0
                MAIN.UTILITY.gotoScene('scene.hub.cafe.cafe')
            end
        end
    })

    local width = display.contentWidth * 0.2
    --3 Edit
    local editRect = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth-width*2,
        y=display.contentHeight-y,
        width=width,
        height=y,
        text='Edit',
        touch=function()
            composer.setVariable('partyMember', sceneGroup[1].currentIndex)
            MAIN.UTILITY.gotoScene('scene.hub.members.profile.profile', { member=sceneGroup[1]:currentItem().actor })
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
        local TERMS = MAIN.TERMS

        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName='PARTY MEMBERS',
            --reset actor picture, it will rerun on select
            actorPicture=nil,
            back=function()
                if composer.getVariable('cafeActor') then
                    MAIN.UTILITY.gotoScene('scene.hub.cafe.cafe')
                else
                    MAIN.UTILITY.gotoScene('scene.hub.party.party')
                end
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        sceneGroup[2]:enable(false)
        sceneGroup[3].isVisible = false

        --we only refresh if come from party
        local partyMember = composer.getVariable('partyMember') or 0
        local previousSceneName = composer.getSceneName('previous')
        if previousSceneName == 'scene.hub.party.party' then
            local PLAYER = MAIN.PLAYER
            local party = PLAYER.PARTY.currentParty()
            local partySlot = composer.getVariable('partySlot')
            local allMembers = PLAYER.MEMBERS.getAllMembers(party, partySlot)
            sceneGroup[1]:setItems(allMembers)

            local currentMember = party[partySlot].actor
            if currentMember ~= 0 then
                for i = 1, #allMembers do
                    if currentMember == allMembers[i].actorId then
                        partyMember = i
                        break
                    end
                end
            end
        elseif previousSceneName == 'scene.hub.cafe.cafe' then
            local PLAYER = MAIN.PLAYER
            local allMembers = PLAYER.MEMBERS.getAllMembersCafe()
            sceneGroup[1]:setItems(allMembers)

            local dispatch = PLAYER.CAFE.getDispatchAtIndex(composer.getVariable('cafeDispatch'))
            local currentMember = dispatch.party[composer.getVariable('cafeActor')]
            if currentMember ~= 0 then
                for i = 1, #allMembers do
                    if currentMember == allMembers[i].actorId then
                        partyMember = i
                        break
                    end
                end
            end
        else
            --refresh actor as it could have changed level or rating
            sceneGroup[1]:refreshAtIndex(sceneGroup[1].currentIndex)
        end
        sceneGroup[1]:selectAndCall(partyMember, true)

        UTILITY.removeComposerVariable('partyMember')

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