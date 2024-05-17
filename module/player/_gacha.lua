local M = {}

local getActorResult = function(actorId, rating)
    --Check if its a new actor and we create actor or gain items
    --Adding a rating input so we dont need to pull back from data
    local MEMBERS = MAIN.PLAYER.MEMBERS
    local actor = MEMBERS.getActor(actorId)
    local isNew = false
    if actor then
        MAIN.PLAYER.INVENTORY.gainItem(2, 10 + actorId, 1)
    else
        MEMBERS.newSaveActor(actorId, rating)
        isNew = true
    end
    return {
        actor=actorId,
        isNew=isNew
    }
end

local getRandomActorAtRating = function(rating, isFeatured)
    local actors
    if rating == 1 then
        actors = CONSTANTS.gachaActorsRank3
    elseif rating == 2 then
        actors = CONSTANTS.gachaActorsRank2
    elseif rating == 3 then
        if isFeatured then
            local featured = M.getGachaStats('featured')
            --if first time, then guarentee, else 50%
            if featured.first then
                actors = { featured.actor }
                featured.first = false
            else
                local hit50 = math.random() < 0.5
                if hit50 then
                    actors = { featured.actor }
                else
                    actors = CONSTANTS.gachaActorsRank1
                    --If fail the 50/50 then reset featured to true
                    featured.first = true
                end
            end
        else
            actors = CONSTANTS.gachaActorsRank1
        end
    end
    
    return actors[math.floor(math.random() * #actors) + 1]
end

local rollForActor = function(category)
    --for corresponding category, get bonus chance, and roll, also add a rank variable
    local gachaStat = M.getGachaStats(category)

    local bonus = gachaStat.bonus

    --Get rank chance
    local rank1Chance = CONSTANTS.gachaRank1 + bonus.rate

    local rank2Chance = rank1Chance + CONSTANTS.gachaRank2
    local rank3Chance = 1
    --Add bonus count, if 10 then guarentee rank 2
    gachaStat.guarentee = gachaStat.guarentee + 1
    if gachaStat.guarentee >= 10 then
        rank2Chance = 1
        gachaStat.guarentee = 0
    end

    --Create range
    local ranges = { rank3Chance, rank2Chance, rank1Chance, 0 }

    local random = math.random()
    local rating
    for i = 1, #ranges do
        if ranges[i] < random then
            rating = i - 1
            break
        end
    end

    --add bonus count
    if rating == 3 then
        bonus.rate = 0
        bonus.count = 0
    else
        bonus.count = bonus.count + 1
        if bonus.count >= 20 then
            bonus.count = 0
            bonus.rate = bonus.rate + CONSTANTS.gachaBonusRate
        end
    end

    local actorId = getRandomActorAtRating(rating, category == 'featured')
    
    --[[
    print('rollForActor ranges', require('json').encode(ranges))
    print('rollForActor rating -', rating, 'random -', random)
    print(actorId)
    ]]
    
    return getActorResult(actorId, rating)
end

M.executeGacha = function(category, value)
    --category -> ['force', 'normal', 'featured', 'event']
    --value -> IF force then is actorId else num of recruits
    local actorResult = {}
    if category == 'force' then
        --Hardcoding the rank
        actorResult[1] = getActorResult(value, 1)
    else
        for i = 1, value do
            actorResult[i] = rollForActor(category)
        end
    end

    if category ~= 'force' then
        --dont write save for force, this should be handled in rewards screen
        MAIN.SYSTEM.SAVE.writeSave()
    end
    
    return actorResult
end

--Require save
M.getGachaStats = function(category)
    return MAIN.SYSTEM.SAVE.getSave().gacha[category]
end

M.hasDailyRecruit = function()
    return M.getGachaStats('normal').daily
end

M.useDailyRecruit = function()
    M.getGachaStats('normal').daily = false
end

M.resetDailyGacha = function()
    --reset can do daily gacha flag
    M.getGachaStats('normal').daily = true
end

M.resetFeaturedGacha = function()
    local gachaStat = M.getGachaStats('featured')
    --Reset featured chance
    gachaStat.first = true

    --reset gacha actor
    gachaStat.actor = getRandomActorAtRating(3, false)
end

return M