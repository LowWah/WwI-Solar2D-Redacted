local M = {}

--Server time is the true time to refer to, local time is used to track deltas
local serverTime = 0
local oldClock = 0

M.time = function()
    return serverTime
end

local resetDaily = function()
    print('NEW DAY')

    local PLAYER = MAIN.PLAYER

    PLAYER.GACHA.resetDailyGacha()
    
    --mission
    local MISSION = PLAYER.MISSION
    MISSION.resetDailyMission()
    --daily login lives
    MISSION.addMissionCount(1, 1, 1)
    --daily login map
    MISSION.addMissionCount(1, 2, 1)
    --weekly login lives
    MISSION.addMissionCount(2, 1, 1)

    PLAYER.QUEST.resetArena()

    --REFRESH EVENT MINIGAME
    PLAYER.QUEST.resetEvent()

    --cafe jobs list
    PLAYER.CAFE.resetJobList()
end

local resetWeekly = function()
    print('NEW WEEK')

    MAIN.PLAYER.GACHA.resetFeaturedGacha()

    
    local MISSION = MAIN.PLAYER.MISSION
    MISSION.resetWeeklyMission()
    --We need to re add this as the count from the daily gets reset
    MISSION.addMissionCount(2, 1, 1)
end

local resetMonthly = function()
    print('NEW MONTH')

    MAIN.PLAYER.QUEST.resetTower()
end

local updateSave = function()
    local save = MAIN.SYSTEM.SAVE.getSave()

    --update lives here
    local writeSave
    if MAIN.PLAYER.LIVES.updateLives() then
        writeSave = true
    end
    
    --Check for new day
    local oldDate = os.date("*t", save.time)
    local nextDay = os.time({year=oldDate.year,month=oldDate.month,day=oldDate.day+1,hour=0})
    --Check daily
    if serverTime >= nextDay then
        writeSave = true

        resetDaily()

        --Check monthly
        --Convert to table for convience
        local newDate = os.date('*t', serverTime)
        if newDate.year > oldDate.year or newDate.month ~= oldDate.month then
            resetMonthly()
        end

        --If sunday, reset weekly stuff
        --Check every day between nextDay and newTime, if its sunday then reset, this is probably a shit way to do this
        while serverTime >= nextDay do
            local nextWDay = os.date('%w', nextDay)
            --This is a string...
            if nextWDay == '0' then
                resetWeekly()
                break
            end
            --Check next day
            nextDay = nextDay + 86400
        end
    end

    save.time = serverTime
    --Write save only if something updated
    if writeSave then
        MAIN.SYSTEM.SAVE.writeSave()
    end
end

local updateTime = function()
    local currentClock = os.clock()
    local deltaTime = math.floor(currentClock - oldClock)
    --only need to check once a second has passed
    if deltaTime >= 1 then
        serverTime = serverTime + deltaTime
        updateSave()
        oldClock = currentClock
    end
end

M.initializeTime = function()
    --Get time with timezone
    oldClock = os.clock()
    network.request('http://worldtimeapi.org/api/ip', 'GET', function(event)
        if event.isError then
            print('Failed to connect, reverting to system time')
            --get time from device
            serverTime = os.time()
        else
            print('Connected to server')
            local response = require('json').decode(event.response)
            serverTime = response.unixtime
        end

        --Networks requests are asynchronous so need to add this in the request
        --Run this one time
        updateSave()

        Runtime:addEventListener('enterFrame', updateTime)
    end, { timeout=5 })
end

M.stopTime = function()
    Runtime:removeEventListener('enterFrame', updateTime)
end

return M