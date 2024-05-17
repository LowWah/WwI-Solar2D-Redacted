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

    local arenaChallenges = event.params and event.params.arenaChallenges or nil
    local arenaChallengesComplete

    local CONTAINER = MAIN.UI.CONTAINER
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    local colour1 = CONSTANTS.overlayColour
    local colour2 = { 0, 0, 0, 0 }
    --1 top gradient left
    CONTAINER.createGradientRect({
        parent=sceneGroup,
        x=0,
        y=CONSTANTS.rectanglePadding,
        width=display.contentCenterX,
        height=CONSTANTS.lineHeight,
        colour1=colour1,
        colour2=colour2
    })
    
    --2 top gradient right
    CONTAINER.createGradientRect({
        parent=sceneGroup,
        x=display.contentCenterX,
        y=CONSTANTS.rectanglePadding,
        width=display.contentCenterX,
        height=CONSTANTS.lineHeight,
        colour1=colour2,
        colour2=colour1
    })

    local title = 'DEFEAT'
    local titleColour = CONSTANTS.textColourRed
    if composer.getVariable('battleResult') == 2 then
        title = 'VICTORY'
        titleColour = CONSTANTS.textColourGreen
    end
    local TEXT = MAIN.UI.TEXT
    --3 top title
    TEXT.drawText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=display.contentWidth,
        height=y,
        text=title,
        fontColour=titleColour,
        fontSize=40,
        alignX='centre',
        alignY='centre'
    })

    local titleSecondary = ''
    if composer.getVariable('quickClear') then
        titleSecondary = 'Quick clear x' .. composer.getVariable('quickClear')
    elseif arenaChallenges then
        arenaChallengesComplete = 0
        local arenaSave = MAIN.SYSTEM.SAVE.getSave().quests.arena
        for i = 1, #arenaChallenges do
            local arenaChallenge = arenaChallenges[i]
            if not arenaChallenge.isChallengeComplete then
                local isChallengeCompleted = false
                if arenaChallenge.operator == 'lessthan' then
                    isChallengeCompleted = arenaChallenge.count <= arenaChallenge.required
                else
                    isChallengeCompleted = arenaChallenge.count >= arenaChallenge.required
                end

                if isChallengeCompleted then
                    arenaChallengesComplete = arenaChallengesComplete + 1

                    --Update the arena save here for convience
                    arenaSave[i] = true
                end
            end
        end

        titleSecondary = 'Challenges complete x' .. arenaChallengesComplete
    end
    --4 top title secondary
    TEXT.drawText({
        parent=sceneGroup,
        x=display.contentCenterX+TEXT.textWidth(title, 40)*0.5+CONSTANTS.textPadding,
        y=0,
        width=display.contentWidth,
        height=y,
        text=titleSecondary,
        fontColour=titleColour,
        fontSize=CONSTANTS.fontSizeSmall+2,
        alignY='centre'
    })

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local rewardsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2

    --store all the gauges here to reference easier
    scene.gauges = {}

    local currentParty = MAIN.PLAYER.PARTY.currentParty()
    --5 guild + party status
    local partyScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=0,
        y=y,
        width=CONSTANTS.backWidth+rewardsWidth-CONSTANTS.rectanglePadding+CONSTANTS.rectangleSpacing,
        height=display.contentHeight-y,
        columns=1,
        rows=6,
        numItems=6,
        isTouchEnabled=false,
        --make a dummy -1 because we are lazy and include guild in party
        items={ -1, currentParty[1].actor, currentParty[2].actor, currentParty[3].actor, currentParty[4].actor, currentParty[5].actor },
        create=function(input)
            local container = display.newContainer(input.width, input.height)
            input.parent:insert(container, true)

            --1 face
            local faceGroup = display.newGroup()
            container:insert(faceGroup)
            faceGroup.coords = {
                x=input.x,
                y=input.y+(input.height-CONSTANTS.faceHeight)*0.5
            }

            local iconX = input.x + CONSTANTS.faceWidth - CONSTANTS.iconWidth - CONSTANTS.iconPadding
            local iconY = input.y
            local IMAGE = MAIN.IMAGE
            --2 rank
            local rank = IMAGE.loadIconFrame(1)
            container:insert(rank)
            rank.x = iconX
            rank.y = iconY

            --3 rating
            local rating = IMAGE.loadIconFrame(1)
            container:insert(rating)
            rating.x = iconX
            rating.y = iconY + CONSTANTS.iconHeight + CONSTANTS.iconPadding

            local TEXT = MAIN.UI.TEXT
            --4 name
            TEXT.drawText({
                parent=container,
                x=input.x+CONSTANTS.faceWidth,
                y=input.y,
                width=input.width-CONSTANTS.faceWidth-TEXT.textWidth(' Lv 100'),
                height=input.height,
                text=''
            })

            --5
            TEXT.drawText({
                parent=container,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' 100'),
                height=input.height,
                text='Lv',
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --6 level
            local levelText = TEXT.drawText({
                parent=container,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                alignX='right'
            })

            --7 bonus
            local bonus = TEXT.drawText({
                parent=container,
                x=input.x+CONSTANTS.faceWidth,
                y=input.y+CONSTANTS.textHeight,
                width=input.width,
                height=input.height,
                text='Bonus',
                fontColour=CONSTANTS.textColourPink
            })
            --bonus will be updated at set rewards
            bonus.isVisible = false

            --8
            TEXT.drawText({
                parent=container,
                x=input.x,
                y=input.y+CONSTANTS.textHeight,
                width=input.width-TEXT.textWidth(' 9999'),
                height=input.height,
                text='Next',
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --9 Next
            local nextText = TEXT.drawText({
                parent=container,
                x=input.x,
                y=input.y+CONSTANTS.textHeight,
                width=input.width,
                height=input.height,
                text='',
                alignX='right'
            })

            local gaugeHeight = 10
            local gaugeX = CONSTANTS.faceWidth + CONSTANTS.textPadding
            local gaugeY = ((input.height - CONSTANTS.textHeight * 2) - gaugeHeight) * 0.5
            --10 gauge
            local gaugeGroup = MAIN.UI.CONTAINER.createRectangleGauge({
                parent=container,
                x=input.x+gaugeX,
                y=input.y+CONSTANTS.textHeight*2+(CONSTANTS.lineHeight-gaugeHeight)*0.5,
                width=input.width-gaugeX-CONSTANTS.textPadding,
                height=gaugeHeight,
                colour1=(input.index == 1 and CONSTANTS.textColourPink or CONSTANTS.textColourGreen),
                rate=0
            })

            gaugeGroup.lvlText = levelText
            gaugeGroup.nextText = nextText

            --set gauge function to update frame based on remaining
            function gaugeGroup:updateRateForExp(frame)
                if self.remainingFrames > 0 then
                    --get rate from remaining, subtract and recalculate rate
                    --dont subtrct per frame as there is some decimal rounding which makes it annoying
                    local frameCount = math.min(frame, self.remainingFrames)
                    self.remainingFrames = self.remainingFrames - frameCount
                    local expGain = self.expGain * (1 - self.remainingFrames / self.totalFrames)
                    local nextRequiredExp = self.nextRequiredExp - expGain
                    local currentLevel = self.currentLevel
                    while nextRequiredExp <= 0 do 
                        currentLevel = currentLevel + 1
                        self.lvlText:setText(currentLevel, CONSTANTS.textColourGreen)
                        if currentLevel >= self.maxLevel then
                            self.nextRequiredExp = 0
                            self.remainingFrames = 0
                            self:setRate(1)
                            return
                        end
                        nextRequiredExp = nextRequiredExp + self.expRate[currentLevel]
                    end
                    --there is a bug somewhere when reach max level it doesnt show 0
                    self.nextText:setText(math.round(nextRequiredExp))
                    self:setRate(1 - nextRequiredExp / self.expRate[currentLevel])
                end
            end
        end,
        refresh=function(input)
            local item = input.item
            local container = input.parent[2]
            local gaugeGroup = container[10]
            if item == -1 then
                --guild
                container.isVisible = true
                local GUILD = MAIN.PLAYER.GUILD
                --4 name
                container[4]:setText('Guild')

                local guildLvl = GUILD.level()
                --6 level
                container[6]:setText(guildLvl)

                local nxt = GUILD.expForNext()
                --9 next
                container[9]:setText(nxt)

                --10 rate
                --local gaugeGroup = container[10]
                local maxLevel = GUILD.maxLevel()
                gaugeGroup.nextRequiredExp = nxt
                gaugeGroup.currentLevel = guildLvl
                gaugeGroup.maxLevel = maxLevel
                --Need to get the rate for level ups
                gaugeGroup.expRate = GUILD.expRequired()

                local rate = guildLvl >= maxLevel and 1 or (1 - nxt / gaugeGroup.expRate[guildLvl])
                gaugeGroup:setRate(rate)


            elseif item > 0 then
                --actor
                container.isVisible = true

                local actor = MAIN.PLAYER.MEMBERS.getActor(item)

                --1 face
                local face = MAIN.IMAGE.loadFacePicture(actor:skin().face)
                face.x = container[1].coords.x
                face.y = container[1].coords.y
                container[1]:insert(face)

                --2 rank
                container[2].fill.frame = CONSTANTS.rankIcon[actor:rank()]
                
                --3 rank
                container[3].fill.frame = CONSTANTS.ratingIcon[actor:rating()]

                --4 name
                container[4]:setText(actor:name())

                local level = actor:level()
                --6 level
                container[6]:setText(level)

                local nxt = actor:requiredExpForNext()
                --9 next
                container[9]:setText(nxt)

                --10 rate
                --container[10]:setRate(actor:expRateForNext())
                gaugeGroup.nextRequiredExp = nxt
                gaugeGroup.currentLevel = level
                gaugeGroup.maxLevel = actor:maxLevel()
                --Need to get the rate for level ups
                gaugeGroup.expRate = CONSTANTS.actorExp

                local rate = level >= gaugeGroup.maxLevel and 1 or (1 - nxt / gaugeGroup.expRate[level])
                gaugeGroup:setRate(rate)

            else
                container.isVisible = false

                gaugeGroup.nextRequiredExp = 0
                gaugeGroup.currentLevel = 0
                gaugeGroup.maxLevel = 0
                --Need to get the rate for level ups
                gaugeGroup.expRate = 0
            end

            if composer.getVariable('battleResult') == 2 then
                local totalFrames = 60
                gaugeGroup.totalFrames = totalFrames
                gaugeGroup.remainingFrames = gaugeGroup.currentLevel < gaugeGroup.maxLevel and totalFrames or 0
            else
                gaugeGroup.totalFrames = 0
                gaugeGroup.remainingFrames = 0
            end
            if gaugeGroup.remainingFrames > 0 then
                scene.gauges[input.index] = gaugeGroup
            end
            gaugeGroup.expGain = 0

        end
    })

    local rewardsX = display.contentWidth-rewardsWidth
    --6 guild + party exp
    local battleRewardsScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=rewardsX,
        y=y,
        width=rewardsWidth,
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectangleSpacing+CONSTANTS.rectanglePadding*2,
        columns=1,
        rows=2,
        numItems=2,
        isTouchEnabled=false,
        create=function(input)
            local text = input.index == 1 and 'Guild Exp' or 'Party Exp'
            local TEXT = MAIN.UI.TEXT

            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=text,
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 value
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='0',
                fontColour=CONSTANTS.textColourInvalid,
                alignX='right',
                alignY='centre'
            })

        end,
        refresh=function(input)
            local item = input.item
            if item and item > 0 then
                input.parent[3]:setText(item, CONSTANTS.textColour)
            end
        end
    })

    --7 rewards list
    local rewardsScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=rewardsX,
        y=y+CONSTANTS.lineHeight*3+CONSTANTS.rectangleSpacing*3,
        width=rewardsWidth,
        height=display.contentHeight-y-(y+CONSTANTS.lineHeight*3+CONSTANTS.rectangleSpacing*3),
        columns=1,
        rows=9,
        numItems=9,
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
                if item.category == 0 then
                    input.parent[2].isVisible = true
                    input.parent[2]:setItem({icon=CONSTANTS.goldIcon, name=item.count})

                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false

                else
                    local rewardItem = MAIN.PLAYER.INVENTORY.getItem(item.category, item.id)

                    input.parent[2].isVisible = true
                    input.parent[2]:setItem({icon=rewardItem:icon(), name=rewardItem:name()})
    
                    local level = rewardItem:level()
                    if level > 0 then
                        input.parent[3].isVisible = false
                        input.parent[4].isVisible = true
                        input.parent[4][2]:setText(level)
                    else
                        input.parent[3].isVisible = true
                        input.parent[3]:setText(item.count)
    
                        input.parent[4].isVisible = false
                    end
                    
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
            local rewardItem = MAIN.PLAYER.INVENTORY.getItem(item.category, item.id)
            local category
            if rewardItem:isEquipment() then
                category = 'equipment'
            elseif rewardItem.category == 4 then
                category = 'gem'
            end

            sceneGroup[8]:refresh({item=rewardItem, category=category})
            sceneGroup[9]:refresh({item=rewardItem})
        end
    })

    local COMMON = MAIN.UI.COMMON
    --8 description
    local desc = COMMON.createDescriptionGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth+rewardsWidth-CONSTANTS.rectanglePadding-CONSTANTS.rectangleSpacing
    })
    desc:refresh()

    --9 description 2
    local description2Group = COMMON.createDescription2Group({
        parent=sceneGroup,
        x=CONSTANTS.backWidth+rewardsWidth-CONSTANTS.rectanglePadding-CONSTANTS.rectangleSpacing
    })
    description2Group:setTouch(true)

    --10 continue
    COMMON.createSelectRectangle({
        parent=sceneGroup,
        text='Continue',
        touch=function()
            local UTILITY = MAIN.UTILITY

            UTILITY.removeComposerVariable('battleResult')

            UTILITY.sceneFadeOut({
                onComplete=function()
                    if event.params and event.params.nextScene then
                        --Since these arent to floor, need to clear composer variables
                        UTILITY.removeComposerVariable('quest')
                        UTILITY.removeComposerVariable('stage')
                        UTILITY.removeComposerVariable('floor')
                        UTILITY.removeComposerVariable('stageItem')

                        UTILITY.gotoScene(event.params.nextScene)
                    elseif composer.getVariable('quest') == 'labyrinth' then
                        UTILITY.gotoScene('scene.hub.quest.stages.labyrinth')
                    elseif composer.getVariable('floor') then
                        UTILITY.gotoScene('scene.hub.quest.stages.floor.floor')
                    else
                        UTILITY.gotoScene('scene.hub.hub')
                    end
                end
            })
            
        end
    })

    --11 touch layer to immediately finish transition
    local touchLayer = display.newRect(sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    touchLayer.isVisible = false
    touchLayer.isHitTestable = true

    function touchLayer:touch(event)
        if event.phase == 'began' then
            local gauges = scene.gauges
            for k, v in pairs(gauges) do
                --Theres a clamp so just add total frames
                v:updateRateForExp(v.totalFrames)

            end

            self:removeEventListener('touch', self)
            self.isHitTestable = false
        end
    end

    function touchLayer:enableTouch()
        self:addEventListener('touch', self)
    end

    local requireSave = false

    local quest = composer.getVariable('quest')
    --generate rewards/ clear floor
    local guildExpGain = 0
    local partyExpGain = 0
    local actorExpBonus

    --Generate a item category mapping with counts, id etc then add items later
    local items = {}
    if quest == 'labyrinth' then

        --Doing this here
        composer.removeScene('scene.labyrinth.labyrinth')

        --special condition for labyrinth
        local rewards = event.params.rewards

        if composer.getVariable('battleResult') == 1 then
            --remove half rewards randomly
            local count = 0
            for i = 1, #rewards do
                count = count + rewards[i].count
            end

            count = math.random() < 0.5 and math.ceil(count * 0.5) or math.floor(count * 0.5)

            for i = 1, count do
                local randomIndex = math.floor(math.random() * #rewards) + 1
                local randomReward = rewards[randomIndex]
                local newGain = rewards[randomIndex].count - 1
                if newGain <= 0 then
                    table.remove(rewards, randomIndex)
                else
                    rewards[randomIndex].count = newGain
                end
            end
        end

        --gem category
        local gemRewards = {}

        for i = 1, #rewards do
            gemRewards[rewards[i].id] = rewards[i].count
        end

        items[4] = gemRewards

        requireSave = true

    elseif arenaChallenges then
        if arenaChallengesComplete > 0 then
            --special condition for arena
            local stage = composer.getVariable('stage')
            local floor = composer.getVariable('floor')

            local reward = MAIN.PLAYER.QUEST.getStageFloors(quest, stage)[floor].rewards.general[1]

            local gainTotal = reward.count * arenaChallengesComplete 

            local rewardCount = { [reward.id] = reward.count * arenaChallengesComplete }
            items[reward.category] = rewardCount

            requireSave = true

            MAIN.PLAYER.MISSION.addMissionCount(2, 5, arenaChallengesComplete)
        end
    elseif composer.getVariable('battleResult') == 2 then
        local quickClearCount = composer.getVariable('quickClear') or 1

        local stage = composer.getVariable('stage')
        local floor = composer.getVariable('floor')

        --gain missions
        local addMissionCount = MAIN.PLAYER.MISSION.addMissionCount
        if quest == 'main' or quest == 'side' or quest == 'event' then
            addMissionCount(1, 3, quickClearCount)
            addMissionCount(2, 2, quickClearCount)
        elseif quest == 'gear' or quest == 'tome' or quest == 'onslaught' then
            addMissionCount(1, 4, quickClearCount)
            addMissionCount(2, 3, quickClearCount)
        elseif quest == 'tower' then
            addMissionCount(2, 4, quickClearCount)
        end

        local dataRewards = MAIN.PLAYER.QUEST.getStageFloors(quest, stage)[floor].rewards

        --[[
                    rewards={
                        first={},
                        battle={},
                        general={}
                    },
        ]]

        --battle
        guildExpGain = (dataRewards.battle.guild or 0) * quickClearCount
        partyExpGain = (dataRewards.battle.party or 0) * quickClearCount
        actorExpBonus = dataRewards.battle.bonus

        --first
        if dataRewards.first then
            if not MAIN.PLAYER.QUEST.isFloorCleared(quest, stage, floor) then
                for i = 1, #dataRewards.first do
                    local dataReward = dataRewards.first[i]
                    local category = dataReward.category
                    if category then
                        if not items[category] then
                            items[category] = {}
                        end
                        if dataReward.ids then
                            local rewardCount = dataReward.count
                            local rand = math.random
                            for j = 1, rewardCount do
                                local randId = dataReward.ids[math.floor(rand() * #dataReward.ids) + 1]
                                if not items[category][randId] then
                                    items[category][randId] = 0
                                end

                                items[category][randId] = items[category][randId] + 1
                            end
                        elseif dataReward.id then
                            local id = dataReward.id
                            if category then
                                if not items[category][id] then
                                    items[category][id] = 0
                                end
                                items[category][id] = items[category][id] + dataReward.count
                            end
                        end
                    end
                end
            end
        end

        --general
        if dataRewards.general then
            for i = 1, #dataRewards.general do
                local dataReward = dataRewards.general[i]
                local category = dataReward.category
                local id = dataReward.id
                if category then
                    if not items[category] then
                        items[category] = {}
                    end

                    local rewardCount = dataReward.count * quickClearCount
                    if dataReward.ids then
                        local rand = math.random
                        for j = 1, rewardCount do
                            if dataReward.chance then
                                if rand() < dataReward.chance then
                                    local randId = dataReward.ids[math.floor(rand() * #dataReward.ids) + 1]
                                    if not items[category][randId] then
                                        items[category][randId] = 0
                                    end
    
                                    items[category][randId] = items[category][randId] + 1
                                end
                            else
                                local randId = dataReward.ids[math.floor(rand() * #dataReward.ids) + 1]
                                if not items[category][randId] then
                                    items[category][randId] = 0
                                end

                                items[category][randId] = items[category][randId] + 1
                            end
                        end
                    elseif dataReward.id then
                        if not items[category][id] then
                            items[category][id] = 0
                        end
    
                        local count = 0
                        --Do chance if there is
                        if dataReward.chance then
                            local rand = math.random
                            for j = 1, rewardCount do
                                if rand() < dataReward.chance then
                                    count = count + 1
                                end
                            end
                        else
                            count = rewardCount or 0
                        end
    
                        items[category][id] = items[category][id] + count
                    end
                end
            end
        end

        MAIN.PLAYER.QUEST.clearFloor(quest, stage, floor)

        --Update stage item
        composer.setVariable('stageItem', MAIN.PLAYER.QUEST.getStageList(quest)[stage])

        MAIN.UTILITY.removeComposerVariable('quickClear')

        requireSave = true
    end

    --gain battle exp
    local battleRewards = { guildExpGain, partyExpGain }
    battleRewardsScrollView:setItems(battleRewards)
    --set the exp for the gauges
    for i = 1, 6 do
        local gauge = scene.gauges[i]
        if gauge then
            if i == 1 then
                gauge.expGain = guildExpGain
                MAIN.PLAYER.GUILD.gainExp(guildExpGain)
            else
                local actorExpGain = partyExpGain
                local actor = partyScrollView:itemAtIndex(i)
                if actorExpBonus then
                    for j = 1, #actorExpBonus do
                        if actor == actorExpBonus[j] then
                            actorExpGain = actorExpGain * 2

                            --bonus doesnt show when actor is max because gauge isnt initalized
                            partyScrollView._collectorGroup[i][2][7].isVisible = true
                            break
                        end
                    end
                end
                gauge.expGain = actorExpGain
                
                local actor = MAIN.PLAYER.MEMBERS.getActor(actor)
                local actorCurrentLevel = actor:level()

                actor:gainExp(actorExpGain)

                --add mission count here
                if actor:level() > actorCurrentLevel then
                    MAIN.PLAYER.MISSION.addMissionCount(1, 6, 1)
                end
            end
        end
    end

    --gain rewards
    local rewardItems = {}
    local counter = 1
    --map rewards to items
    for k, v in pairs(items) do
        local PLAYER = MAIN.PLAYER
        --category 0 is gold
        if k == 0 then
            PLAYER.GOLD.gainGold(v[1])
            rewardItems[counter] = {
                category=0,
                id=1,
                count=v[1]
            }
            counter = counter + 1
        else
            for id, count in pairs(v) do
                local gainItems = PLAYER.INVENTORY.gainItem(k, id, count)
                for j = 1, #gainItems do
                    rewardItems[counter] = gainItems[j]
                    counter = counter + 1
                end
            end
        end
    end

    rewardsScrollView:setItems(rewardItems)

    if requireSave then
        MAIN.SYSTEM.SAVE.writeSave()
    end
end

function scene:startProcessing()
    local sceneGroup = self.view

    if composer.getVariable('battleResult') == 2 then
        local touchLayer = sceneGroup[11]
        local gauges = self.gauges
        for i = 1, 6 do
            local gauge = gauges[i]
            if gauge then
                timer.performWithDelay(1, function(event)
                    gauge:updateRateForExp(1)
        
                    if gauge.remainingFrames <= 0 then
                        timer.cancel(event.source)
                    end
                end, 0)
            end
        end
    
        touchLayer:enableTouch()
    end
end

function scene:reselect(itemId, count)
    if itemId then
        count = count or 0

        local sceneGroup = self.view
        local itemList = sceneGroup[7]

        local currentItem = itemList:currentItem()
        local newCount = currentItem.count - count
        if newCount == 0 then
            table.remove(itemList.items, itemList.currentIndex)
            itemList:setItems(itemList.items)
            sceneGroup[8]:refresh()
            sceneGroup[9]:refresh()
        else
            currentItem.count = newCount
            itemList:refreshAtIndex(itemList.currentIndex)
            itemList:selectAndCall(itemList.currentIndex, true)
        end

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
        
        UTILITY.updateBackgroundImages({CONSTANTS.pictureRewards})
        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=false, --we'll do our own gradient as we want it centred
            middleGradient=true
        })

        UTILITY.showLoadingLayer(false)

        scene:startProcessing()
        UTILITY.sceneFadeIn()
 
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

        composer.removeScene('scene.battle.rewards.rewards')
 
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