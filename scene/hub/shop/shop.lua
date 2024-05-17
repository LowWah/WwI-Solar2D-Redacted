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
    --1 Category
    local categoryScrollView = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category='General',
                key='general'
            }, {
                category='Event',
                key='event'
            }, {
                category='Tower',
                key='tower'
            }, {
                category='Arena',
                key='arena'
            }
        },
        touch=function(input)
            sceneGroup[2]:setItems(MAIN.DATA.SHOP.getShopItems(input.item.key))

            sceneGroup[3]:refresh()
            sceneGroup[4]:refresh()
        end
    })

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local inventoryWidth = fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2 + CONSTANTS.rectanglePadding * 2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local CONTAINER = MAIN.UI.CONTAINER
    --2 Item list
    local itemsList = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=inventoryWidth,
        height=display.contentHeight-y*2,
        columns=2,
        rows=12,
        numItems=24,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local costWidth = TEXT.textWidth('9999') + CONSTANTS.iconWidth + CONSTANTS.iconPadding * 2
            --2 Item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-costWidth,
                height=input.height
            })

            --3 Cost
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+input.width-costWidth,
                y=input.y,
                width=costWidth,
                height=input.height
            })

        end, 
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[3].isVisible = true

                local dataItem = MAIN.DATA.ITEM.getItem(item.item.category, item.item.id)
                local costOwned = 0
                if item.cost.category == 0 then
                    costOwned = MAIN.PLAYER.GOLD.gold()
                else
                    local ownedItem = MAIN.PLAYER.INVENTORY.getItem(item.cost.category, item.cost.id)
                    if ownedItem then
                        costOwned = ownedItem:count()
                    end
                end
                local fontColour = costOwned >= item.cost.count and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                local name = dataItem.name
                if item.item.count then
                    name = name .. ' x' .. item.item.count
                end

                input.parent[2]:setItem({icon=dataItem.icon, name=name}, fontColour)

                local costItem = MAIN.DATA.ITEM.getItem(item.cost.category, item.cost.id)
                input.parent[3]:setItem({icon=costItem.icon, name=item.cost.count}, fontColour)
                
                input.parent:enableTouch(true)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false

                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            local item = input.item
            local dataItem = MAIN.DATA.ITEM.getItem(item.item.category, item.item.id)
            local category
            if item.item.category >= 5 then
                category = 'equipment'
            end
            sceneGroup[3]:refresh({item=dataItem, category=category})
            sceneGroup[4]:resetItem(item)
            sceneGroup[5]:enable(false)
        end
    })

    --3 Description
    local description = COMMON.createDescriptionGroup({
        parent=sceneGroup
    })

    local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    --4 Shop Count
    local countRect
    countRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-descriptionWidth,
        y=(CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 6),
        width=descriptionWidth,
        height=(CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 5 + CONSTANTS.rectanglePadding * 2),
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
                text='Purchase',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3 count
            local countNumber = TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            --4,5,6,7 buttons
            local buttonX = input.x + CONSTANTS.textPadding
            local buttonWidth = TEXT.textWidth('-10') + CONSTANTS.textPadding * 2

            local counts = { -10, -1, 1, 10 }
            for i = 1, #counts do
                local countText = (counts[i] > 0 and '+' or '') .. tostring(counts[i])
                local r = COMMON.createRectangleWithText({
                    parent=input.parent,
                    x=buttonX+(i-1)*(buttonWidth+CONSTANTS.rectangleSpacing),
                    y=y,
                    width=buttonWidth,
                    height=CONSTANTS.lineHeight,
                    text=countText,
                    padding=0,
                    touch=function(input)
                        countRect:addCount(counts[i])
                    end
                })

                function r:enable(enable)
                    r.fontColour = enable and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                    r:redraw()
                    r:enableTouch(enable)
                end
            end

            y = y + CONSTANTS.lineHeight * 1.5
            --8
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Cost',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            local countWidth = TEXT.textWidth('999999')
            local costWidth = input.width - countWidth - CONSTANTS.textPadding * 3
            --9 Cost item
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=costWidth,
                height=CONSTANTS.lineHeight
            })

            --10 Cost owned
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            --11 Cost
            y = y + CONSTANTS.lineHeight
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --12
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Remaining',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            --13 Remaining count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })
        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[3].isVisible = true
                local count = input.parent.count
                if item.item.count then
                    count = count * item.item.count
                end
                input.parent[3]:setText(count)
                input.parent[4].isVisible = true
                input.parent[5].isVisible = true
                input.parent[6].isVisible = true
                input.parent[7].isVisible = true
                input.parent[8].isVisible = true
                input.parent[9].isVisible = true
                local costItem = MAIN.DATA.ITEM.getItem(item.cost.category, item.cost.id)
                input.parent[9]:setItem({icon=costItem.icon, name=costItem.name})
                input.parent[10].isVisible = true
                local ownedCost = 0
                if item.cost.category == 0 then
                    ownedCost = MAIN.PLAYER.GOLD.gold()
                else
                    local ownedItem = MAIN.PLAYER.INVENTORY.getItem(item.cost.category, item.cost.id)
                    if ownedItem then
                        ownedCost = ownedItem:count()
                    end
                end
                input.parent[10]:setText(ownedCost)
                input.parent[11].isVisible = true
                local costPrice = item.cost.count * input.parent.count
                input.parent[11]:setText(costPrice)
                input.parent[12].isVisible = true
                input.parent[13].isVisible = true
                local diffCost = ownedCost - costPrice
                input.parent[13]:setText(diffCost, diffCost >= 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid)

                sceneGroup[5]:enable(input.parent.count > 0 and diffCost >= 0)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false
                input.parent[6].isVisible = false
                input.parent[7].isVisible = false
                input.parent[8].isVisible = false
                input.parent[9].isVisible = false
                input.parent[10].isVisible = false
                input.parent[11].isVisible = false
                input.parent[12].isVisible = false
                input.parent[13].isVisible = false
            end

        end
    })

    function countRect:addCount(count)
        self.count = math.max(0, self.count + count)
        self:refresh({item=self.item})
    end

    function countRect:resetItem(item)
        self.item = item
        self.count = 0
        self:refresh({item=self.item})
    end


    --5 Purchase
    local purchaseRect = COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Purchase',
        touch=function()
            local shopItem = itemsList:currentItem()

            --Lose item
            if shopItem.cost.category == 0 then
                MAIN.PLAYER.GOLD.gainGold(-1 * shopItem.cost.count * countRect.count)
                MAIN.UTILITY.updateLowerUiGold()
            else
                MAIN.PLAYER.INVENTORY.loseItem(shopItem.cost.category, shopItem.cost.id, shopItem.cost.count * countRect.count)
            end

            local count = countRect.count
            if shopItem.item.count then
                count = count * shopItem.item.count
            end

            composer.showOverlay('overlay.rewards.rewards', {
                isModal = true,
                params = {
                    rewards=MAIN.PLAYER.INVENTORY.gainItem(shopItem.item.category, shopItem.item.id, count)
                }
            })
        end
    })
end

function scene:reselect()
    local sceneGroup = self.view

    sceneGroup[4]:resetItem(sceneGroup[4].item)
    sceneGroup[5]:enable(false)
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
            sceneName='SHOP',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.hub')
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        sceneGroup[1]:selectAndCall(1, true)
        sceneGroup[3]:refresh()
        sceneGroup[4]:resetItem()
        sceneGroup[5]:enable(false)
        
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