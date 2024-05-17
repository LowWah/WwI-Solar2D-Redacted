local M = {}

M.maxLevel = function()
    return CONSTANTS.guildMaxLevel
end

M.expRequired = function()
    return CONSTANTS.guildExpRequired
end

M.expRequiredAtLevel = function(level)
    return M.expRequired()[level]
end

M.maxNext = function()
    return M.expRequiredAtLevel(M.maxLevel())
end

--Require save
M.level = function()
    return MAIN.SYSTEM.SAVE.getSave().guild.level
end

M.isMaxLevel = function()
    return M.level() >= M.maxLevel()
end

M.expForNext = function()
    if M.isMaxLevel() then
        return 0
    end
    local guild = MAIN.SYSTEM.SAVE.getSave().guild
    return M.expRequiredAtLevel(guild.level) - guild.exp
end

M.gainExp = function(exp, guild)
    guild = guild or MAIN.SYSTEM.SAVE.getSave().guild
    if guild.level < M.maxLevel() then
        guild.exp = guild.exp + exp
        local rate = M.expRequiredAtLevel(guild.level)
        if guild.exp >= rate then
            guild.level = guild.level + 1
            MAIN.PLAYER.LIVES.gainLives(1, true)
            guild.exp = guild.exp - rate
            --Check if level up again
            if guild.exp >= M.expRequiredAtLevel(guild.level) then
                M.gainExp(0, guild)
            end
        end
    else
        guild.exp = 0
    end
end

return M