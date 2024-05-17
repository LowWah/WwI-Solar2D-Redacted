local M = {}

local item_base = {
    id=0,
    category=0,
    data=nil,
    save=nil,
    slots=nil
}

function item_base:name()
    return self.data.name
end

function item_base:itemId()
    return self.data.id
end

function item_base:icon()
    return self.data.icon
end

function item_base:description()
    return self.data.description
end

function item_base:recycleItem()
    if self.data.recycle then
        if self.data.recycle.category == -1 then
            return {
                category=self.data.recycle.category,
                item={
                    icon=6,
                    name='Energy'
                },
                count=self.data.recycle.count+self:recycleCountAtLevel()
            }
        else
            return {
                category=self.data.recycle.category,
                item=MAIN.DATA.ITEM.getItem(self.data.recycle.category, self.data.recycle.id),
                count=self.data.recycle.count+self:recycleCountAtLevel()
            }
        end
    end
end

function item_base:recycleCountAtLevel()
    local level = self:level()
    if level > 0 then
        local count = 0
        local upgradeCount = self:upgradeItem().count
        for i = 1, level - 1 do
            count = count + upgradeCount * i
        end
        if self:isMaxLevel() then
            count = count + upgradeCount * 10
        end
        count = count + self:currentExp()
        return count
    end
    return 0
end

function item_base:isEquipment()
    return self.category >= 5
end

function item_base:level()
    return self.save.level or 0
end

function item_base:maxLevel()
    return self.category == 4 and 5 or 10
end

function item_base:isMaxLevel()
    return self:level() >= self:maxLevel()
end

function item_base:currentExp()
    return self.save.exp or 0
end

function item_base:totalExpForNext()
    if not self:isMaxLevel() then
        return self:upgradeItem().count * self:level()
    end
    return 0
end

function item_base:requiredExpForNext()
    if not self:isMaxLevel() then
        return self:totalExpForNext() - self:currentExp()
    end
    return 0
end

function item_base:expRateForNext()
    local expForNext = self:totalExpForNext()
    if expForNext ~= 0 then
        return 1 - self:requiredExpForNext() / expForNext
    end
    return 1
end

function item_base:gainExp(exp)
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

function item_base:upgradeItem()
    return self.data.upgrade
end

function item_base:slotItems()
    if self.save.slots then
        local slots = {}
        for i = 1, #self.save.slots do

        end
    end
end

function item_base:stats(id)
    if self.data.stats then
        local base = (self.data.stats[id] or 0) * self:level()

        if self.slots then
            for i = 1, #self.slots do
                if self.slots[i].id ~= 0 then
                    base = base + self.slots[i]:stats(id)
                end
            end
        end

        return base
    end
    return 0
end

function item_base:additional(id)
    if self.data.additional then
        local base = (self.data.additional[id] or 0) * self:level()

        if self.slots then
            for i = 1, #self.slots do
                if self.slots[i].id ~= 0 then
                    base = base + self.slots[i]:additional(id)
                end
            end
        end

        return base
    end
    return 0
end

function item_base:count()
    return self.save and self.save.count or 0
end

function item_base:initializeSlots()
    if self.save.slots then
        self.slots = {}
        for i = 1, #self.save.slots do
            --this always needs to be some kind of object
            local slotItem = {id=0,category=4}
            if self.save.slots[i].uniqueId ~= 0 then
                slotItem = item_base:new({
                   id=self.save.slots[i].uniqueId,
                   category=4,
                   save=self.save.slots[i]
                })
            end

            self.slots[i] = slotItem
        end
    end
end

function item_base:new(obj)
    --inherit methods
    setmetatable(obj, self)
    self.__index = self

    obj.data = MAIN.DATA.ITEM.getItem(obj.category, tonumber(obj.save.itemId or obj.id))

    --initialize slot items here
    obj:initializeSlots()

    --to disable the new function 
    function obj:new()
        print('This object should not create a new object')
    end

    return obj
end

--[[
    Item categories
    1 - General
    2 - Token
    3 - Tome
    4 - Gem
    5 - Weapon
    6 - Body
    7 - Head
    8 - Leg
    9 - Accessory
]]--
local allInventory = {
    {}, {}, {}, {}, {}, {}, {}, {}, {}
}

local newItem = function(category, id)
    local save = {
        count=0
    }
    MAIN.SYSTEM.SAVE.getSave().inventory[category][tostring(id)] = save

    --add to all Inventory
    local item = item_base:new({
        id=id,
        category=category,
        save=save
    })
    allInventory[category][tostring(id)] = item
    return item
end

local newItemWithLevel = function(category, id, uniqueId)
    local slots
    --if has slots
    local dataItem = MAIN.DATA.ITEM.getItem(category, id)
    if dataItem.slots then 
        slots = {}
        for i = 1, dataItem.slots do
            --a fake gem save with uniqueId
            slots[i] = {
                uniqueId=0,
                itemId=0,
                count=0,
                level=0,
                exp=0
            }
        end
    end

    local save = {
        itemId=id,
        count=1,
        level=1,
        exp=0,
        slots=slots
    }
    MAIN.SYSTEM.SAVE.getSave().inventory[category][tostring(uniqueId)] = save

    --add to all inventory
    local item = item_base:new({
        id=uniqueId,
        category=category,
        save=save
    })
    allInventory[category][tostring(uniqueId)] = item
    return item
end

M.gainItem = function(category, id, count)
    --Check if item can stack or not
    local result = {}
    if category == 0 then
        --gold
        MAIN.PLAYER.GOLD.gainGold(count)
        result[1] = {
            category=0,
            count=count
        }
    elseif category <= 3 then
        local item = allInventory[category][tostring(id)]
        if not item then
            item = newItem(category, tostring(id))
        end
        item.save.count = math.min(9999, item:count() + count)
        result[1] = {
            category=category,
            id=id,
            count=count
        }
    else
        --Get a unique id from current time and add clock miliseconds to get greater precision
        --this actually runs so fast, os.clock is the same when theres two items
        local uniqueId = tonumber(MAIN.SYSTEM.TIME.time() .. string.sub(tostring(os.clock()),-3))
        --Gain individually
        local gainCount = 0
        while gainCount < count do
            if not M.getItem(category, uniqueId) then
                newItemWithLevel(category, id, uniqueId)

                gainCount = gainCount + 1

                result[gainCount] = {
                    category=category,
                    id=uniqueId,
                    itemId=id,
                    count=1
                }
                
            end
            
            --incrementing to keep it unique
            uniqueId = uniqueId + 1
            
        end
    end
    --return the counts so it can be used if required
    return result
end

M.loseItem = function(category, id, count)
    --Check if item can stack or not
    if count > 0 then
        if category <= 3 then
            local item = allInventory[category][tostring(id)]
            local newCount = item:count() - count
            if newCount <= 0 then
                --remove from allinventory and save
                allInventory[category][tostring(id)] = nil
                MAIN.SYSTEM.SAVE.getSave().inventory[category][tostring(id)] = nil
            else
                item.save.count = newCount
            end
        else
            --Always remove it
            allInventory[category][tostring(id)] = nil
            MAIN.SYSTEM.SAVE.getSave().inventory[category][tostring(id)] = nil

            if category >= 5 then
                --remove any reference in party, should probably add a warning
                local partyList = MAIN.SYSTEM.SAVE.getSave().party.partyList
                for i = 1, #partyList do
                    local party = partyList[i]
                    for j = 1, #party do
                        local member = party[j]
                        if member.equipment[category - 4] == id then
                            member.equipment[category - 4] = 0
                        end
                    end
                end
            end

        end
    end
end

M.getItem = function(category, id)
    if category == 0 then
        local gold = item_base:new({
            id=id,
            category=category,
            save={
                count=0
            }
        })

        return gold
    end
    return allInventory[category][tostring(id)]
end

M.getItemClone = function(item) --category, id)
    --local item = M.getItem(category, id)

    local copySave = {}
    for k, v in pairs(item.save) do
        copySave[k] = v
    end

    return item_base:new({
        id=item.id,
        category=item.category,
        save=copySave
    })
end

M.getAllItems = function(category)
    --shit we cant just do this...
    --return allInventory[category]

    local items = {}
    local counter = 1
    for k, v in pairs(allInventory[category]) do
        items[counter] = v
        counter = counter + 1
    end

    table.sort(items, function(a,b) return tonumber(a.id) < tonumber(b.id) end)

    return items
end

M.getAllItemsForCollection = function(category)
    local items = {}
    local counter = 1

    local saveLevel = 0 
    if category == 4 then
        saveLevel = 5
    elseif category > 4 then
        saveLevel = 10
    end
    local dataItems = MAIN.DATA.ITEM.getAllItems(category)
    for k, v in pairs(dataItems) do
        local slots
        --if slots we only care about 2 slots
        if v.slots and v.slots == 2 then
            slots = {}
            for i = 1, v.slots do
                slots[i] = {
                    uniqueId=0,
                    itemId=0,
                    count=0,
                    level=0,
                    exp=0
                }
            end
        end
        if not v.slots or slots then
            --create a fake save, just include everything for convience
            local fakeSave = {
                count=1,
                itemId=k,
                level=saveLevel,
                exp=0,
                slots=slots
            }
            items[counter] = item_base:new({
                id=k,
                category=category,
                save=fakeSave
            })

            counter = counter + 1
        end
    end

    return items
end

M.getEquipmentListForEquip = function(category)
    --need to filter for equipment in current party

    local ignoreList = {}
    local currentParty = MAIN.PLAYER.PARTY.currentParty()
    for i = 1, #currentParty do
        local equipmentId = currentParty[i].equipment[category]
        if equipmentId > 0 then
            ignoreList[equipmentId] = true
        end
    end

    local items = {}
    local counter = 1
    for k, v in pairs(allInventory[category + 4]) do
        if not ignoreList[tonumber(k)] then
            items[counter] = v
            counter = counter + 1
        end
    end

    table.sort(items, function(a,b) return a.id < b.id end)

    --add a remove
    items[counter] = {
        id=0
    }

    return items
end

M.changeEquipmentSlot = function(equipmentItem, slotId, slotItem)
    local currentSlotSave = equipmentItem.save.slots[slotId]

    --gain existing slot item
    if currentSlotSave.uniqueId ~= 0 then
        --create a new item with level can copy current level and exp
        local currentSlotItem = newItemWithLevel(4, currentSlotSave.itemId, currentSlotSave.uniqueId)

        currentSlotItem.save.level = currentSlotSave.level
        currentSlotItem.save.exp = currentSlotSave.exp
    end

    --update currentSlotSave and lose slotItem
    if slotItem then
        currentSlotSave.uniqueId = slotItem.id
        currentSlotSave.itemId = slotItem:itemId()
        currentSlotSave.count = 1
        currentSlotSave.level = slotItem:level()
        currentSlotSave.exp = slotItem:currentExp()

        M.loseItem(4, slotItem.id, 1)
    else
        --reset to defaults
        currentSlotSave.uniqueId = 0
        currentSlotSave.itemId = 0
        currentSlotSave.count = 0
        currentSlotSave.level = 0
        currentSlotSave.exp = 0
    end

    equipmentItem:initializeSlots()

end

M.clearInventory = function()
    allInventory = {
        {}, {}, {}, {}, {}, {}, {}, {}, {}
    }
end

M.initializeInventory = function()
    local save = MAIN.SYSTEM.SAVE.getSave().inventory

    for i = 1, #save do
        local category = save[i]
        local inventory = {}
        for k, v in pairs(category) do
            --Maybe we should load the whole items so that we can still reference it instead of referencing data
            inventory[k] = item_base:new({
                id=tonumber(k),
                category=i,
                save=v
            })
        end
        allInventory[i] = inventory
    end
end

return M