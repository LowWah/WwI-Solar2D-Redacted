local M = {}

local battlemanager_base = {
    --[[
    phase='start',

    currentWave=1,
    waves=1,
    allEnemies=nil,
    currentEnemies=nil,

    party=nil,

    turn=0,
    inputActor=0,
    order=nil,
    actingBattlerIndex=0,

    log=nil,

    group=nil
    ]]
}

function battlemanager_base:startInput()
    self.turn = self.turn + 1
    self.phase = 'input'
    self.inputActor = 0

    --move dead members to reserve
    local activePartyMembers = self:activePartyMembers()
    if #activePartyMembers < #self.party then
        for i = 1, #activePartyMembers do
            local currentMember = activePartyMembers[i]
            if currentMember:isDead() then
                --only swap if alive
                for j = #activePartyMembers + 1, #self.party do
                    local reserveMember = self.party[j]
                    if not reserveMember:isDead() then
                        self.party[i] = reserveMember
                        self.party[j] = currentMember
                        break
                    end
                end
            end
        end
    end

    --need to get active party members again
    activePartyMembers = self:activePartyMembers()
    for i = 1, #activePartyMembers do
        --start input runs before generate turn order
        if not activePartyMembers[i]:isDead() and activePartyMembers[i].startInput then
            activePartyMembers[i]:startInput(self)
        end
    end

    local aliveEnemies = self:aliveMembers()
    for i = 1, #aliveEnemies do
        --enemy ai logic
        aliveEnemies[i].inputSkill = 1
        aliveEnemies[i].target = 0
        if aliveEnemies[i].startInput then
            --use error handling so it doesnt freeze
            pcall(function() aliveEnemies[i]:startInput(self) end)
        end
    end

    self:generateTurnOrder()
end

function battlemanager_base:setNextWave()
    self.currentWave = self.currentWave + 1
    self.currentEnemies = self.allEnemies[self.currentWave]
    self.turn = 0

    --assign enemies to party members for statsExtra (frieda)
    for i = 1, #self.party do
        self.party[i].currentEnemies = self.currentEnemies
    end

    --disable auto if boss options
    if MAIN.SYSTEM.OPTIONS.getOptionWithKey('battle', 'autoBoss') then
        for i = 1, #self.currentEnemies do
            if self.currentEnemies[i].boss then
                MAIN.SYSTEM.OPTIONS.setAutoBattle(1)
                break
            end
        end
    end
end

function battlemanager_base:startBattle()
    local aliveMembers = self:aliveMembers(true)
    for i = 1, #aliveMembers do
        local actor = aliveMembers[i]

        if actor.startWave then
            actor:startWave(self)
        end
    end
end

function battlemanager_base:generateTurnOrder()
    local tie = { }
    local batterCount = #self.party + #self.currentEnemies
    for i = 1, batterCount do
        tie[i] = i
    end

    local order = {}
    local counter = 1
    
    local numActivePartyMembers = self:numActivePartyMembers()
    local random = math.random
    for i = 1, #self.party do
        if self.party[i]:canMove() then
            local randomIndex = random(#tie)
            local randomTie = tie[randomIndex]
            table.remove(tie, randomIndex)
            self.party[i]:initializeSpeed(randomTie)


            if i <= numActivePartyMembers then
                order[counter] = self.party[i]
                counter = counter + 1
            end

            --generate target for actors
        end
    end

    for i = 1, #self.currentEnemies do
        if self.currentEnemies[i]:canMove() then
            order[counter] = self.currentEnemies[i]
            counter = counter + 1

            local randomIndex = random(#tie)
            local randomTie = tie[randomIndex]
            table.remove(tie, randomIndex)
            self.currentEnemies[i]:initializeSpeed(randomTie)
        end
    end

    self.order = order
    self:sortTurnOrder()

    self.followUps = {}
end

function battlemanager_base:refreshTurnOrder()
    local order = {}
    local counter = 1

    for i = 1, self:numActivePartyMembers() do
        if self.party[i]:canMove() then
            order[counter] = self.party[i]
            counter = counter + 1
        end
    end

    for i = 1, #self.currentEnemies do
        if self.currentEnemies[i]:canMove() then
            order[counter] = self.currentEnemies[i]
            counter = counter + 1
        end
    end

    self.order = order
    self:sortTurnOrder()
end

function battlemanager_base:sortTurnOrder()
    table.sort(self.order, function(a, b)
        local aSpeed = a:speedTotal()
        local bSpeed = b:speedTotal()
        return bSpeed == aSpeed and a.tieOrder > b.tieOrder or aSpeed > bSpeed
    end)
end

function battlemanager_base:numActivePartyMembers()
    return math.min(CONSTANTS.battleActiveMembers, #self.party)
end

function battlemanager_base:activePartyMembers()
    local party = {}
    local maxCount = self:numActivePartyMembers()
    for i = 1, maxCount do
        party[i] = self.party[i]
    end
    return party
end

function battlemanager_base:aliveMembers(isParty)
    local aliveMembers = {}
    local counter = 1

    local members = isParty and self:activePartyMembers() or self.currentEnemies
    for i = 1, #members do
        if not members[i]:isDead() then
            aliveMembers[counter] = members[i]
            counter = counter + 1
        end
    end

    return aliveMembers

end

function battlemanager_base:changeInputActor(increment)
    local inputActor = self.inputActor
    while true do
        inputActor = inputActor + increment
        if inputActor > self:numActivePartyMembers() then
            break
        end
        local actor = self.party[inputActor]
        if not actor then
            break
        end
        if actor:canMove() then
            break
        end
    end
    
    return inputActor
end

function battlemanager_base:getNextInputActor()
    self.inputActor = self:changeInputActor(1)
end

function battlemanager_base:getPreviousInputActor()
    self.inputActor = self:changeInputActor(-1)
end

function battlemanager_base:hasPreviousInputActor()
    return self:changeInputActor(-1) > 0
end 

function battlemanager_base:hasNextInputActor()
    return self:changeInputActor(1) <= self:numActivePartyMembers()
end

function battlemanager_base:addLog(log)
    self.log[#self.log + 1] = log
end

function battlemanager_base:clearLog()
    self.log = {}
end

function battlemanager_base:startTurn()
    self.phase = 'turn'

    self.actingBattlerIndex = 0
end

function battlemanager_base:endTurn()
    self.phase = 'end'

    local results = {}
    local counter = 1

    --allies
    local numActivePartyMembers = self:numActivePartyMembers()
    for i = 1, #self.party do
        if not self.party[i]:isDead() then
            self.party[i]:updateTurns()

            local regenerate = self.party[i]:regenerate(i <= numActivePartyMembers)
            if regenerate then
                results[counter] = { target=self.party[i], regenerate=regenerate }
                counter = counter + 1
            end
        end
    end

    --enemies
    for i = 1, #self.currentEnemies do
        if not self.currentEnemies[i]:isDead() then
            self.currentEnemies[i]:updateTurns()
            local regenerate = self.currentEnemies[i]:regenerate(true)
            if regenerate then
                results[counter] = { target=self.party[i], regenerate=regenerate }
                counter = counter + 1
            end
        end
    end

    return results
end

function battlemanager_base:checkInputSkillTarget()
    local actor = self.party[self.inputActor]
    local skillTarget = actor:inputSkillTarget()

    --We only need to concern ourselves with 1 target skills as the others dont care about actor.target
    if skillTarget == 1 then
        local targets = self.currentEnemies
        --Check if any targets have provoke, if so set to target
        for i = 1, #targets do
            local target = targets[i]
            if not target:isDead() then
                local isProvokeAffected = target:hasProvoke()
                if isProvokeAffected then
                    --let actingBattlerActionTarget handle the target
                    actor.target = 0
                    return
                end
            end
        end

        local getNextTarget = function()
            for i = 1, #targets do
                local target = targets[i]
                if not target:isDead() then
                    local isStealthAffected = target:hasStealth()
                    if not isStealthAffected then
                        return i
                    end
                end
            end
            return 0
        end

        local target = targets[actor.target]
        if targets[actor.target] then
            if not target:isDead() then
                --Check if target has stealth 
                local isStealthAffected = target:hasStealth()
                if isStealthAffected then
                    actor.target = getNextTarget()
                end
            else
                actor.target = getNextTarget()
            end
        else
            actor.target = getNextTarget()
        end
    elseif skillTarget == 7 then
        local targets = self:activePartyMembers()

        local getSelfTarget = function()
            for i = 1, #targets do
                if targets[i] == actor then
                    return i
                end
            end
        end

        local target = targets[actor.target]
        if target then
            if target:isDead() then
                actor.target = getSelfTarget()
            end
        else
            actor.target = getSelfTarget()
        end
    end
end

function battlemanager_base:actingBattler()
    return self.order[self.actingBattlerIndex]
end

function battlemanager_base:getNextActingBattler()
    self.actingBattlerIndex = self.actingBattlerIndex + 1
    return self:actingBattler()
end

function battlemanager_base:getRandomTarget(actingBattlerIsActor, count)
    --random should be reverse of the battler who is doing the action
    local aliveTargets = self:aliveMembers(not actingBattlerIsActor)

    local targets = {}

    for i = 1, count do
        local random = 1 + math.floor(math.random() * #aliveTargets)
        targets[i] = aliveTargets[random]
    end

    return targets
end

function battlemanager_base:actingBattlerActionTarget()
    local actingBattler = self:actingBattler()
    local action = actingBattler:inputSkillObj()
    --this is mapped to battler as there may be buffs to adjust
    local actionTarget = actingBattler:inputSkillTarget()
    --local inputTarget = actingBattler.target

    local targets
    if actingBattler.editTargets then
        targets = actingBattler:editTargets(action, self)
    end

    if not targets then
        --a list so we can iterate when multiple
        targets = {}

        if actionTarget == 1 then
            --1 enemy
            local targetId = actingBattler.target
            if targetId == 0 then
                --enemies or actor with any enemy provoke or actor with all enemies stealth
                local enemyParty
                if actingBattler.isActor then
                    enemyParty = self.currentEnemies
                else
                    enemyParty = self:activePartyMembers()
                end

                local provoke
                local potentialTargets = {}
                for i = 1, #enemyParty do
                    local enemyBattler = enemyParty[i]
                    if not enemyBattler:isDead() then
                        if enemyBattler:hasProvoke() then
                            provoke = provoke or {}
                            provoke[#provoke + 1] = enemyBattler
                        end
                        if not enemyBattler:hasStealth() then
                            potentialTargets[#potentialTargets + 1] = enemyBattler
                        end
                    end
                end

                if provoke then
                    targets = { provoke[math.floor(math.random() * #provoke) + 1] }
                else
                    if potentialTargets[1] then
                        targets = { potentialTargets[math.floor(math.random() * #potentialTargets) + 1] }
                    else
                        --in the edge case where all targets have stealth
                        targets = self:getRandomTarget(actingBattler.isActor, 1)
                    end
                end
            else
                local target
                if actingBattler.isActor then
                    target = self.currentEnemies[targetId]
                else
                    target = self:activePartyMembers()[targetId]
                end
                
                if target and not target:isDead() then
                    targets[1] = target
                else
                    targets = self:getRandomTarget(actingBattler.isActor, 1)
                end
            end
        elseif actionTarget == 6 then
            --all enemies
            targets = self:aliveMembers(not actingBattler.isActor)
        elseif actionTarget == 7 then
            --1 ally
            local target
            if actingBattler.isActor then
                target = self:activePartyMembers()[actingBattler.target]
            else
                target = self.currentEnemies[actingBattler.target]
            end

            if target and not target:isDead() then
                targets[1] = target
            else
                targets = self:getRandomTarget(not actingBattler.isActor, 1)
            end
        elseif actionTarget == 8 then
            --all allies
            targets = self:aliveMembers(actingBattler.isActor)
        elseif actionTarget == 9 then
            --self
            targets[1] = actingBattler
        else
            targets = self:getRandomTarget(actingBattler.isActor, actionTarget - 1)
        end
    end

    return targets 
end

function battlemanager_base:performAction(actingBattler, skill, target, isFollowup)
    local result, actingResults, targetResults
    if isFollowup then
        actingResults = {
            isFollowup=true
        }
    end
    if not target:isDead() then
        --local actingBattler = self:actingBattler()
        --local skill = actingBattler:inputSkillObj()

        --PRE ACTIONS
        if actingBattler.preActionActingSelf then
            actingBattler:preActionActingSelf(actingBattler, skill, target)
        end

        local luckChance = actingBattler:luckChance(target)

        local effects

        --BUFFS
        local skillBuffs = skill:buffs()
        if skillBuffs then
            effects = {}

            --Apply buffs
            for i = 1, #skillBuffs do
                effects[#effects + 1] = actingBattler:applyBuffToTarget(skillBuffs[i], target)
            end
        end

        --DEBUFFS
        local skillDebuffs = skill:debuffs()
        if skillDebuffs then
            --Check chance for debuffs
            for i = 1, #skillDebuffs do
                local chance = skillDebuffs[i].chance or 1
                chance = chance + luckChance
                if math.random() < chance then
                    local hpRecover
                    effects = effects or {}
                    effects[#effects + 1], hpRecover = actingBattler:applyDebuffToTarget(skillDebuffs[i], target)

                    if hpRecover then
                        actingResults = actingResults or {}
                        actingResults.damage = actingResults.damage or {}
                        actingResults.damage.value = hpRecover
                        actingResults.damage.isHeal = true
                    end
                end
            end
        end

        --STATBUFFS
        local skillStatBuffs = skill:statBuffs()
        if skillStatBuffs then
            --Apply statbuffs
            for i = 1, #skillStatBuffs do
                --chance is for debuffs
                local chance = skillStatBuffs[i].chance or 1
                chance = chance + luckChance
                if math.random() < chance then
                    local tempActingEffect
                    effects = effects or {}

                    local skillStatBuff = skillStatBuffs[i]
                    if skillStatBuff.id == 0 then
                        --0 becomes random, we need to clone it as we dont want to override data
                        skillStatBuff = {
                            id=(math.floor(math.random() * 6) + 3),
                            value=skillStatBuff.value,
                            turn=skillStatBuff.turn
                        }
                    end

                    effects[#effects + 1], tempActingEffect = actingBattler:applyStatBuffToTarget(skillStatBuff, target)
                    if tempActingEffect then
                        actingResults = actingResults or {}
                        if tempActingEffect.hpRecover then
                            actingResults.damage = actingResults.damage or {}
                            actingResults.damage.value = tempActingEffect.hpRecover
                            actingResults.damage.isHeal = true
                        elseif tempActingEffect.actorLog then
                            local actingEffects = actingResults.effects or {}
                            actingEffects[#actingEffects + 1] = tempActingEffect.actorLog
                            actingResults.effects = actingEffects
                        end
                    end
                end
            end
        end

        --Hp cost
        if skill.data.hpCost then
            local loseHp = math.min(actingBattler:hp() - 1, math.round(actingBattler:maxHp() * skill.data.hpCost))
            actingBattler:gainHp(-1 * loseHp)
            actingResults = actingResults or {}
            actingResults.damage = actingResults.damage or {}
            actingResults.damage.value = loseHp
        end

        --DAMAGE
        local damage = {}
        if skill:damage() then
            local value, isCrit, isWeak, isResist, isHeal, isStun

            --do evasion
            local isEvade = actingBattler:checkEvade(skill, target)

            if not isEvade then
                --generate damage value
                value = self:skillDamageFormula(actingBattler, skill, target)

                --modify damage
                if actingBattler.editDamageActing then
                    value = actingBattler:editDamageActing(actingBattler, skill, target, value)
                elseif target.editDamageTarget then
                    value = target:editDamageTarget(actingBattler, skill, target, value)
                end
                
                isHeal = value < 0

                --do elements, this is already done in skillDamageFormula so its purely for visual
                local elementRate = actingBattler:elementRateToTarget(skill, target)         
                isWeak = elementRate > 1
                isResist = elementRate < 1

                --CRIT
                if skill:canCrit() then
                    local critChance = skill.data.alwaysCrit and 1 or (actingBattler:critical() + luckChance)
                    if math.random() < critChance then
                        isCrit = true
                        local multiplier = 1.8
                        --Kindhearted buff, doing this as its the only buff to affect crit damage
                        if actingBattler.buffs[20] then
                            multiplier = 2.5
                        end

                        value = math.round(value * multiplier)
                    end
                end

                --STUN
                if not target.debuffs[1] and not isResist then
                    --can stun only used by charolette hyper, should generalize it
                    if isWeak or isCrit or (actingBattler.canStun and actingBattler:canStun()) then
                        local stunChance = actingBattler:stunChanceToTarget(skill, target)
                        if math.random() < stunChance then
                            isStun = true
                            local hpRecover
                            effects = effects or {}
                            effects[#effects + 1], hpRecover = actingBattler:applyDebuffToTarget({id=1, turn=1}, target)

                            if hpRecover then
                                actingResults = actingResults or {}
                                actingResults.damage = actingResults.damage or {}
                                actingResults.damage.value = hpRecover
                                actingResults.damage.isHeal = true
                            end
                        end
                    end
                end
            end

            damage = {
                value=(value and math.abs(value)),
                isCrit=isCrit,
                isWeak=isWeak,
                isResist=isResist,
                isHeal=isHeal,
                isEvade=isEvade,
                isStun=isStun,
                isFollowup=isFollowup
            }

            if value then
                --have a return for clara
                damage.value = target:gainHp(-1 * value) or damage.value
            end

            if target.isActor and not target:isDead() and value and value > 0 then
                target:gainTpForDefence()
            end

            --drain
            if actingBattler:skillDrain(skill) and value then
                local drain = math.round(damage.value * 0.5)

                drain = actingBattler:gainHp(drain) or drain
                actingResults = actingResults or {}
                actingResults.damage = actingResults.damage or {}
                actingResults.damage.value = drain
                actingResults.damage.isHeal = true
            end
        end

        if damage or effects then
            targetResults = {
                damage=damage,
                effects=effects
            }
        end

        --MP heal
        if skill.data.healMp then
            --just default to 999
            target:gainMp(999)

            targetResults = {
                regenerate={
                    mp=999
                }
            }
        end

        --seperate result into target and acting, so can do stuff like drain
        result = {
            target=targetResults,
            acting=actingResults
        }

        function result:isSuccessfulAttack()
            return self.target and self.target.damage and self.target.damage.value and self.target.damage.value > 0
        end

        function result:isFollowup()
            return self.acting and self.acting.isFollowup
        end

        --POST ACTIONS

        --ACTING
        if actingBattler.postActionActingSelf then
            actingBattler:postActionActingSelf(actingBattler, skill, target, result, self)
        end

        --check for any postActionActingParty
        if actingBattler.isActor then
            local aliveMembers = self:aliveMembers(true)
            for i = 1, #aliveMembers do
                if aliveMembers[i].postActionActingParty then
                    aliveMembers[i]:postActionActingParty(actingBattler, skill, target, result, self)
                end
            end
        end

        --TARGET
        if target.postActionTargetSelf then
            target:postActionTargetSelf(actingBattler, skill, target, result, self)
        end
    end

    return result
end

function battlemanager_base:addFollowup(actingBattler, skill, targets)
    self.followUps[#self.followUps + 1] = {
        actingBattler=actingBattler,
        skill=skill,
        targets=targets
    }
end

function battlemanager_base:completeAction(actingBattler, skill, targets, isFollowup)
    --differs from postAction as this runs after all targets have been done
    if not isFollowup and actingBattler.completeActionActingSelf then
        actingBattler:completeActionActingSelf(actingBattler, skill, targets, self)
    end

    --For Nova, should setup so completeActionActingSelf not followup is in skill
    if actingBattler.completeActionActingSelfIncludeFollow then
        actingBattler:completeActionActingSelfIncludeFollow(actingBattler, skill, targets, self)
    end

    --check end hyper after ultimate here as if we do it as part of pay skill cost, it does not have the tp gain penalty
    if actingBattler.isActor and skill:isHyper() then
        actingBattler:updateHyperTurns()
    end

end

function battlemanager_base:skillDamageFormula(actingBattler, skill, target)
    --this is seperate to be reused in autobattle formulars
    local value
    if actingBattler.skillDamageFormula then
        value = actingBattler:skillDamageFormula(actingBattler, skill, target)
    end 

    if not value then
        local skillType = skill:type()
        local sign = 1
        local baseValue
        if skillType == 1 then
            local userStat = actingBattler:attack() * 1.25
            local targetStat = target:defence()
            local elementRate = actingBattler:elementRateToTarget(skill, target)

            baseValue = math.max(1, skill:damage() * (userStat - targetStat)) * elementRate
        elseif skillType == 2 then
            local userStat = actingBattler:magic() * 1.25
            local targetStat = target:resist()
            local elementRate = actingBattler:elementRateToTarget(skill, target)
            
            baseValue = math.max(1, skill:damage() * (userStat - targetStat)) * elementRate
        else
            --dont need target stat for healing
            local userStat = actingBattler:magic() * 0.5
            sign = -1

            baseValue = skill:damage() * userStat
        end

        local variance = baseValue * 0.1
        baseValue = baseValue - math.round(math.random() * variance) + math.round(math.random() * variance)

        value = math.max(1, math.min(999, math.round(baseValue)))

        value = value * sign
    end

    return value
end

function battlemanager_base:doAutoBattle()
    local optionsBattle = MAIN.SYSTEM.OPTIONS.getBattleOptions()

    local activePartyMembers = self:activePartyMembers()

    --determine heal targets here
    local healTargets, healTargetLowestHp, healTargetHpRate
    for i = 1, #activePartyMembers do
        local member = activePartyMembers[i]
        local memberHpRate = member:hpRate()
        if memberHpRate <= 0.3 and not member:isDead() then
            if not healTargets then
                healTargets = {}
            end
            --we still need targets to determine self
            healTargets[#healTargets + 1] = i

            if memberHpRate < (healTargetHpRate or 1) then
                healTargetHpRate = memberHpRate
                healTargetLowestHp = i
            end
        end
    end
    healTargetHpRate = nil

    for i = 1, #activePartyMembers do
        local battler = activePartyMembers[i]
        if battler:canMove() then
            --set target based on options, if skill becomes a target ally, we'll update it later
            local target
            --check if any enemies have provoke
            local provoke
            for j = 1, #self.currentEnemies do
                local enemy = self.currentEnemies[j]
                if not enemy:isDead() and enemy:hasProvoke() then
                    provoke = provoke or {}
                    provoke[#provoke + 1] = j
                    break
                end
            end

            if provoke then
                target = provoke[math.floor(math.random() * #provoke) + 1]
            end

            if not target then
                if optionsBattle.autoTarget ~= 1 then
                    --we need all enemies as target is based of current enemies, not alive enemies
                    local allEnemies = self.currentEnemies
                    local bestStat = nil
                    local statFunc 
                    if optionsBattle.autoTarget == 3 then
                        --strongest
                        statFunc = function(stat)
                            return stat > bestStat
                        end
                    else
                        --weakest
                        statFunc = function(stat)
                            return stat < bestStat
                        end
                    end
                    
                    for j = 1, #allEnemies do
                        local enemy = allEnemies[j]
                        if not enemy:isDead() and not enemy:hasStealth() then
                            local totalStats = enemy:maxHp()
                            for s = 3, 8 do
                                --we use base stats so it consistently hits the same enemy even after buffs/ debuffs
                                totalStats = totalStats + enemy:statsBase(s)
                            end
        
                            if bestStat then
                                if statFunc(totalStats) then
                                    bestStat = totalStats
                                    target = j
                                end
                            else
                                bestStat = totalStats
                                target = j
                            end
                        end
                    end
                else
                    --previous
                    --this doesnt adjust for changing target after using an ally skill
                    local previousEnemyTarget = self.currentEnemies[battler.target]
                    if previousEnemyTarget and not previousEnemyTarget:isDead() and not previousEnemyTarget:hasStealth() then
                        target = battler.target
                    else
                        --current target is dead or stealth, get next non stealth
                        for j = 1, #self.currentEnemies do
                            local enemy = self.currentEnemies[j]
                            if not enemy:isDead() and not enemy:hasStealth() then
                                target = j
                                break
                            end
                        end
                    end
                end
            end

            --all enemies stealth, just get the first alive enemy
            if not target then
                for j = 1, #self.currentEnemies do
                    local enemy = self.currentEnemies[j]
                    if not enemy:isDead() then
                        target = j
                        break
                    end
                end
            end

            --determine skill
            --priority - ultimate -> Heal Self -> Heal (HP Any) -> Buff -> Debuff -> Attack with highest dam
            local inputSkill = 1
            
            --check use ultimate
            if optionsBattle.autoUltimate and battler:canUseSkill(6) then
                inputSkill = 6
            else
                --generate a list of all useable skills
                local healSelf, healAny
                if healTargetLowestHp then
                    healAny = {}
                    for j = 1, #healTargets do
                        if healTargets[j] == battler then
                            healSelf = {}
                            break
                        end 
                    end
                end
                local buff = optionsBattle.autoBuff and {} or nil
                local debuff = optionsBattle.autoDebuff and {} or nil
                local attack = { 1 }
                for j = 2, (#battler.skills - 1) do
                    if battler:canUseSkill(j) then
                        local skill = battler.skills[j]
                        --assign to appropriate categories
                        local skillDamage = skill:damage()
                        if skillDamage then
                            if skillDamage >= 0 then
                                if skill:type() == 3 and healAny then
                                    --heal
                                    if healSelf and skill:target() == 9 then
                                        healSelf[#healSelf + 1] = j
                                    end
                                    healAny[#healAny + 1] = j
                                else
                                    --attack
                                    attack[#attack + 1] = j
                                end
                            end
                        end
    
                        if buff and skill:buffs() then
                            --buffs
                            local skillBuffs = skill:buffs()

                            local addBuff = false
                            --check if battler does not have the buffs applied already
                            for k = 1, #skillBuffs do
                                if not battler.buffs[skillBuffs[k].id] then
                                    addBuff = true
                                    break
                                end
                            end
                            if addBuff then
                                buff[#buff + 1] = j
                            end
                        end
    
                        if debuff and skill:debuffs() then
                            --debuffs
                            local skillDebuffs = skill:debuffs()

                            local addDebuff = true
                            --check if target enemy has at least one applied buff
                            for k = 1, #skillDebuffs do
                                if self.currentEnemies[target].debuffs[skillDebuffs[k].id] then
                                    addDebuff = false
                                    break
                                end
                            end

                            if addDebuff then
                                debuff[#debuff + 1] = j
                            end
                        end

                        if skill:statBuffs() then
                            local statBuffs = skill:statBuffs()

                            local addBuff = false
                            local addDebuff = true
                            for k = 1, #statBuffs do
                                local statBuff = statBuffs[k]
                                if buff and statBuff.value > 0 then
                                    addDebuff = false
                                    if battler.statBuffs[statBuff.id].value <= 0 then
                                        addBuff = true
                                        break
                                    end
                                elseif debuff and statBuff.value < 0 then
                                    addBuff = false
                                    if self.currentEnemies[target].statBuffs[statBuff.id].value < 0 then
                                        addDebuff = false
                                        break
                                    end
                                else
                                    addBuff = false
                                    addDebuff = false
                                end
                            end

                            if addBuff then
                                buff[#buff + 1] = j
                            end

                            if addDebuff then
                                debuff[#debuff + 1] = j
                            end
                        end
                    end
                end

                if healSelf and #healSelf > 0 then
                    --we should identify the skill which heals the most, but every only has one heal skill so doing it like this for now
                    inputSkill = healSelf[1]
                    --we dont need to set target as we have skill condition but whatever
                    target = i
                elseif healAny and #healAny > 0 then
                    --we should identify the skill which heals the most, but every only has one heal skill so doing it like this for now
                    inputSkill = healAny[1]
                    target = healTargetLowestHp
                elseif buff and #buff > 0 then
                    --just use the last buff skill
                    inputSkill = buff[#buff]
                    target = i
                elseif debuff and #debuff > 0 then
                    --use the debuff skill with most damage
                    local bestDebuffDamage
                    for j = 1, #debuff do
                        local debuffSkill = battler.skills[debuff[j]]
                        local debuffTarget = debuffSkill:target()

                        local debuffDamage = 0
                        if debuffSkill:damage() then
                            if debuffTarget == 1 then
                                --one target
                                debuffDamage = self:skillDamageFormula(battler, debuffSkill, self.currentEnemies[target])
                            elseif debuffTarget == 6 then
                                --all enemies
                                local aliveEnemies = self:aliveMembers()
                                for k = 1, #aliveEnemies do
                                    debuffDamage = debuffDamage + self:skillDamageFormula(battler, debuffSkill, aliveEnemies[k])
                                end
                            else
                                --get debuffTarget - 1 random targets
                                local numRandomTargets = debuffTarget - 1
                                local aliveEnemies = self:aliveMembers()
                                for k = 1, (debuffTarget - 1) do
                                    local randomEnemy = aliveEnemies[math.floor(math.random() * #aliveEnemies) + 1]
                                    debuffDamage = debuffDamage + self:skillDamageFormula(battler, debuffSkill, randomEnemy)
                                end
                            end
                        end

                        if debuffDamage >= (bestDebuffDamage or 0) then
                            bestDebuffDamage = debuffDamage
                            inputSkill = debuff[j]
                        end
                    end
                else
                    --use the attack skill with most damage
                    --basically same logic as debuff
                    local bestAttackDamage
                    for j = 1, #attack do
                        local attackSkill = battler.skills[attack[j]]
                        local attackTarget = attackSkill:target()

                        local attackDamage = 0
                        if attackSkill:damage() then
                            if attackTarget == 1 then
                                --one target
                                attackDamage = self:skillDamageFormula(battler, attackSkill, self.currentEnemies[target])
                            elseif attackTarget == 6 then
                                --all enemies
                                local aliveEnemies = self:aliveMembers()
                                for k = 1, #aliveEnemies do
                                    attackDamage = attackDamage + self:skillDamageFormula(battler, attackSkill, aliveEnemies[k])
                                end
                            else
                                --get debuffTarget - 1 random targets
                                local numRandomTargets = attackTarget - 1
                                local aliveEnemies = self:aliveMembers()
                                for k = 1, (attackTarget - 1) do
                                    local randomEnemy = aliveEnemies[math.floor(math.random() * #aliveEnemies) + 1]
                                    attackDamage = attackDamage + self:skillDamageFormula(battler, attackSkill, randomEnemy)
                                end
                            end
                        end

                        if attackDamage >= (bestAttackDamage or 0) then
                            bestAttackDamage = attackDamage
                            inputSkill = attack[j]
                        end
                    end
                end
            end

            battler.inputSkill = inputSkill
            battler.target = target
        end
    end
end

function battlemanager_base:new(obj)
    --inherit methods
    setmetatable(obj, self)
    self.__index = self

    --to disable the new function 
    function obj:new()
        print('This object should not create a new object')
    end

    return obj
end

local battler_base = {
    --[[
    name='',
    level=0,
    isActor=false,
    
    picture='',
    pictureX=0,
    pictureY=0,
    face='',

    max={ 0, 0 },
    stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
    additional={ 0, 0, 0, 0, 0 },

    tp=0,
    hyper=false,
    hyperId=0,

    speed=0,
    tieOrder=0,

    buffs={},
    debuffs={},
    elements={},

    skills={},
    inputSkill=0,
    target=0

    ai=nil
    ]]

}

--HP
function battler_base:maxHp()
    return self.max[1]
end

function battler_base:hp()
    return self.stats[1]
end

function battler_base:hpRate()
    return self:hp() / self:maxHp()
end

function battler_base:gainHp(gain)
    self.stats[1] = math.max(0, math.min(self:maxHp(), self:hp() + gain))
end

function battler_base:isDead()
    return self:hp() <= 0
end

--MP
function battler_base:maxMp()
    return self.max[2]
end

function battler_base:mp()
    return self.stats[2]
end

function battler_base:mpRate()
    return self:mp() / self:maxMp()
end

function battler_base:gainMp(gain)
    self.stats[2] = math.max(0, math.min(self:maxMp(), self:mp() + gain))
end

--TP
--Get tp directly, i.e self.tp

function battler_base:maxTp()
    return 100
end

function battler_base:tpRate()
    return self.tp / self:maxTp()
end

function battler_base:initializeTp()
    self.tp = 10 + math.floor(math.random() * 16)
end

function battler_base:gainTp(gain)
    if self.isActor and not self.hyper then
    
        local maxTp = self:maxTp()

        self.tp = math.max(0, math.min(maxTp, self.tp + gain))
        if not self.hyper and self.tp >= maxTp then
            self:gainHyper()
        end
    end
end

function battler_base:tpMode()
    return self.mode
end

function battler_base:gainTpForAttack()
    local modeTpGain = 0
    if self.isActor then
        modeTpGain = 4
        local tpMode = self:tpMode()
        if tpMode == 1 then
            modeTpGain = 8
        elseif tpMode == 2 then
            modeTpGain = 12
        end
    end

    self:gainTp(modeTpGain)
end

function battler_base:gainTpForDefence()
    local modeTpGain = 0
    if self.isActor then
        modeTpGain = 4
        local tpMode = self:tpMode()
        if tpMode == 3 then
            modeTpGain = 8 
        elseif tpMode == 1 then
            modeTpGain = 12
        end
    end

    self:gainTp(modeTpGain)
end

function battler_base:gainTpForHeal()
    local modeTpGain = 0
    if self.isActor then
        modeTpGain = 4
        local tpMode = self:tpMode()
        if tpMode == 1 then
            modeTpGain = 8
        elseif tpMode == 4 then
            modeTpGain = 12
        end
    end
    
    self:gainTp(modeTpGain)
end

function battler_base:gainTpForBuffs()
    local modeTpGain = 0
    if self.isActor then
        modeTpGain = 2
        local tpMode = self:tpMode()
        if tpMode == 1 then
            modeTpGain = 4
        elseif tpMode == 4 then
            modeTpGain = 6
        end
    end

    self:gainTp(modeTpGain)
end

function battler_base:gainTpForDebuffs()
    local modeTpGain = 0
    if self.isActor then
        modeTpGain = 2
        local tpMode = self:tpMode()
        if tpMode == 1 then
            modeTpGain = 4
        elseif tpMode == 5 then
            modeTpGain = 6
        end
    end

    self:gainTp(modeTpGain)
end

function battler_base:gainHyper()
    self.hyper = true
    --GAIN HYPER BUFF, 
    self:applyBuffToTarget({
        id=self.hyperId,
        turn=4
    }, self)

    --disable auto if hyper options
    if MAIN.SYSTEM.OPTIONS.getOptionWithKey('battle', 'autoHyper') then
        MAIN.SYSTEM.OPTIONS.setAutoBattle(1)
    end

end

function battler_base:loseHyper()
    self.buffs[self.hyperId] = nil
    self:removeEffectIcon(MAIN.DATA.BUFF.getBuff(self.hyperId).icon)
    --dont disable self.hyper yet as we still need it for tp penalty
end

--STATS
function battler_base:statsBase(i)
    return math.round(self.stats[i] * self:statsExtra(i))
end

function battler_base:statsExtra(i)
    return 1
end

function battler_base:statsMultiply(i)
    local bonus = self:statBuffRate(i)
    for k, v in pairs(self.buffs) do
        local dataBuff = MAIN.DATA.BUFF.getBuff(v.id)
        if dataBuff.stats then
            bonus = bonus * dataBuff.stats[i]
        end
    end
    for k, v in pairs(self.debuffs) do
        local dataDebuff = MAIN.DATA.DEBUFF.getDebuff(v.id)
        if dataDebuff.stats then
            bonus = bonus * dataDebuff.stats[i]
        end
    end
    --APPLY BUFFS/DEBUFFS
    return bonus
end

function battler_base:statsTotal(i)
    return math.max(1, math.min(999, math.round(self:statsBase(i) * self:statsMultiply(i))))
end

function battler_base:attack()
    return self:statsTotal(3)
end

function battler_base:defence()
    return self:statsTotal(4)
end

function battler_base:magic()
    return self:statsTotal(5)
end

function battler_base:resist()
    return self:statsTotal(6)
end

function battler_base:agility()
    return self:statsTotal(7)
end

function battler_base:luck()
    return self:statsTotal(8)
end

function battler_base:luckChance(target)
    return math.max(0, (self:luck() - target:luck()) / 2000)
end

--ADDITIONAL
function battler_base:additionalBase(i)
    return self.additional[i]
end

function battler_base:additionalBonus(i)
    local bonus = 0
    
    local buffsWithAdditional = { 1, 2, 3, 4, 5, 11, 13, 14 }
    for j = 1, #buffsWithAdditional do
        if self.buffs[buffsWithAdditional[j]] then
            local dataBuff = MAIN.DATA.BUFF.getBuff(buffsWithAdditional[j])
            bonus = bonus + dataBuff.additional[i]
        end
    end

    --there arent any debuffs affecting additional at the moment
    return bonus
end

function battler_base:additionalTotal(i)
    return math.max(0, math.min(1, self:additionalBase(i) + self:additionalBonus(i)))
end

function battler_base:hpRegen()
    return self:additionalTotal(1)
end

function battler_base:mpRegen()
    return self:additionalTotal(2)
end

function battler_base:critical()
    return self:additionalTotal(3)
end

function battler_base:evasion()
    return self:additionalTotal(4)
end

function battler_base:stun()
    return self:additionalTotal(5)
end

--ELEMENTS - we dont sum but do lowest or highest
function battler_base:elementsBase(i)
    return self.elements[i] or 1
end

function battler_base:elementsBonus(i)
    local rate

    --Check debuff
    local debuffsWithElements = { 2 }
    for j = 1, #debuffsWithElements do
        if self.debuffs[debuffsWithElements[j]] then
            rate = MAIN.DATA.DEBUFF.getDebuff(debuffsWithElements[j]).elements[i]
            break
        end
    end

    if not rate then
        --check buffs only if not debuffed
        local buffsWithElements = { 12, 21, 22, 23, 24, 25, 26 }
        for j = 1, #buffsWithElements do
            if self.buffs[buffsWithElements[j]] then
                rate = MAIN.DATA.BUFF.getBuff(buffsWithElements[j]).elements[i]
                break
            end
        end
    end

    return rate
end

function battler_base:elementsTotal(i)
    return self:elementsBonus(i) or self:elementsBase(i)
end

function battler_base:elementRateAgainstSkill(skill)
    return self:elementsTotal(skill:element())
end

function battler_base:elementRateToTarget(skill, target)
    return target:elementRateAgainstSkill(skill)
end

function battler_base:stunChanceToTarget(skill, target)
    return self:stun() + self:luckChance(target)
end

--BUFFS
function battler_base:applyBuffToTarget(buff, target)
    self:gainTpForBuffs()

    local dataBuff = MAIN.DATA.BUFF.getBuff(buff.id)
    local log
    if target.buffs[buff.id] then
        local newTurn = math.max(target.buffs[buff.id].turn, buff.turn)
        target.buffs[buff.id].turn = newTurn
        log = target.name .. ' extends their ' .. dataBuff.name .. ' buff!'
        target:updateEffectIcon(dataBuff.icon, newTurn)
    else
        target.buffs[buff.id] = {
            id=buff.id,
            turn=buff.turn
        }
        log = target.name .. ' receives a ' .. dataBuff.name .. ' buff!'
        target:addEffectIcon(dataBuff.icon, buff.turn)
    end
    
    return log
end

function battler_base:updateBuffTurns()
    for k, v in pairs(self.buffs) do
        local newTurn = v.turn - 1
        if newTurn <= 0 then
            self.buffs[k] = nil
            v = nil
            self:removeEffectIcon(MAIN.DATA.BUFF.getBuff(k).icon)
        else
            v.turn = newTurn
            self:updateEffectIcon(MAIN.DATA.BUFF.getBuff(k).icon, newTurn)
        end
    end
end

--DEBUFF
function battler_base:applyDebuffToTarget(debuff, target)
    --return is used by annie only
    local hpRecover = self:gainTpForDebuffs()

    local dataDebuff = MAIN.DATA.DEBUFF.getDebuff(debuff.id)
    local log
    if target.debuffs[debuff.id] then
        local newTurn = math.max(target.debuffs[debuff.id].turn, debuff.turn)
        target.debuffs[debuff.id].turn = newTurn
        log = target.name .. ' extends their ' .. dataDebuff.name .. ' debuff!'
        target:updateEffectIcon(dataDebuff.icon, newTurn)
    else
        target.debuffs[debuff.id] = {
            id=debuff.id,
            turn=debuff.turn
        }
        log = target.name .. ' receives a ' .. dataDebuff.name .. ' debuff!'
        target:addEffectIcon(dataDebuff.icon, debuff.turn)
    end
    
    return log, hpRecover
end

function battler_base:updateDebuffTurns()
    for k, v in pairs(self.debuffs) do
        local newTurn = v.turn - 1
        if newTurn <= 0 then
            self.debuffs[k] = nil
            v = nil
            self:removeEffectIcon(MAIN.DATA.DEBUFF.getDebuff(k).icon)
        else
            v.turn = newTurn
            self:updateEffectIcon(MAIN.DATA.DEBUFF.getDebuff(k).icon, newTurn)
        end
    end
end

--STAT BUFFS
function battler_base:applyStatBuffToTarget(statBuff, target)
    local value = statBuff.value

    if self.editStatBuffSelf then
        value = self:editStatBuffSelf(value)
    end

    if target.editStatBuffTarget then
        value = target:editStatBuffTarget(value)
    end

    if value > 0 then
        local statBuffTarget = target.statBuffs[statBuff.id]
        local paramName = CONSTANTS.paramStats[statBuff.id]

        self:gainTpForBuffs()

        if statBuffTarget.value < 0 then
            target:removeEffectIcon(CONSTANTS.statBuffsIcons(statBuff.id, statBuffTarget.value).icon)
            statBuffTarget.value = 0
            statBuffTarget.turn = 0
            return target.name .. ' loses their ' .. paramName .. ' debuff!'
        else
            local log, effectIconFunc
            if statBuffTarget.value == 0 then
                log = target.name .. ' receives a ' .. paramName .. ' buff!'
            else
                --always remove it as it might be upgraded to next level
                target:removeEffectIcon(CONSTANTS.statBuffsIcons(statBuff.id, statBuffTarget.value).icon)
                log = target.name .. ' extends their ' .. paramName .. ' buff!'
            end
            statBuffTarget.value = math.min(2, statBuffTarget.value + value)
            statBuffTarget.turn = math.max(statBuffTarget.turn, statBuff.turn)
            target:addEffectIcon(CONSTANTS.statBuffsIcons(statBuff.id, statBuffTarget.value).icon, statBuffTarget.turn)
            return log
        end

    elseif value < 0 then
        --SHOULD CHANCE BE HERE??
        local statBuffTarget = target.statBuffs[statBuff.id]
        local paramName = CONSTANTS.paramStats[statBuff.id]

        --secondary output for debuffs, this shold be done at postAction but its too hard to identify apply debuff
        local secondary

        --used by annie
        local hpRecover = self:gainTpForDebuffs()

        --used by nikolette, 
        local actorLog
        if self.applyStatDebuffSelf then
            actorLog = self:applyStatDebuffSelf(statBuff)
        end

        if hpRecover or actorLog then
            secondary = {
                hpRecover=hpRecover,
                actorLog=actorLog
            }
        end
        
        if statBuffTarget.value > 0 then
            target:removeEffectIcon(CONSTANTS.statBuffsIcons(statBuff.id, statBuffTarget.value).icon)
            statBuffTarget.value = 0
            statBuffTarget.turn = 0
            return target.name .. ' loses their ' .. paramName .. ' buff!', secondary
        else
            local log
            if statBuffTarget.value == 0 then
                log = target.name .. ' receives a ' .. paramName .. ' debuff!'
            else
                --always remove it as it might be upgraded to next level
                target:removeEffectIcon(CONSTANTS.statBuffsIcons(statBuff.id, statBuffTarget.value).icon)
                log = target.name .. ' extends their ' .. paramName .. ' debuff!'
            end
            statBuffTarget.value = math.max(-2, statBuffTarget.value + value)
            statBuffTarget.turn = math.max(statBuffTarget.turn, statBuff.turn)
            target:addEffectIcon(CONSTANTS.statBuffsIcons(statBuff.id, statBuffTarget.value).icon, statBuffTarget.turn)
            return log, secondary
        end
    end
end

function battler_base:statBuffRate(i)
    local statBuffValue = self.statBuffs[i].value
    if statBuffValue == 0 then
        return 1
    elseif statBuffValue == 1 then
        return 1.1
    elseif statBuffValue == -1 then
        return 0.9
    elseif statBuffValue == 2 then
        return 1.15
    elseif statBuffValue == -2 then
        return 0.85
    else
        return 1
    end
end

function battler_base:updateStatBuffTurns()
    for i = 1, #self.statBuffs do
        local statBuff = self.statBuffs[i]
        if statBuff.value ~= 0 then
            local newTurn = statBuff.turn - 1
            local icon = CONSTANTS.statBuffsIcons(i, statBuff.value).icon
            statBuff.turn = newTurn
            if newTurn == 0 then
                self:removeEffectIcon(icon)
                statBuff.value = 0
            else
                self:updateEffectIcon(icon, newTurn)
            end
        end
    end
end

--could probably do some sort and insert via binary search
function battler_base:addEffectIcon(icon, turn)
    self.effectIcons[#self.effectIcons + 1] = {
        icon=icon,
        turn=turn
    }
end

function battler_base:updateEffectIcon(icon, turn)
    for i = 1, #self.effectIcons do
        if self.effectIcons[i].icon == icon then
            self.effectIcons[i].turn = turn
            return
        end
    end

end

function battler_base:removeEffectIcon(icon)
    for i = 1, #self.effectIcons do
        if self.effectIcons[i].icon == icon then
            table.remove(self.effectIcons, i)
            return
        end
    end
end

function battler_base:allEffects()
    local icons = {}
    local counter = 1
    for k, v in pairs(self.buffs) do
        local obj = {
            icon = MAIN.DATA.BUFF.getBuff(v.id).icon,
            turn = v.turn > 0 and v.turn or ''
        }
        icons[counter] = obj
        counter = counter + 1
    end
    for k, v in pairs(self.debuffs) do
        local obj = {
            icon = MAIN.DATA.DEBUFF.getDebuff(v.id).icon,
            turn = v.turn > 0 and v.turn or ''
        }
        icons[counter] = obj
        counter = counter + 1
    end

    return icons
end

function battler_base:hasStealth()
    local stealthBuffs = { 6 }
    for i = 1, #stealthBuffs do
        if self.buffs[stealthBuffs[i]] then
            return true
        end
    end
    return false
end

function battler_base:hasProvoke()
    local provokeBuffs = { 7 }
    for i = 1, #provokeBuffs do
        if self.buffs[provokeBuffs[i]] then
            return true
        end
    end
    return false
end

function battler_base:regenerate(inParty)
    --return a result so we can draw a new damage popup
    local regenerate

    if inParty then
        local hpRegen = self:hpRegen()
        local hpGain = math.round(self:maxHp() * hpRegen)
        if hpGain > 0 then
            regenerate = regenerate or {}
            hpGain = self:gainHp(hpGain) or hpGain
    
            regenerate.hp = hpGain
        end
    
        if self.isActor then
            local mpRegen = self:mpRegen()
            local mpGain = math.round(self:maxMp() * mpRegen)
            if mpGain > 0 then
                regenerate = regenerate or {}
                self:gainMp(mpGain)
    
                regenerate.mp = mpGain
            end
        end
    end

    if regenerate then
        return { regenerate=regenerate }
    end
end

function battler_base:updateHyperTurns()
    if self.hyper then
        if self.buffs[self.hyperId] then
            local loseTp = { 30, 20, 10 }
            --directly minus as gainTp is affected by the hyper penalty
            self.tp = math.max(0, math.min(self:maxTp(), self.tp - loseTp[self.buffs[self.hyperId].turn]))
        else
            self:loseHyper()
            --update the flag here as we want ultimate skills to have the tp gain penalty
            self.hyper = false
        end
    end
end

function battler_base:updateTurns()
    self:updateBuffTurns()
    self:updateDebuffTurns()
    self:updateStatBuffTurns()
    self:updateHyperTurns()
end

function battler_base:clearBuffsDebuffs()
    for k, v in pairs(self.buffs) do
        self.buffs[k] = nil
        self:removeEffectIcon(MAIN.DATA.BUFF.getBuff(k).icon)
    end

    for k, v in pairs(self.debuffs) do
        self.debuffs[k] = nil
        self:removeEffectIcon(MAIN.DATA.DEBUFF.getDebuff(k).icon)
    end

    for i = 1, #self.statBuffs do
        if self.statBuffs[i].value ~= 0 then
            local icon = CONSTANTS.statBuffsIcons(i, self.statBuffs[i].value).icon
            self:removeEffectIcon(icon)

            self.statBuffs[i].value = 0
            self.statBuffs[i].turn = 0
        end
    end

    if self.isActor then
        self.hyper = false
        self:loseHyper()
    end
end

--SPEED
function battler_base:minSpeed()
    return 1
end

function battler_base:maxSpeed()
    return 999
end

function battler_base:initializeSpeed(tieOrder)
    self.tieOrder = tieOrder or 0
    local agi = math.round(self:agility() / 2)
    local variance = math.floor(agi / 10)

    self.speed = math.round(math.max(self:minSpeed(), math.min(self:maxSpeed(), agi + math.random() * variance - math.random() * variance)))

    --apply speed buffs/ debuffs
    local buffsWithSpeed = { 15, 19 }
    for i = 1, #buffsWithSpeed do
        if self.buffs[buffsWithSpeed[i]] then
            self.speed = math.max(self.minSpeed(), math.min(self:maxSpeed(), self.speed + MAIN.DATA.BUFF.getBuff(buffsWithSpeed[i]).speed))
        end
    end

    local debuffsWithSpeed = { 6 }
    for i = 1, #debuffsWithSpeed do
        if self.debuffs[debuffsWithSpeed[i]] then
            self.speed = math.max(self.minSpeed(), math.min(self:maxSpeed(), self.speed + MAIN.DATA.DEBUFF.getDebuff(debuffsWithSpeed[i]).speed))
        end
    end 
end

function battler_base:speedBonus()
    local bonus = 0
    --Check skills
    local skill = self:inputSkillObj()
    if skill then
        bonus = bonus + skill:speed()
    end

    return bonus
end

function battler_base:speedTotal()
    return math.max(self:minSpeed(), math.min(self:maxSpeed(), self.speed + self:speedBonus()))
end

--SKILL
function battler_base:inputSkillObj()
    return self.skills[self.inputSkill]
end

function battler_base:inputSkillIcon()
    local skill = self:inputSkillObj()
    if skill then
        return skill:icon()
    end
    return 1
end

function battler_base:skillTarget(skill)
    return skill:target()
end

function battler_base:inputSkillTarget()
    --check buffs
    return self:skillTarget(self:inputSkillObj())
end

function battler_base:canUseSkill(index)
    if self.isActor then
        local skill = self.skills[index]
        if skill then
            --Check battler can move
            if not self:canMove() then
                return false
            end
            --Is hyper
            if skill:isHyper() then
                return self.hyper
            end

            --MP
            return self:mp() >= skill:cost()
        end
        return false
    else
        return true
    end
end

function battler_base:payCost(skill)
    --local skill = self:inputSkillObj()
    if skill:isHyper() then
        self.tp = 0
        self:loseHyper()
    else
        self:gainMp(-1 * skill:cost())
    end
end

function battler_base:skillDrain(skill)
    return skill.data.drain
end

function battler_base:setInputSkill(index)
    self.inputSkill = index
    --Retarget needs to be in battlemanager
end

function battler_base:canMove()
    if self:isDead() then
        return false
    end

    local debuffsWhichCantMove = { 1 }
    for i = 1, #debuffsWhichCantMove do
        if self.debuffs[debuffsWhichCantMove[i]] then
            return false
        end
    end
    return true
end

function battler_base:checkEvade(skill, target)
    --skills that never miss
    if skill.data.neverMiss then
        return false
    end

    local isEvade = false

    --skills that can fail
    if skill.data.fail then
        isEvade = math.random() < skill.data.fail
    end

    if not isEvade then
        --check target evade
        local targetEvasion = target:evasion()
        if targetEvasion > 0 then
            isEvade = math.random() < targetEvasion
        end
    end

    return isEvade
end

function battler_base:new(obj)
    --inherit methods
    setmetatable(obj, self)
    self.__index = self

    --to disable the new function 
    function obj:new()
        print('This object should not create a new object')
    end

    return obj
end

local makeBattleEnemies = function(enemies, terrain)
    local battleEnemies = {}

    local enemyLetters = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H' }

    --get troops
    local troops
    if enemies.waves then
        troops = enemies.waves
    elseif terrain then
        local allEnemiesWithBosses = MAIN.DATA.QUEST.getTowerEnemies()[2]

        troops = {}
        for i = 1, 3 do
            local terrainFinal = terrain == 0 and math.floor(math.random() * #allEnemiesWithBosses) + 1 or terrain
            local possibleTroops = allEnemiesWithBosses[terrainFinal][i]

            troops[i] = possibleTroops[math.floor(math.random() * #possibleTroops) + 1]
        end
    else
        troops = { 1 }
    end

    local getTroop = MAIN.DATA.TROOP.getTroop
    local getEnemy = MAIN.DATA.ENEMY.getEnemy
    local getSkill = MAIN.DATA.SKILLS.getSkill
    --setup enemies
    for i = 1, #troops do
        local battleWave = {}

        local troop = getTroop(troops[i])

        local letter = {}
        for j = 1, #troop do 
            local enemyId = troop[j].enemyId
            local dataEnemy = getEnemy(enemyId)

            if not letter[enemyId] then
                letter[enemyId] = {}
            end
            local letterAtEnemy = letter[enemyId]
            letterAtEnemy[#letterAtEnemy + 1] = j

            local enemy = {
                id=enemyId,

                name=dataEnemy.name,
                level=enemies.level,
                isActor=false,
                letter=nil, --will be set later
                boss=dataEnemy.boss,
                hpGauge=dataEnemy.hpGauge,

                picture=dataEnemy.picture,
                pictureX=troop[j].x,
                pictureY=troop[j].y,
                --face='Face_FH_001_01',
                
                max={ 0, 0 },
                stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
                additional={ 0, 0, 0, 0, 0 },

                tp=0,
                hyper=false,
                hyperId=0,
                mode=0,

                speed=0,
                tieOrder=0,

                buffs={},
                debuffs={},
                elements=(dataEnemy.elements or { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }),
                statBuffs={ },
                effectIcons= { },

                skills={  },
                inputSkill=1,
                target=0,

                startInput=dataEnemy.startInput
            }

            --STATS
            for k = 1, #enemy.stats do
                --stats
                enemy.stats[k] = math.round(dataEnemy.stats[k] + enemy.level * dataEnemy.growth[k])

                --max
                if k <= 2 then
                    enemy.max[k] = enemy.stats[k]
                end

                --additional
                enemy.additional[k] = k == 2 and 0 or CONSTANTS.paramAdditionalRate[k]

                --statBuffs
                enemy.statBuffs[k] = {
                    value=0,
                    turn=0
                }
            end

            --SKILLS
            local skillLevel = math.ceil(enemy.level / 10)
            for k = 1, #dataEnemy.skills do
                enemy.skills[k] = getSkill(dataEnemy.skills[k], skillLevel)
            end

            battleWave[j] = battler_base:new(enemy)
        end

        --check letter
        for k, v in pairs(letter) do
            if #v > 1 then
                for j = 1, #v do
                    battleWave[v[j]].letter = enemyLetters[j]
                end
            end
        end

        battleEnemies[i] = battleWave
    end

    return battleEnemies
end

local makeBattleParty = function(inLabyrinth)
    local party = MAIN.PLAYER.PARTY.currentParty()

    local battleParty = {}
    local counter = 1

    local MEMBERS = MAIN.PLAYER.MEMBERS
    local INVENTORY = MAIN.PLAYER.INVENTORY
    local pictureY = display.contentHeight - CONSTANTS.actorHeight
    for i = 1, #party do
        if party[i].actor > 0 then
            local member = party[i]

            local actor = MEMBERS.getActor(member.actor)
            local actorSkin = actor:skin()

            local setCounts = {}
            local equipment = {}
            local elementSetBonuses
            for j = 1, #member.equipment do
                if member.equipment[j] > 0 then
                    equipment[j] = INVENTORY.getItem(j + 4, member.equipment[j])

                    --elements
                    if equipment[j] and equipment[j].data.elements then
                        elementSetBonuses = elementSetBonuses or {}
                        for k, v in pairs(equipment[j].data.elements) do
                            elementSetBonuses[k] = v
                        end
                    end

                    if equipment[j] and equipment[j].data.set and equipment[j].data.set ~= 0 then
                        local currentSetCount = setCounts[equipment[j].data.set] or 0
                        setCounts[equipment[j].data.set] = currentSetCount + 1
                    end
                end
            end

            local statSetBonuses, additionalSetBonuses
            for k, v in pairs(setCounts) do
                local set = MAIN.DATA.ITEM.getEquipmentSet(k)
                for i = 1, #set.effects do
                    if v >= i and set.effects[i] then
                        local effect = set.effects[i]
                        if effect.stats then
                            local stats = effect.stats
                            statSetBonuses = statSetBonuses or {}
                            if stats.params then
                                statSetBonuses = statSetBonuses or {}
                                for j = 1, #stats.params do
                                    local statBonus = statSetBonuses[stats.params[j]] or 0
                                    statSetBonuses[stats.params[j]] = statBonus + stats.value
                                end
                            elseif stats.param then
                                statSetBonuses = statSetBonuses or {}
                                local statBonus = statSetBonuses[stats.param] or 0
                                statSetBonuses[stats.param] = statBonus + stats.value
                            end
                        elseif effect.additional then
                            local additonal = effect.additional
                            if additonal.params then
                                additionalSetBonuses = additionalSetBonuses or {}
                                for j = 1, #additonal.params do
                                    local additionalBonus = additionalSetBonuses[additonal.params[j]] or 0
                                    additionalSetBonuses[additonal.params[j]] = additionalBonus + additonal.value
                                end
                            elseif additonal.param then
                                additionalSetBonuses = additionalSetBonuses or {}
                                local additionalBonus = additionalSetBonuses[additonal.param] or 0
                                additionalSetBonuses[additonal.param] = additionalBonus + additonal.value
                            end
                        elseif effect.element then
                            --TODO
                        end
                    end
                end
            end

            local battler = {
                id=actor.actor,

                name=actor:name(),
                level=actor:level(),
                isActor=true,

                rankIcon=CONSTANTS.rankIcon[actor:rank()],
                ratingIcon=CONSTANTS.ratingIcon[actor:rating()],
                
                picture=actorSkin.picture,
                pictureX=0,
                pictureY=pictureY,
                face=actorSkin.face,

                --only need it for labyrinth
                character=(inLabyrinth and actorSkin.character or nil),

                max={ 0, 0 },
                stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
                additional={ 0, 0, 0, 0, 0 },

                tp=0,
                hyper=false,
                hyperId=actor.data.hyper.hyperId,
                mode=actor.data.mode,

                speed=0,
                tieOrder=0,

                buffs={},
                debuffs={},
                elements={},
                statBuffs={ },
                effectIcons= { },

                skills=actor:allSkills(),
                inputSkill=1,
                target=0
            }

            --setup stats
            for s = 1, #battler.stats do
                local stat = actor:stats(s)
                local additional = actor:additional(s)
                for e = 1, #member.equipment do
                    if equipment[e] then
                        stat = stat + equipment[e]:stats(s)

                        if additional then
                            additional = additional + equipment[e]:additional(s)
                        end
                    end
                end

                if statSetBonuses and statSetBonuses[s] then
                    local bonus = math.floor(stat * statSetBonuses[s])
                    stat = stat + bonus
                end

                battler.stats[s] = stat

                --max
                if battler.max[s] then
                    battler.max[s] = stat
                end

                --additional
                if additional then
                    if additionalSetBonuses and additionalSetBonuses[s] then
                        additional = additional + additionalSetBonuses[s]
                    end

                    battler.additional[s] = additional
                end

                --statBuffs
                battler.statBuffs[s] = {
                    value=0,
                    turn=0
                }
            end

            --setup elements
            for e = 1, #CONSTANTS.elementIcons do
                local element = elementSetBonuses and elementSetBonuses[e] or actor:elements(e)
                battler.elements[e] = element
            end

            battler = battler_base:new(battler)
            battler:initializeTp()

            --setup effects, runs after new to override functions
            if actor.data.unique.effects then
                for k, v in pairs(actor.data.unique.effects) do
                    battler[k] = v
                end
            end

            battleParty[counter] = battler
            counter = counter + 1
        end
    end
    return battleParty
end

M.initializeBattleManager = function(parent)
    --load details
    local floor = MAIN.PLAYER.QUEST.getStageFloors(composer.getVariable('quest'), composer.getVariable('stage'))[composer.getVariable('floor')]

    local waves, allEnemies, currentEnemies, background
    if floor.enemies then
        local terrain
        if floor.enemies.terrain then
            terrain = floor.enemies.terrain
        elseif floor.enemies.terrains then
            terrain = floor.enemies.terrains[math.floor(math.random() * #floor.enemies.terrains) + 1]
            background = CONSTANTS.terrain[terrain].imageName
        end

        allEnemies = makeBattleEnemies(floor.enemies, terrain)
        waves = #allEnemies
        currentEnemies = allEnemies[1]
    end

    if not background then
        background = CONSTANTS.terrain[floor.terrain].imageName
    end

    local party = makeBattleParty()

    --assign for statsExtra (raya/frieda)
    for i = 1, #party do
        party[i].party = party
        party[i].currentEnemies = currentEnemies
    end

    return battlemanager_base:new({
        phase='start',

        currentWave=1,
        waves=waves,
        allEnemies=allEnemies,
        currentEnemies=currentEnemies,

        party=party,

        turn=0,
        inputActor=0,
        order={},
        actingBattlerIndex=0,

        log={},

        group=parent,

        background=background,

        arenaChallenges=(composer.getVariable('quest') == 'arena' and MAIN.PLAYER.QUEST.getArenaChallenges() or nil)
    })
end

M.initializeBattleManagerForLabyrinth = function()
    --we have a dedicated battle manager for labyrinth so we can dynamically update the enemies and keep actor hps
    local battleManager = battlemanager_base:new({
        phase='start',

        currentWave=0,
        waves=waves,
        allEnemies=allEnemies,
        currentEnemies=currentEnemies,

        party=makeBattleParty(true),

        turn=0,
        inputActor=0,
        order={},
        actingBattlerIndex=0,

        log={},

        group=nil,

        background=CONSTANTS.pictureLabyrinth,

        arenaChallenges=nil
    })

    function battleManager:setupEnemies(troops)
        self.phase = 'start'

        local allEnemies = makeBattleEnemies(troops)

        self.currentWave = 1
        self.waves = #allEnemies
        self.allEnemies = allEnemies
        self.currentEnemies = allEnemies[1]
        
        self.turn = 0
        self.inputActor = 0
        self.order = {}
        self.actingBattlerIndex = 0

        self.log = {}

        self.background = CONSTANTS.pictureLabyrinth

        --clean buffs/debuffs
        if self.party then
            for i = 1, #self.party do
                self.party[i]:clearBuffsDebuffs()
                
                --assign for statsExtra (raya/frieda)
                self.party[i].party = party
                self.party[i].currentEnemies = currentEnemies
            end
        end
    end

    return battleManager

end

return M