local M = {}

--This is only used for text positoning
M.lowerMaxLives = function()
    return CONSTANTS.livesMaxLower
end

--Upper limit including using consumables
M.upperMaxLives = function()
    return CONSTANTS.livesMaxUpper
end

--Require save
M.maxLives = function()
    return 10 + MAIN.PLAYER.GUILD.level()
end

M.currentLives = function()
    return MAIN.SYSTEM.SAVE.getSave().lives.lives
end

M.gainLives = function(lives, upperLimit)
    --there was a bug somehwere i think
    upperLimit = upperLimit or (M.currentLives() > M.maxLives())
    local max = upperLimit and M.upperMaxLives() or M.maxLives()
    local livesSave = MAIN.SYSTEM.SAVE.getSave().lives
    --we need to update current time when lives reduces from max
    local isPreviouslyMax = livesSave.lives >= M.maxLives()
    livesSave.lives = math.max(0, math.min(livesSave.lives + lives, max))
    --If set to max then need to update to current time
    if livesSave.lives >= max then
        livesSave.time = MAIN.SYSTEM.TIME.time()
    elseif isPreviouslyMax and livesSave.lives < M.maxLives() then
        --should instead create a reduce function which handles this
        livesSave.time = MAIN.SYSTEM.TIME.time()
    end
end

M.isMaxLives = function()
    return M.currentLives() >= M.maxLives() 
end

M.updateLives = function()
    if not M.isMaxLives() then
        local livesSave = MAIN.SYSTEM.SAVE.getSave().lives
        local currentTime = MAIN.SYSTEM.TIME.time()
        if currentTime >= livesSave.time + CONSTANTS.livesTimeForOne then
            M.gainLives(math.floor((currentTime - livesSave.time) / CONSTANTS.livesTimeForOne))
            livesSave.time = currentTime
            return true
        end
    end
end

return M