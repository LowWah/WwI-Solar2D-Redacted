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

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    local CONTAINER = MAIN.UI.CONTAINER
    local currentEquipWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    --1 current item name
    local currentEquip = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-currentEquipWidth,
        y=y,
        width=currentEquipWidth,
        height=y,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            
            local levelWidth = 
            --2 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width-TEXT.textWidth(' Lv 10', CONSTANTS.fontSizeSmall)),
                height=input.height
            })

            --3 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width-TEXT.textWidth(' 10', CONSTANTS.fontSizeSmall)),
                height=input.height,
                text='Lv',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --4 level
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right'
            })

        end,
        refresh=function(input)
            local item = input.item

            if item > 0 then
                local equipItem = MAIN.PLAYER.INVENTORY.getItem(composer.getVariable('equipSlot') + 4, item)
                input.parent[2]:setItem({icon=equipItem:icon(), name=equipItem:name()}, CONSTANTS.textColour)

                input.parent[3].isVisible = true
                input.parent[4].isVisible = true
                input.parent[4]:setText(equipItem:level())
            else
                local icon = 213 + composer.getVariable('equipSlot')
                input.parent[2]:setItem({icon=icon, name='Empty'}, CONSTANTS.textColourInvalid)

                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
            end

        end
    })

    local COMMON = MAIN.UI.COMMON
    local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    --2 current item description
    local currentDesc = COMMON.createDescriptionGroup({
        parent=sceneGroup,
        x=display.contentWidth-descriptionWidth-currentEquipWidth+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing
    })

    
    local equipY = y + CONSTANTS.lineHeight * 2 + CONSTANTS.rectangleSpacing * 2
    local equipWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    --3 equip list
    local equipScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=display.contentWidth-equipWidth,
        y=equipY,
        width=equipWidth,
        height=display.contentHeight-y-equipY,
        columns=1,
        rows=10,
        numItems=10,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            
            local levelWidth = 
            --2 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width-TEXT.textWidth(' Lv 10', CONSTANTS.fontSizeSmall)),
                height=input.height
            })

            --3 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width-TEXT.textWidth(' 10', CONSTANTS.fontSizeSmall)),
                height=input.height,
                text='Lv',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --4 level
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right'
            })

        end,
        refresh=function(input)
            local item = input.item
            if item then
                if item.id > 0 then
                    input.parent[2].isVisible = true
                    input.parent[2]:setItem({icon=item:icon(), name=item:name()})

                    input.parent[3].isVisible = true

                    input.parent[4].isVisible = true
                    input.parent[4]:setText(item:level())

                else
                    input.parent[2].isVisible = true
                    input.parent[2]:setItem({icon=1, name='Remove'})

                    input.parent[3].isVisible = false

                    input.parent[4].isVisible = false
                end
                input.parent:enableTouch(true)
                
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent:enableTouch(false)
            end

        end,
        touch=function(input)
            local item = input.item
            if item then
                sceneGroup[4]:refresh({item=(item.id > 0 and item or nil), category='equipment'})

                local statsGroup = sceneGroup[5]
                local actorEquipOriginal = statsGroup.original
                local actorEquip = {
                    actor=actorEquipOriginal.actor,
                    equipment={ 0, 0, 0, 0, 0 }
                }

                for i = 1, #actorEquip.equipment do
                    if composer.getVariable('equipSlot') == i then
                        actorEquip.equipment[i] = item.id
                    else
                        actorEquip.equipment[i] = actorEquipOriginal.equipment[i]
                    end
                end

                statsGroup:refresh(actorEquip)

                sceneGroup[6]:enable(true)
            end
        end
    })

    --4 equip description
    local equipDesc = COMMON.createDescriptionGroup({
        parent=sceneGroup,
        x=display.contentWidth-descriptionWidth-equipWidth+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        y=y+CONSTANTS.lineHeight*6+CONSTANTS.rectangleSpacing*6
    })

    --5 stat group
    COMMON.createStatBigGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        hasUpgrade=true
    })

    --6 equip button
    COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Equip',
        touch=function()
            MAIN.PLAYER.PARTY.changePartyEquipment(composer.getVariable('partySlot'), composer.getVariable('equipSlot'), equipScrollView:currentItem().id)

            MAIN.SYSTEM.SAVE.writeSave()

            MAIN.UTILITY.gotoScene('scene.hub.party.equip.equip')
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

        local actorEquip = MAIN.PLAYER.PARTY.currentParty()[composer.getVariable('partySlot')]
        local actor = MAIN.PLAYER.MEMBERS.getActor(actorEquip.actor)

        local UTILITY = MAIN.UTILITY
        
        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName='EQUIP SLOT',
            actorPicture=actor:skin().picture,
            back=function()
                UTILITY.gotoScene('scene.hub.party.equip.equip')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        local currentEquip = actorEquip.equipment[composer.getVariable('equipSlot')]
        sceneGroup[1]:refresh({item=currentEquip})
        if currentEquip > 0 then
            sceneGroup[2]:refresh({item=MAIN.PLAYER.INVENTORY.getItem(composer.getVariable('equipSlot') + 4, currentEquip), category='equipment'})
        else
            sceneGroup[2]:refresh()
        end

        sceneGroup[3]:setItems(MAIN.PLAYER.INVENTORY.getEquipmentListForEquip(composer.getVariable('equipSlot')))

        sceneGroup[4]:refresh()

        sceneGroup[5]:refresh({original={
            actor=actor,
            equipment=actorEquip.equipment
        }, actor=actor, equipment=actorEquip.equipment})

        sceneGroup[6]:enable(false)
        
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