local M = {}

--actor constructor
local actor_base = {
    actor=0,
    data=nil,
    save=nil
}

function actor_base:name()
    return self.data.name
end

function actor_base:profile()
    return self.data.profile
end

--RANK/ RATING
function actor_base:rank()
    --rank is actually inital rating, so rank 3 actors actually output 1 for this
    return self.data.rating
end

function actor_base:rating()
    return self.save.rating
end

function actor_base:isMaxRating()
    return self:rating() >= CONSTANTS.ratingMax
end

function actor_base:increaseRating()
    if not self:isMaxRating() then
        self.save.rating = self.save.rating + 1
    end
end

--LEVEL,EXP
function actor_base:level()
    return self.save.level
end

function actor_base:maxLevel()
    return 30 + self:rating() * 10
end

function actor_base:isMaxLevel()
    return self:level() == self:maxLevel()
end

function actor_base:currentExp()
    return self.save.exp
end

function actor_base:totalExpForNext()
    if not self:isMaxLevel() then
        return CONSTANTS.actorExp[self:level()]
    end
    return 0
end

function actor_base:requiredExpForNext()
    if not self:isMaxLevel() then
        return self:totalExpForNext() - self:currentExp()
    end
    return 0
end

function actor_base:gainExp(exp)
    if not self:isMaxLevel() then
        self.save.exp = self.save.exp + exp
        while self.save.exp >= self:totalExpForNext() do
            self.save.exp = self.save.exp - self:totalExpForNext()
            self.save.level = self.save.level + 1
            if self:isMaxLevel() then
                self.save.exp = 0
                break
            end
        end
    end
end

--SKINS
function actor_base:currentSkinId()
    return self.save.skinCurrent
end

function actor_base:skin(skinId)
    skinId = skinId or self:currentSkinId()
    return self.data.skins[skinId]
end

function actor_base:changeSkin(skinId)
    self.save.skinCurrent = skinId
end

function actor_base:isSkinUnlocked(skinId)
    return not not self.save.skinsUnlocked[skinId]
end

function actor_base:unlockSkin(skinId)
    self.save.skinsUnlocked[skinId] = true
end

--PARAMS
function actor_base:stats(id)
    return math.floor((self.data.stats[id] + self.data.growth[id] * self:level()) * (1 + (self:rating() - self:rank()) * 0.01))
end

--ADDITIONAL 
function actor_base:additional(id)
    return self.data.additional and self.data.additional[id] or CONSTANTS.paramAdditionalRate[id]
end

--ELEMENTS
function actor_base:elements(id)
    return self.data.elements and self.data.elements[id] or 1
end

--SKILLS
function actor_base:skillLevel(index)
    return self.save.skillLevel[index]
end

function actor_base:skillLevelUp(index)
    local skillId = self.data.skills[index]
    local currentLevel = self:skillLevel(index)
    if currentLevel < MAIN.DATA.SKILLS.skillMaxLevel(skillId) then
        self.save.skillLevel[index] = currentLevel + 1
    end
end

function actor_base:skill(index)
    local skillId = self.data.skills[index]
    local level = self:skillLevel(index)
    return MAIN.DATA.SKILLS.getSkill(skillId, level)
end

function actor_base:allSkills()
    local skills = {}
    for i = 1, #self.data.skills do
        skills[i] = self:skill(i)
    end
    return skills
end

function actor_base:new(obj)
    --inherit methods
    setmetatable(obj, self)
    self.__index = self

    obj.data = MAIN.DATA.ACTOR.getActor(obj.actor)

    --to disable the new function 
    function obj:new()
        print('This object should not create a new object')
    end

    return obj
end

--A container to store all members
local allMembers = {}

M.clearMembers = function()
    allMembers = {}
end

M.initializeMembers = function()
    local save = MAIN.SYSTEM.SAVE.getSave().actors

    for k, v in pairs(save) do
        local actorId = tonumber(k)
        allMembers[actorId] = actor_base:new({
            actor=actorId,
            save=v
        })
    end
end

M.getActor = function(actorId)
    return allMembers[actorId]
end

M.newSaveActor = function(actorId, rating)
    local newSave = {
        actorId=actorId,
        level=1,
        exp=0,
        skillLevel={ 1, 1, 1, 1, 1, 1 },
        skinsUnlocked={ true, false, false, false, false, false }, --set this as an array for convience
        skinCurrent=1,
        rating=rating
    }
    MAIN.SYSTEM.SAVE.getSave().actors[tostring(actorId)] = newSave

    --load to allMembers
    allMembers[actorId] = actor_base:new({
        actor=actorId,
        save=newSave
    })
end

M.getActorClone = function(actorId)
    --create a copy of save cause we dont want to edit it directly
    local save = allMembers[actorId].save
    local copySave = {}
    for k, v in pairs(save) do
        copySave[k] = v
    end

    return actor_base:new({
        actor=actorId,
        save=copySave
    })
end

M.getAllMembers = function(party, partySlot)
    local actors = {}
    local counter = 1

    --Ignore actors that are already in party, they will show up at top
    local ignoreList = {}
    if party and partySlot then
        for i = 1, #party do
            --If in party we insert them first
            local actor = party[i].actor
            if actor ~= 0 then
                actors[counter] = {
                    actorId=actor,
                    actor=allMembers[actor],
                    inParty=true,
                    currentSlot=partySlot==i
                }

                counter = counter + 1
                ignoreList[actor] = true
            end
        end
    end

    local unsorted = {}
    local unsortedCounter = 1
    --we need to use pairs as gaps in the array breaks # and ipairs
    for k, v in pairs(allMembers) do
        if not ignoreList[k] then
            unsorted[unsortedCounter] = {
                actorId=k,
                actor=v,
                inParty=false,
                currentSlot=false
            }

            unsortedCounter = unsortedCounter + 1
        end
    end

    table.sort(unsorted, function(a, b) return a.actorId < b.actorId end)

    for i = 1, unsortedCounter - 1 do
        actors[counter] = unsorted[i]
        counter = counter + 1
    end

    --Add remove if in party
    if party and partySlot then
        --This is a blank object
        actors[counter] = {
            
        }
    end

    return actors
end

M.getAllMembersCafe = function()
    local actors = {}
    local counter = 1

    --Ignore actors that are already in any dispatch, they will show up at top
    local ignoreList = {}
    local dispatch = MAIN.PLAYER.CAFE.getCafeFromSave().dispatch

    for i = 1, #dispatch do
        for j = 1, #dispatch[i].party do
            local actor = dispatch[i].party[j]
            if actor ~= 0 then
                actors[counter] = {
                    actorId=actor,
                    actor=allMembers[actor],
                    dispatch=i
                }

                counter = counter + 1
                ignoreList[actor] = true
            end
        end
    end

    local unsorted = {}
    local unsortedCounter = 1
    --we need to use pairs as gaps in the array breaks # and ipairs
    for k, v in pairs(allMembers) do
        if not ignoreList[k] then
            unsorted[unsortedCounter] = {
                actorId=k,
                actor=v,
                dispatch=nil
            }

            unsortedCounter = unsortedCounter + 1
        end
    end

    table.sort(unsorted, function(a, b) return a.actorId < b.actorId end)

    for i = 1, unsortedCounter - 1 do
        actors[counter] = unsorted[i]
        counter = counter + 1
    end

    --Add remove if in party
    --This is a blank object
    actors[counter] = {

    }

    return actors
end

M.getActorForCollection = function(actorId)
    local maxSave = {
        level=100,
        exp=0,
        skillLevel={ 1, 7, 7, 7, 7, 1 },
        skinsUnlocked={ false, false, false, false, false, false },
        skinCurrent=1,
        rating=CONSTANTS.ratingMax
    }
    --need to get save to copy the skinsUnlocked
    if allMembers[actorId] then
        local save = allMembers[actorId].save
        for i = 1, #save.skinsUnlocked do
            maxSave.skinsUnlocked[i] = save.skinsUnlocked[i]
        end
    end
    
    return actor_base:new({
        actor=actorId,
        save=maxSave
    })
end

M.getCollectionMembers = function()
    local actors = {}

    --use an actor list as there are gaps in data.actor
    local actorList = CONSTANTS.actorList
    for i = 1, #actorList do
        local actor = M.getActorForCollection(actorList[i])
        actors[i] = {
            actorId=i,
            actor=actor,
            inParty=false,
            currentSlot=false
        }
    end

    return actors
end

return M