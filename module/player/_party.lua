local M = {}

local emptyPartySlot = function(actorId)
    return {
        actor=actorId or 0,
        equipment={ 0,0,0,0,0 }
    }
end

--require save
M.currentPartyId = function()
    return MAIN.SYSTEM.SAVE.getSave().party.currentParty
end

M.currentParty = function()
    return MAIN.SYSTEM.SAVE.getSave().party.partyList[M.currentPartyId()]
end

M.setCurrentParty = function(index)
    MAIN.SYSTEM.SAVE.getSave().party.currentParty = index
end

M.isPartyVaild = function()
    local party = M.currentParty()
    for i = 1, #party do
        if party[i].actor > 0 then
            return true
        end
    end
    return false
end

M.setPartySlotActor = function(partySlot, actor)
    local party = M.currentParty()
    local partyActor = emptyPartySlot(actor)

    if actor ~= 0 then
        --Check if new party member is already in party, then swap, else add
        for i = 1, #party do
            --Ignore current slot
            if i ~= partySlot then
                if party[i].actor == actor then
                    local actorAtCurrentSlot = party[partySlot]
                    partyActor = party[i]

                    party[i] = actorAtCurrentSlot
                    break
                end
            end
        end
    end

    party[partySlot] = partyActor
end

M.changePartyEquipment = function(partySlot, equipmentSlot, equipmentId)
    M.currentParty()[partySlot].equipment[equipmentSlot] = equipmentId
end

return M