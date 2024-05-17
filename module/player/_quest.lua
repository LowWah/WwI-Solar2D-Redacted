local M = {}

M.getStageList = function(quest)
    local dataStages = MAIN.DATA.QUEST.getStagesForQuest(quest)

    local stages = {}

    --localize these
    local min = math.min
    local max = math.max
    for i = 1, #dataStages do
        local dataStage = dataStages[i]

        --name - define inline
        --picture - define inline

        --level
        local minLvl = 999
        local maxLvl = 0
        local levelText
        for j = 1, #dataStage.floors do
            local floor = dataStage.floors[j]
            if floor.enemies then
                local lvl = floor.enemies.level
                minLvl = min(minLvl, lvl)
                maxLvl = max(maxLvl, lvl)
            end
        end
        if minLvl ~= 999 then
            levelText = minLvl .. '-' .. maxLvl
        end
        
        --Check stage requirements
        local requirements
        if dataStage.requirements then
            if M.stagePercentComplete(dataStage.requirements.quest, dataStage.requirements.stage, true) ~= 100 then
                requirements = dataStage.requirements.text
            end
        end

        --Check percent
        --ignore percent for arena
        local percent = ''
        local percentFontColour = CONSTANTS.textColourInvalid
        if quest ~= 'arena' then
            percent =  0
            --if not unlocked we can already set to zero
            if not requirements then
                percent = M.stagePercentComplete(quest, i)
            end
            if percent == 100 then
                percentFontColour = CONSTANTS.textColourGreen
            end
            percent = percent .. '%'
        end

        stages[i] = {
            name=dataStage.name,
            picture=dataStage.picture,
            level=levelText,
            requirements=requirements,
            percent=percent,
            percentFontColour=percentFontColour
        }
    end

    return stages
end

M.getStageFloors = function(quest, stageIndex)
    --THIS SHOULD BE IN DATA
    return MAIN.DATA.QUEST.getStagesForQuest(quest)[stageIndex].floors
end

--require save
M.isFloorCleared = function(quest, stage, floor, partial)
    if quest == 'arena' then
        return false
    else
        local f = MAIN.SYSTEM.SAVE.getSave().quests[quest][stage][floor]
        if quest == 'tower' then
            local toCheck = partial and 1 or 2
            return f and f >= toCheck
        else
            return not not f
        end
    end
end

M.clearFloor = function(quest, stage, floor)
    local s = MAIN.SYSTEM.SAVE.getSave().quests[quest][stage]
    if quest == 'tower' then
        if s[floor] ~= 2 then
            s[floor] = 2
            
            local maxFloorCount = #M.getStageFloors(quest, stage)
            composer.setVariable('floor', math.min(floor + 1, maxFloorCount))
        end
    else
        if not s[floor] then
            s[floor] = true
            
            local maxFloorCount = #M.getStageFloors(quest, stage)
            composer.setVariable('floor', math.min(floor + 1, maxFloorCount))
        end
    end
end

M.stagePercentComplete = function(quest, stage, partial)
    local saveQuest = MAIN.SYSTEM.SAVE.getSave().quests[quest][stage]
    local countComplete = 0
    --Need to read the stage data to get number of floors
    local stageData = MAIN.DATA.QUEST.getStagesForQuest(quest)[stage]
    local floors = stageData.floors
    for i = 1, #floors do
        if saveQuest[i] then
            if quest == 'tower' then
                --Tower - 0/ nil is incomplete, 1 is incomplete but unlocked, 2 is complete
                --partial flag for tower requirements
                local toCheck = partial and 1 or 2
                if saveQuest[i] and saveQuest[i] >= toCheck then
                    countComplete = countComplete + 1
                end
            else
                countComplete = countComplete + 1
            end
            
        end
    end

    return math.floor(countComplete * 100 / #floors)
end

M.resetTower = function()
    --get new set of tower enemies
    local tower = MAIN.DATA.QUEST.getStagesForQuest('tower')
    local towerEnemies = MAIN.DATA.QUEST.getTowerEnemies()
    
    local randomEnemy = function(f, terrain)
        --boss at f 5 and 10
        local troopType = f % 5 == 0 and 2 or 1
        local enemyType = towerEnemies[troopType][terrain]

        local wave = {}
        for i = 1, #enemyType do
            wave[i] = enemyType[i][math.floor(math.random() * #enemyType[i]) + 1]
        end

        return wave
    end
    
    local save = MAIN.SYSTEM.SAVE.getSave()

    local towerSave = {}
    for i = 1, #tower do
        local floorEnemies = {}
        
        --one unique terrain per floor
        local terrains = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 }

        for j = 1, #tower[i].floors do
            floorEnemies[j] = randomEnemy(j, table.remove(terrains, math.floor(#terrains * math.random()) + 1))

            --reset completion status
            local currentCompletionStatus = save.quests.tower[i][j]
            if currentCompletionStatus and currentCompletionStatus >= 2 then
                save.quests.tower[i][j] = 1
            end
        end
        towerSave[i] = floorEnemies
    end

    save.tower = towerSave

    --reset data
    MAIN.DATA.QUEST.initializeTower(towerSave)
end

M.resetArena = function()
    --get new set of arena stages and challenges
    local arena = MAIN.DATA.QUEST.getArenaStages()
    local arenaChallenges = MAIN.DATA.QUEST.getArenaChallenges()

    --we dont save the dupeChecker cause it will become an object once saved, we still want an array
    local dupeChecker = {}
    local stageIds = {}
    local counter = 1
    while counter <= 3 do
        local random = math.floor(math.random() * #arena) + 1
        if not dupeChecker[random] then
            dupeChecker[random] = true
            stageIds[counter] = random
            counter = counter + 1
        end
    end

    --always start with one
    local challengeIds = { 1 }
    dupeChecker = {}
    counter = 2
    while counter <= 4 do
        local random = math.floor(math.random() * (#arenaChallenges - 1)) + 2
        if not dupeChecker[random] then
            dupeChecker[random] = true
            challengeIds[counter] = random
            counter = counter + 1

            --we dont want to overlap 4,5 as it would be impossible to complete in one go
            if random == 4 or random == 5 then
                dupeChecker[4] = true
                dupeChecker[5] = true
            end

            --only one element quest
            if random >= 11 then
                for i = 11, 22 do
                    dupeChecker[i] = true
                end
            end
        end
    end

    local arenaSave = {
        stageIds=stageIds,
        challengeIds=challengeIds
    }
    
    --reset save
    local save = MAIN.SYSTEM.SAVE.getSave()
    save.arena = arenaSave
    save.quests.arena = { false, false, false, false, false }

    --reset data
    MAIN.DATA.QUEST.initializeArena(arenaSave)
end

M.getArenaChallenges = function()
    local saveChallengeIds = MAIN.SYSTEM.SAVE.getSave().arena.challengeIds
    local arenaChallenges = MAIN.DATA.QUEST.getArenaChallenges()

    local challenges = {}
    for i = 1, #saveChallengeIds do
        local dataChallenge = arenaChallenges[saveChallengeIds[i]]
        local isChallengeComplete = MAIN.SYSTEM.SAVE.getSave().quests.arena[i]

        --create an object to be used during battle
        local c = {
            text=dataChallenge.text,
            count=0,
            required=dataChallenge.required,
            condition=dataChallenge.condition,
            isChallengeComplete=isChallengeComplete,
            operator=(dataChallenge.operator or 'greaterthanorequalto'),
            type=dataChallenge.type
        }

        function c:checkCondition(actingBattler, skill, target, battleManager)
            if not self.isChallengeComplete then
                local conditionResult = self.condition(actingBattler, skill, target, battleManager)
                if conditionResult then
                    local newCount = self.count + conditionResult
                    if self.operator == 'greaterthanorequalto' then
                        --we'll limit it
                        newCount = math.min(self.required, newCount)
                    end
                    self.count = newCount
                end
            end
        end
        challenges[i] = c
    end

    return challenges
end

--EVENT - this should have its own module
M.resetEvent = function()
    MAIN.SYSTEM.SAVE.getSave().quests.event[3] = { }
end


return M