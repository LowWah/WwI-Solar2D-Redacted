local M = {}

local getLanguage = function()
    return MAIN.SYSTEM.OPTIONS.getLanguage()
end

local getTranslated = function(obj)
    return obj[getLanguage()]
end

--TITLE
M.getTitle = function()
    return getTranslated({
        en='War with Infinity'
    })
end

M.getEdition = function()
    return getTranslated({
        en='Fantasy Heroine Edition'
    })
end

M.getTouchToStart = function()
    return getTranslated({
        en='Touch to start'
    })
end

--GUILD
M.getGuild = function()
    return getTranslated({
        en='Guild'
    })
end

--LEVEL
M.getLevel = function()
    return getTranslated({
        en='Level'
    })
end

M.getToNext = function()
    return getTranslated({
        en='To Next'
    })
end

--GOLD
M.getGold = function()
    return getTranslated({
        en='Gold'
    })
end

--QUEST
M.getQuest = function()
    return getTranslated({
        en='Quest'
    })
end

M.getCurrentQuests = function()
    return getTranslated({
        en='Current Quests'
    })
end

M.getCompleteChapter1 = function()
    return getTranslated({
        en='Complete Chapter 1'
    })
end

M.getRecommLv = function()
    return getTranslated({
        en='Recomm. Lv'
    })
end

M.getSelectStage = function()
    return getTranslated({
        en='Select stage'
    })
end

--FLOOR
M.getFloor = function()
    return getTranslated({
        en='Floor'
    })
end

--STORY
M.getStory = function()
    return getTranslated({
        en='Story'
    })
end

M.getMain = function()
    return getTranslated({
        en='Main'
    })
end

M.getSide = function()
    return getTranslated({
        en='Side'
    })
end

M.getEvent = function()
    return getTranslated({
        en='Event'
    })
end

--RESOURCE
M.getResource = function()
    return getTranslated({
        en='Resource'
    })
end

--ONSLAUGHT
M.getOnslaught = function()
    return getTranslated({
        en='Onslaught'
    })
end

--SHARD
M.getShard = function()
    return getTranslated({
        en='Shard'
    })
end

--GEAR
M.getGear = function()
    return getTranslated({
        en='Gear'
    })
end

--CHALLENGE
M.getChallenge = function()
    return getTranslated({
        en='Challenge'
    })
end

--ARENA
M.getArena = function()
    return getTranslated({
        en='Arena'
    })
end

--TOWER
M.getTower = function()
    return getTranslated({
        en='Tower'
    })
end

--LABYRINTH
M.getLabyrinth = function()
    return getTranslated({
        en='Labyrinth'
    })
end

--PARTY
M.getParty = function()
    return getTranslated({
        en='Party'
    })
end

--MEMBERS
M.getMembers = function()
    return getTranslated({
        en='Members'
    })
end

--INVENTORY
M.getInventory = function()
    return getTranslated({
        en='Inventory'
    })
end

--RECRUIT
M.getRecruit = function()
    return getTranslated({
        en='Recruit'
    })
end

--SHOP
M.getShop = function()
    return getTranslated({
        en='Shop'
    })
end

--MISSION
M.getMission = function()
    return getTranslated({
        en='Mission'
    })
end

--CAFE
M.getCafe = function()
    return getTranslated({
        en='Cafe'
    })
end

--COLLECTION
M.getCollection = function()
    return getTranslated({
        en='Collection'
    })
end

--CHANGE
M.getChange = function()
    return getTranslated({
        en='Change'
    })
end

--LOCKED
M.getLocked = function()
    return getTranslated({
        en='Locked'
    })
end

M.getEmpty = function()
    return getTranslated({
        en='Empty'
    })
end

M.getReserve = function()
    return getTranslated({
        en='Reserve'
    })
end

M.getLog = function()
    return getTranslated({
        en='Log'
    })
end

M.getSkip = function()
    return getTranslated({
        en='Skip'
    })
end

M.getNew = function()
    return getTranslated({
        en='New'
    })
end

M.getFeatured = function()
    return getTranslated({
        en='Featured'
    })
end

M.getDaily = function()
    return getTranslated({
        en='Daily'
    })
end

M.getNormal = function()
    return getTranslated({
        en='Normal'
    })
end

M.getGuarentee = function()
    return getTranslated({
        en='Guarentee'
    })
end

M.getBonus = function()
    return getTranslated({
        en='Bonus'
    })
end

M.getProfile = function()
    return getTranslated({
        en='Profile'
    })
end

M.getSkills = function()
    return getTranslated({
        en='Skills'
    })
end

M.getRating = function()
    return getTranslated({
        en='Rating'
    })
end

M.getAttire = function()
    return getTranslated({
        en='Attire'
    })
end

M.getRemove = function()
    return getTranslated({
        en='Remove'
    })
end

M.getCurrent = function()
    return getTranslated({
        en='Current'
    })
end

M.getInParty = function()
    return getTranslated({
        en='In Party'
    })
end

M.getSelect = function()
    return getTranslated({
        en='Select'
    })
end

M.getEdit = function()
    return getTranslated({
        en='Edit'
    })
end

return M