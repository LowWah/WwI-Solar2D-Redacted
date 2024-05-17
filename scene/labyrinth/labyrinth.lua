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

    --consume labyrinthCost
    if composer.getVariable('labyrinthCost') == 1 then
        MAIN.PLAYER.INVENTORY.loseItem(1, 17, 1)
    else
        MAIN.PLAYER.LIVES.gainLives(-1 * CONSTANTS.labyrinthLivesCost)
    end

    MAIN.UTILITY.removeComposerVariable('labyrinthCost')
    MAIN.SYSTEM.SAVE.writeSave()

    --create a battle manager that is passed to each battle
    local battleManager = MAIN.BATTLE.initializeBattleManagerForLabyrinth()

    local labyrinthLevel = 10
    for i = 1, #battleManager.party do
        labyrinthLevel = math.max(labyrinthLevel, battleManager.party[i].level)
    end

    --forward declare
    local labyrinthManager

    --start at two, we use one to force an failed message from battle
    composer.setVariable('battleResult', 2)

    local CONTAINER = MAIN.UI.CONTAINER
    local TEXT = MAIN.UI.TEXT

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --1 title
    TEXT.drawText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=display.contentWidth,
        height=y,
        text='LABYRINTH',
        fontColour=CONSTANTS.textColourPink,
        fontSize=40,
        alignX='centre',
        alignY='centre'
    })

    local titleX = display.contentCenterX + TEXT.textWidth('Labyrinth ', 40) * 0.5
    --2 
    TEXT.drawText({
        parent=sceneGroup,
        x=titleX,
        y=0,
        height=y,
        text='Lv',
        fontColour=CONSTANTS.textColourPink,
        alignY='centre'
    })

    titleX = titleX + TEXT.textWidth('Lv ')
    --3 
    TEXT.drawText({
        parent=sceneGroup,
        x=titleX,
        y=0,
        height=y,
        text=labyrinthLevel,
        alignY='centre'
    })

    local iconRectangleWidth = CONSTANTS.iconWidth + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
    local iconRectangleHeight = CONSTANTS.iconHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
    --4 Escape
    local escapeButton = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-iconRectangleWidth,
        y=0,
        width=iconRectangleWidth,
        height=iconRectangleHeight,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.battleIconEscape)
            input.parent:insert(icon)
            icon.x=input.x
            icon.y=input.y
        end,
        refresh=function(input)

        end,
        touch=function()
            labyrinthManager.characterSprite:pause()
            composer.showOverlay('overlay.labyrinth.escape', {
                isModal = true,
                params = {
                    labyrinthManager=labyrinthManager
                }
            })
        end
    })

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local itemsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local partyWidth = itemsWidth --CONSTANTS.backWidth + itemsWidth - CONSTANTS.rectanglePadding + CONSTANTS.rectangleSpacing
    
    --5 Party
    local partyScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=0,
        y=y,
        width=partyWidth,
        height=display.contentHeight-y,
        rows=5,
        columns=1,
        numItems=5,
        create=function(input)
            --2 container
            local container = display.newContainer(input.width, input.height)
            input.parent:insert(container, true)

            --2 1 face group
            local faceGroup = display.newGroup()
            container:insert(faceGroup)
            faceGroup.coords = {
                x=input.x,
                y=input.y+(input.height-CONSTANTS.faceHeight)*0.5
            }

            local iconX = input.x + CONSTANTS.faceWidth - CONSTANTS.iconWidth - CONSTANTS.iconPadding
            local iconY = input.y + CONSTANTS.iconPadding * 0.5
            local loadIconFrame = MAIN.IMAGE.loadIconFrame
            --2 2 rank icon
            local rank = loadIconFrame(1)
            container:insert(rank)
            rank.x = iconX
            rank.y = iconY

            --2 3 rating icon
            local rating = loadIconFrame(1)
            container:insert(rating)
            rating.x = iconX
            rating.y = iconY + CONSTANTS.iconHeight + CONSTANTS.iconPadding

            --level??

            local x = input.x + CONSTANTS.faceWidth
            local y = input.y
            --2 4 name
            TEXT.drawText({
                parent=container,
                x=x,
                y=y,
                width=input.width-CONSTANTS.faceWidth,
                text='',
            })

            y = y + CONSTANTS.iconPadding

            local texts = { 'HP', 'MP', 'TP' }
            local currentX = x + TEXT.textWidth('HP', CONSTANTS.fontSizeSmall) + CONSTANTS.textPadding
            local maxX = currentX + TEXT.textWidth('999') + CONSTANTS.textPadding
            local maxWidth = TEXT.textWidth('/999') + CONSTANTS.textPadding * 2
            local currentWidth = input.width - currentX + input.x - maxWidth + CONSTANTS.textPadding * 3
            for i = 1, #texts do

                y = y + CONSTANTS.textHeight
                --2 5 (+3)
                TEXT.drawText({
                    parent=container,
                    x=x,
                    y=y,
                    width=input.width-CONSTANTS.faceWidth,
                    text=texts[i],
                    fontSize=CONSTANTS.fontSizeSmall,
                    fontColour=CONSTANTS.textColourPink
                })

                --2 6 (+3) current
                TEXT.drawText({
                    parent=container,
                    x=currentX,
                    y=y,
                    width=currentWidth,
                    text='',
                    alignX='right'
                })

                --2 7 (+3) max
                TEXT.drawText({
                    parent=container,
                    x=maxX,
                    y=y,
                    width=maxWidth,
                    text=''
                })

            end
        end,
        refresh=function(input)
            local item = input.item
            if item then
                local container = input.parent[2]
                container.isVisible = true

                --1 face
                while container[1].numChildren > 0 do
                    container[1][1]:removeSelf()
                end
                local face = MAIN.IMAGE.loadFacePicture(item.face)
                face.x = container[1].coords.x
                face.y = container[1].coords.y
                container[1]:insert(face)

                --2 rank
                container[2].fill.frame = item.rankIcon

                --3 rating
                container[3].fill.frame = item.ratingIcon

                --4 name
                container[4]:setText(item.name)

                --6 current hp
                container[6]:setText(item:hp())
                
                --7 max hp
                container[7]:setText('/' .. item:maxHp())

                --9 current mp
                container[9]:setText(item:mp())
                
                --10 max mp
                container[10]:setText('/' .. item:maxMp())
                
                --12 current tp
                container[12]:setText(item.tp)
                
                --13 max tp
                container[13]:setText('/' .. item:maxTp())

            else
                input.parent[2].isVisible = false
                input.parent:enableTouch(false)
            end
            
        end,
        touch=function(input)
            local scrollView = input.parent.scrollView
            if scrollView.currentSelectedFormation == 0 then
                scrollView.currentSelectedFormation = input.index
            else
                --swap
                local oldActor = scrollView:itemAtIndex(scrollView.currentSelectedFormation)
                scrollView.items[scrollView.currentSelectedFormation] = input.item
                scrollView.items[input.index] = oldActor

                --refresh
                scrollView:refreshAtIndex(scrollView.currentSelectedFormation)
                scrollView:refreshAtIndex(input.index)

                --reset
                scrollView.currentSelectedFormation = 0
                scrollView:select(0)

                --recreate character sprite, we could refresh instead but wahtever
                labyrinthManager:createCharacterSprite()
            end
        end
    })

    --we need to save the index as the old select index already gets updated on touch
    partyScrollView.currentSelectedFormation = 0

    function partyScrollView:enableFormation(isEnabled)
        self:select(0)

        for i = 1, self._collectorGroup.numChildren do
            self._collectorGroup[i]:enableTouch(isEnabled)
        end

        --reset this
        self.currentSelectedFormation = 0
    end

    partyScrollView:enableFormation(false)

    --6 formation
    local formationButton = MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=display.contentWidth*0.2,
        height=y,
        text='Formation',
        touch=function()
            labyrinthManager.characterSprite:pause()
            composer.showOverlay('overlay.labyrinth.formation', {
                isModal = true,
                params = {
                    partyScrollView=partyScrollView
                }
            })
        end
    })

    local gemRates = { 0, 0, 0 }
    if labyrinthLevel >= 100 then
        --rare
        gemRates[3] = 1
    elseif labyrinthLevel >= 81 then
        --uncommon/ rate
        local rareRate = math.round((labyrinthLevel - 72) * 3.5) / 100
        local uncommonRate = 1 - rareRate

        gemRates[2] = uncommonRate
        gemRates[3] = rareRate
    elseif labyrinthLevel >= 61 then
        --common/ uncommon/ rare
        local uncommonRate = math.round((labyrinthLevel - 40) * 1.5) / 100
        local rareRate = math.round((labyrinthLevel - 60) * 1.5) / 100
        local commonRate = 1 - uncommonRate - rareRate

        gemRates[1] = commonRate
        gemRates[2] = uncommonRate
        gemRates[3] = rareRate
    elseif labyrinthLevel >= 41 then
        --common/ uncommon
        local uncommonRate = math.round((labyrinthLevel - 40) * 2) / 100
        local commonRate = 1 - uncommonRate

        gemRates[1] = commonRate
        gemRates[2] = uncommonRate
    else
        --common
        gemRates[1] = 1
    end


    local listX = display.contentWidth - itemsWidth
    local listLength = 3
    local listHeight = CONSTANTS.lineHeight * listLength + CONSTANTS.rectangleSpacing * (listLength - 1) + CONSTANTS.rectanglePadding * 2
    --7 bonus/ penalty list
    local bonusGroup = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=listX,
        y=y,
        width=itemsWidth,
        height=listHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            
            local y = input.y
            
            local x = input.x
            local halfWidth = input.width * 0.5

            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=halfWidth,
                height=CONSTANTS.lineHeight,
                text='Bonus',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 bonus value
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Bonus '),
                y=y,
                width=TEXT.textWidth('9999%')+ CONSTANTS.textPadding*2,
                height=CONSTANTS.lineHeight,
                text='0%',
                alignY='centre'
            })

            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Bonus 9999%'),
                y=y,
                width=input.width-TEXT.textWidth('Bonus 9999%'),
                height=CONSTANTS.lineHeight,
                text='Common/Uncommon/Rare',
                fontColour=CONSTANTS.textColourPink,
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right',
            })

            local ratesText = (gemRates[1] * 100) .. '%/' .. (gemRates[2] * 100) .. '%/' .. (gemRates[3] * 100) .. '%'
            --5 rates
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Bonus 9999%'),
                y=y+4,
                width=input.width-TEXT.textWidth('Bonus 9999%'),
                height=CONSTANTS.lineHeight,
                text=ratesText,
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --stats
            for i = 1, 6 do
                --5 (+2)
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+(halfWidth*((i+1)%2)),
                    y=y+CONSTANTS.textHeight*math.floor((i-1)/2),
                    width=halfWidth,
                    text=CONSTANTS.paramStatsShort[i+2],
                    fontColour=CONSTANTS.textColourPink
                })

                --6 (+2) stat reduction
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+(halfWidth*((i+1)%2))+TEXT.textWidth('ATK '),
                    y=y+CONSTANTS.textHeight*math.floor((i-1)/2),
                    width=halfWidth-TEXT.textWidth('ATK '),
                    text='100%',
                    alignX='right'
                })
            end

        end,
        refresh=function(input)
            input.parent[3]:setText(math.round(input.bonus * 100) .. '%')
                for i = 1, #input.penalty do
                    local penalty = input.penalty[i]
                    local fontColour = penalty < 1 and CONSTANTS.textColourRed or CONSTANTS.textColour
                    input.parent[5 + i * 2]:setText(math.round(penalty * 100) .. '%', fontColour)
                end
        end
    })

    --8 rewards text
    MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=listX,
        y=y+listHeight-CONSTANTS.rectanglePadding*2+CONSTANTS.rectangleSpacing,
        width=itemsWidth,
        height=y,
        text='Rewards',
        fontColour=CONSTANTS.textColourPink
    })

    --9 rewards list
    local rewardsList = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=display.contentWidth-itemsWidth,
        y=y+listHeight-CONSTANTS.rectanglePadding*2+CONSTANTS.rectangleSpacing+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
        width=itemsWidth,
        height=display.contentHeight-y*2-(listHeight-CONSTANTS.rectanglePadding*2+CONSTANTS.rectangleSpacing)-CONSTANTS.lineHeight-CONSTANTS.rectangleSpacing,
        rows=12-listLength-1,
        columns=1,
        numItems=12-listLength-1,
        isTouchEnabled=false,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            --2 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' 9999'),
                height=input.height
            })

            --3 count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                alignX='right',
                alignY='centre'
            })

        end,
        refresh=function(input)
            local item = input.item
            if item then
                local dataItem = MAIN.DATA.ITEM.getItem(item.category, item.id)
                input.parent[2].isVisible = true
                input.parent[2]:setItem({
                    icon=dataItem.icon,
                    name=dataItem.name
                })

                input.parent[3].isVisible = true
                input.parent[3]:setText(item.count)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
            end
        end
    })

    --10 encounter text
    local encounterText = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=0,
        y=display.contentHeight-y,
        width=display.contentWidth*0.8+CONSTANTS.rectanglePadding,
        height=y,
        fillColour={ 0, 0, 0, 0 },
        strokeColourDisabled={ 0, 0, 0, 0 },
        strokeWidth=0,
        create=function(input)
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Encounter',
                fontColour=CONSTANTS.textColourPink,
                fontSize=CONSTANTS.fontSizeSmall+2,
                alignX='right'
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourPink,
                fontSize=CONSTANTS.fontSizeSmall+2,
                alignX='right',
                alignY='bottom'
            })

        end,
        refresh=function(input)
            input.parent[3]:setText(input.countText, input.fontColour)
        end
    })
    
    TEXT.drawText({
        parent=sceneGroup,
        x=0,
        y=display.contentHeight-y,
        width=display.contentWidth*0.8,
        height=y,
        text='',
        fontColour=CONSTANTS.textColourPink,
        alignX='right',
        alignY='centre'
    })

    --11 encounter gauge
    local encounterGauge = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth*0.8,
        y=display.contentHeight-y,
        width=display.contentWidth*0.2,
        height=y,
        create=function(input)
            --2
            CONTAINER.createGradientRect({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                colour1=CONSTANTS.textColourRed,
                colour2=CONSTANTS.textColourGreen
            })

            --3 back rect
            local rect = display.newRect(input.parent, input.x + input.width, input.y, input.width, input.height)
            rect:setFillColor(0, 0, 0, 1)
            rect.anchorX = 1
            rect.anchorY = 0

            function rect:updateWidthRate(rate)
                self.width = input.width * rate
            end
        end,
        refresh=function(input)
            input.parent[3]:updateWidthRate(input.rate)
        end
    })

    --store coords here
    local map = {}

    --12 Map
    local mapRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=partyWidth-CONSTANTS.rectanglePadding*2+CONSTANTS.rectangleSpacing,
        y=y,
        width=display.contentWidth-partyWidth-itemsWidth+CONSTANTS.rectanglePadding*4-CONSTANTS.rectangleSpacing*2,
        height=display.contentHeight-y*2,
        create=function(input)
            --create a new group for map tiles so we can move within the group only and character will always be above
            local mapGroup = display.newGroup()
            input.parent:insert(mapGroup)

            --hexagon coords
            local hexH = 56
            local hexW = hexH * 0.5 * math.pow(3, 0.5)
            local vertices = { 0, hexH * -0.5, hexW * 0.5, hexH * -0.25, hexW * 0.5, hexH * 0.25, 0, hexH * 0.5, hexW * -0.5, hexH * 0.25, hexW * -0.5, hexH * -0.25 }

            local startX = input.x + input.width * 0.5
            local startY = input.y + input.height * 0.5

            --number of hexagons from left to right
            local length = 9
            local range = math.floor(length / 2)
            
            local loadIconFrame = MAIN.IMAGE.loadIconFrame

            --create axial coords and a key, store in map obj
            for r = -range, range do
                local hexY = startY + r * hexH * 0.75
                for q = -range, range do
                    if q + r >= -range and q + r <= range then
                        local key = q .. ',' .. r

                        --cant remember where i got this from
                        local hexX = startX + q * hexW + r * 0.5 *hexW

                        --group to hold hex + item, set the coord here and we normalize when insert
                        local hexGroup = display.newGroup()
                        hexGroup.x = hexX
                        hexGroup.y = hexY
                        mapGroup:insert(hexGroup)

                        function hexGroup:map()
                            return map[key]
                        end

                        local hexagon = display.newPolygon(0, 0, vertices)
                        hexGroup:insert(hexagon, true)
                        hexagon:setFillColor(CONSTANTS.rectangleFillColour[1], CONSTANTS.rectangleFillColour[2], CONSTANTS.rectangleFillColour[3], CONSTANTS.rectangleFillColour[4])
                        hexagon.strokeWidth = CONSTANTS.rectangleStrokeWidth
                        local strokeColour = CONSTANTS.rectangleStrokeColourActive
                        hexagon:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])

                        local itemIcon = loadIconFrame(3)
                        itemIcon.anchorX = 0.5
                        itemIcon.anchorY = 0.5
                        hexGroup:insert(itemIcon, true)

                        --hide icon
                        itemIcon.isVisible = false

                        hexagon.canTouch = false

                        --add touch
                        function hexagon:touch(event)
                            if self.canTouch then
                                if event.phase == 'began' then
                                    transition.to(self.parent, {time=0, xScale=CONSTANTS.touchScale, yScale=CONSTANTS.touchScale})
                                    --Set stage to focus touch events for this object only
                                    local stage = display.getCurrentStage()
                                    stage:setFocus( self )
                                    self.isFocus = true
                                elseif self.isFocus then
                                    if event.phase == 'moved' then
                                        --Check if touch still inbounds
                                        local bounds = self.contentBounds
                                        if event.x < bounds.xMin or event.x > bounds.xMax or event.y < bounds.yMin or event.y > bounds.yMax then
                                            self.isFocus = false
                                            transition.to(self.parent, {time=0, xScale=1, yScale=1})
                                            local stage = display.getCurrentStage()
                                            stage:setFocus( nil )
                                        end
                                    elseif event.phase == 'ended' then
                                        self.isFocus = false
                                        transition.to(self.parent, {time=0, xScale=1, yScale=1})
                                        local stage = display.getCurrentStage()
                                        stage:setFocus( nil )
                                        
                                        if labyrinthManager.isFlashlight then
                                            self.parent:reveal(true)
                                            self.parent:revealSurroundings(true)

                                            labyrinthManager:endFlashlight()
                                        else
                                            labyrinthManager:moveToCoord(q, r)
                                        end
                                    end
                                end
                                return true
                            end
                        end
                        
                        hexagon:addEventListener('touch', hexagon)

                        --enableTouch
                        function hexGroup:enableTouch(isEnabled)
                            local hex = self[1]
                            --if item is rock then set to untouchable
                            local map = self:map()
                            if map.seen and map.item == 7 then
                                hex:setFillColor(CONSTANTS.rectangleFillColour[1], CONSTANTS.rectangleFillColour[2], CONSTANTS.rectangleFillColour[3], CONSTANTS.rectangleFillColour[4])
                                hex:setStrokeColor(CONSTANTS.rectangleStrokeColourInactive[1], CONSTANTS.rectangleStrokeColourInactive[2], CONSTANTS.rectangleStrokeColourInactive[3], CONSTANTS.rectangleStrokeColourInactive[4])
                                hex.canTouch = false
                                self:toBack()
                            else
                                local strokeColour = isEnabled and CONSTANTS.rectangleStrokeColourActive or CONSTANTS.hexagonStrokeColourInactive
                                hex:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])
                                hex.canTouch = isEnabled
                            end
                        end

                        function hexGroup:reveal(isFlashlight)
                            local hex = self[1]
                            hex:setFillColor(CONSTANTS.hexagonFillColourActive[1], CONSTANTS.hexagonFillColourActive[2], CONSTANTS.hexagonFillColourActive[3], CONSTANTS.hexagonFillColourActive[4])
                            self:map().seen = true
                            self[2].isVisible = true

                            self:toFront()
                            
                            if not isFlashlight then
                                self:enableTouch(true)
                            end
                        end

                        function hexGroup:getSurroundings()
                            local surroundings = {}
                            local counter = 1

                            --hardcoding adjacent offsets
                            local adjacentOffsets = {
                                { 0, -1 }, { 1, -1 }, { -1, 0 }, { 1, 0 }, { -1, 1 }, { 0, 1 }
                            }
                            for i = 1, #adjacentOffsets do
                                local adjacentQ = q + adjacentOffsets[i][1]
                                local adjacentR = r + adjacentOffsets[i][2]

                                local adjacentKey = adjacentQ .. ',' .. adjacentR
                                if map[adjacentKey] then
                                    surroundings[counter] = map[adjacentKey].group
                                    counter = counter + 1
                                end
                            end

                            return surroundings
                        end

                        function hexGroup:revealSurroundings(isFlashlight)
                            local surroundings = self:getSurroundings()
                            for i = 1, #surroundings do
                                surroundings[i]:reveal(isFlashlight)
                            end
                            
                            self:toFront()
                        end

                        function hexGroup:reset(itemIcon)
                            self:enableTouch(false)
                            self[2].fill.frame = itemIcon
                            self[2].isVisible = false
                        end

                        map[key] = {
                            group=hexGroup,
                            seen=false,
                            item=0,
                            --coords for sprite, y is slightly adjusted
                            coords={
                                x=hexX,
                                y=hexY-2
                            }
                        }
                    end
                end
            end
        end,
        refresh=function(input)

        end
    })

    --setup labyrinth manager
    labyrinthManager = {
        level=labyrinthLevel,
        stepCount=0,
        encounterCount=5,
        enemyCount=0,
        smokeBomb=0,
        encounterChance=0.4,
        rewards={},
        bonus=0,
        penalty={ 1, 1, 1, 1, 1, 1 },
        map=map,
        position={ -10, -10 },
        rates=gemRates,
        defeatCount=0,
        characterSprite=nil,
        characterSequence={
            {
                name='down',
                frames={ 2, 3, 2, 1 },
                time=CONSTANTS.characterAnimation,
                loopCount=0
            },
            {
                name='left',
                frames={ 5, 6, 5, 4 },
                time=CONSTANTS.characterAnimation,
                loopCount=0
            },
            {
                name='right',
                frames={ 8, 9, 8, 7 },
                time=CONSTANTS.characterAnimation,
                loopCount=0
            },
            {
                name='up',
                frames={ 11, 12, 11, 10 },
                time=CONSTANTS.characterAnimation,
                loopCount=0
            }
        },
        troops={
            { 14, 29, 44, 59, 74, 89, 104, 119, 134, 149, 164, 179 }, --boss
            { 5, 6, 7, 20, 21, 22, 35, 36, 37, 50, 51, 52, 65, 66, 67, 80, 81, 82, 95, 96, 97, 110, 111, 112, 125, 126, 127, 140, 141, 142, 155, 156, 157, 170, 171, 172, 185, 186, 187 }, --1
            { 8, 9, 10, 23, 24, 25, 38, 39, 40, 53, 54, 55, 68, 69, 70, 83, 84, 85, 98, 99, 100, 113, 114, 115, 128, 129, 130, 143, 144, 145, 158, 159, 160, 173, 174, 175, 188, 189, 190, 191 }, --2
            { 11, 12, 13, 26, 27, 28, 41, 42, 43, 56, 57, 58, 71, 72, 73, 86, 87, 88, 101, 102, 103, 116, 117, 118, 131, 132, 133, 146, 147, 148, 161, 162, 163, 176, 177, 178, 192, 193, 194, 195 } --3
        }
    }

    function labyrinthManager:refreshParty()
        partyScrollView:setItems(battleManager.party)
    end

    function labyrinthManager:refreshEncounter()
        local rate = 1 - (self.stepCount / self.encounterCount)
        encounterGauge:refresh({rate=rate})
    end

    function labyrinthManager:refreshRewards()
        rewardsList:setItems(self.rewards)
    end

    function labyrinthManager:refreshBonusAndPenalty()
        bonusGroup:refresh({bonus=self.bonus, penalty=self.penalty})
    end

    function labyrinthManager:generateEncounter()
        self.stepCount = 0
        --should change to normal distribution
        self.encounterCount = math.floor(math.random() * 4) + 3
        self.encounterChance = 0.4

        local countText = 'Normal'
        local fontColour = CONSTANTS.textColour
        local count = (self.enemyCount + 1) % 4
        if count == 0 then
            count = 4
            countText = 'Boss'
            fontColour = CONSTANTS.textColourRed
        end
        encounterText:refresh({countText=(count .. ' ' .. countText), fontColour=fontColour})

        self:refreshEncounter()
    end

    function labyrinthManager:getEnemyTroop()
        --increment this here
        self.enemyCount = self.enemyCount + 1

        local rate = (self.enemyCount % 4) + 1
        local possibleTroops = self.troops[rate]

        return possibleTroops[math.floor(#possibleTroops * math.random()) + 1]
    end

    function labyrinthManager:performStep()
        if self.smokeBomb > 0 then
            self.smokeBomb = math.max(0, self.smokeBomb - 1)
        elseif self.stepCount < self.encounterCount then
            --why min???
            self.stepCount = self.stepCount + 1
        else
            if math.random() < self.encounterChance then
                --get enemies
                local enemies = {
                    level=labyrinthLevel,
                    type='standard',
                    waves={ self:getEnemyTroop() }
                }


                battleManager:setupEnemies(enemies)

                composer.setVariable('battleResult', 1)
                MAIN.UTILITY.sceneFadeOut({
                    onComplete=function()
                        MAIN.UTILITY.gotoScene('scene.battle.battle', { battleManager=battleManager })
                    end
                })

                return true
            else
                self.encounterChance = self.encounterChance + 0.15
            end
        end
        self:refreshEncounter()
    end

    function labyrinthManager:moveToCoord(q, r, isInstant)
        --disable current surroundings
        local current = self.map[self.position[1] .. ',' .. self.position[2]]
        if current then
            local currentGroup = current.group
            currentGroup[1]:setFillColor(CONSTANTS.hexagonFillColourActive[1], CONSTANTS.hexagonFillColourActive[2], CONSTANTS.hexagonFillColourActive[3], CONSTANTS.hexagonFillColourActive[4])
            local currentSurroundings = currentGroup:getSurroundings()
            for i = 1, #currentSurroundings do
                currentSurroundings[i]:enableTouch(false)
            end
        end
        current = nil
        

        --disable formation and cancel button so it doesnt overlay anything
        formationButton.canTouch = false
        escapeButton.canTouch = false

        --move char to new position
        self.position[1] = q
        self.position[2] = r
        local mapCoord = self.map[q .. ',' .. r]

        self.characterSprite:pause()
        if self.characterSprite.y < mapCoord.coords.y then
            self.characterSprite:setSequence('down')
        elseif self.characterSprite.y > mapCoord.coords.y then
            self.characterSprite:setSequence('up')
        elseif self.characterSprite.x < mapCoord.coords.x then
            self.characterSprite:setSequence('right')
        else 
            self.characterSprite:setSequence('left')
        end
        self.characterSprite:play()

        transition.to(self.characterSprite, {
            time=(isInstant and 0 or CONSTANTS.characterWalk),
            x=mapCoord.coords.x,
            y=mapCoord.coords.y,
            onComplete=function()
                self.characterSprite:pause()
                self.characterSprite.fill.frame = 2
                formationButton.canTouch = true
                escapeButton.canTouch = true

                local hexGroup = mapCoord.group
                hexGroup:reveal()
                hexGroup:enableTouch(false)
                --lazy...
                hexGroup[1]:setFillColor(CONSTANTS.rectangleSelectedCOlour[1], CONSTANTS.rectangleSelectedCOlour[2], CONSTANTS.rectangleSelectedCOlour[3], CONSTANTS.rectangleSelectedCOlour[4])
        
                local hasEncounter = self:performStep()
                if not hasEncounter then
                    --check for item
                    self:activateAtCurrentPosition(hexGroup)
                end
            end
        })


    end

    local dataItems = {
        {
            id=1,
            name='Start',
            icon=1,
            description='Start point'
        }, 
        {
            id=2,
            name='Exit',
            icon=220,
            description='End current labyrinth',
            onUse=function()
                labyrinthManager.characterSprite:pause()
                composer.showOverlay('overlay.labyrinth.exit', {
                    isModal = true,
                    params = {
                        labyrinthManager=labyrinthManager
                    }
                })
            end
        },
        {
            id=3,
            name='Heal',
            icon=26,
            description='Recover 20% Mhp/Mmp',
            onUse=function()
                for i = 1, #battleManager.party do
                    local member = battleManager.party[i]

                    member:gainHp(math.floor(0.2 * member:maxHp()))
                    member:gainMp(math.floor(0.2 * member:maxMp()))
                end

                labyrinthManager:refreshParty()
                return true
            end
        },
        {
            id=4,
            name='Smoke Bomb',
            icon=222,
            description='Reset encounter and stop for two steps',
            onUse=function()
                labyrinthManager.stepCount = 0
                labyrinthManager.smokeBomb = 2
                labyrinthManager:refreshEncounter()
                return true
            end
        },
        {
            id=5,
            name='Flashlight',
            icon=221,
            description='Reveal a space and its surroundings',
            onUse=function()
                labyrinthManager:startFlashlight()
            end
        },
        {
            id=6,
            name='Gemstone',
            icon=223,
            description='Receive 1-3x gems (x bonus)',
            onUse=function()
                labyrinthManager.characterSprite:pause()
                composer.showOverlay('overlay.rewards.rewards', {
                    isModal = true,
                    params = {
                        rewards=labyrinthManager:gainRewards(),
                        ignoreSave=true
                    }
                })
            end
        },
        {
            id=7,
            name='Rock',
            icon=224
        }
    }

    function labyrinthManager:activateAtCurrentPosition(hexGroup)
        if not hexGroup then
            local q = self.position[1]
            local r = self.position[2]
            hexGroup = self.map[q .. ',' .. r].group
        end

        local item = hexGroup:map().item
        if item ~= 0 and dataItems[item].onUse then
            self.characterSprite:pause()
            composer.showOverlay('overlay.labyrinth.use', {
                isModal = true,
                params = {
                    item=dataItems[item],
                    labyrinthManager=self
                }
            })
        else
            self:revealSurroundings()
        end
    end

    function labyrinthManager:revealSurroundings(hexGroup)
        if not hexGroup then
            local q = self.position[1]
            local r = self.position[2]
            hexGroup = self.map[q .. ',' .. r].group
        end
        hexGroup:revealSurroundings()

        self.characterSprite:setSequence('down')
        self.characterSprite:play()
    end

    function labyrinthManager:generateLabyrinth()
        --add mission here as this should be a good indicator for when labyrinth is entered
        MAIN.PLAYER.MISSION.addMissionCount(2, 6, 1)

        local itemPoints = {}

        --generate start location and end location, seperate into triangles, start at 0 for convience
        local triangles = { 0, 1, 2, 3, 4, 5 }
        local startTriangle = table.remove(triangles, math.floor(math.random() * #triangles) + 1)

        local endTriangles = {}
        for i = 1, 2 do
            endTriangles[i] = table.remove(triangles, math.floor(math.random() * #triangles) + 1)
        end
        triangles = nil

        --manually typing these, three coords
        local trianglePoints = {
            { -4, 4, 0 }, --1 edge, bottom
            { -3, 4, -1 }, --2
            { -2, 4, -2 }, --3 start point
            { -1, 4, -3 }, --4
            { 0, 4, -4 }, --5 edge, bottom
            { -3, 3, 0 }, --6 edge
            { -2, 3, -1 }, --7
            { -1, 3, -2 }, --8
            { 0, 3, -3 }, --9 edge
            { -2, 2, 0 }, --10 edge
            { -1, 2, -1 }, --11
            { 0, 2, -2 }, --12 edge
            { -1, 1, 0 }, --13 edge
            { 0, 1, -1 } --14 edge
        }

        --assign start point associated triangle
        local startPoint = {
            key={},
            sign=((startTriangle % 2) == 0 and 1 or -1),
            rotation=(startTriangle % 3)
        }

        --loop 2 as we only need q,r
        for i = 1, 2 do
            local value = startPoint.sign * trianglePoints[3][(i - 1 + startPoint.rotation) % 3 + 1]
            if value == -0 then
                value = 0
            end
            startPoint.key[i] = value
        end

        itemPoints[startPoint.key[1] .. ',' .. startPoint.key[2]] = 1
 
        --MAIN.UTILITY.printJSON(itemPoints)

        --assign escape points
        for i = 1, #endTriangles do
            local potentialPoints
            --if adjacent to start point we exclude edges
            local diff = math.abs(endTriangles[i] - startTriangle)
            if diff == 1 or diff == 5 then
                potentialPoints = { 2, 3, 4, 7, 8, 11 }
            else
                potentialPoints = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 }
            end
            local endSign = endTriangles[i] % 2 == 0 and 1 or -1
            local endRotation = endTriangles[i] % 3

            while true do
                local randomPoint = potentialPoints[math.floor(math.random() * #potentialPoints) + 1]
                local randomTriangle = trianglePoints[randomPoint]
                local key = {}
                for j = 1, 2 do
                    local value = endSign * randomTriangle[(j - 1 + endRotation) % 3 + 1]
                    if value == -0 then
                        value = 0
                    end
                    key[j] = value 
                end
                local endKey = key[1] .. ',' .. key[2]
                if not itemPoints[endKey] then
                    itemPoints[endKey] = 2
                    break 
                end
            end
        end

        --print('exit')
        --MAIN.UTILITY.printJSON(itemPoints)


        --generate items per rectangle
        local items = {
            { --heal
                item=3,
                rectangles=(math.floor(math.random() * 2) + 1)
            },
            { --smoke bomb
                item=4,
                rectangles=(math.floor(math.random() * 2) + 1)
            },
            { --flashlight
                item=5,
                rectangles=(math.floor(math.random() * 2) + 2)
            },
            { --gem
                item=6,
                rectangles=(math.floor(math.random() * 3) + 3)
            }
        }

        for i = 1, #items do
            local triangles = { 0, 1, 2, 3, 4, 5 }
            local itemTriangles = {}
            for j = 1, items[i].rectangles do
                itemTriangles[j] = table.remove(triangles, math.floor(math.random() * #triangles) + 1)
            end

            for j = 1, #itemTriangles do
                local sign = itemTriangles[j] % 2 == 0 and 1 or -1
                local rotation = itemTriangles[j] % 3

                local failBack = 0
                while true do
                    local randomTriangle = trianglePoints[math.floor(math.random() * #trianglePoints) + 1]
                    local key = {}
                    for k = 1, 2 do
                        local value = sign * randomTriangle[(k - 1 + rotation) % 3 + 1]
                        if value == -0 then
                            value = 0
                        end
                        key[k] = value 
                    end
                    local itemKey = key[1] .. ',' .. key[2]
                    if not itemPoints[itemKey] then
                        itemPoints[itemKey] = items[i].item
                        break 
                    end

                    failBack = failBack + 1
                    if failBack > 10 then
                        print('failed to generate item ' .. items[i].item)
                        break
                    end
                end
            end
        end

        --print('items')
        --MAIN.UTILITY.printJSON(itemPoints)

        --generate rocks, 1/2 per rectangle
        for i = 0, 5 do
            local sign = i % 2 == 0 and 1 or -1
            local rotation = i % 3

            local count = math.floor(math.random() * 2) + 1
            local failBack = 0
            for j = 1, count do
                while true do
                    local randomTriangle = trianglePoints[math.floor(math.random() * #trianglePoints) + 1]
                    local key = {}
                    for k = 1, 2 do
                        local value = sign * randomTriangle[(k - 1 + rotation) % 3 + 1]
                        if value == -0 then
                            value = 0
                        end
                        key[k] = value 
                    end
                    local itemKey = key[1] .. ',' .. key[2]
                    if not itemPoints[itemKey] then
                        local isValid = false

                        --dont allow rock chains with three so it doesnt block 
                        local adjacentOffsets = {
                            { 0, -1 }, { 1, -1 }, { -1, 0 }, { 1, 0 }, { -1, 1 }, { 0, 1 }
                        }
                        local rockCount = {
                            count=0,
                            points={}
                        }
                        for l = 1, #adjacentOffsets do
                            local adjacentQ = key[1] + adjacentOffsets[l][1]
                            local adjacentR = key[2] + adjacentOffsets[l][2]
    
                            local adjacentKey = adjacentQ .. ',' .. adjacentR
                            if itemPoints[adjacentKey] and itemPoints[adjacentKey] == 7 then
                                rockCount.count = rockCount.count + 1
                                rockCount.points[rockCount.count] = { adjacentQ, adjacentR }
                            end
                        end

                        --check adjacent, if 0 then ok, if 2 then skip, if one then check that coord and if more than one then skip
                        if rockCount.count == 0 then
                            isValid = true
                        elseif rockCount.count == 1 then
                            local adjacent2HasRock = false
                            for l = 1, #adjacentOffsets do
                                local adjacent2Q = rockCount.points[1][1] + adjacentOffsets[l][1]
                                local adjacent2R = rockCount.points[1][2] + adjacentOffsets[l][2]

                                local adjacent2Key = adjacent2Q .. ',' .. adjacent2R
                                if itemPoints[adjacent2Key] and itemPoints[adjacent2Key] == 7 then
                                    adjacent2HasRock = true
                                    break
                                end
                            end

                            isValid = not adjacent2HasRock
                        end

                        if isValid then
                            itemPoints[itemKey] = 7
                            break 
                        end
                    end

                    failBack = failBack + 1
                    if failBack > 10 then
                        print('failed to generate item 7')
                        break
                    end
                end
            end
        end

        --print('rocks')
        --MAIN.UTILITY.printJSON(itemPoints)

        --reset everything
        for k, v in pairs(self.map) do
            v.seen = false

            local item = {
                id=0,
                icon=1
            }
            if itemPoints[k] then
                item.id = itemPoints[k]
                item.icon = dataItems[itemPoints[k]].icon
            end

            v.item = item.id
            v.group:reset(item.icon)

            v.group[1]:setFillColor(CONSTANTS.rectangleFillColour[1], CONSTANTS.rectangleFillColour[2], CONSTANTS.rectangleFillColour[3], CONSTANTS.rectangleFillColour[4])
            v.group:enableTouch(false)

        end

        self:createCharacterSprite()

        --generate start location
        self.position = { -10, -10 }
        self:moveToCoord(startPoint.key[1], startPoint.key[2], true)
        
        self:refreshBonusAndPenalty()

        self:generateEncounter()

    end

    function labyrinthManager:getNextBonusAndPenalty()
        --double bonus
        local bonus = self.bonus
        if bonus == 0 then
            bonus = 0.5
        else
            bonus = bonus * 2
        end
        self.bonus = bonus

        --get two penalties
        local penaltyCount = 0
        local penalties = {}
        while penaltyCount < 2 do
            local random = math.floor(math.random() * 6) + 1
            if not penalties[random] then
                local currentPenalty = self.penalty[random]
                local newPenalty = math.max(0.59, math.round(currentPenalty * 90) / 100)

                self.penalty[random] = newPenalty

                local isReduced = newPenalty < currentPenalty
                penalties[random] = {
                    value=newPenalty,
                    reduced=isReduced
                }

                if isReduced then
                    --just reduce the corresponding stat of every member by 10%, it wont be exact cause of rounding by whatever
                    for i = 1, #battleManager.party do
                        local currentStat = battleManager.party[i].stats[random + 2]
                        battleManager.party[i].stats[random + 2] = math.max(1, math.round(currentStat * 0.9))
                    end
                end

                penaltyCount = penaltyCount + 1
            end
        end

        return {
            bonus=bonus,
            penalties=penalties
        }
    end

    function labyrinthManager:revive()
        for i = 1, #partyScrollView.items do
            local battler = partyScrollView:itemAtIndex(i)
            battler:gainHp(battler:maxHp())
        end

        composer.setVariable('battleResult', 2)
        self:refreshParty()
        self:activateAtCurrentPosition()
    end

    function labyrinthManager:useItemAtPostiion()
        local q = self.position[1]
        local r = self.position[2]
        local map = self.map[q .. ',' .. r]

        --if return true, then continue
        local result = dataItems[map.item].onUse()

        map.item = 0
        map.group:reset(1)

        if result then
            self:revealSurroundings()
        end
    end

    function labyrinthManager:startFlashlight()
        self.isFlashlight = true
        for k, v in pairs(self.map) do
            local hexGroup = v.group
            hexGroup[1]:setStrokeColor(CONSTANTS.hexagonStrokeColourFlashlight[1], CONSTANTS.hexagonStrokeColourFlashlight[2], CONSTANTS.hexagonStrokeColourFlashlight[3], CONSTANTS.hexagonStrokeColourFlashlight[4])
            hexGroup[1].canTouch = true
        end
    end

    function labyrinthManager:endFlashlight()
        self.isFlashlight = false
        for k, v in pairs(self.map) do
            v.group:enableTouch(false)
        end

        self:revealSurroundings()
    end

    function labyrinthManager:gainRewards()
        local gemRange = { self.rates[1] + self.rates[2] + self.rates[3], self.rates[2] + self.rates[3], self.rates[3] }
        local gemRates = {
            { 1, 6 },
            { 7, 13 }, 
            { 14, 90 }
        }
        local countRange = { math.round(1 * (1 + self.bonus)), math.round(3 * (1 + self.bonus)) }

        --get random count with normal distribution (Box-Muller transform)
        local u1 = math.random()
        local u2 = math.random()
        
        local z0 = math.sqrt(-2 * math.log(u1)) * math.cos(2 * math.pi * u2)

        local mean = (countRange[1] + countRange[2]) / 2
        --ask chatgpt for the 6...
        local std_dev = (countRange[2] - countRange[1]) / 6

        --apparently this might go out of range but whatever
        local count = math.max(1, math.round((z0 * std_dev) + mean))
        local gemCounts = {}

        for i = 1, count do
            local gemRating = 3
            local random = math.random()
            for j = 1, #gemRange do
                if gemRange[j] < random then
                    gemRating = j - 1
                    break
                end
            end

            local randomGem = math.floor(math.random() * (gemRates[gemRating][2] - gemRates[gemRating][1] + 1)) + gemRates[gemRating][1]
            gemCounts[randomGem] = (gemCounts[randomGem] or 0) + 1
        end

        --convert counts to rewards
        local rewardsCount = {}
        local counter = 1

        local rewardsItemList = self.rewards

        for k, v in pairs(gemCounts) do
            --update the existing items list, if it doesnt exist then just add it to end
            --binary search is better
            local hasUpdated = false
            for i = 1, #rewardsItemList do
                if rewardsItemList[i].id == k then
                    hasUpdated = true
                    rewardsItemList[i].count = rewardsItemList[i].count + v
                end
            end

            local gemItem = {
                category=4,
                id=k,
                count=v
            }
            if not hasUpdated then
                rewardsItemList[#rewardsItemList + 1] = gemItem
            end

            rewardsCount[counter] = gemItem
            counter = counter + 1
        end

        return rewardsCount
    end


    function labyrinthManager:createCharacterSprite()
        if self.characterSprite then
            self.characterSprite:removeSelf()
            self.characterSprite = nil
        end

        local sheet = MAIN.IMAGE.loadCharacterSheet(battleManager.party[1].character)
        local sprite = display.newSprite(mapRect, sheet, self.characterSequence)
        sprite.fill.frame = 2

        --move to current position
        local currentPosition = self.position[1] .. ',' .. self.position[2]
        if self.map[currentPosition] then
            local currentMapCoords = self.map[currentPosition].coords
            sprite.x = currentMapCoords.x
            sprite.y = currentMapCoords.y
        end
        
        self.characterSprite = sprite
    end

    labyrinthManager:generateLabyrinth()

    self.battleManager = battleManager
    self.labyrinthManager = labyrinthManager

    --Run this here and dont run it in battle
    composer.removeHidden()

end

function scene:reselect()
    --since we're reusing rewards overlay, we set this
    self.labyrinthManager:refreshRewards()
    self.labyrinthManager:revealSurroundings()
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
        
        UTILITY.updateBackgroundImages({ CONSTANTS.pictureLabyrinth })
        UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true
        })

        UTILITY.sceneFadeIn()
        UTILITY.showLoadingLayer(false)

        local failed = composer.getVariable('battleResult') == 1
        --if failed we return to the previous enemyCount, so we dont skip bosses
        if failed then
            self.labyrinthManager.enemyCount = self.labyrinthManager.enemyCount - 1
        end
        
        self.labyrinthManager:refreshParty()
        self.labyrinthManager:generateEncounter()

        if failed then
            self.labyrinthManager.defeatCount = self.labyrinthManager.defeatCount + 1
            --show failed overlay
            self.labyrinthManager.characterSprite:pause()
            composer.showOverlay('overlay.labyrinth.exit', {
                isModal = true,
                params = {
                    labyrinthManager=self.labyrinthManager
                }
            })
        else
            self.labyrinthManager:activateAtCurrentPosition()
        end
 
    end
end

function scene:restart()
    self.labyrinthManager:revealSurroundings()
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