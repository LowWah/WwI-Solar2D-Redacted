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

    local TERMS = MAIN.TERMS
    --Generate paty list, reusing categories for convience
    local partyList = {}
    for i = 1, CONSTANTS.partyCount do
        partyList[i] = {
            category=('Party ' .. i),
            key=i
        }
    end

    local COMMON = MAIN.UI.COMMON
    --1 Party list
    COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items=partyList,
        touch=function(input)
            local PARTY = MAIN.PLAYER.PARTY
            PARTY.setCurrentParty(input.index)

            sceneGroup[2]:setItems(PARTY.currentParty())

            MAIN.UTILITY.updateLowerUiActor(nil)

            sceneGroup[3].isVisible = false
            sceneGroup[4].isVisible = false

            sceneGroup[5]:refreshSelect()
        end
    })

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --Party slot width is 1.5x
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local partySlotWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local partySlotHeight = display.contentHeight - y * 2

    local CONTAINER = MAIN.UI.CONTAINER
    --2 Party slot
    CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=display.contentWidth-partySlotWidth,
        y=y,
        width=partySlotWidth,
        height=partySlotHeight,
        rows=5,
        columns=1,
        numItems=5,
        create=function(input)
            local TERMS = MAIN.TERMS
            local TEXT = MAIN.UI.TEXT

            local slotName = input.index <= CONSTANTS.battleActiveMembers and 'Party' or 'Reserve'
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x+CONSTANTS.faceWidth+CONSTANTS.iconWidth,
                y=input.y,
                width=input.width-CONSTANTS.faceWidth-CONSTANTS.iconWidth,
                height=input.height,
                text=slotName,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --3 Empty
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Empty',
                fontColour=CONSTANTS.textColourInvalid,
                alignX='centre',
                alignY='centre'
            })

            --4 Member
            TEXT.drawMember({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height
            })

            --5 Change
            local changeWidth = input.width + CONSTANTS.rectangleStrokeWidth * 2 - fifthWidth + CONSTANTS.rectanglePadding * 2
            local changeHeight = CONSTANTS.textHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
            local changeRect = COMMON.createRectangleWithText({
                parent=input.parent,
                x=input.x+input.width-changeWidth+CONSTANTS.rectanglePadding+CONSTANTS.rectangleStrokeWidth,
                y=input.y+input.height-changeHeight+CONSTANTS.rectanglePadding+CONSTANTS.rectangleStrokeWidth,
                width=changeWidth,
                height=changeHeight,
                text='Change',
                fontSize=CONSTANTS.fontSizeSmall,
                touch=function(input2)
                    composer.setVariable('partySlot', input.index)

                    MAIN.UTILITY.gotoScene('scene.hub.party.members.members')
                end
            })

        end,
        refresh=function(input)
            local item = input.item
            --couldnt be bothered doing else
            if item then
                if item.actor > 0 then
                    input.parent[3].isVisible = false
                    input.parent[4]:setActor(MAIN.PLAYER.MEMBERS.getActor(item.actor))
                    input.parent[4].isVisible = true
                else
                    input.parent[3].isVisible = true
                    input.parent[4].isVisible = false
                end
            end
        end,
        touch=function(input)
            local item = input.item
            if item.actor == 0 then
                MAIN.UTILITY.updateLowerUiActor(nil)

                sceneGroup[3].isVisible = false
                sceneGroup[4].isVisible = false
            else
                sceneGroup[3].isVisible = true
                sceneGroup[3]:setItem(item)
                sceneGroup[4].isVisible = true
                sceneGroup[4]:refresh({item=item})

                MAIN.UTILITY.updateLowerUiActor(MAIN.PLAYER.MEMBERS.getActor(item.actor):skin().picture)
            end
        end
    })

    --3 Stat group
    local statGroup = COMMON.createStatSmallGroup({
        parent=sceneGroup
    })
    statGroup.isVisible = false

    local equipX = display.contentWidth - fifthWidth * 3 - CONSTANTS.rectangleSpacing * 2 - CONSTANTS.rectanglePadding * 2
    local equipHeight = (display.contentHeight - y * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5
    --4 equip group
    local equipGroup = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=equipX,
        y=display.contentHeight-y-equipHeight,
        width=partySlotWidth,
        height=equipHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Equipment',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            local levelWidth = TEXT.textWidth(' Lv 10', CONSTANTS.fontSizeSmall)
            local levelNumberWidth = TEXT.textWidth(' 10', CONSTANTS.fontSizeSmall)
            --Equipment, doing a loop
            for i = 1, 5 do
                --3 (+3) Equipment
                TEXT.drawItemName({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width-levelWidth,
                    height=CONSTANTS.lineHeight
                })

                --4 (+3)
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width-levelNumberWidth,
                    height=CONSTANTS.lineHeight,
                    text='Lv',
                    fontSize=CONSTANTS.fontSizeSmall,
                    fontColour=CONSTANTS.textColourPink,
                    alignX='right'
                })

                --5 (+3) level
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.lineHeight,
                    text='',
                    fontSize=CONSTANTS.fontSizeSmall,
                    alignX='right'
                })

                y = y + CONSTANTS.lineHeight

            end

            
            local editWidth = fifthWidth * 0.5 + CONSTANTS.rectanglePadding * 2
            --18 Edit button
            MAIN.UI.COMMON.createRectangleWithText({
                parent=input.parent,
                x=input.x+input.width-editWidth+CONSTANTS.rectanglePadding+CONSTANTS.rectangleStrokeWidth,
                y=input.y-CONSTANTS.rectanglePadding-CONSTANTS.rectangleStrokeWidth,
                width=editWidth,
                height=(CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2),
                text='Edit',
                touch=function()
                    composer.setVariable('partySlot', sceneGroup[2].currentIndex)

                    MAIN.UTILITY.gotoScene('scene.hub.party.equip.equip')
                end
            })
            
        end,
        refresh=function(input)
            local item = sceneGroup[2]:currentItem()
            if item and item.equipment then
                for i = 1, #item.equipment do
                    local index = i * 3

                    if item.equipment[i] == 0 then
                        input.parent[index]:setItem({icon=1, name='Empty'}, CONSTANTS.textColourInvalid)

                        input.parent[index + 1].isVisible = false
                        input.parent[index + 2].isVisible = false
                    else
                        local equipItem = MAIN.PLAYER.INVENTORY.getItem(i + 4, item.equipment[i])
                        input.parent[index]:setItem({icon=equipItem:icon(), name=equipItem:name()}, CONSTANTS.textColour)

                        input.parent[index + 1].isVisible = true
                        input.parent[index + 2].isVisible = true
                        input.parent[index + 2]:setText(equipItem:level())
                    end
                end
            end

        end
    })
    equipGroup.isVisible = false

    --5 Stage group
    local floorGroup = display.newGroup()
    sceneGroup:insert(floorGroup)

    --5 1 Stage group
    CONTAINER.createRectangleGroup({
        parent=floorGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=(fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2),
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding*2,
        fillColour={ 0, 0, 0, 0 },
        strokeColourDisabled={ 0, 0, 0, 0 },
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 Stage name
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourPink,
                paddingX=0
            })

            --3 Floor
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-CONSTANTS.textPadding,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourPink,
                paddingX=0,
                alignX='right'
            })

            --4 Level
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y+CONSTANTS.textHeight,
                width=input.width-CONSTANTS.textPadding,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourPink,
                paddingX=0,
                alignX='right'
            })

        end,
        refresh=function(input)
            if input.stage then
                input.parent[2].isVisible = true
                input.parent[2]:setText(input.stage)

                if input.floor then
                    input.parent[3].isVisible = true
                    input.parent[3]:setText(input.floor)

                    input.parent[4].isVisible = true
                    input.parent[4]:setText(input.level)
                else
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false
                end
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
            end
        end
    })

    --5 2 Select
    COMMON.createSelectRectangle({
        parent=floorGroup,
        text='Start',
        touch=function()
            local quest = composer.getVariable('quest')
            local nextScene, data
            composer.setVariable('battleResult', 1)
            if quest == 'tower' or quest == 'arena' or quest == 'labyrinth' then
                --use this to dertermine other dialogue
                data = MAIN.PLAYER.STORYCOLLECTION.getOtherDialogue(quest, MAIN.PLAYER.PARTY.currentParty())
                if data then
                    nextScene = 'scene.dialogue.dialogue'
                else
                    nextScene = quest == 'labyrinth' and 'scene.labyrinth.labyrinth' or 'scene.battle.battle'
                end
            else
                local floorItem = MAIN.PLAYER.QUEST.getStageFloors(quest, composer.getVariable('stage'))[composer.getVariable('floor')]
                if floorItem.preBattle then
                    nextScene = 'scene.dialogue.dialogue'
                else
                    nextScene = 'scene.battle.battle'
                end
            end

            if nextScene then
                local UTILITY = MAIN.UTILITY

                UTILITY.sceneFadeOut({
                    onComplete=function()
                        UTILITY.gotoScene(nextScene, data and { data=data } or nil)
                    end
                })
            end
        end
    })

    --5 3 Quick clear
    local quickClearRect = COMMON.createRectangleWithText({
        parent=floorGroup,
        x=display.contentWidth*0.6,
        y=display.contentHeight-y,
        width=display.contentWidth*0.2,
        height=y,
        text='Quick clear',
        touch=function()
            composer.showOverlay('overlay.party.quickclear', {
                isModal = true,
                params = {
                    
                }
            })
        end
    })

    function quickClearRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end

    function floorGroup:refresh()
        local isVisible = false
        local quest = composer.getVariable('quest')
        local floor = composer.getVariable('floor')
        if quest == 'labyrinth' then
            isVisible = true
            self[1]:refresh({stage='Labyrinth'})
            self[3].isVisible = false
        elseif floor then
            isVisible = true
            local stage = composer.getVariable('stage')
            local stageItem = MAIN.DATA.QUEST.getStagesForQuest(quest)[stage]
            local floorItem = stageItem.floors[floor]
            self[1]:refresh({
                stage=stageItem.name,
                floor=('Floor ' .. floor),
                level=(floorItem.enemies and 'Level ' .. floorItem.enemies.level or '')
            })
            if floorItem.canAuto then
                self[3].isVisible = true
                self[3]:enable(MAIN.PLAYER.QUEST.isFloorCleared(quest, stage, floor))
            else
                self[3].isVisible = false
            end
        end
        self.isVisible = isVisible
        self:refreshSelect()
    end

    function floorGroup:refreshSelect() 
        self[2]:enable(MAIN.PLAYER.PARTY.isPartyVaild())
    end
 
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
        
        local isFromFloor = not not composer.getVariable('stageItem')
        local sceneName = isFromFloor and string.upper(composer.getVariable('quest')) or 'PARTY'
        
        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName=sceneName,
            back=function()
                if isFromFloor then
                    MAIN.UTILITY.gotoScene('scene.hub.quest.stages.floor.floor')
                elseif composer.getVariable('quest') == 'labyrinth' then
                    MAIN.UTILITY.gotoScene('scene.hub.quest.stages.labyrinth')
                else
                    MAIN.UTILITY.gotoScene('scene.hub.hub')
                end
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        sceneGroup[1]:selectAndCall(MAIN.PLAYER.PARTY.currentPartyId(), true)

        if composer.getVariable('partySlot') then 
            sceneGroup[2]:selectAndCall(composer.getVariable('partySlot'), true)
            UTILITY.removeComposerVariable('partySlot')
        end
        
        sceneGroup[5]:refresh()

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