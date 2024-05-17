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

    local item = event.params.item

    --1 overlay
    MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

    local createRectangleGroup = MAIN.UI.CONTAINER.createRectangleGroup

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local height = display.contentHeight - y * 2
    local stageWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2 + CONSTANTS.rectanglePadding * 2
    local x = stageWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    
    --2 main group
    createRectangleGroup({
        parent=sceneGroup,
        x=x,
        y=y,
        width=display.contentWidth-x,
        height=height,
        create=function(input)
            --2 container
            local container = display.newContainer(input.width, input.height)
            input.parent:insert(container, true)

            --forward declare selects so it will deselect 
            local enemyListScrollView, firstRewardsScrollView, guildRewardsRect, partyRewardsRect, bonusRewardsRect, generalRewardsScrollView

            --background
            local image = MAIN.IMAGE.loadBackgroundPicture(CONSTANTS.terrain[item.terrain].imageName)
            image.x = input.x + input.width * 0.5
            image.y = input.y + input.height * 0.5
            image.anchorX = 0.5
            image.anchorY = 0.5

            local scale = math.min(math.floor(input.width / display.contentWidth), math.floor(input.height / display.contentHeight))
            image.scaleX = scale
            image.scaleY = scale

            container:insert(image)

            local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
            local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2

            --description
            local descriptionGroup = MAIN.UI.COMMON.createDescriptionGroup({
                parent=container,
                x=input.x+input.width-descriptionWidth+CONSTANTS.rectanglePadding,
                y=input.y-CONSTANTS.rectanglePadding-CONSTANTS.rectangleStrokeWidth
            })

            descriptionGroup:refresh()

            descriptionGroup.selectRects = {}
            function descriptionGroup:deselectRects(currentRect)
                for k, v in pairs(self.selectRects) do
                    if k ~= currentRect and v.select then
                        v:select(0)
                    end
                end
            end

            local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
            local itemWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
            local itemHeight = (display.contentHeight - y * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5
            local rewardsWidth = fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2
            local x = input.x + (input.width - rewardsWidth - itemWidth) * 0.5
            local TEXT = MAIN.UI.TEXT
            --enemies waves
            createRectangleGroup({
                parent=container,
                x=x,
                y=input.y,
                width=itemWidth-CONSTANTS.rectanglePadding*2,
                height=CONSTANTS.lineHeight,
                padding=0,
                create=function(input2)
                    if item.enemies then
                        local wavesCount = item.enemies.waves and #item.enemies.waves or 3

                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text=(wavesCount .. ' waves'),
                            alignY='centre'
                        })

                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width-TEXT.textWidth(' 100'),
                            height=input2.height,
                            text='Lv',
                            fontColour=CONSTANTS.textColourPink,
                            alignX='right',
                            alignY='centre'
                        })
                        
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text=item.enemies.level,
                            alignX='right',
                            alignY='centre'
                        })

                    else
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text='No enemies',
                            fontColour=CONSTANTS.textColourInvalid,
                            alignY='centre'
                        })
                    end
                end,
                refresh=function(input)

                end
            })

            if item.enemies then
                local listOfEnemies = {}
                local counter = 1
                local enemyIdList = {}

                if item.enemies.waves then
                    for i = 1, #item.enemies.waves do
                        local troop = MAIN.DATA.TROOP.getTroop(item.enemies.waves[i])
                        for j = 1, #troop do
                            if not enemyIdList[troop[j].enemyId] then
                                enemyIdList[troop[j].enemyId] = true

                                local enemy = MAIN.DATA.ENEMY.getEnemy(troop[j].enemyId)
                                listOfEnemies[counter] = {
                                    enemyId=troop[j].enemyId,
                                    name=enemy.name,
                                    boss=enemy.boss or false,
                                    level=item.enemies.level
                                }
                                counter = counter + 1
                            end
                        end
                    end
                elseif item.enemies.terrain then
                    if item.enemies.terrain ~= 0 then
                        local allEnemiesWithBosses = MAIN.DATA.QUEST.getTowerEnemies()[2][item.enemies.terrain]

                        for i = 1, #allEnemiesWithBosses do
                            for j = 1, #allEnemiesWithBosses[i] do
                                local troop = MAIN.DATA.TROOP.getTroop(allEnemiesWithBosses[i][j])
                                for k = 1, #troop do 
                                    if not enemyIdList[troop[k].enemyId] then
                                        enemyIdList[troop[k].enemyId] = true
        
                                        local enemy = MAIN.DATA.ENEMY.getEnemy(troop[k].enemyId)
                                        listOfEnemies[counter] = {
                                            enemyId=troop[k].enemyId,
                                            name=enemy.name,
                                            boss=enemy.boss or false,
                                            level=item.enemies.level
                                        }
                                        counter = counter + 1
                                    end
                                end
                            end
                        end
                    else
                        listOfEnemies[counter] = {
                            enemyId=0,
                            name='Random',
                            boss=false,
                            level=item.enemies.level
                        }
                    end
                elseif item.enemies.terrains then
                    for t = 1, #item.enemies.terrains do
                        local allEnemiesWithBosses = MAIN.DATA.QUEST.getTowerEnemies()[2][item.enemies.terrains[t]]

                        for i = 1, #allEnemiesWithBosses do
                            for j = 1, #allEnemiesWithBosses[i] do
                                local troop = MAIN.DATA.TROOP.getTroop(allEnemiesWithBosses[i][j])
                                for k = 1, #troop do 
                                    if not enemyIdList[troop[k].enemyId] then
                                        enemyIdList[troop[k].enemyId] = true
        
                                        local enemy = MAIN.DATA.ENEMY.getEnemy(troop[k].enemyId)
                                        listOfEnemies[counter] = {
                                            enemyId=troop[k].enemyId,
                                            name=enemy.name,
                                            boss=enemy.boss or false,
                                            level=item.enemies.level
                                        }
                                        counter = counter + 1
    
                                    end
                                end
                            end
                        end
                    end
                end

                --2 4 enemies list
                descriptionGroup.selectRects.enemiesList = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
                    parent=container,
                    x=x,
                    y=input.y+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
                    width=itemWidth-CONSTANTS.rectanglePadding*2,
                    height=input.height-CONSTANTS.lineHeight-CONSTANTS.rectangleSpacing,
                    padding=0,
                    rows=11,
                    columns=1,
                    items=listOfEnemies,
                    create=function(input2)
                        --2
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width-TEXT.textWidth(' Boss', CONSTANTS.fontSizeSmall),
                            height=input2.height,
                            text='',
                            alignY='centre'
                        })

                        --3 boss
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height-12,
                            text='Boss',
                            fontSize=CONSTANTS.fontSizeSmall,
                            fontColour=CONSTANTS.textColourPink,
                            alignX='right',
                            alignY='centre'
                        })

                    end,
                    refresh=function(input2)
                        if input2.item then
                            input2.parent[2].isVisible = true
                            input2.parent[2]:setText(input2.item.name)

                            input2.parent[3].isVisible = input2.item.boss

                            input2.parent:enableTouch(input2.item.enemyId > 0)
                        else
                            input2.parent[2].isVisible = false
                            input2.parent[3].isVisible = false
                            input2.parent:enableTouch(false)
                        end
                    end,
                    touch=function(input2)
                        descriptionGroup:deselectRects('enemiesList')
                        descriptionGroup:refresh({item=input2.item, category='enemy'})
                    end
                })
            end

            --floor
            createRectangleGroup({
                parent=container,
                x=input.x+input.width-rewardsWidth,
                y=input.y,
                width=rewardsWidth-descriptionWidth+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
                height=CONSTANTS.lineHeight+CONSTANTS.textHeight,
                padding=0,
                create=function(input2)
                    --2
                    TEXT.drawText({
                        parent=input2.parent,
                        x=input2.x,
                        y=input2.y,
                        width=input2.width,
                        height=CONSTANTS.lineHeight,
                        text=('Floor ' .. event.params.floorIndex),
                        fontColour=CONSTANTS.textColourPink,
                        alignX='centre',
                        alignY='centre'
                    })

                    if event.params.isFloorCleared then
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y+CONSTANTS.lineHeight,
                            text='Clear',
                            fontColour=CONSTANTS.textColourGreen,
                            fontSize=CONSTANTS.fontSizeSmall
                        })
                    elseif not event.params.isEnabled then
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y+CONSTANTS.lineHeight,
                            text='Locked',
                            fontColour=CONSTANTS.textColourRed,
                            fontSize=CONSTANTS.fontSizeSmall
                        })
                    end

                    if item.canAuto then
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y+CONSTANTS.lineHeight,
                            text='Quick Clear',
                            width=input2.width,
                            fontColour=(event.params.isFloorCleared and CONSTANTS.textColourYellow or CONSTANTS.textColourInvalid),
                            fontSize=CONSTANTS.fontSizeSmall,
                            alignX='right'
                        })
                    end

                end,
                refresh=function(input2)

                end
            })

            if composer.getVariable('quest') == 'arena' then
                local rewardsY = input.y + input.height - CONSTANTS.lineHeight * 6 - CONSTANTS.rectangleSpacing * 4 
                MAIN.UI.COMMON.createRectangleWithText({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=rewardsWidth,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    text='ARENA CHALLENGES',
                    fontColour=CONSTANTS.textColourPink
                })

                rewardsY = rewardsY + CONSTANTS.lineHeight + CONSTANTS.rectangleSpacing - CONSTANTS.rectangleStrokeWidth
                
                local save = MAIN.SYSTEM.SAVE.getSave()
                local arenaItem = {}
                for i = 1, #save.arena.challengeIds do
                    arenaItem[i] = {
                        name=MAIN.DATA.QUEST.getArenaChallenges()[save.arena.challengeIds[i]].text,
                        isComplete=save.quests.arena[i]
                    }
                end
                --arena challenges
                descriptionGroup.selectRects.arenaChallengesList = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=rewardsWidth,
                    height=(CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing)*4-CONSTANTS.rectangleSpacing,
                    padding=0,
                    rows=4,
                    columns=1,
                    numItems=4,
                    items=arenaItem,
                    create=function(input2)
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text='',
                            alignY='centre'
                        })
                    end,
                    refresh=function(input2)
                        if input2.item then
                            input2.parent[2].isVisible = true
                            input2.parent[2]:setText(input2.item.name, input2.item.isComplete and CONSTANTS.textColourInvalid or CONSTANTS.textColour)
                            input2.parent:enableTouch(true)
                        else
                            input2.parent[2].isVisible = false
                            input2.parent:enableTouch(false)
                        end
                    end,
                    touch=function(input2)
                        descriptionGroup:deselectRects('arenaChallengesList')
                        descriptionGroup:refresh({item=input2.item, category='arena'})
                    end
                })

                rewardsY = rewardsY + (CONSTANTS.lineHeight + CONSTANTS.rectangleSpacing) * 4
                createRectangleGroup({
                    parent=input.parent,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    create=function(input2)
                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text='Reward per Challenge',
                            fontColour=CONSTANTS.textColourPink,
                            alignY='centre'
                        })
                    end,
                    refresh=function(input2)

                    end
                })

                descriptionGroup.selectRects.generalRewardsList = createRectangleGroup({
                    parent=input.parent,
                    x=input.x+input.width-(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    y=rewardsY,
                    width=(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    create=function(input2)
                        TEXT.drawItemName({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            item={
                                icon=MAIN.DATA.ITEM.getItem(item.rewards.general[1].category, item.rewards.general[1].id).icon,
                                name=item.rewards.general[1].count
                            }
                        })
                    end,
                    refresh=function(input2)

                    end,
                    touch=function()
                        --fake a select on the rect group
                        descriptionGroup.selectRects.generalRewardsList[1].canTouch = false
                        local selectedColour = CONSTANTS.rectangleSelectedCOlour
                        descriptionGroup.selectRects.generalRewardsList[1]:setFillColor(selectedColour[1], selectedColour[2], selectedColour[3], selectedColour[4])

                        descriptionGroup:deselectRects('generalRewardsList')
                        descriptionGroup:refresh({item=MAIN.DATA.ITEM.getItem(item.rewards.general[1].category, item.rewards.general[1].id)})
                    end
                })

                function descriptionGroup.selectRects.generalRewardsList:select()
                    self[1].canTouch = true
                    local fillColour = CONSTANTS.rectangleFillColour
                    self[1]:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
                end
            else
                local rewardsY = input.y + input.height - CONSTANTS.lineHeight * 6 - CONSTANTS.rectangleSpacing * 4 - CONSTANTS.rectangleStrokeWidth
                MAIN.UI.COMMON.createRectangleWithText({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=rewardsWidth,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    text='FIRST',
                    fontColour=CONSTANTS.textColourPink
                })

                rewardsY = rewardsY + CONSTANTS.lineHeight + CONSTANTS.rectangleSpacing
                --first rewards
                descriptionGroup.selectRects.firstRewardsList = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=rewardsWidth,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    rows=1,
                    columns=2,
                    numItems=2,
                    items=item.rewards.first,
                    create=function(input2)
                        TEXT.drawItemName({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width-TEXT.textWidth(' 50%'),
                            height=input2.height
                        })
                    end,
                    refresh=function(input2)
                        if input2.item then
                            input2.parent[2].isVisible = true
                            local fontColour = event.params.isFloorCleared and CONSTANTS.textColourInvalid or CONSTANTS.textColour
                            local icon, name
                            if input2.item.icon and input2.item.name then
                                icon = input2.item.icon
                                name = input2.item.name .. ' x' .. input2.item.count
                            else

                                if input2.item.category == 0 then
                                    icon = CONSTANTS.goldIcon
                                    name = input2.item.count
                                else
                                    local rewardItem = MAIN.DATA.ITEM.getItem(input2.item.category, input2.item.id)
                                    icon = rewardItem.icon
                                    name = rewardItem.name .. ' x' .. input2.item.count
                                end
                            end
                            input2.parent[2]:setItem({icon=icon, name=name}, fontColour)
                            input2.parent:enableTouch(true)
                        else
                            input2.parent[2].isVisible = false
                            input2.parent:enableTouch(false)
                        end
                    end,
                    touch=function(input2)
                        descriptionGroup:deselectRects('firstRewardsList')
                        local descItem
                        if input2.item.name and input2.item.icon and input2.item.description then
                            descriptionGroup:refresh({item=input2.item})
                        else
                            local dataItem = MAIN.DATA.ITEM.getItem(input2.item.category, input2.item.id)
                            descriptionGroup:refresh({item=dataItem})
                        end
                    end
                })

                rewardsY = rewardsY + CONSTANTS.lineHeight + CONSTANTS.rectangleSpacing

                MAIN.UI.COMMON.createRectangleWithText({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=rewardsWidth,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    text='GENERAL',
                    fontColour=CONSTANTS.textColourPink
                })

                rewardsY = rewardsY + CONSTANTS.lineHeight + CONSTANTS.rectangleSpacing
                --guild exp
                descriptionGroup.selectRects.guildRewardsList = createRectangleGroup({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY,
                    width=(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    create=function(input2)
                        local guildExp = item.rewards.battle.guild or 0
                        local fontColour = guildExp > 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                        local guildExpItem = TEXT.drawItemName({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                        })
                        guildExpItem:setItem({
                            icon=4,
                            name='Guild Exp'
                        }, fontColour)

                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text=guildExp,
                            fontColour=fontColour,
                            alignX='right',
                            alignY='centre'
                        })
                    end,
                    refresh=function(input2)

                    end,
                    touch=function()
                        --fake a select on the rect group
                        descriptionGroup.selectRects.guildRewardsList[1].canTouch = false
                        local selectedColour = CONSTANTS.rectangleSelectedCOlour
                        descriptionGroup.selectRects.guildRewardsList[1]:setFillColor(selectedColour[1], selectedColour[2], selectedColour[3], selectedColour[4])

                        descriptionGroup:deselectRects('guildRewardsList')
                        descriptionGroup:refresh({item={
                            icon=4,
                            name='Guild Exp',
                            description='Exp gained for guild'
                        }})
                    end
                })
                
                function descriptionGroup.selectRects.guildRewardsList:select()
                    self[1].canTouch = true
                    local fillColour = CONSTANTS.rectangleFillColour
                    self[1]:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
                end

                --party exp
                descriptionGroup.selectRects.partyRewardsList = createRectangleGroup({
                    parent=container,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
                    width=(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    create=function(input2)
                        local partyExp = item.rewards.battle.party or 0
                        local fontColour = partyExp > 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                        local partyExpItem = TEXT.drawItemName({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                        })
                        partyExpItem:setItem({
                            icon=160,
                            name='Party Exp'
                        }, fontColour)

                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text=partyExp,
                            fontColour=fontColour,
                            alignX='right',
                            alignY='centre'
                        })
                    end,
                    refresh=function(input2)

                    end,
                    touch=function()
                        --fake a select on the rect group
                        descriptionGroup.selectRects.partyRewardsList[1].canTouch = false
                        local selectedColour = CONSTANTS.rectangleSelectedCOlour
                        descriptionGroup.selectRects.partyRewardsList[1]:setFillColor(selectedColour[1], selectedColour[2], selectedColour[3], selectedColour[4])

                        descriptionGroup:deselectRects('partyRewardsList')
                        descriptionGroup:refresh({item={
                            icon=4,
                            name='Party Exp',
                            description='Exp gained for party'
                        }})
                    end
                })
                
                function descriptionGroup.selectRects.partyRewardsList:select()
                    self[1].canTouch = true
                    local fillColour = CONSTANTS.rectangleFillColour
                    self[1]:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
                end

                --bonus
                descriptionGroup.selectRects.bonusRewardsList = createRectangleGroup({
                    parent=input.parent,
                    x=input.x+input.width-rewardsWidth,
                    y=rewardsY+(CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing)*2,
                    width=(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    height=CONSTANTS.lineHeight,
                    padding=0,
                    create=function(input2)
                        if item.rewards.battle.bonus then
                            TEXT.drawText({
                                parent=input2.parent,
                                x=input2.x,
                                y=input2.y,
                                width=input2.width,
                                height=input2.height,
                                text='Bonus',
                                fontColour=CONSTANTS.textColourPink,
                                alignY='centre'
                            })

                            local getTokenIcon = function(actorId)
                                return MAIN.IMAGE.loadIconFrame(MAIN.DATA.ITEM.getItem(2, 10 + actorId).icon)
                            end

                            local iconX = input2.x + CONSTANTS.textPadding + TEXT.textWidth('Bonus') + CONSTANTS.iconPadding
                            local iconY = input2.y + (input2.height - CONSTANTS.iconHeight) * 0.5
                            for i = 1, #item.rewards.battle.bonus do
                                local icon = getTokenIcon(item.rewards.battle.bonus[i])
                                icon.x = iconX
                                icon.y = iconY

                                input2.parent:insert(icon)

                                iconX = iconX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                            end
                        end
                    end,
                    refresh=function(input2)
                        if item.rewards.battle.bonus then
                            input2.parent:enableTouch(true)
                        else
                            input2.parent:enableTouch(false)
                        end
                    end,
                    touch=function()
                        --fake a select on the rect group
                        descriptionGroup.selectRects.bonusRewardsList[1].canTouch = false
                        local selectedColour = CONSTANTS.rectangleSelectedCOlour
                        descriptionGroup.selectRects.bonusRewardsList[1]:setFillColor(selectedColour[1], selectedColour[2], selectedColour[3], selectedColour[4])

                        descriptionGroup:deselectRects('bonusRewardsList')
                        descriptionGroup:refresh({item=item.rewards.battle.bonus, category='bonus'})
                    end
                })
                descriptionGroup.selectRects.bonusRewardsList:refresh()
                
                function descriptionGroup.selectRects.bonusRewardsList:select()
                    if item.rewards.battle.bonus then
                        self[1].canTouch = true
                        local fillColour = CONSTANTS.rectangleFillColour
                        self[1]:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
                    end
                end

                --general
                descriptionGroup.selectRects.generalRewardsList = MAIN.UI.CONTAINER.createScrollViewWithRectangles({
                    parent=input.parent,
                    x=input.x+input.width-(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    y=rewardsY,
                    width=(rewardsWidth-CONSTANTS.rectangleSpacing)*0.5,
                    height=CONSTANTS.lineHeight*3+CONSTANTS.rectangleSpacing*2,
                    padding=0,
                    rows=3,
                    columns=1,
                    numItems=3,
                    items=item.rewards.general,
                    create=function(input2)
                        TEXT.drawItemName({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width-TEXT.textWidth(' 50%'),
                            height=input2.height
                        })

                        TEXT.drawText({
                            parent=input2.parent,
                            x=input2.x,
                            y=input2.y,
                            width=input2.width,
                            height=input2.height,
                            text='',
                            alignX='right',
                            alignY='centre'
                        })
                    end,
                    refresh=function(input2)
                        if input2.item then
                            input2.parent[2].isVisible = true
                            local fontColour = CONSTANTS.textColour
                            local icon, name
                            if input2.item.icon and input2.item.name then
                                icon = input2.item.icon
                                name = input2.item.name .. ' x' .. input2.item.count
                            else

                                if input2.item.category == 0 then
                                    icon = CONSTANTS.goldIcon
                                    name = input2.item.count
                                else
                                    local rewardItem = MAIN.DATA.ITEM.getItem(input2.item.category, input2.item.id)
                                    icon = rewardItem.icon
                                    name = rewardItem.name .. ' x' .. input2.item.count
                                end
                            end
                            input2.parent[2]:setItem({icon=icon, name=name}, fontColour)

                            if input2.item.chance and input2.item.chance < 1 then
                                input2.parent[3].isVisible = true
                                input2.parent[3]:setText(input2.item.chance*100 .. '%')
                            else
                                input2.parent[3].isVisible = false
                            end

                            input2.parent:enableTouch(true)
                        else
                            input2.parent[2].isVisible = false
                            input2.parent[3].isVisible = false
                            input2.parent:enableTouch(false)
                        end
                    end,
                    touch=function(input2)
                        descriptionGroup:deselectRects('generalRewardsList')
                        local descItem
                        if input2.item.name and input2.item.icon and input2.item.description then
                            descriptionGroup:refresh({item=input2.item})
                        else
                            local dataItem = MAIN.DATA.ITEM.getItem(input2.item.category, input2.item.id)
                            descriptionGroup:refresh({item=dataItem})
                        end
                    end
                })
            end
        end,
        refresh=function(input)

        end
    })

    --3 back
    MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=CONSTANTS.backWidth,
        height=y,
        text='Back',
        touch=function()
            composer.hideOverlay()
        end
    })

    --4 select rect
    local enterRect = MAIN.UI.COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Enter',
        touch=function()
            composer.setVariable('floor', event.params.floorIndex)
            MAIN.UTILITY.gotoScene('scene.hub.party.party')
        end
    })
    enterRect:enable(event.params.isEnabled)

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