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
    --1 categories
    local categoriesScrollView = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category='Daily',
                key='daily'
            }, {
                category='Weekly',
                key='weekly'
            }, {
                category='Achievement',
                key='achievement'
            }
        },
        touch=function(input)
            local items = MAIN.PLAYER.MISSION.getMissionList(input.index)

            sceneGroup[2]:setItems(items)

            sceneGroup[3]:enable(MAIN.PLAYER.MISSION.canClaimMission(input.index))

            sceneGroup[4]:refresh({index=input.index})

        end
    })

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --2 missions
    local missionScrollView
    missionScrollView = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        rows=7,
        columns=2,
        numItems=14,
        isTouchEnabled=false,
        create=function(input)
            local buttonWidth = input.width * 0.2
            local buttonHeight = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
            local TEXT = MAIN.UI.TEXT

            local countWidth = TEXT.textWidth('00/25')
            --2 Requirements
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width - buttonWidth - countWidth,
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColourPink
            })

            local countNumberWidth = TEXT.textWidth('00')
            local countX = input.x + input.width - buttonWidth - countWidth
            --3 current count
            TEXT.drawText({
                parent=input.parent,
                x=countX,
                y=input.y,
                width=countNumberWidth+CONSTANTS.textPadding*2,
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColourInvalid,
                alignX='right'
            })
    
            --4 required count
            TEXT.drawText({
                parent=input.parent,
                x=countX+countNumberWidth,
                y=input.y,
                width=countWidth,
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColour
            })
    
            --5 Rewards
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y+input.height-CONSTANTS.lineHeight,
                width=input.width
            })
    
            --6 Button
            local claimButton = MAIN.UI.COMMON.createRectangleWithText({
                parent=input.parent,
                x=input.x+input.width-buttonWidth,
                y=input.y+(input.height-buttonHeight)*0.5,
                width=buttonWidth,
                height=buttonHeight,
                text='',
                touch=function()
                    local category = categoriesScrollView.currentIndex
                    local item = missionScrollView:itemAtIndex(input.index)
                    
                    composer.showOverlay('overlay.rewards.rewards', {
                        isModal = true,
                        params = {
                            rewards=MAIN.PLAYER.MISSION.claimMission(category, item.id)
                        }
                    })
                end
            })

            function claimButton:enable(isEnabled, text)
                local fontColour
                if text == 'Claimed' then
                    fontColour = CONSTANTS.textColourPink
                elseif isEnabled then
                    fontColour = CONSTANTS.textColour
                else
                    fontColour = CONSTANTS.textColourInvalid
                end
                self:refresh({ text=text, fontColour=fontColour })
        
                self:enableTouch(isEnabled)
            end

        end,
        refresh=function(input)
            local item = input.item
            if item then 
                --2 requirements
                input.parent[2].isVisible = true
                input.parent[2]:setText(item:name())

                local count = item:count()
                local required = item:required()

                local countFontColour = count >= required and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid
                --3 current count
                input.parent[3].isVisible = true
                input.parent[3]:setText(count, countFontColour)

                --4 required count
                input.parent[4].isVisible = true
                input.parent[4]:setText('/' .. required)

                --5 rewards
                local reward = item:reward()
                local dataReward = MAIN.DATA.ITEM.getItem(reward.category, reward.id)
                input.parent[5].isVisible = true
                input.parent[5]:setItem({ icon=dataReward.icon, name=(dataReward.name .. ' x' .. reward.count) })

                local status = item:status() --'In progress'
                local isEnabled = status == 'Claim'
                --6 button text
                input.parent[6].isVisible = true
                input.parent[6]:enable(isEnabled, status)
                
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false
                input.parent[6].isVisible = false
            end

        end
    })

    --3 Claim All
    local claimAllRect = COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Claim All',
        touch=function()
            composer.showOverlay('overlay.rewards.rewards', {
                isModal = true,
                params = {
                    rewards=MAIN.PLAYER.MISSION.claimMissionAll(categoriesScrollView.currentIndex)
                }
            })
        end
    })

    --4 timer
    local timerRect = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=display.contentHeight-y,
        width=display.contentWidth*0.2,
        height=y,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local timerX = input.x + input.width - TEXT.textWidth('99D24H60M60S') - CONSTANTS.textPadding * 3
            --2 Time
            local timeGroup = TEXT.drawTimer({
                parent=input.parent,
                x=timerX,
                y=input.y+(input.height-CONSTANTS.textHeight)*0.5,
                onComplete=function(timer)
                    timer:setTime(timer:nextTime('week'))
                end
            })
        end,
        refresh=function(input)
            local timeGroup = input.parent[2]
            local time
            if input.index == 1 then
                time = 'day'
            elseif input.index == 2 then
                time = 'week'
            end
            if time then
                input.parent.isVisible = true
                timeGroup:setTime(timeGroup:nextTime(time))
            else
                input.parent.isVisible = false
                timeGroup:stopTime()
            end
        end
    })
end
 
function scene:reselect()
    local sceneGroup = self.view

    sceneGroup[1]:selectAndCall(sceneGroup[1].currentIndex, true)
    
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
            sceneName='MISSION',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.hub')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        sceneGroup[1]:selectAndCall(1, true)

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

        sceneGroup[4]:refresh({start=false})
 
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