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

    --Set it for convience
    self.categoryName = 'Labyrinth'
    local category = composer.getVariable('quest')
    local COMMON = MAIN.UI.COMMON

    --1 Categories, this isnt really required in the new layout but including anyways
    local categories = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category=self.categoryName,
                key=category
            }
        }
    })
    categories:select(1)

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --2 Panel
    local panel = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
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
                text='Labyrinth',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Navigate the labyrinth to gain gems. Labyrinth level and rewards are based on highest level party member (minimum level 10).'
            })

            y = y + CONSTANTS.textHeight * 2.5
            --4
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Every step raises the encounter bar, once full there is a chance for an encounter. Every fourth encounter will have a boss.'
            })

            y = y + CONSTANTS.textHeight * 2.5
            --5
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Exit the labyrinth by reaching designated exit points. You can either leave to receive all rewards or use a map to continue another labyrinth.'
            })

            y = y + CONSTANTS.textHeight * 3.5
            --6
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Continuing another labyrinth will apply stat penalties (due to the guild leader\'s fear of enclosed spaces) but will yield more rewards.'
            })

            y = y + CONSTANTS.textHeight * 2.5
            --7
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='If defeated while in labyrinth, half of your rewards will be lost. However you can use another map to fully recover and continue the labyrinth. Maps required to recover increases after every defeat.'
            })

            y = y + CONSTANTS.textHeight * 3.5
            --8
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Enter a labyrinth using a map or 20 energy. Note there is no option to suspend while in a labyrinth.'
            })

            --9
            local mapItem = MAIN.DATA.ITEM.getItem(1, 17)
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+input.width-TEXT.textWidth('Labyrinth Map 9999')-CONSTANTS.iconWidth-CONSTANTS.iconPadding,
                y=input.y+input.height-CONSTANTS.lineHeight+(CONSTANTS.lineHeight-CONSTANTS.iconHeight)*0.5-CONSTANTS.iconPadding,
                width=TEXT.textWidth('Labyrinth Map')+CONSTANTS.iconWidth+CONSTANTS.iconPadding+CONSTANTS.textPadding*2,
                height=CONSTANTS.lineHeight,
                item={
                    icon=mapItem.icon,
                    name=mapItem.name
                }
            })

            --10
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y+input.height-CONSTANTS.lineHeight-CONSTANTS.iconPadding,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })



        end,
        refresh=function(input)
            local countItem = MAIN.PLAYER.INVENTORY.getItem(1, 17)

            local count = countItem and countItem:count() or 0
            input.parent[10]:setText(count)
        end
    })

    local rectWidth = display.contentWidth * 0.2
    --3 labyrinth map enter
    local labyrinthMapRect = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-rectWidth,
        y=display.contentHeight-y,
        width=rectWidth,
        height=y,
        create=function(input)
            local mapItem = MAIN.DATA.ITEM.getItem(1, 17)
            --2
            MAIN.UI.TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                item={
                    icon=mapItem.icon,
                    name='x1'
                }
            })

        end,
        refresh=function(input)
            local owned = MAIN.PLAYER.INVENTORY.getItem(1, 17)
            local isValid = not not owned
            input.parent[2]:setItem(nil, isValid and CONSTANTS.textColour or CONSTANTS.textColourInvalid)
            input.parent:enableTouch(isValid)
        end,
        touch=function(input)
            composer.setVariable('labyrinthCost', 1)

            MAIN.UTILITY.gotoScene('scene.hub.party.party')

        end
    })

    --4 energy enter
    local energyRect = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-rectWidth*2,
        y=display.contentHeight-y,
        width=rectWidth,
        height=y,
        create=function(input)
            local mapItem = MAIN.DATA.ITEM.getItem(1, 17)
            --2
            MAIN.UI.TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                item={
                    icon=6,
                    name=('x' .. CONSTANTS.labyrinthLivesCost)
                }
            })

        end,
        refresh=function(input)
            local isValid = MAIN.PLAYER.LIVES.currentLives() >= CONSTANTS.labyrinthLivesCost
            input.parent[2]:setItem(nil, isValid and CONSTANTS.textColour or CONSTANTS.textColourInvalid)
            input.parent:enableTouch(isValid)
        end,
        touch=function(input)
            composer.setVariable('labyrinthCost', 2)

            MAIN.UTILITY.gotoScene('scene.hub.party.party')
        end
    })
    

    --[[
    --5 recharge
    local rechargeRect = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=display.contentHeight-y,
        width=rectWidth,
        height=y,
        text='Recharge',
        touch=function()
            print('show overlay')
        end
    })
    ]]

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
            sceneName=string.upper(self.categoryName),
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.quest.quest')
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        UTILITY.showLoadingLayer(false) 

        sceneGroup[2]:refresh()
        sceneGroup[3]:refresh()
        sceneGroup[4]:refresh()

        UTILITY.removeComposerVariable('labyrinthCost')

        if composer.getSceneName('previous') == 'scene.battle.rewards.rewards' then
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