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
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local height = display.contentHeight - y * 2
    local stageWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2 + CONSTANTS.rectanglePadding * 2
    --1 stage picture
    local stage = COMMON.createStagesScrollView({
        parent=sceneGroup,
        x=0,
        y=y,
        width=stageWidth,
        height=height,
        rows=1,
        columns=1,
        isTouchEnabled=false
    })

    local floorX = stageWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing 
    --2 story floors
    MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=floorX,
        y=y,
        width=display.contentWidth-floorX,
        height=height,
        rows=7,
        columns=2,
        numItems=14,
        isTouchEnabled=false,
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
                fontColour=CONSTANTS.textColourPink
            })

            --3 characters
            local charactersGroup = display.newGroup()
            input.parent:insert(charactersGroup)

            charactersGroup.coords = {
                x=input.x+CONSTANTS.iconPadding,
                y=input.y+input.height-CONSTANTS.iconHeight-CONSTANTS.iconPadding*0.5
            }

            local buttonWidth = input.width * 0.2
            local buttonHeight = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
            local buttonY = input.y + (input.height - buttonHeight) * 0.5
            local COMMON = MAIN.UI.COMMON
            --4 Start button
            local startRect = COMMON.createRectangleWithText({
                parent=input.parent,
                x=input.x+input.width-buttonWidth,
                y=buttonY,
                width=buttonWidth,
                height=buttonHeight,
                text='View',
                touch=function()
                    local dialogue = input.parent.scrollView.dialogue[input.index]

                    composer.setVariable('quest', dialogue.quest)
                    composer.setVariable('stage', dialogue.stage)
                    composer.setVariable('floor', dialogue.floor)
                    composer.setVariable('battleResult', dialogue.battleResult)

                    MAIN.UTILITY.sceneFadeOut({
                        onComplete=function()
                            MAIN.UTILITY.gotoScene('scene.dialogue.dialogue')
                        end
                    })
                end
            })
        
            function startRect:enable(isEnabled, text)
                local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                self:refresh({ text=text, fontColour=fontColour })
        
                self:enableTouch(isEnabled)
            end

            --5 Log button
            local logRect = COMMON.createRectangleWithText({
                parent=input.parent,
                x=input.x+input.width-buttonWidth*2,
                y=buttonY,
                width=buttonWidth,
                height=buttonHeight,
                text='Log',
                touch=function()
                    --data will be loaded in refresh
                    local name = input.parent.scrollView.name[input.index]
                    local dialogue = input.parent.scrollView.dialogue[input.index]

                    local data = MAIN.DATA.DIALOGUE.getDialogue(dialogue.quest, dialogue.stage, dialogue.floor, dialogue.battleResult)
                    local step = #data.events

                    composer.showOverlay('overlay.dialogue.log', {
                        isModal = true,
                        params = {
                            name=name,
                            data=data,
                            step=step
                        }
                    })
                end
            })

            function logRect:enable(isEnabled, text)
                local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                self:refresh({ text=text, fontColour=fontColour })
        
                self:enableTouch(isEnabled)
            end

        end,
        refresh=function(input)
            local item = input.item
            if item then
                local isEnabled = true
                if item.quest then
                    isEnabled = MAIN.PLAYER.QUEST.isFloorCleared(item.quest.quest, item.quest.stage, item.quest.floor)
                end

                input.parent[2].isVisible = true
                input.parent[2]:setText(item.name, isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid)

                input.parent[3].isVisible = true
                while input.parent[3].numChildren > 0 do
                    input.parent[3][1]:removeSelf()
                end
                local iconX = input.parent[3].coords.x
                local iconY = input.parent[3].coords.y
                for i = 1, #item.characters do
                    local dataItem = MAIN.DATA.ITEM.getItem(2, 10 + item.characters[i])
                    local icon = MAIN.IMAGE.loadIconFrame(dataItem.icon)
                    icon.x = iconX
                    icon.y = iconY
                    input.parent[3]:insert(icon)

                    iconX = iconX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                end


                input.parent[4].isVisible = true
                input.parent[4]:enable(isEnabled)
                
                input.parent[5].isVisible = true
                input.parent[5]:enable(isEnabled)

                input.parent.scrollView.dialogue[input.index] = item.dialogue
                input.parent.scrollView.name[input.index] = item.name
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false

            end

        end
    })

end

function scene:startProcessing()
    --this does nothing
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
            sceneName='STORY',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.collection.story.story')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        sceneGroup[1]:setItems({ composer.getVariable('stageItem') })
        sceneGroup[2].dialogue = {}
        sceneGroup[2].name = {}
        local items = MAIN.DATA.STORYCOLLECTION.getStoryCollection(composer.getVariable('collectionQuest'))[composer.getVariable('collectionStage')].story
        sceneGroup[2]:setItems(items)

        UTILITY.showLoadingLayer(false)

        if composer.getSceneName('previous') == 'scene.dialogue.dialogue' then
            UTILITY.updateBackgroundImages({ MAIN.PLAYER.HUB.hubBackground() })
            UTILITY.sceneFadeIn({time=0})
        end
 
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