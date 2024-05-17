local M = {}

--Gold module, we treat gold seperate instead of an item so it can have a higher max
 
M.maxGold = function()
    return CONSTANTS.goldMax
end


--Require save
M.gold = function()
    return MAIN.SYSTEM.SAVE.getSave().gold
end

M.gainGold = function(gold)
    --Maybe should be an object so we can update it via pass by reference
    local save = MAIN.SYSTEM.SAVE.getSave()

    save.gold = math.max(0, math.min(M.maxGold(), save.gold + gold))
end

return M