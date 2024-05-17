local M = {}

local options = {}

M.initializeOptions = function()
    options = MAIN.SYSTEM.FILE.readJson(CONSTANTS.fileSettings, system.DocumentsDirectory)
    if not options then
        print('No options found - creating default')
        options = {
            language='en',
            general = {
                clickAnimation = true,
                messageSpeed = 1
            },
            audio = {
                bgmVolume = 100,
                meVolume=100,
                seVolume = 100
            },
            battle = {
                battleSpeed=1,
                autoBattle=1,
                autoTarget=1,
                autoBuff=true,
                autoDebuff=true,
                autoUltimate=true,
                autoHyper=false,
                autoBoss=false
            }
        }

        M.writeOptions()
    end
end

M.writeOptions = function()
    MAIN.SYSTEM.FILE.writeJson(CONSTANTS.fileSettings, options)
end

--Require options
M.getLanguage = function()
    return options.language or 'en'
end

M.getMessageSpeed = function()
    return options.general.messageSpeed
end

M.getBattleSpeed = function()
    return options.battle.battleSpeed
end

M.setBattleSpeed = function(speed)
    options.battle.battleSpeed = speed 
    M.writeOptions()
end

M.getAutoBattle = function()
    return options.battle.autoBattle
end

M.setAutoBattle = function(autoBattle)
    options.battle.autoBattle = autoBattle 
    M.writeOptions()
end

M.getBattleOptions = function()
    return options.battle
end

M.getOptionWithKey = function(category, key)
    return options[category][key]

end

M.setOptionWithKey = function(category, key, value)
    options[category][key] = value
    if category == 'general' then
        if key == 'clickAnimation' then
            MAIN.UTILITY.updateClickLayer()
        end
    elseif category == 'audio' then
        --Adjust audio
    end
    M.writeOptions()
end

return M