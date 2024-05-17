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

    local labyrinthManager = event.params.labyrinthManager
    local nextBonus
    if composer.getVariable('battleResult') == 2 then
        nextBonus = labyrinthManager:getNextBonusAndPenalty()
    end
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    local lineHeightOne = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local popupRectWidth = display.contentWidth * 0.5 - CONSTANTS.rectanglePadding
    local popupRectHeight = CONSTANTS.textHeight * 6 + CONSTANTS.rectanglePadding * 2
    local popupRectX = (display.contentWidth - popupRectWidth) * 0.5
    local popupRectY = (display.contentHeight - popupRectHeight) * 0.5
    
    local CONTAINER = MAIN.UI.CONTAINER
    --2 Text
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=popupRectX,
        y=popupRectY-lineHeightOne,
        width=popupRectWidth,
        height=popupRectHeight,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y

            local title, fontColour
            if composer.getVariable('battleResult') == 1 then
                title = 'DEFEAT x' .. labyrinthManager.defeatCount
                fontColour = CONSTANTS.textColourRed
            else
                title = 'COMPLETE'
                fontColour = CONSTANTS.textColourGreen
            end

            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=title,
                fontColour=fontColour,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight - 6

            if nextBonus then
                --[[
                    nextBonus={
                        bonus=1,
                        penalties={
                            1={
                                value=0.81,
                                reduced=true
                            },
                            2={
                                value=0.81,
                                reduced=false
                            }
                        }
                    }
                ]]

                --Text
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=input.height,
                    text='Exit for full rewards or continue?'
                })

                y = y + CONSTANTS.textHeight

                --BONUS
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=input.height,
                    text='Next Bonus',
                    fontColour=CONSTANTS.textColourPink
                })

                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+TEXT.textWidth('Next Bonus '),
                    y=y,
                    width=input.width-TEXT.textWidth('Next Bonus '),
                    height=input.height,
                    text=(math.round(nextBonus.bonus * 100) .. '%'),
                    fontColour=CONSTANTS.textColourGreen
                })

                local penaltyY = y+CONSTANTS.textHeight
                --PENALTY
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=penaltyY,
                    width=input.width,
                    height=input.height,
                    text='Next Penalty',
                    fontColour=CONSTANTS.textColourPink
                })

                local penaltyX = input.x + TEXT.textWidth('Next Penalty ')

                for k, v in pairs(nextBonus.penalties) do
                    local fontColour = v.reduced and CONSTANTS.textColourRed or CONSTANTS.textColourInvalid
                    local text = CONSTANTS.paramStatsShort[k + 2] .. ' ' .. math.round(v.value * 100) .. '%'

                    TEXT.drawText({
                        parent=input.parent,
                        x=penaltyX,
                        y=penaltyY,
                        width=input.width,
                        height=input.height,
                        text=text,
                        fontColour=fontColour
                    })

                    penaltyX = penaltyX + TEXT.textWidth(text .. ' ')
                end
            else
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=input.height,
                    text='Half rewards will be lost.'
                })

                y = y + CONSTANTS.textHeight
                TEXT.drawTextWithWrapping({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=input.height,
                    text='Use map to fully restore Hp and continue?'
                })
            end

            local mapY = input.y+input.height-CONSTANTS.lineHeight
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=mapY,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Owned',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            local mapX = input.x + TEXT.textWidth('Owned ')
            local mapItem = MAIN.DATA.ITEM.getItem(1, 17)
            local ownedItem = MAIN.PLAYER.INVENTORY.getItem(1, 17)
            local count = ownedItem and ownedItem:count() or 0
            local fontColour = count > 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid
            local itemName = TEXT.drawItemName({
                parent=input.parent,
                x=mapX,
                y=mapY,
                width=input.width,
                height=CONSTANTS.lineHeight
            })
            itemName:setItem({icon=mapItem.icon, name=mapItem.name}, fontColour)

            TEXT.drawText({
                parent=input.parent,
                x=mapX+TEXT.textWidth(mapItem.name .. ' ')+CONSTANTS.iconWidth+CONSTANTS.iconPadding,
                y=mapY,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=count,
                fontColour=fontColour,
                alignY='centre'
            })
        end

    })

    local fifthWidth = display.contentWidth * 0.2
    --3 Continue
    local continueRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=popupRectX,
        y=popupRectY+lineHeightOne*2-CONSTANTS.rectanglePadding*2,
        width=fifthWidth,
        height=lineHeightOne,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding-TEXT.textWidth('x1'),
                height=input.height,
                text='Continue',
                alignY='centre'
            })

            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+input.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding-TEXT.textWidth('x1')-CONSTANTS.textPadding,
                y=input.y,
                width=input.width,
                height=input.height
            })

        end,
        refresh=function(input)
            local dataItem = MAIN.DATA.ITEM.getItem(1, 17)
            local ownedItem = MAIN.PLAYER.INVENTORY.getItem(1, 17)
            local ownedCount = ownedItem and ownedItem:count() or 0
            local requiredCount = nextBonus and 1 or labyrinthManager.defeatCount
            local isEnabled = ownedCount >= requiredCount
            local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
            input.parent[2]:setText('Continue', fontColour)
            input.parent[3]:setItem({icon=dataItem.icon, name='x' .. requiredCount}, fontColour)
            input.parent:enableTouch(isEnabled)
        end,
        touch=function()
            composer.hideOverlay()
            local requiredCount = nextBonus and 1 or labyrinthManager.defeatCount
            MAIN.PLAYER.INVENTORY.loseItem(1, 17, requiredCount)
            if nextBonus then
                MAIN.UTILITY.sceneFadeOut({
                    onComplete=function()
                        labyrinthManager:generateLabyrinth()
                        MAIN.UTILITY.sceneFadeIn()
                    end
                })
            else
                labyrinthManager:revive()
            end
        end

    })

    continueRect:refresh()

    --4 Exit
    MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=popupRectX+popupRectWidth-fifthWidth,
        y=popupRectY+lineHeightOne*2-CONSTANTS.rectanglePadding*2,
        width=fifthWidth,
        height=lineHeightOne,
        text='Exit',
        touch=function()
            composer.hideOverlay()
            MAIN.UTILITY.sceneFadeOut({
                onComplete=function()
                    MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards', { rewards=labyrinthManager.rewards })
                end
            })
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