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

    local TEXT = MAIN.UI.TEXT
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --1
    TEXT.drawText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=display.contentWidth,
        height=y,
        text='OPTIONS',
        fontColour=CONSTANTS.textColourPink,
        fontSize=40,
        alignX='centre',
        alignY='centre'
    })

    --2 Category
    local categoryScrollView = MAIN.UI.COMMON.createCategoryScrollView({
        parent=sceneGroup,
        items={
            {
                category='General',
                key='general'
            }, {
                category='Audio',
                key='audio'
            }, {
                category='Battle',
                key='battle'
            }, {
                category='Data',
                key='data'
            } 
        },
        touch=function(input)
            sceneGroup[3]:setItems(MAIN.DATA.OPTIONS.getOptions(input.item.key))
        end
    })

    --3 Options
    local optionsScrollView = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        rows=7,
        columns=1,
        numItems=7,
        isTouchEnabled=false,
        create=function(input)
            local textWidth = input.width * 0.6
            --2 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=textWidth,
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y+CONSTANTS.lineHeight,
                width=textWidth,
                height=CONSTANTS.lineHeight,
                text=''
            })

            --4 scrollview
            local scrollViewHeight = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
            local scrollviewGroup = display.newGroup()
            scrollviewGroup.coords = {
                x=input.x+textWidth,
                y=input.y+(input.height-scrollViewHeight)*0.5,
                width=input.width-textWidth,
                height=scrollViewHeight
            }
            input.parent:insert(scrollviewGroup)
        end,
        refresh=function(input)
            --remove existing scrollview
            while input.parent[4].numChildren > 0 do
                input.parent[4][1]:removeSelf()
            end

            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[2]:setText(item.title)

                input.parent[3].isVisible = true
                input.parent[3]:setText(item.description)

                local coords = input.parent[4].coords
                local scrollViewOptions = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
                    parent=input.parent[4],
                    x=coords.x,
                    y=coords.y,
                    width=coords.width,
                    height=coords.height,
                    rows=1,
                    columns=#item.items,
                    items=item.items,
                    create=function(input2)
                        --2
                        MAIN.UI.TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text='',
                            alignX='centre',
                            alignY='centre'
                        })
                    end,
                    refresh=function(input2)
                        input2.parent[2]:setText(input2.item.text)
                    end,
                    touch=function(input2)
                        if item.key == 'delete' then
                            input.parent[4][1]:select(0)
                            composer.showOverlay('overlay.options.delete', {
                                isModal = true,
                                params = {
                                    
                                }
                            })
                        else
                            MAIN.SYSTEM.OPTIONS.setOptionWithKey(categoryScrollView:currentItem().key, item.key, input2.item.value)
                        end
                    end
                })
                local currentIndex = 0
                if item.key ~= 'delete' then
                    local currentValue = MAIN.SYSTEM.OPTIONS.getOptionWithKey(categoryScrollView:currentItem().key, item.key)
                    for i = 1, #item.items do
                        if item.items[i].value == currentValue then
                            currentIndex = i
                            break
                        end
                    end
                end
                        
                scrollViewOptions:select(currentIndex)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
            end

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

        local UTILITY = MAIN.UTILITY

        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            back=function()
                UTILITY.gotoScene(composer.getSceneName('previous'))
                UTILITY.updateLowerUiLayer()
            end,
        })
        
        UTILITY.showLoadingLayer(false)

        sceneGroup[2]:selectAndCall(1)
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