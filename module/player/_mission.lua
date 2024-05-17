local M = {}

local mission_base = {
    id=0,
    category=0,
    data=nil,
    save=nil
}

function mission_base:name()
    return self.data.name
end

function mission_base:count()
    return self.save.count
end

function mission_base:required()
    return self.data.required
end

function mission_base:status()
    return self.save.status
end

function mission_base:reward()
    return self.data.reward
end

function mission_base:new(obj)
    --inherit methods
    setmetatable(obj, self)
    self.__index = self

    obj.data = MAIN.DATA.MISSION.getMissions(obj.category)[obj.id]

    --to disable the new function 
    function obj:new()
        print('This object should not create a new object')
    end

    return obj
end

--require save
local newSaveMission = function(category, i)
    local save = {
        count=0,
        status='Ongoing'
    }
    MAIN.SYSTEM.SAVE.getSave().mission[category][i] = save

    return save
end

M.getMissionList = function(category)
    local dataMissions = MAIN.DATA.MISSION.getMissions(category)

    local missions = {}
    local counter = 1
    local saveMissions = MAIN.SYSTEM.SAVE.getSave().mission[category]
    local guildLevel = MAIN.PLAYER.GUILD.level()
    for i = 1, #dataMissions do
        local mission = dataMissions[i]

        local include = true
        if mission.requirements and mission.requirements.guildLevel then
            include =  guildLevel >= mission.requirements.guildLevel 
        end

        if include then
            missions[counter] = mission_base:new({
                id=i,
                category=category,
                save=(saveMissions[i] or newSaveMission(category, i))
            })

            counter = counter + 1
        end
    end

    return missions
end

M.addMissionCount = function(category, index, count)
    --THERE SHOULD BE LOGIC TO CREATE A MISSION IF INDEX DOESNT exist
    local saveMission = MAIN.SYSTEM.SAVE.getSave().mission[category][index]
    local dataMission = MAIN.DATA.MISSION.getMissions(category)[index]

    if saveMission.status == 'Ongoing' then
        saveMission.count = math.min(dataMission.required, saveMission.count + count)

        if saveMission.count >= dataMission.required then
            saveMission.status = 'Claim'
        end
    end
end

M.canClaimMission = function(category)
    local missionList = M.getMissionList(category)

    for i = 1, #missionList do
        if missionList[i]:status() == 'Claim' then
            return true
        end
    end

    return false
end

M.claimMission = function(category, index)
    local saveMission = MAIN.SYSTEM.SAVE.getSave().mission[category][index]

    if saveMission and saveMission.status == 'Claim' then
        saveMission.status = 'Claimed'
        
        local reward = MAIN.DATA.MISSION.getMissions(category)[index].reward
        return MAIN.PLAYER.INVENTORY.gainItem(reward.category, reward.id, reward.count)
    end
end

M.claimMissionAll = function(category)
    local returnRewards = {}
    local counter = 1

    local missionList = M.getMissionList(category)

    for i = 1, #missionList do
        local mission = missionList[i]
        if mission:status() == 'Claim' then
            mission.save.status = 'Claimed'

            local reward = mission:reward()
            local r = MAIN.PLAYER.INVENTORY.gainItem(reward.category, reward.id, reward.count)
            for j = 1, #r do
                returnRewards[counter] = r[j]
                counter = counter + 1
            end
        end
    end

    return returnRewards
end


M.resetDailyMission = function()
    --go to save and set all count to 0
    local dataMissions = MAIN.DATA.MISSION.getMissions(1)

    for i = 1, #dataMissions do
        newSaveMission(1, i)
    end

end

M.resetWeeklyMission = function()
    --go to save and set all count to 0
    local dataMissions = MAIN.DATA.MISSION.getMissions(2)

    for i = 1, #dataMissions do
        newSaveMission(2, i)
    end

end

return M