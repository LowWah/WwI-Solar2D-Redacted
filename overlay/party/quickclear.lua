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

    local rectWidth = display.contentWidth * 0.4
    local rectHeight = CONSTANTS.lineHeight * 6 + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing

    local rectX = display.contentWidth * 0.1
    local rectY = (display.contentHeight - rectHeight) * 0.5

    local CONTAINER = MAIN.UI.CONTAINER
    local quickclearCounter = {
        count=0,
        limit=0
    }
    function quickclearCounter:addCount(count)
        self.limit = math.floor(MAIN.PLAYER.LIVES.currentLives() / CONSTANTS.autoCost)
        self.count = math.max(0, math.min(self.limit, self.count + count))
        sceneGroup[2]:refresh({count=self.count})
    end
    --2 Quick clear
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=rectX+rectWidth,
        y=rectY,
        width=rectWidth,
        height=rectHeight-CONSTANTS.lineHeight-CONSTANTS.rectangleStrokeWidth,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive,
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
                text='Quick clear',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 2'),
                height=CONSTANTS.lineHeight,
                text='Cost',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=CONSTANTS.autoCost,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight + CONSTANTS.textHeight * 0.5

            --5
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Rewards x',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })
            
            y = y + CONSTANTS.lineHeight

            local buttonX = input.x + CONSTANTS.textPadding
            local buttonWidth = TEXT.textWidth('-10') + CONSTANTS.textPadding * 2

            --6,7,8,9
            local counts = { -10, -1, 1, 10 }
            for i = 1, #counts do
                local countText = (counts[i] > 0 and '+' or '') .. tostring(counts[i])
                local r = MAIN.UI.COMMON.createRectangleWithText({
                    parent=input.parent,
                    x=buttonX+(i-1)*(buttonWidth+CONSTANTS.rectangleSpacing),
                    y=y,
                    width=buttonWidth,
                    height=CONSTANTS.lineHeight,
                    text=countText,
                    padding=0,
                    touch=function()
                        quickclearCounter:addCount(counts[i])
                    end
                })
            end

            --10 Total use
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='0',
                fontColour=CONSTANTS.textColourInvalid,
                alignX='right',
                alignY='centre'
            })

            local bottomWidth = display.contentWidth * 0.2 - CONSTANTS.rectanglePadding * 2
            y = input.y + input.height - CONSTANTS.lineHeight
            local currentLives = MAIN.PLAYER.LIVES.currentLives()
            --11
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Current',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --12 Current lives
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=bottomWidth,
                height=CONSTANTS.lineHeight,
                text=currentLives,
                alignX='right',
                alignY='centre'
            })


            --13
            TEXT.drawText({
                parent=input.parent,
                x=input.x+bottomWidth+CONSTANTS.rectanglePadding*2,
                y=y,
                width=bottomWidth,
                height=CONSTANTS.lineHeight,
                text='Remaining',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })
            
            --14 Remaining lives
            TEXT.drawText({
                parent=input.parent,
                x=input.x+bottomWidth+CONSTANTS.rectanglePadding*2,
                y=y,
                width=bottomWidth,
                height=CONSTANTS.lineHeight,
                text=currentLives,
                alignX='right',
                alignY='centre'
            })

        end,
        refresh=function(input)
            if input.count then
                local isEnabled = input.count > 0
                local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid

                input.parent[10]:setText(input.count, fontColour)

                local currentLives = MAIN.PLAYER.LIVES.currentLives()
                local remainingFontColour = isEnabled and CONSTANTS.textColourRed or CONSTANTS.textColour
                input.parent[12]:setText(currentLives)
                input.parent[14]:setText(currentLives - CONSTANTS.autoCost * input.count, remainingFontColour)

                sceneGroup[4]:enable(isEnabled)
            end
        end
    })

    local COMMON = MAIN.UI.COMMON
    local buttonY = rectY + rectHeight - CONSTANTS.lineHeight - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing -CONSTANTS.rectangleStrokeWidth
    local buttonWidth = display.contentWidth * 0.2
    local buttonHeight = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --3 No
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=rectX+rectWidth,
        y=buttonY,
        width=buttonWidth,
        height=buttonHeight,
        text='Cancel',
        touch=function()
            composer.hideOverlay()
        end
    })

    --4 Yes
    local yesRect = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=rectX+rectWidth*2-buttonWidth,
        y=buttonY,
        width=buttonWidth,
        height=buttonHeight,
        text='Start',
        touch=function()
            composer.setVariable('quickClear', quickclearCounter.count)
            composer.setVariable('battleResult', 2)

            MAIN.PLAYER.LIVES.gainLives(-1 * CONSTANTS.autoCost * quickclearCounter.count)

            MAIN.UTILITY.sceneFadeOut({
                onComplete=function()
                    MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                end
            })
        end
    })

    function yesRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end

    yesRect:enable(false)

    local rechargeCounter = {
        {
            count=0,
            limit=0
        }, {
            count=0,
            limit=0
        }
    }
    function rechargeCounter:addCount(index, count)
        self[index].count = math.max(0, math.min(self[index].limit, self[index].count + count))
        sceneGroup[5]:refresh({count={ self[1].count, self[2].count }})
    end
    --5 Recharge
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=rectX,
        y=rectY,
        width=rectWidth,
        height=rectHeight,
        strokeColourDisabled=CONSTANTS.rectangleStrokeColourActive,
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
                text='Recharge',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            local livesSmallItem = MAIN.DATA.ITEM.getItem(1, 3)
            --3
            local ownedLivesSmallItemText = TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight
            })

            local ownedLivesSmallItem = MAIN.PLAYER.INVENTORY.getItem(1, 3)
            local ownedLivesSmallItemCount = ownedLivesSmallItem and ownedLivesSmallItem:count() or 0
            local ownedLivesSmallItemFontColour = ownedLivesSmallItemCount > 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid
            ownedLivesSmallItemText:setItem({
                icon=livesSmallItem.icon,
                name=livesSmallItem.name
            }, ownedLivesSmallItemFontColour)
            rechargeCounter[1].limit = ownedLivesSmallItemCount

            --4 OwnedLivesSmallItemCount
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=ownedLivesSmallItemCount,
                fontColour=ownedLivesSmallItemFontColour,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight

            local buttonX = input.x + CONSTANTS.textPadding
            local buttonWidth = TEXT.textWidth('-10') + CONSTANTS.textPadding * 2

            --5,6,7,8 Buttons 1
            local counts = { -10, -1, 1, 10 }
            for i = 1, #counts do
                local countText = (counts[i] > 0 and '+' or '') .. tostring(counts[i])
                local r = MAIN.UI.COMMON.createRectangleWithText({
                    parent=input.parent,
                    x=buttonX+(i-1)*(buttonWidth+CONSTANTS.rectangleSpacing),
                    y=y,
                    width=buttonWidth,
                    height=CONSTANTS.lineHeight,
                    text=countText,
                    padding=0,
                    touch=function()
                        rechargeCounter:addCount(1, counts[i])
                    end
                })
            end

            --9 USe 1 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='0',
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --10
            local ownedLivesBigItemText = TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight
            })

            local livesSmallItem = MAIN.DATA.ITEM.getItem(1, 4)
            local ownedLivesBigItem = MAIN.PLAYER.INVENTORY.getItem(1, 4)
            local ownedLivesBigItemCount = ownedLivesBigItem and ownedLivesBigItem:count() or 0
            local ownedLivesBigItemFontColour = ownedLivesBigItemCount > 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid
            ownedLivesBigItemText:setItem({
                icon=livesSmallItem.icon,
                name=livesSmallItem.name
            }, ownedLivesBigItemFontColour)
            rechargeCounter[2].limit = ownedLivesBigItemCount

            --11 OwnedLivesBigItemCount
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=ownedLivesBigItemCount,
                fontColour=ownedLivesBigItemFontColour,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --12,13,14,15 Buttons 2
            local counts = { -10, -1, 1, 10 }
            for i = 1, #counts do
                local countText = (counts[i] > 0 and '+' or '') .. tostring(counts[i])
                local r = MAIN.UI.COMMON.createRectangleWithText({
                    parent=input.parent,
                    x=buttonX+(i-1)*(buttonWidth+CONSTANTS.rectangleSpacing),
                    y=y,
                    width=buttonWidth,
                    height=CONSTANTS.lineHeight,
                    text=countText,
                    padding=0,
                    touch=function()
                        rechargeCounter:addCount(2, counts[i])
                    end
                })
            end

            --16 USe 2 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='0',
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            
            local rechargeWidth = input.width * 0.4
            --17 recharge button
            local rechargeButton = MAIN.UI.COMMON.createRectangleWithText({
                parent=input.parent,
                x=input.x+input.width-rechargeWidth+CONSTANTS.rectangleStrokeWidth,
                y=input.y+input.height-CONSTANTS.lineHeight+CONSTANTS.rectangleStrokeWidth,
                width=rechargeWidth,
                height=CONSTANTS.lineHeight,
                padding=0,
                text='+0',
                touch=function()
                    local count1 = rechargeCounter[1].count
                    local count2 = rechargeCounter[2].count

                    local totalGain = count1 + 2 * count2 

                    MAIN.PLAYER.INVENTORY.loseItem(1, 3, count1)
                    MAIN.PLAYER.INVENTORY.loseItem(1, 4, count2)

                    MAIN.PLAYER.LIVES.gainLives(totalGain, true)

                    --just show overlay again, im not bothered putting this to refresh
                    composer.showOverlay('overlay.party.quickclear', {
                        isModal = true,
                        params = {
                            
                        }
                    })
                end
            })
            function rechargeButton:enable(isEnabled, text)
                local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                self:refresh({ text=text, fontColour=fontColour })
        
                self:enableTouch(isEnabled)
            end
            rechargeButton:enable(false)

        end,
        refresh=function(input)
            local count1 = input.count[1]
            local count2 = input.count[2]

            input.parent[9]:setText(count1)
            input.parent[16]:setText(count2)

            local totalGain = count1 + 2 * count2
            input.parent[17]:enable(totalGain > 0, '+' .. totalGain)
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