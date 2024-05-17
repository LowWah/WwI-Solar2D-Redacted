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
    --1 slots
    local slotsScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=0,
        y=y,
        width=CONSTANTS.backWidth,
        height=display.contentHeight-y,
        rows=9,
        columns=1,
        numItems=9,
        create=function(input)
            --2
            MAIN.UI.TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=('Slot ' .. input.index),
                fontColour=CONSTANTS.textColourPink
            })

            --3
            local icon = MAIN.IMAGE.loadIconFrame(1)
            icon.x = input.x + input.width - CONSTANTS.iconWidth - CONSTANTS.iconPadding
            icon.y = input.y + input.height - CONSTANTS.iconHeight - CONSTANTS.iconPadding
            input.parent:insert(icon)

        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[3].isVisible = true
                input.parent[3].fill.frame = item.data and item.data.icon or 192
                input.parent:enableTouch(true)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent:enableTouch(false)
            end

        end,
        touch=function(input)
            local item = input.item
            local removeEnabled = false
            if item.id ~= 0 then
                sceneGroup[3]:refresh({item=item,category='gem'})
                sceneGroup[4]:refresh({item=item})

                removeEnabled = true
            else
                sceneGroup[3]:refresh()
                sceneGroup[4]:refresh()
            end

            sceneGroup[6].isVisible = true
            sceneGroup[6]:enable(removeEnabled)
            sceneGroup[7].isVisible = false
            sceneGroup[5].isVisible = true
            sceneGroup[5]:enable(true)

            sceneGroup[2]:refreshCurrentItems()
        end
    })

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local inventoryWidth = fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2 + CONSTANTS.rectanglePadding * 2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --2 Items list
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

            local countWidth = TEXT.textWidth(' 9999')
            --2 Item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-countWidth,
                height=input.height
            })

            --3 Level Group
            local levelGroup = display.newGroup()
            input.parent:insert(levelGroup)

            --3 1 
            TEXT.drawText({
                parent=levelGroup,
                x=input.x+input.width-TEXT.textWidth(' Lv 10', CONSTANTS.fontSizeSmall),
                y=input.y,
                text='Lv',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink
            })

            --3 2 Level
            TEXT.drawText({
                parent=levelGroup,
                x=input.x+input.width-TEXT.textWidth(' 10', CONSTANTS.fontSizeSmall),
                y=input.y,
                text='',
                fontSize=CONSTANTS.fontSizeSmall
            })

        end, 
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[2]:setItem({icon=item:icon(), name=item:name()})

                input.parent[3].isVisible = true
                input.parent[3][2]:setText(item:level())
                
                input.parent:enableTouch(sceneGroup[7].isVisible)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false

                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            local item = input.item
            sceneGroup[3]:refresh({item=item, category='gem'})
            sceneGroup[4]:refresh({item=item})

            sceneGroup[7]:enable(true)
        end
    })

    function itemsList:refreshCurrentItems()
        for i = 1, #self.items do
            self:refreshAtIndex(i)
        end
        self:select(0)
    end

    local COMMON = MAIN.UI.COMMON
    --3 description
    COMMON.createDescriptionGroup({
        parent=sceneGroup
    })

    --4 description 2
    local description2Group = COMMON.createDescription2Group({
        parent=sceneGroup
    })
    description2Group:setTouch(true)

    --5 Change
    COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Change',
        touch=function()
            sceneGroup[5].isVisible = false
            sceneGroup[6].isVisible = false
            sceneGroup[7].isVisible = true
            sceneGroup[7]:enable(false)

            sceneGroup[3]:refresh()
            sceneGroup[4]:refresh()

            itemsList:refreshCurrentItems()
        end
    })
    
    --6 remove
    local removeRect = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth*0.6,
        y=display.contentHeight-y,
        width=display.contentWidth*0.2,
        height=y,
        text='Remove',
        touch=function()
            MAIN.PLAYER.INVENTORY.changeEquipmentSlot(event.params.item, slotsScrollView.currentIndex, nil)
            MAIN.SYSTEM.SAVE.writeSave()

            scene:start()
        end
    })
    function removeRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end
    
    --7 select - use another rect to easily identify whether its equip or select
    COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Forge',
        touch=function()
            MAIN.PLAYER.INVENTORY.changeEquipmentSlot(event.params.item, slotsScrollView.currentIndex, itemsList:currentItem())
            MAIN.SYSTEM.SAVE.writeSave()

            scene:start()
        end
    })
 
end
 

function scene:start()
    local sceneGroup = self.view

    local equipmentItem = self.equipmentItem
    sceneGroup[1]:setItems(equipmentItem.slots)

    sceneGroup[3]:refresh({item=equipmentItem,category='equipment'})
    sceneGroup[4]:refresh()

    sceneGroup[5].isVisible = true
    sceneGroup[5]:enable(false)

    sceneGroup[6].isVisible = true
    sceneGroup[6]:enable(false)

    sceneGroup[7].isVisible = false

    sceneGroup[2]:setItems(MAIN.PLAYER.INVENTORY.getAllItems(4))
end

function scene:reselect(itemId)
    local sceneGroup = self.view

    --refreence this to speed up search??
    local oldItemIndex = sceneGroup[2].currentIndex

    if oldItemIndex ~= 0 then
        --same processing as inventory
        sceneGroup[2]:setItems(MAIN.PLAYER.INVENTORY.getAllItems(4))

        if itemId then
            local index = 0
            --if item is populated then a change has happened, we need to find the index of the item and reselect it, if it doesnt exist then ignore
            --Only check for minus 1 and plus one as it shouldnt change too far TODO when we sort by level we'll need to scroll up
            for i = (oldItemIndex - 1), (oldItemIndex + 1) do
                local item = sceneGroup[2]:itemAtIndex(i)
                if item and item.id == itemId then
                    index = i
                    break
                end
            end

            sceneGroup[2]:selectAndCall(index, true)
            if index == 0 then 
                sceneGroup[3]:refresh()
                sceneGroup[4]:refresh()
                sceneGroup[7]:enable(false)
            end

        end
    else
        --is run from slot
        local sceneGroup = self.view

        local currentIndex = sceneGroup[1].currentIndex
        local equipmentItem = self.equipmentItem
        equipmentItem:initializeSlots()
        sceneGroup[1]:setItems(equipmentItem.slots)
        sceneGroup[1]:selectAndCall(currentIndex)
    end
    
end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        
        self.equipmentItem = event.params.item
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

        local UTILITY = MAIN.UTILITY
        
        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName='FORGE',
            back=function()
                MAIN.UTILITY.gotoScene(composer.getSceneName('previous'))
            end,
            guild=true,
            gold=true,
            lives=true
        })

        self:start()

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