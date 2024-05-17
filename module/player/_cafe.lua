local M = {}

M.getCafeFromSave = function()
    return MAIN.SYSTEM.SAVE.getSave().cafe
end

M.getDispatchCategory = function()
    --returns a list to be used for dispatch
    local categories = {}
    local saveCafe = M.getCafeFromSave().dispatch

    for i = 1, 4 do
        local status
        local isEnabled = true
        local fontColour = CONSTANTS.textColour
        if saveCafe[i].jobId > 0 then
            if MAIN.SYSTEM.TIME.time() >= saveCafe[i].time then
                status = 'Finished'
                fontColour = CONSTANTS.textColourGreen
            else
                status = 'In Progress'
            end
        else
            if i >= 3 then
                local requiredGuildLevel = 3 * (i - 2)
                isEnabled = MAIN.PLAYER.GUILD.level() >= requiredGuildLevel
                if isEnabled then
                    status = 'Ready'
                else
                    status = 'Rq. Guild Lv ' .. requiredGuildLevel
                    fontColour = CONSTANTS.textColourInvalid
                end
            else
                status = 'Ready'
            end
        end

        categories[i] = {
            id=i,
            status=status,
            fontColour=fontColour,
            isEnabled=isEnabled
        }
    end

    return categories
end

M.getDispatchAtIndex = function(index)
    return M.getCafeFromSave().dispatch[index]
end

M.resetJobList = function()
    local allJobs = MAIN.DATA.CAFE.getAllJobs()
    local allBonuses = MAIN.DATA.CAFE.getAllBonuses()

    local randomBonus = function()
        return math.floor(math.random() * #allBonuses) + 1
    end

    local list = {}
    local counter = 1

    --do this in parts of three so bonus doesnt double up within the same tier
    for i = 1, 3 do
        local randomBonusSelected = {}
        for r = 1, #allBonuses do
            randomBonusSelected[r] = allBonuses[r]
        end
        for j = 1, 7 do
            list[counter] = {
                jobId=allJobs[(i - 1) * 7 + j].id,
                bonusId=table.remove(randomBonusSelected, math.floor(math.random() * #randomBonusSelected) + 1).id
            }
            counter = counter + 1
        end
    end

    local saveCafe = M.getCafeFromSave()
    saveCafe.list = list
end

M.fillRecommendedParty = function(index, bonusId)
    local members = MAIN.PLAYER.MEMBERS.getAllMembers()

    --get list of currently in dispatch
    local dispatch = M.getCafeFromSave().dispatch
    local allMembersInDispatch = {}
    for i = 1, #dispatch do
        if i ~= index then
            for j = 1, #dispatch[i].party do
                if dispatch[i].party[j] ~= 0 then
                    allMembersInDispatch[dispatch[i].party[j]] = true
                end
            end
        end
    end
    
    local bonusActors = {}
    local bonusCheck = MAIN.DATA.CAFE.getBonus(bonusId).condition
    for i = 1, #members do
        if not allMembersInDispatch[members[i].actorId] then
            --check if has bonus
            if bonusCheck(members[i].actor) then
                local bonusActorsIndex = #bonusActors
                bonusActors[bonusActorsIndex + 1] = members[i].actorId
                if bonusActorsIndex + 1 == 5 then
                    break
                end
            end
        end
    end

    local bonusActorsIndex = 1
    local party = { 0, 0, 0, 0, 0 }
    for i = 1, #party do
        if bonusActors[bonusActorsIndex] then
            party[i] = bonusActors[bonusActorsIndex]
            bonusActorsIndex = bonusActorsIndex + 1
        else
            break
        end
    end

    dispatch[index].party = party

    return party
end

M.resetDispatch = function(index)
    M.getCafeFromSave().dispatch[index] = {
        jobId=0,
        bonusId=0,
        party={ 0, 0, 0, 0, 0 },
        time=0
    }
end

M.retrieveDispatch = function(index)
    local dispatch = M.getDispatchAtIndex(index)

    local job = MAIN.DATA.CAFE.getJob(dispatch.jobId)

    local count = job.reward.count

    --check bonus
    local bonusCondition = MAIN.DATA.CAFE.getBonus(dispatch.bonusId).condition
    local bonusActorCount = 0
    for i = 1, #dispatch.party do
        if dispatch.party[i] ~= 0 then
            if bonusCondition(MAIN.PLAYER.MEMBERS.getActor(dispatch.party[i])) then
                bonusActorCount = bonusActorCount + 1
            end
        end
    end

    --should probably move this to constants
    if bonusActorCount >= 5 then
        count = count + count
    elseif bonusActorCount >= 3 then
        count = math.round(count + count * 0.5)
    end

    --get rewards
    local rewards 
    if job.reward.ids then
        --grab random counts 
        local ids = job.reward.ids
        local gainItems = {}
        local getRandom = function()
            return math.floor(math.random() * #ids) + 1
        end
        for i = 1, count do
            local randomId = getRandom()
            local randomItem = ids[randomId]
            gainItems[randomItem] = (gainItems[randomItem] or 0) + 1
        end
        rewards = {}
        local counter = 1

        for k, v in pairs(gainItems) do
            rewards[counter] = MAIN.PLAYER.INVENTORY.gainItem(job.reward.category, k, v)[1]
            counter = counter + 1
        end
    else
        rewards = MAIN.PLAYER.INVENTORY.gainItem(job.reward.category, job.reward.id, count)
    end

    M.resetDispatch(index)

    return rewards
end

M.startDispatch = function(dispatchIndex, jobIndex)
    local saveCafe = M.getCafeFromSave()

    local dispatch = saveCafe.dispatch[dispatchIndex]

    local job = saveCafe.list[jobIndex]

    --update dispatch
    dispatch.jobId = job.jobId
    dispatch.bonusId = job.bonusId
    dispatch.time = MAIN.SYSTEM.TIME.time() + MAIN.DATA.CAFE.getJob(job.jobId).duration

    --remove job from list
    --table.remove isnt recommended but we only remove one item which reindexes once anyways so shouldnt have too much performance cost
    table.remove(saveCafe.list, jobIndex) 

end


return M