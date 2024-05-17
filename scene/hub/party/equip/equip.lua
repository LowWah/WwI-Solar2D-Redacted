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
    local equipWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local equipHeight = (display.contentHeight - y * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5 
    --1 equip slots
    local equipScrollView = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=display.contentWidth-equipWidth,
        y=y,
        width=equipWidth,
        height=equipHeight,
        columns=1,
        rows=6,
        numItems=6,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            --2 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' Lv 10', CONSTANTS.fontSizeSmall),
                height=input.height
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' 10', CONSTANTS.fontSizeSmall),
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
                --2 item name
                input.parent[2].isVisible = true
                if item > 0 then
                    local equipItem = MAIN.PLAYER.INVENTORY.getItem(input.index + 4, item)
                    input.parent[2]:setItem({ icon=equipItem:icon(), name=equipItem:name() }, CONSTANTS.textColour)

                    input.parent[3].isVisible = true

                    --4 level
                    input.parent[4].isVisible = true
                    input.parent[4]:setText(equipItem:level())
                else
                    local icon = 213 + input.index
                    input.parent[2]:setItem({ icon=icon, name='Empty' }, CONSTANTS.textColourInvalid)

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

            local equipItem
            if item > 0 then
                equipItem = MAIN.PLAYER.INVENTORY.getItem(input.index + 4, item)
            end
            sceneGroup[2]:refresh({item=equipItem, category='equipment'})

            sceneGroup[4]:enable(true)
            --sceneGroup[5].isVisible = not not equipItem

        end
    })

    local COMMON = MAIN.UI.COMMON
    --2 description
    COMMON.createDescriptionGroup({
        parent=sceneGroup,
        y=display.contentHeight-y-equipHeight
    })

    --3 stats group
    COMMON.createStatSmallGroup({
        parent=sceneGroup
    })

    --4 equip
    COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Change',
        touch=function()
            composer.setVariable('equipSlot', equipScrollView.currentIndex)

            MAIN.UTILITY.gotoScene('scene.hub.party.equip.slot.slot')
        end
    })

    --5 Equip sets
    MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-equipWidth*2+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        y=(CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 6),
        width=fifthWidth+CONSTANTS.rectanglePadding*2,
        height=(CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 5 + CONSTANTS.rectanglePadding * 2),
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Sets Bonuses',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 Set group
            local group = display.newGroup()
            input.parent:insert(group)

            function group:drawSets(sets)
                while self.numChildren > 0 do
                    self[1]:removeSelf()
                end

                local y = input.y + CONSTANTS.lineHeight
                for k, v in pairs(sets) do
                    local dataSet = MAIN.DATA.ITEM.getEquipmentSet(k)

                    TEXT.drawText({
                        parent=self,
                        x=input.x,
                        y=y,
                        width=input.width-TEXT.textWidth(' 4'),
                        height=CONSTANTS.textHeight,
                        text=dataSet.name,
                        fontColour=CONSTANTS.textColourPink
                    })

                    TEXT.drawText({
                        parent=self,
                        x=input.x,
                        y=y,
                        width=input.width,
                        height=CONSTANTS.textHeight,
                        text=v,
                        alignX='right'
                    })

                    for i = 1, #dataSet.effects do
                        if dataSet.effects[i] then
                            local isValid = v >= i
                            if isValid then
                                y = y + CONSTANTS.textHeight
                                TEXT.drawText({
                                    parent=self,
                                    x=input.x,
                                    y=y,
                                    width=input.width,
                                    height=CONSTANTS.textHeight,
                                    text=dataSet.effects[i].text,
                                    fontColour=CONSTANTS.textColourGreen
                                })
                            end
                        end
                    end

                    y = y + CONSTANTS.lineHeight
                end
            
            end
            
        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[3].isVisible = true

                local counts = {}

                for i = 1, #item do
                    if item[i] ~= 0 then
                        local equipment = MAIN.PLAYER.INVENTORY.getItem(i + 4, item[i])
                        if equipment.data.set and equipment.data.set ~= 0 then
                            local currentCount = counts[equipment.data.set] or 0
                            counts[equipment.data.set] = currentCount + 1
                        end
                    end
                end

                input.parent[3]:drawSets(counts)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
            end
            
        end

    })

    --[[
    --5 upgrade
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth*0.6,
        y=display.contentWidth-y,
        width=display.contentWidth*0.2,
        height=y,
        text='Upgrade',
        touch=function()
            local item = MAIN.PLAYER.INVENTORY.getItem(equipScrollView.currentIndex + 4, equipScrollView:currentItem())
            composer.showOverlay('overlay.inventory.upgrade', {
                isModal = true,
                params = {
                    item = item
                }
            })
        end
    })]]

end
 
function scene:reselect()
    local oldIndex = sceneGroup[1].currentIndex
    sceneGroup[1]:setItems(actorEquip.equipment)
    sceneGroup[3]:setItem(actorEquip)

    sceneGroup[1]:select(oldIndex)
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

        local UTILITY = MAIN.UTILITY
        
        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName='EQUIP',
            actorPicture=MAIN.PLAYER.MEMBERS.getActor(actorEquip.actor):skin().picture,
            back=function()
                UTILITY.gotoScene('scene.hub.party.party')
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        sceneGroup[1]:setItems(actorEquip.equipment)
        sceneGroup[2]:refresh()
        sceneGroup[3]:setItem(actorEquip)
        sceneGroup[4]:enable(false)

        sceneGroup[5]:refresh({item=actorEquip.equipment})
        --sceneGroup[5].isVisible = false

        local index = composer.getVariable('equipSlot') or 0
        UTILITY.removeComposerVariable('equipSlot')

        sceneGroup[1]:selectAndCall(index, true)
        
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