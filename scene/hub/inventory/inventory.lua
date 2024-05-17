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

    --1 Categories
    local categoriesScrollView = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category='General',
                key='general'
            }, {
                category='Token',
                key='token'
            }, {
                category='Tome',
                key='tome'
            }, {
                category='Gem',
                key='gem'
            }, {
                category='Weapon',
                key='weapon'
            }, {
                category='Body',
                key='body'
            }, {
                category='Head',
                key='head'
            }, {
                category='Leg',
                key='leg'
            }, {
                category='Accessory',
                key='accessory'
            }
        },
        touch=function(input)
            local items = composer.getVariable('collection') and MAIN.PLAYER.INVENTORY.getAllItemsForCollection(input.index) or MAIN.PLAYER.INVENTORY.getAllItems(input.index)

            sceneGroup[2]:setItems(items)

            sceneGroup[3]:refresh()
            sceneGroup[4]:refresh()

            sceneGroup[5].isVisible = false
        end
    })

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local inventoryWidth = fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2 + CONSTANTS.rectanglePadding * 2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local CONTAINER = MAIN.UI.CONTAINER
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

            --3 Count
            TEXT.drawText({
                parent=input.parent,
                x=input.x+input.width-countWidth-CONSTANTS.textPadding,
                y=input.y,
                width=countWidth,
                height=input.height,
                text='',
                alignX='right',
                alignY='centre',
                paddingX=0
            })

            --4 Level Group
            local levelGroup = display.newGroup()
            input.parent:insert(levelGroup)

            --4 1 
            TEXT.drawText({
                parent=levelGroup,
                x=input.x+input.width-TEXT.textWidth(' Lv 10', CONSTANTS.fontSizeSmall),
                y=input.y,
                text='Lv',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink
            })

            --4 2 Level
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

                local level = item:level()
                if level > 0 then
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = true
                    input.parent[4][2]:setText(level)
                else
                    if composer.getVariable('collection') then
                        input.parent[3].isVisible = false
                    else
                        input.parent[3].isVisible = true
                        input.parent[3]:setText(item:count())
                    end

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
            local category
            local isForgeVisible = false
            local isForgeEnabled = false
            if item:isEquipment() then
                category = 'equipment'
                isForgeVisible = not composer.getVariable('collection')
                isForgeEnabled = (not not item.slots)
            elseif item.category == 4 then
                category = 'gem'
            end
            sceneGroup[3]:refresh({item=item, category=category})
            sceneGroup[4]:refresh({item=item})

            sceneGroup[5].isVisible = isForgeVisible
            sceneGroup[5]:enableTouch(isForgeEnabled)
        end
    })

    local COMMON = MAIN.UI.COMMON
    --3 description
    COMMON.createDescriptionGroup({
        parent=sceneGroup
    })

    --4 description 2
    COMMON.createDescription2Group({
        parent=sceneGroup
    })

    --5 Forge
    local forgeRect = COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Forge',
        touch=function()
            composer.setVariable('inventoryCategory', categoriesScrollView.currentIndex)
            composer.setVariable('inventoryItem', itemsList.currentIndex)

            MAIN.UTILITY.gotoScene('scene.hub.inventory.forge', {
                item=itemsList:currentItem()
            })
        end
    })
    forgeRect.isVisible = false

end

function scene:reselect(itemId)
    local sceneGroup = self.view

    --refreence this to speed up search??
    local oldItemIndex = sceneGroup[2].currentIndex

    sceneGroup[1]:selectAndCall(sceneGroup[1].currentIndex, true)

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
        
        local sceneName = 'INVENTORY'
        local backScene = 'scene.hub.hub'
        if composer.getVariable('collection') then
            sceneName = 'COLLECTION'
            backScene = 'scene.hub.collection.collection'
            sceneGroup[4]:setTouch(false)
        else
            sceneGroup[4]:setTouch(true)
        end

        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName=sceneName,
            back=function()
                UTILITY.gotoScene(backScene)
            end,
            guild=true,
            gold=true,
            lives=true
        })

        local index = composer.getVariable('inventoryCategory')
        if index then
            sceneGroup[1]:selectAndCall(index, true)
            sceneGroup[2]:selectAndCall(composer.getVariable('inventoryItem'))

            UTILITY.removeComposerVariable('inventoryCategory')
            UTILITY.removeComposerVariable('inventoryItem')
        else
            sceneGroup[1]:selectAndCall(1, true)
        end

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