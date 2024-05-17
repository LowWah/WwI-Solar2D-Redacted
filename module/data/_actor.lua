local M = {}

local actors = {
    {
        name='Melaine',
        rating=1,
        skills={ 1, 5, 7, 85, 182, 220 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_001_01',
                face='Face_FH_001_01',
                character='Character_FH_001_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_001_02',
                face='Face_FH_001_01',
                character='Character_FH_001_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_001_03',
                face='Face_FH_001_01',
                character='Character_FH_001_01',
                cost=400
            }
        },
        stats={ 185, 105, 175, 170, 160, 165, 180, 175 },
        growth={ 4.2, 3.5, 4, 3.7, 3.3, 3.5, 4.1, 4 },
        recruit='You can\'t just slash your enemies, you need grace. Here, watch me!',
        profile='Raised in a family of elves that opted to practice with melee weapons rather than magic, Melaine proudly claims to be the most dazziling among her fellow kin. Her movements draw inspiration from many dance performances she enjoyed when she was younger and, with a magic dagger enchanted in glistening ice, she makes a performance on every battle she partakes in.',
        mode=2,
        elements={ 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Encore',
            description='After attacking an enemy, all attacks done to that target will be followed up with a weak ice attack\n\nA good performer always knows when the audience wants more',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target is enemy, not dead, successful hit
                    if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() then
                        --treat it as hidden debuff which lasts one turn
                        local markDebuffId = 5
                        target.debuffs[markDebuffId] = {
                            id=markDebuffId,
                            turn=1
                        }
                    end
                end,
                postActionActingParty=function(self, actingBattler, skill, target, result, battleManager)
                    local markDebuffId = 5
                    --target is enemy, not dead, has debuff, successful hit
                    if self ~= actingBattler and not target.isActor and not target:isDead() and target.debuffs[markDebuffId] and result:isSuccessfulAttack() and not result:isFollowup() then
                        local skillId = self.buffs[self.hyperId] and 276 or 275
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { target })
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Enticing Encore',
            description='Encore attacks are now critical\n\nYou know how to make a performance shine',
            hyperId=10,
            icon=58
        }
    }, {
        name='Elie',
        rating=2,
        skills={ 2 ,136, 165, 202, 207, 221 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_002_01',
                face='Face_FH_002_01',
                character='Character_FH_002_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_002_02',
                face='Face_FH_002_01',
                character='Character_FH_002_01',
                cost=400
            }
        },
        stats={ 195, 130, 175, 180, 190, 210, 165, 160 },
        growth={ 4.25, 4.2, 3.85, 3.95, 4.15, 4.3, 3.9, 4 },
        recruit='We\'re here to help.',
        profile='Coming from a long line of elves noted for their incredible magic, Elie has also inherited her ancestors gifts and uses it to support those in need. One recipent to her good-hearted nature was a stray wisp, injured as a casualty in some battle. As thanks for mending it back to health the wisp now follows Elie and assists with tending those in need.',
        mode=4,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        unique={
            icon=57,
            name='Guardian Elf',
            description='Buff skills will also grant a small amount of healing\n\nGood-hearted by nature, these kinds of elves will alway look to protect you',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target is ally, skill is buff (do no damage value)
                    if target.isActor and not result:isSuccessfulAttack() and not result:isFollowup() then
                        local skillId = 277
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { target })
                    end
                end,
                editDamageActing=function(self, actingBattler, skill, target, value)
                    if self.buffs[self.hyperId] and target.isActor and value < 0 then
                        value = math.round(value * 1.5)
                    end

                    return value
                end
            }
        },
        hyper={
            --effect is in unique
            name='Wisp Heal',
            description='Increases healing given by 50%\n\nThe wisp will also provide support',
            hyperId=10,
            icon=58
        }
    }, {
        name='Sofie',
        rating=1,
        skills={ 3, 43, 52, 166, 203, 222 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_003_01',
                face='Face_FH_003_01',
                character='Character_FH_003_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_003_02',
                face='Face_FH_003_01',
                character='Character_FH_003_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_003_03',
                face='Face_FH_003_01',
                character='Character_FH_003_01',
                cost=400
            }
        },
        stats={ 175, 115, 170, 155, 155, 165, 160, 150 },
        growth={ 4.05, 3.8, 3.95, 3.75, 3.7, 3.8, 3.7, 3.55 },
        recruit='I\'m good at sewing stiches, so let me know if you have an open wound.',
        profile='Orphaned as a baby, Sofie\'s only clue of her birth parents is the stuffed doll that was in her arms when she first arrived at the orphanage. With all the wear and tear that has come to the doll, Sofie quickly mastered the needle and thread and has sewn the doll more times she can count. She hopes that, by keeing the doll alive, it will lead her back to her parents.',
        mode=1,
        elements={ 1.25, 1, 0.75, 1.25, 1, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Stitching',
            description='Healing skills use Attack instead of M.Attack\n\nA master of the needle and thread can patch up an wound',
            effects={
                skillDamageFormula=function(self, actingBattler, skill, target)
                    --if action is heal, return heal using atk
                    if target.isActor then
                        local skillDamage = skill:damage()
                        if skillDamage and skillDamage < 0 then
                            local userStat = self:attack()
                            local baseValue = math.max(1, math.abs(skillDamage * userStat))
                            local variance = baseValue * 0.1
                            baseValue = baseValue - math.round(math.random() * variance) + math.round(math.random() * variance)
                    
                            return -1 * math.round(baseValue)
                        end
                    end
                end,
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --in hyper only
                    if self.buffs[self.hyperId] then
                        --target is enemy, not dead, successful hit, 50% chance
                        if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() and math.random() < 0.5 then
                            local effects = result.target and result.target.effects or {}
                            local debuffs = {
                                {
                                    id=3,
                                    value=-1,
                                    turn=3
                                },
                                {
                                    id=5,
                                    value=-1,
                                    turn=3
                                }
                            }
                            for i = 1, #debuffs do
                                --apply directly instead of a followup as we want it instant
                                effects[#effects + 1] = self:applyStatBuffToTarget(debuffs[i], target)
                            end

                            result.target.effects = effects
                        end
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Cross Stitch',
            description='Successful attacks have a 50% chance to apply a ATK and MAT debuff that lasts 3 turns\n\nNeedles can also be an effective weapon',
            hyperId=10,
            icon=58
        }
    }, {
        name='Inari',
        rating=2,
        skills={ 2, 80, 101, 126, 170, 223 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_004_01',
                face='Face_FH_004_01',
                character='Character_FH_004_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_004_02',
                face='Face_FH_004_01',
                character='Character_FH_004_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_004_03',
                face='Face_FH_004_01',
                character='Character_FH_004_01',
                cost=400
            }
        },
        stats={ 185, 140, 165, 180, 200, 190, 140, 180 },
        growth={ 4.2, 4.4, 3.8, 4, 4.3, 4.1, 3.8, 3.9 },
        recruit='This seems like it\'ll be a lot of trouble. When we finish, you\'ll have some offerings for me, right?',
        profile='Some time in the distant past, Inari stumbled across a human village suffering from agricultrual drought. On a whim, she used her deft command of nature to cultivate the lands and from then on was revered as the god of agriculture. Since then, she has strayed away from meddling with human afairs though, occasionally comes to claim the offerings that have been tributed by the villagers in hopes of a good harvest.',
        mode=2,
        elements={ 1, 1, 1, 1.25, 0.75, 1.25, 0.75, 0.75, 0.75, 1, 1 },
        unique={
            icon=57,
            name='Bountiful Harvest',
            description='Skills have a 35% chance to not consume MP\n\nFor a good harvest, one must be able to call the weather at any moment',
            effects={
                payCost=function(self)
                    --hopefully this overwrites
                    local skill = self:inputSkillObj()
                    if skill:isHyper() then
                        self.tp = 0
                        self:loseHyper()
                    else
                        local godOfAgricultureChance = self.buffs[self.hyperId] and 1 or 0.35
                        if math.random() >= godOfAgricultureChance then
                            self:gainMp(-1 * skill:cost())
                        end
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='God of Agriculture',
            description='Bountiful Harvest chance increased to 100%\n\nBeing a god means there are people depending on you',
            hyperId=10,
            icon=58
        }
    }, {
        name='Lily',
        rating=1,
        skills={ 3, 40, 96, 48, 102, 224 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_005_01',
                face='Face_FH_005_01',
                character='Character_FH_005_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_005_02',
                face='Face_FH_005_01',
                character='Character_FH_005_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_005_03',
                face='Face_FH_005_01',
                character='Character_FH_005_01',
                cost=400
            }
        },
        stats={ 195, 115, 180, 160, 170, 140, 150, 140 },
        growth={ 4.35, 3.4, 4.05, 3.7, 3.9, 3.5, 3.8, 3.7 },
        recruit='A new voyage, how exciting! Let\'s make it one to remember!',
        profile='The youngest of three sisters, Lily enjoyed a carefree youth sheltered by her older siblings. One day, she hid on a navy ship in hopes for adventure but was instead caught and worked to the bone. However she is grateful to the navy captain for giving her such treatment as it has given her more respect for life. She has since stayed with the navy, putting in hard work to partake in the new adventures that await her.',
        mode=2,
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Sharpshooter',
            description='Attacks cannot miss\n\nA title awarded to those that excel in marksmanship',
            effects={
                checkEvade=function(self, skill, target)
                    return false
                end
            }
        },
        hyper={
            --buff has stat bonus
            name='Deadly Sniper',
            description='Increase critical by 24%\n\nWith good aim, it is easy to target critical points',
            hyperId=11,
            icon=58
        }
    }, {
        name='Meryl',
        rating=1,
        skills={ 1, 5, 12, 19, 194, 225 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_006_01',
                face='Face_FH_006_01',
                character='Character_FH_006_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_006_02',
                face='Face_FH_006_01',
                character='Character_FH_006_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_006_03',
                face='Face_FH_006_01',
                character='Character_FH_006_01',
                cost=400
            }
        },
        stats={ 180, 100, 180, 160, 140, 155, 175, 180 },
        growth={ 4.1, 3.4, 4.15, 3.6, 3.2, 3.6, 4.15, 4.1 },
        recruit='Are you all set? Hope you can keep up with me.',
        profile='As a feline, considered the most dexterous of the humanoid species, many question why Meryl has chooses to practice with swords instead of honing her animal traits. She claims her ample speed complements swordplay and that she doesn\'t want to risk breaking her claws. Of course she\'s still able to match all the others of her kind, with the added bonus of not needing to tend to broken nails.',
        mode=2,
        elements={ 0.75, 1.25, 1.25, 1, 1, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Dual Wield',
            description='Basic attack performs one additional attack to the enemy\n\nTwo weapons means twice the damage',
            effects={
                completeActionActingSelf=function(self, actingBattler, skill, targets, battleManager)
                    --targets is enemy
                    if #targets > 0 and not targets[1].isActor and skill.data.id == 1 then
                        local skillId = 1
                        --if hyper then its attack all
                        local followupTargets = self.buffs[self.hyperId] and battleManager:aliveMembers(false) or targets
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), followupTargets)
                    end
                end,
                skillTarget=function(self, skill)
                    if self.buffs[self.hyperId] and skill.data.id == 1 then
                        return 6
                    end
                    return skill:target()
                end
            }

        },
        hyper={
            --effect is in unique
            name='Feral Instinct',
            description='Basic attack now attacks all enemies\n\nUnleash your inner beast and slash all enemies',
            hyperId=10,
            icon=58
        }
    }, {
        name='Sakura',
        rating=1,
        skills={ 1, 89, 90, 18, 180, 226 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_007_01',
                face='Face_FH_007_01',
                character='Character_FH_007_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_007_02',
                face='Face_FH_007_01',
                character='Character_FH_007_01',
                cost=400
            }, {
                name='Kimono', 
                picture='Battler_FH_007_03',
                face='Face_FH_007_01',
                character='Character_FH_007_01',
                cost=1000
            }
        },
        stats={ 200, 105, 175, 175, 150, 170, 165, 170 },
        growth={ 4.25, 3.4, 4, 3.8, 3.3, 3.7, 4.05, 3.9 },
        recruit='Let us emerge victorious.',
        profile='Very few have risen up the rank as quickly as Sakura. Earning the title of samurai, she serves the military army, the highest line of defence that protects the country. Men admire her skill, women adore her beauty, it is no surprise many name her as the \'beauty on the battlefield\'.',
        mode=2,
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Beauty',
            description='35% chance to receive a buff which increases speed to 999\n\nSometimes beauty can kill in a battlefield',
            effects={
                startInput=function(self, battleManager)
                    local beautyChance = self.buffs[self.hyperId] and 1 or 0.35
                    if math.random() < beautyChance then
                        local beautyBuffId = 15
                        self:applyBuffToTarget({
                            id=beautyBuffId,
                            turn=1
                        }, self)
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Adoration',
            description='Beauty chance increase to 100%\n\nAll is left in awe in the presence of such beauty',
            hyperId=10,
            icon=58
        }
    }, {
        name='Annie',
        rating=1,
        skills={ 2, 25, 26, 31, 35, 227 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_008_01',
                face='Face_FH_008_01',
                character='Character_FH_008_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_008_02',
                face='Face_FH_008_01',
                character='Character_FH_008_01',
                cost=400
            }, {
                name='Armless', 
                picture='Battler_FH_008_03',
                face='Face_FH_008_01',
                character='Character_FH_008_01',
                cost=1000
            }
        },
        stats={ 210, 90, 190, 160, 130, 140, 150, 170 },
        growth={ 4.6, 3.2, 4.1, 3.9, 3.2, 3.6, 3.9, 3.8 },
        recruit='Take this! Wow, what a block. Whatever you\'re doing must be tough if you\'re that good.',
        profile='The \'girl with big fists\', Annie has made a name for herself as the girl that can pack a punch. Perhaps because the orphanage was a rowdy home, or perhaps from all the competitions she\'s entered to win food for her family, she always had to fight to get what she wanted. Whatever the reason, she now feels most comfortable when speaking with punches.',
        mode=5,
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25 },
        unique={
            icon=57,
            name='Advantage',
            description='Recover 10% mhp when inflicting a debuff\n\nWhen the enemy\'s weak, its the best time to strike',
            effects={
                gainTpForDebuffs=function(self)
                    --default tp gain
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

                    --gain hp when apply debuff
                    local gain = math.floor(self:maxHp() * 0.1)
                    self:gainHp(gain)
                    return gain
                end,
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    if self.buffs[self.hyperId] then
                        --actingBattler is enemy
                        if not actingBattler.isActor and result:isSuccessfulAttack() then
                            local heal = math.floor(result.target.damage.value * 0.25)
                            self:gainHp(heal)

                            result.target.regenerate = {
                                hp=heal
                            }
                        end
                    end
                end,
            }
        },
        hyper={
            --effect in unique
            name='Never give up!',
            description='Recover 25% of damage taken, applies even when dead\n\nA true fighter knows when not to give up',
            hyperId=10,
            icon=58
        }
    }, {
        name='Ebonie',
        rating=1,
        skills={ 3, 44, 47, 49, 186, 228 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_009_01',
                face='Face_FH_009_01',
                character='Character_FH_009_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_009_02',
                face='Face_FH_009_01',
                character='Character_FH_009_01',
                cost=400
            }
        },
        stats={ 180, 105, 180, 150, 160, 150, 175, 180 },
        growth={ 4.1, 3.6, 4.05, 3.65, 3.3, 3.55, 3.95, 4.2 },
        recruit='Let\'s finish this quick and move to the next target.',
        profile='Ebonie took a different approach to her family\'s training, opting to stay hidden in the shadows. Though her face-to-face combat skills are just as good her sisters, she finds it tedious and prefers a quick win. Her thrusting dagger, a family heirloom, is sharp enough to pierce through her target\'s vitals and end the battle immediately.',
        mode=5,
        elements={ 1.25, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Enfeeble',
            description='Successful attacks have a 35% chance to apply LUK debuff that lasts 3 turns\n\nStrike an enemy\'s vitals to weaken them',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target is enemy, not dead, skill successful
                    if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() then
                        local chance = self.buffs[self.hyperId] and 1 or 0.35
                        if math.random() < chance then
                            local effects = result.target and result.target.effects or {}
                            --instant instead of followup
                            effects[#effects + 1] = self:applyStatBuffToTarget({
                                id=8,
                                value=-1,
                                turn=3
                            }, target)

                            result.target.effects = effects
                        end
                    end
                end
            }
        },
        hyper={
            --effect is in hyper
            name='Debilitate',
            description='Enfeeble chance increase to 100%\n\nDon\'t give your enemies any chance to fight back',
            hyperId=10,
            icon=58
        }
    }, {
        name='Justine',
        rating=2,
        skills={ 1, 150, 153, 16, 200, 229 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_010_01',
                face='Face_FH_010_01',
                character='Character_FH_010_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_010_02',
                face='Face_FH_010_01',
                character='Character_FH_010_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_010_03',
                face='Face_FH_010_01',
                character='Character_FH_010_01',
                cost=400
            }
        },
        stats={ 200, 125, 190, 170, 190, 170, 165, 180 },
        growth={ 4.7, 3.8, 4.15, 4.05, 4.15, 4.05, 3.9, 3.8 },
        recruit='Don\'t fret, the hero Justine has come to your aid!',
        profile='Justine, the self-proclaimed \'Hero\', travels around to world looking to lend her aid to those in need. However, due to her use of dark magic and her neutral good alignment, many see her acts of good will as chaotic and fear her recklessness. In spite of other\'s opinions, she continues to do what she thinks is right to fulfil her duty as a hero.',
        mode=1,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        unique={
            icon=57,
            name='Righteous',
            description='Attacks cannot be resisted\n\nAll your actions are just and cannot be reasoned against',
            effects={
                elementRateToTarget=function(self, skill, target)
                    local value = target:elementRateAgainstSkill(skill)
                    return math.max(1, value)
                end,
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --hyper, target is enemy, not dead, successful hit
                    if self.buffs[self.hyperId] and not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() then
                        local targetStatBuffs = target.statBuffs
                        local effects = result.target and result.target.effects or {}
                        for i = 1, #targetStatBuffs do
                            if targetStatBuffs[i].value > 0 then
                                --this applies a debuff, not sure if we really want that or just cancel
                                effects[#effects + 1] = self:applyStatBuffToTarget({
                                    id=i,
                                    value=-1,
                                    turn=1
                                }, target)
                            end
                        end

                        if #effects == 0 then
                            effects = nil
                        end
                        result.target.effects = effects
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Heroic',
            description='Successful attacks will negate any stat buffs the target enemy has\n\nThose blessed as hero have the power to overcome anything',
            hyperId=10,
            icon=58
        }
    }, {
        name='Opal',
        rating=2,
        skills={ 2, 68, 88, 171, 197, 230 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_011_01',
                face='Face_FH_011_01',
                character='Character_FH_011_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_011_02',
                face='Face_FH_011_01',
                character='Character_FH_011_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_011_03',
                face='Face_FH_011_01',
                character='Character_FH_011_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_011_04',
                face='Face_FH_011_01',
                character='Character_FH_011_01',
                cost=400
            }, {
                name='Recolour D', 
                picture='Battler_FH_011_05',
                face='Face_FH_011_01',
                character='Character_FH_011_01',
                cost=400
            }
        },
        stats={ 190, 140, 165, 180, 200, 190, 160, 150 },
        growth={ 4.3, 4.3, 3.85, 4.05, 4.25, 4.15, 3.95, 3.85 },
        recruit='This is ancient magic, you better not underestimate it.',
        profile='After an incantation gone wrong, Opal found herself transported into a future some thousand years ahead of her time. Though initally bewildered of this new era, she quickly adapted after realising the quality of magic has dropped significantly compared to her time. Armed with the now ancient gemstone magic, she is conflicted on what to do, whether to try return home or attempt to advance the state of magic to how it once was.',
        mode=1,
        elements={ 1, 1.25, 1, 0.75, 1, 0.75, 1, 1, 1, 0.75, 1.25 },
        unique={
            icon=57,
            name='Onyx',
            description='Recover 50% of magic damage recived as mp (before reduction)\n\nIncantation of onyx, consume light with absorbing black',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --actingBattler is enemy
                    if not actingBattler.isActor and not target:isDead() and skill:type() == 2 and result:isSuccessfulAttack() then
                        local value = result.target.damage.value
                        if self.buffs[self.hyperId] then
                            --need this to offset crystal
                            value = value * 10
                        end
                        local heal = math.floor(value * 0.5)
                        if heal > 0 then
                            self:gainMp(heal)

                            result.target.regenerate = {
                                mp=heal
                            }
                        end
                    end
                end,
                editDamageTarget=function(self, actingBattler, skill, target, value)
                    --actingBattler is enemy, skill is magical
                    if self.buffs[self.hyperId] and not actingBattler.isActor and skill:type() == 2 and value > 0 then
                        value = math.round(value * 0.1)
                    end

                    return value
                end
            }
        },
        hyper={
            --effect in unique
            name='Crystal',
            description='Damage received my magic attacks are reduced by 90%\n\nIncantation of crystal, shield yourself with transparent white',
            hyperId=10,
            icon=58
        }
    }, {
        name='Charlotte',
        rating=2,
        skills={ 1, 12, 13, 15, 18, 231 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_012_01',
                face='Face_FH_012_01',
                character='Character_FH_012_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_012_02',
                face='Face_FH_012_01',
                character='Character_FH_012_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_012_03',
                face='Face_FH_012_01',
                character='Character_FH_012_01',
                cost=400
            }
        },
        stats={ 210, 100, 200, 190, 160, 175, 170, 190 },
        growth={ 4.7, 3.65, 4.25, 4.15, 3.7, 3.85, 3.95, 4.05 },
        recruit='Don\'t worry, big sis is here to help.',
        profile='Leader of the military army, Charlotte takes pride in her group of samurai that protect their country. Having hand picked and personally trained each and everyone of her members, they all know her strict yet kind nature, some even consider her as their older sister. On the battlefield is a different story however, as everyone agrees she is more of a \'beast\'.',
        mode=5,
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25, 1, 1 },
        unique={
            icon=57,
            name='Ferocious',
            description='When an enemy is stunned, perform a basic slash attack on that enemy\n\nA warrior on a battlefield is where one can show their true nature',
            effects={
                postActionActingParty=function(self, actingBattler, skill, target, result, battleManager)
                    --target is enemy, not dead, result is stun
                    if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and result.target.damage.isStun then
                        local skillId = 1
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { target })
                    end
                end,
                canStun=function(self)
                    return self.hyper
                end
            }
        },
        hyper={
            --effect in unique
            name='Beast',
            description='All non resisted attacks can stun\n\nStrike with your beast-like strength',
            hyperId=10,
            icon=58
        }
    }, {
        name='Illia',
        rating=2,
        skills={ 3, 41, 111, 165, 200, 232 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_013_01',
                face='Face_FH_013_01',
                character='Character_FH_013_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_013_02',
                face='Face_FH_013_01',
                character='Character_FH_013_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_013_03',
                face='Face_FH_013_01',
                character='Character_FH_013_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_013_03',
                face='Face_FH_013_01',
                character='Character_FH_013_01',
                cost=400
            }
        },
        stats={ 200, 130, 185, 160, 185, 175, 165, 160 },
        growth={ 4.4, 4, 4.15, 3.95, 4.1, 4, 3.9, 3.8 },
        recruit='It matters not that I\'m the fairy princess, I\'m here because I have the skills to help.',
        profile='Daughter of the fairy king, fairy princess Illia, once a spoiled child, has grown to be independent, no longer relying on her parents\' status. With many skills up her arsenal, cooking, cleaning and even swordfighting, all of which were self taught, many admire her skill and strong will. However she credits her family\'s attendant for her change of heart after an incident involving the two of them.',
        mode=4,
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 1, 1 },
        unique={
            icon=57,
            name='Fairykind',
            description='Damage reduced by resist increased to 50%\n\nAll fairys have an innate connection to the elements',
            effects={
                --this is done in elements
            }
        },
        hyper={
            --buff has element bonus
            name='Attuned Elements', 
            description='Gain resist to all elements\n\nAffinity with all elements',
            hyperId=12,
            icon=58
        }
    }, {
        name='Frieda',
        rating=1,
        skills={ 2, 34, 167, 189, 201, 233 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_014_01',
                face='Face_FH_014_01',
                character='Character_FH_014_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_014_02',
                face='Face_FH_014_01',
                character='Character_FH_014_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_014_03',
                face='Face_FH_014_01',
                character='Character_FH_014_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_014_03',
                face='Face_FH_014_01',
                character='Character_FH_014_01',
                cost=400
            }
        },
        stats={ 195, 120, 165, 160, 140, 150, 155, 180 },
        growth={ 4.4, 3.4, 4, 3.7, 3.4, 3.5, 3.9, 4 },
        recruit='Here\'s your order, hope you enjoy.',
        profile='Frieda is an established business owner, single-handedly running a café on her own. As a family business, handed down to her by her father, she holds the cafe very dear to her heart as a reminder of the family she once had. She has extensive training in cooking as well as customer service, not hesitant to kick customers out if they are too rude.',
        mode=4,
        elements={ 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Customer Service',
            description='Increase base stats (excluding MHP, MMP) by 2% per enemy\n\nA good businessman thrives with more customers',
            effects={
                statsExtra=function(self, statId)
                    local extra = 1
                    if self.currentEnemies then
                        for i = 1, #self.currentEnemies do
                            if not self.currentEnemies[i]:isDead() then
                                extra = extra + 0.02
                            end
                        end
                    end

                    return extra
                end,
                skillTarget=function(self, skill)
                    if self.buffs[self.hyperId] and skill:type() == 3 then
                        return 8
                    end
                    return skill:target()
                end
            }
        },
        hyper={
            --effect is in unique
            name='Buffet',
            description='Support skills now target all allies (heal/buffs)\n\nDon\'t be shy, it\'s all you can eat',
            hyperId=10,
            icon=58
        }
    }, {
        name='Iris',
        rating=1,
        skills={ 1, 135, 12, 140, 165, 234 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_015_01',
                face='Face_FH_015_01',
                character='Character_FH_015_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_015_02',
                face='Face_FH_015_01',
                character='Character_FH_015_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_015_03',
                face='Face_FH_015_01',
                character='Character_FH_015_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_015_04',
                face='Face_FH_015_01',
                character='Character_FH_015_01',
                cost=400
            }, {
                name='Recolour D', 
                picture='Battler_FH_015_05',
                face='Face_FH_015_01',
                character='Character_FH_015_01',
                cost=400
            }
        },
        stats={ 210, 95, 175, 155, 140, 150, 150, 145 },
        growth={ 4.45, 3.4, 3.95, 3.85, 3.7, 3.75, 3.9, 3.7 },
        recruit='I fight to protect all that is dear to me.',
        profile='The eldest of three sisters, Iris took it upon herself to take care of her family and the ones she loved. Following the footsteps of her father, she serves the Royal Guard to maintain the prosperity of the land and to make sure her younger siblings don\'t fall into trouble.',
        mode=3,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        unique={
            icon=57,
            name='Knight\'s Armour',
            description='35% chance to reduce damage by 50%\n\nA knight always wears strong armour to protect themselves from harm',
            effects={
                editDamageTarget=function(self, actingBattler, skill, target, value)
                    --actingBattler is enemy
                    if not actingBattler.isActor and value > 0 then
                        local chance = self.buffs[self.hyperId] and 1 or 0.35
                        if math.random() < chance then
                            value = math.round(value * 0.5)
                        end
                    end

                    return value
                end
            }
        },
        hyper={
            --effect is in unique
            name='Knight\'s Vow',
            description='Knight\'s Armour chance increase to 100%\n\nA knight always honours their vow to protect',
            hyperId=10,
            icon=58
        }
    }, {
        name='Lilith',
        rating=3,
        skills={ 2, 154, 158, 159, 209, 235 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_016_01',
                face='Face_FH_016_01',
                character='Character_FH_016_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_016_02',
                face='Face_FH_016_01',
                character='Character_FH_016_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_016_03',
                face='Face_FH_016_01',
                character='Character_FH_016_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_016_04',
                face='Face_FH_016_01',
                character='Character_FH_016_01',
                cost=400
            }
        },
        stats={ 210, 150, 175, 190, 210, 200, 180, 160 },
        growth={ 4.9, 4.2, 4.1, 4.2, 4.6, 4.4, 4.2, 4 },
        recruit='I expect some good meals if I\'m joining.',
        profile='After the defeat of the demon lord centuries ago, the world has slowly rebuilt the peace it had once lived in. However, danger is not inexistent as Lilith threathens the world as her ancestor once did. Destroying countries, starting wars and defeating heroes, the threat she displays are perhaps greater than what they were before and many fear what she may do next. In truth her domination is merely for appetite, with conflict feeding her gluttony.',
        mode=5,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        unique={
            icon=57,
            name='Demon Lord',
            description='Increase damage by 30% to enemies that have debuffs\n\nJust the fear of facing a demon lord will weaken your spirits',
            effects={
                editDamageActing=function(self, actingBattler, skill, target, value)
                    --target is enemy, has any debuff
                    if not target.isActor and value > 0 then
                        local hasDebuff = false
                        for i = 1, #target.statBuffs do
                            if target.statBuffs[i].value < 0 then
                                hasDebuff = true
                                break
                            end
                        end

                        if not hasDebuff then
                            for k, v in pairs(target.debuffs) do
                                hasDebuff = true
                                break
                            end
                        end

                        if hasDebuff then
                            value = math.round(value * 1.3)
                        end
                    end

                    return value
                end,
                startInput=function(self, battleManager)
                    if self.buffs[self.hyperId] then
                        local magicStatBuff = self.statBuffs[5]
                        --if affected by debuff then remove instantly
                        if magicStatBuff.value < 0 then
                            self:removeEffectIcon(CONSTANTS.statBuffsIcons(5, magicStatBuff.value).icon)
                            magicStatBuff.value = 0
                            magicStatBuff.turn = 1
                        end

                        --only apply if not already affected
                        if magicStatBuff.value == 0 then
                            --this will grant tp, and it expires every turn
                            self:applyStatBuffToTarget({
                                id=5,
                                value=1,
                                turn=1
                            }, self)
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Demonic Transformation',
            description='Every turn is guaranteed to have a MAT buff\n\nThis isn\'t even my final form',
            hyperId=10,
            icon=58
        }
    }, {
        name='Cerene',
        rating=1,
        skills={ 1, 5, 18, 19, 186, 231 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_017_01',
                face='Face_FH_017_01',
                character='Character_FH_017_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_017_02',
                face='Face_FH_017_01',
                character='Character_FH_017_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_017_03',
                face='Face_FH_017_01',
                character='Character_FH_017_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_017_04',
                face='Face_FH_017_01',
                character='Character_FH_017_01',
                cost=400
            }
        },
        stats={ 180, 105, 160, 150, 130, 140, 165, 180 },
        growth={ 4.3, 3.5, 4, 3.7, 3.5, 3.6, 4, 3.9 },
        recruit='I\'ll help as well.',
        profile='The younger sister of the famed leader of the military army, Cerene dreams of becoming as strong as her sister. Despite everyone\'s warning of how dangerous it is for a girl her age to take part in battle, she has secretly trained in dual wielding to compensate for her lack of strength. Equipped with two light swords, custom made by a certain blacksmith, she continues to hone her skills to follow the footsteps of her sister.',
        mode=2,
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25, 1, 1 },
        unique={
            icon=57,
            name='Double Strike',
            description='20% chance for attacks to repeat itself\n\nAn attempt to strike with both swords',
            effects={
                completeActionActingSelf=function(self, actingBattler, skill, targets, battleManager)
                    --targets is enemy
                    if #targets > 0 and not targets[1].isActor then
                        local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                        if math.random() < chance then
                            battleManager:addFollowup(self, skill, targets)
                        end
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Hard Work',
            description='Double Strike chance increase to 60%\n\nHard work always pays off',
            hyperId=10,
            icon=58
        }
    }, {
        name='Nova',
        rating=1,
        skills={ 2, 61, 87, 112, 181, 236 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_018_01',
                face='Face_FH_018_01',
                character='Character_FH_018_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_018_02',
                face='Face_FH_018_01',
                character='Character_FH_018_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_018_03',
                face='Face_FH_018_01',
                character='Character_FH_018_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_018_04',
                face='Face_FH_018_01',
                character='Character_FH_018_01',
                cost=400
            }
        },
        stats={ 160, 130, 140, 150, 175, 160, 150, 145 },
        growth={ 4.1, 3.8, 3.6, 3.65, 4.1, 3.7, 3.9, 3.7 },
        recruit='I\'ll... I\'ll try my best!',
        profile='A witch in training, Nova always tries her hardest in every spell she casts, though the results are often quite mixed. Despite this, her master believes that she will grow to become an outstanding witch. Nova\'s current quest is to find her master, who has gone missing after a sudden call-to-arms. Her travels are often full of setbacks and misadventure, but that won\'t stop her from continuing her journey.',
        mode=2,
        elements={ 1.25, 1.25, 1.25, 0.75, 1, 0.75, 1, 0.75, 1, 0.75, 1 },
        unique={
            icon=57,
            name='Witch Apprentice',
            description='Non-ultimate damage skills have a 20% chance to target all enemies\n\nA true witch has complete mastery over her spells, unfortunately you are not one yet',
            effects={
                editTargetsSelf=function(self, actingBattler, skill, targets, battleManager)
                    --non-ultimate skills, use mp to identify
                    if skill:cost() > 0 and skill:target() == 2 then
                        local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                        if math.random() < chance then
                            --target all enemies
                            return battleManager:aliveMembers(false)
                        end
                    end
                    return targets
                end
            }
        },
        hyper={
            --effect is in unique
            name='Pure Blood',
            description='Witch Apprentice chance increase to 60%\n\nThose of pure blood are able to cast the most dangerous of spells',
            hyperId=10,
            icon=58
        }
    }, {
        name='Liana',
        rating=2,
        skills={ 3, 95, 45, 98, 191, 237 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_019_01',
                face='Face_FH_019_01',
                character='Character_FH_019_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_019_02',
                face='Face_FH_019_01',
                character='Character_FH_019_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_019_03',
                face='Face_FH_019_01',
                character='Character_FH_019_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_019_04',
                face='Face_FH_019_01',
                character='Character_FH_019_01',
                cost=400
            }
        },
        stats={ 200, 105, 190, 180, 160, 175, 190, 185 },
        growth={ 4.5, 3.8, 4.2, 4.05, 3.8, 3.9, 4.3, 4.1 },
        recruit='For a fight like this, I\'d much prefer my combat suit, but regardless I\'ll do everything in my power to help.',
        profile='Daughter of Royal guard\'s captain, Liana\'s skill in battle is attributed to both blood and training. Having participated in many battles and mediated many conflicts, it is no surprise many believe her to be as good as her father. Her preferred outfit in battle is a thin, yet tough full body latex suit, yet is more often seen wearing her dress because of her princess duties. While everyone acknowledges her strength in either suit, she much perfers her combat suit as she claims the large frilled dress often gets in the way.',
        mode=1,
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Princess\' Duties',
            description='While in reserve, MHP/MMP regeneration is still received with 50% effect\n\nA princess always have matters to attend to, even if off-duty',
            effects={
                regenerate=function(self, inParty)
                    local regenerate

                    local multiplier = inParty and 1 or 0.5
                    if self.buffs[self.hyperId] then
                        multiplier = multiplier * 2
                    end

                    --hp
                    local hpRegen = self:hpRegen()
                    local hpGain = math.round(self:maxHp() * hpRegen * multiplier)
                    if hpGain > 0 then
                        regenerate = regenerate or {}
                        self:gainHp(hpGain)
                
                        regenerate.hp = hpGain
                    end

                    local mpRegen = self:mpRegen()
                    local mpGain = math.round(self:maxMp() * mpRegen * multiplier)
                    if mpGain > 0 then
                        regenerate = regenerate or {}
                        self:gainMp(mpGain)
            
                        regenerate.mp = mpGain
                    end
                
                    if inParty and regenerate then
                        return { regenerate=regenerate }
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='King\'s Heir',
            description='Doubles MHP/MMP regeneration\n\nYou must know the responsibilities of a king',
            hyperId=10,
            icon=58
        }
    }, {
        name='Viera',
        rating=1,
        skills={ 2, 110, 28, 113, 194, 238 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_020_01',
                face='Face_FH_020_01',
                character='Character_FH_020_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_020_02',
                face='Face_FH_020_01',
                character='Character_FH_020_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_020_03',
                face='Face_FH_020_01',
                character='Character_FH_020_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_020_04',
                face='Face_FH_020_01',
                character='Character_FH_020_01',
                cost=400
            }, {
                name='Recolour D', 
                picture='Battler_FH_020_05',
                face='Face_FH_020_01',
                character='Character_FH_020_01',
                cost=400
            }
        },
        stats={ 190, 95, 185, 160, 130, 150, 150, 160 },
        growth={ 4.4, 3.3, 4.05, 3.9, 3.3, 3.7, 3.95, 3.7 },
        recruit='Hey, you\'re pretty strong. We should have a match sometime. Of course after we\'re done with this.',
        profile='Viera comes from a race of beastfolk that are armed with big ears and tough, yet lean muscles, perfect for hand-to-hand combat. However, after many fights Viera isn\'t fond of the bruises that come to her fists and thus wears paw-shaped gloves. These gloves not only provide protection, but adds that extra bit of weight to really pack a punch.',
        mode=2,
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        unique={
            icon=57,
            name='Mega Punch',
            description='Basic attack now targets all enemies\n\nAttack with so much force nearby enemies can feel its impact',
            effects={
                skillTarget=function(self, skill)
                    local target = skill:target()
                    if skill.data.id == 2 or (self.buffs[self.hyperId] and target ~= 9) then
                        return 6
                    end
                    return target
                end
            }
        },
        hyper={
            --effect is in unique
            name='Deep Impact',
            description='All attack skills now target all enemies\n\nStrike with as much force as a comet',
            hyperId=10,
            icon=58
        }
    }, {
        name='Puck',
        rating=1,
        skills={ 2, 111, 120, 165, 204, 232 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_021_01',
                face='Face_FH_021_01',
                character='Character_FH_021_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_021_02',
                face='Face_FH_021_01',
                character='Character_FH_021_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_021_03',
                face='Face_FH_021_01',
                character='Character_FH_021_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_021_04',
                face='Face_FH_021_01',
                character='Character_FH_021_01',
                cost=400
            }
        },
        stats={ 180, 125, 140, 145, 180, 160, 150, 135 },
        growth={ 4.1, 3.6, 3.7, 3.8, 4.1, 4, 3.7, 3.5 },
        recruit='For the betterment of fairy kind, I am here to serve you.',
        profile='As the attendant of the fairy king, Puck acts as the messenger between the common fairyfolk and royalty. However not everyone sees the fairy king in good light, so she is often tasked with conflict resolution, much to her dismay. Nevertheless, she has great faith in the fairy king and his future ideals.',
        mode=4,
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.5, 0.5, 1, 1 },
        unique={
            icon=57,
            name='Fairykind',
            description='Damage reduced by resist increased to 50%\n\nAll fairys have an innate connection to the elements',
            effects={
                --this is done in elements
            }
        },
        hyper={
            --buff has element bonus
            name='Attuned Elements', 
            description='Gain resist to all elements\n\nAffinity with all elements',
            hyperId=12,
            icon=58
        }
    }, {
        name='Azalea',
        rating=1,
        skills={ 2, 77, 86, 200, 212, 239 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_022_01',
                face='Face_FH_022_01',
                character='Character_FH_022_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_022_02',
                face='Face_FH_022_01',
                character='Character_FH_022_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_022_03',
                face='Face_FH_022_01',
                character='Character_FH_022_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_022_04',
                face='Face_FH_022_01',
                character='Character_FH_022_01',
                cost=400
            }, {
                name='Recolour D', 
                picture='Battler_FH_022_05',
                face='Face_FH_022_01',
                character='Character_FH_022_01',
                cost=400
            }
        },
        stats={ 175, 125, 140, 145, 170, 155, 155, 140 },
        growth={ 4.2, 3.5, 3.75, 3.8, 4.05, 3.9, 3.9, 3.7 },
        recruit='I\'ll put my skills to use. It doesn\'t matter how hard your task is, I\'ll put in my hardest.',
        profile='The middle of three sisters, Azalea found herself with no purpose compared to her sisters, one who\'s strong and the other adventurous. On a pilgrimage to find her worth, she stumbled across a shrine and lent her aid in a ritual to seal an evil god. After discussing with the shrine maidens what had transpired, she realised worth is only aquired if you put effort in. Since then, she has trained alongisde the shrine maidens and assists in their rituals, not to compare herself with her sisters, but to put her skills to use.',
        mode=1,
        elements={ 1, 1, 1, 1.25, 0.75, 0.75, 1.25, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Spirit Circle',
            description='All enemies begin the battle with a 2 stage ATK/MAT debuff that lasts 3 turns\n\nMark the battlefield with a spirit circle that makes enemies less powerful',
            effects={
                startWave=function(self, battleManager)
                    local debuffs = {
                        {
                            id=3,
                            value=-2,
                            turn=3
                        },
                        {
                            id=5,
                            value=-2,
                            turn=3
                        }
                    }

                    for i = 1, #debuffs do
                        --no logs??
                        for j = 1, #battleManager.currentEnemies do
                            self:applyStatBuffToTarget(debuffs[i], battleManager.currentEnemies[j])
                        end
                    end
                end,
                editStatBuffSelf=function(self, value)
                    if self.buffs[self.hyperId] then
                        value = value * 2
                    end
                    return value
                end
            }
        },
        hyper={
            --effect in unique
            name='Talisman',
            description='All stat buffs and debuffs applied are now doubled\n\nActivate a charm that amplifies one\'s spiritual prowess',
            hyperId=10,
            icon=58
        }
    }, {
        name='Miko',
        rating=1,
        skills={ 2, 137, 141, 165, 205, 240 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_023_01',
                face='Face_FH_023_01',
                character='Character_FH_023_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_023_02',
                face='Face_FH_023_01',
                character='Character_FH_023_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_023_03',
                face='Face_FH_023_01',
                character='Character_FH_023_01',
                cost=400
            }
        },
        stats={ 195, 125, 160, 170, 175, 185, 140, 130 },
        growth={ 4.2, 3.7, 3.8, 3.85, 3.95, 4.1, 3.7, 3.6 },
        recruit='This goes against order, of course I have to help.',
        profile='Miko, one of the shrine maidens that maintain the Shinto shrine. Her daily life involes domestic work such as cleaning, cooking, as well as performing rituals to appease the spirits and on occasion, the gods. The duties of a shrine maiden are of utmost importance, for without them, the conflicts between displeased gods would lay waste to the land. Thus Miko\'s actions are always to perfection and will make noise if things aren\'t up to her standard, much to the dismay of some.',
        mode=4,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        unique={
            icon=57,
            name='Weakening Circle',
            description='All enemies begin the battle with a 2 stage DEF/RES debuff that lasts 3 turns\n\nMark the battlefield with a weakening circle that makes enemies defenceless',
            effects={
                startWave=function(self, battleManager)
                    local debuffs = {
                        {
                            id=4,
                            value=-2,
                            turn=3
                        },
                        {
                            id=6,
                            value=-2,
                            turn=3
                        }
                    }

                    for i = 1, #debuffs do
                        --no logs??
                        for j = 1, #battleManager.currentEnemies do
                            self:applyStatBuffToTarget(debuffs[i], battleManager.currentEnemies[j])
                        end
                    end
                end,
                startInput=function(self, battleManager)
                    if self.buffs[self.hyperId] then
                        local aliveActors = battleManager:aliveMembers(true)
                        for i = 1, #aliveActors do
                            local gainHp = math.round(aliveActors[i]:maxHp() * 0.15)
                            aliveActors[i]:gainHp(gainHp)
                        end

                        --[[ OLD
                        Alling Circle - Every turn apply a ATK or MAT debuff to every enemy (depending on which is higher) that lasts 1 turn\n\nPerform a ritual that incapacitates an enemy\'s ability to attack

                        local aliveEnemies = battleManager:aliveMembers(false)
                        for i = 1, #aliveEnemies do
                            local enemy = aliveEnemies[i]
                            local debuff = {
                                id=(enemy:attack() >= enemy:magic() and 3 or 5),
                                value=-1,
                                turn=1
                            }
                            self:applyStatBuffToTarget(debuff, enemy)
                        end
                        ]]
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Healing Circle',
            description='All allies recover 15% of their max HP at the start of every turn\n\nInscribe a circle which rejuvenates your allies',
            hyperId=10,
            icon=58
        }
    }, {
        name='Nu',
        rating=2,
        skills={ 1, 12, 16, 187, 193, 241 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_024_01',
                face='Face_FH_024_01',
                character='Character_FH_024_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_024_02',
                face='Face_FH_024_01',
                character='Character_FH_024_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_024_03',
                face='Face_FH_024_01',
                character='Character_FH_024_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_024_04',
                face='Face_FH_024_01',
                character='Character_FH_024_01',
                cost=400
            }
        },
        stats={ 205, 110, 190, 185, 160, 180, 180, 175 },
        growth={ 4.7, 3.7, 4.25, 4.1, 3.7, 3.95, 4, 3.9 },
        recruit='I am trained only for victory. With me in your guild, I\'ll guarantee victory.',
        profile='The 13th trial of the super soldier experiment, codename Nu, was the only successful subject before research was detained due to inhumane activity. A girl, so young she never attended any kind of schooling, was injected with super soldier serum, gaining heightened abilities, and trained solely for victory. Despite being free from the corrupt lab, Nu was unable to return to her previous society due to her new abilities and training ingrained into her. Thus she decided to walk away from her past life and do the only thing she knows how to, attain victory.',
        mode=3,
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25, 1, 1 },
        unique={
            icon=57,
            name='Counter',
            description='When attacked perform a basic slash attack to the attacker\n\nA super soldier doesn\'t take a punch without fighting back',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --self isnt dead, acting is enemy, successful damage
                    if not self:isDead() and not actingBattler.isActor and result:isSuccessfulAttack() then
                        local skillId = self.buffs[self.hyperId] and 279 or 278
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { actingBattler })
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Retaliate',
            description='Counter also applies a DEF and RES debuff that lasts 2 turns\n\nIt\'s not enough to simply counter if you seek victory',
            hyperId=10,
            icon=58
        }
    }, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, {
        name='Athena',
        rating=1,
        skills={ 1, 5, 18, 187, 193, 242 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_041_01',
                face='Face_FH_041_01',
                character='Character_FH_041_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_041_02',
                face='Face_FH_041_01',
                character='Character_FH_041_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_041_03',
                face='Face_FH_041_01',
                character='Character_FH_041_03',
                cost=1000
            }
        },
        stats={ 180, 100, 175, 165, 140, 150, 145, 140 },
        growth={ 4.4, 3.6, 4, 3.9, 3.7, 3.8, 3.7, 3.7 },
        recruit='Don\'t worry, there\'s nothing to be afraid of.',
        profile='Athena, a fearless warrior who has faced dangers many are scared to even speak of. On a night to conquer the haunted cemetery, she came across an evil spirit. With no fear, she quickly challenged the spectre but the spirit had no intention of fighting and instead attempted to take over her body. Fortunately the possession was a failure and the spirit driven back to the otherworldy plane, however it was not without consequence as Athena was left partly cursed. Though she cares naught for the remnants of evil spirit that rest within her, as nothing can scare her.',
        mode=1,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='No Fear',
            description='Cannot be affected by stat-reducing debuffs\n\nThere is nothing that can hinder you from doing what you want',
            effects={
                editStatBuffTarget=function(self, value)
                    if value < 0 then
                        return 0
                    end
                    return value
                end,
                statBuffRate=function(self, i)
                    local statBuffValue = self.statBuffs[i].value
                    if statBuffValue == 0 then
                        return 1
                    elseif statBuffValue == 1 then
                        return self.buffs[self.hyperId] and 1.2 or 1.1
                    elseif statBuffValue == -1 then
                        return 0.9
                    elseif statBuffValue == 2 then
                        return self.buffs[self.hyperId] and 1.3 or 1.15
                    elseif statBuffValue == -2 then
                        return 0.85
                    else
                        return 1
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Courageous',
            description='Increase from stat buffs are doubled\n\nThose confident achieve more with encouragement',
            hyperId=10,
            icon=58
        }
    }, {
        name='Athena (Ghost)',
        rating=3,
        skills={ 1, 16, 18, 187, 195, 243 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_042_01',
                face='Face_FH_042_01',
                character='Character_FH_042_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_042_02',
                face='Face_FH_042_01',
                character='Character_FH_042_01',
                cost=400
            }
        },
        stats={ 210, 130, 210, 205, 180, 200, 170, 180 },
        growth={ 5.1, 4, 4.3, 4.2, 4, 4.2, 4.2, 4.3 },
        recruit='Ghosts? You don\'t need to be afraid. They\'re suprisingly helpful.',
        profile='Instead of fearing the evil spirit inside her, Athena has embraced the circumstances and has even managed to control the spirit to do her bidding. She wields her new power in confidence, haunting those that get in her way. Even if the spirit attempts to possess her again, she has no worries and predicts the result will end the same as before.',
        mode=3,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75 },
        unique={
            icon=57,
            name='Haunt',
            description='When attacked 35% chance to apply to the attacker a ATK or MAT debuff (depending on attack type) that lasts 3 turns\n\nDon\'t think a ghost can\'t do anything to you',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --self isnt dead, acting is enemy, successful damage
                    if not self:isDead() and not actingBattler.isActor and result:isSuccessfulAttack() then
                        if math.random() < 0.35 then
                            local skillId
                            if skill:type() == 2 then
                                skillId = self.buffs[self.hyperId] and 283 or 281
                            else
                                skillId = self.buffs[self.hyperId] and 282 or 280
                            end
                            battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { actingBattler })
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Curse',
            description='Haunt debuff applied is now stage 2\n\nGhosts are much more capable than just scaring people',
            hyperId=10,
            icon=58
        }
    }, {
        name='Shino',
        rating=1,
        skills={ 1, 42, 9, 32, 183, 244 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_043_01',
                face='Face_FH_043_01',
                character='Character_FH_043_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_043_02',
                face='Face_FH_043_01',
                character='Character_FH_043_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_043_03',
                face='Face_FH_043_01',
                character='Character_FH_043_03',
                cost=1000
            }
        },
        stats={ 180, 100, 170, 150, 140, 145, 185, 140 },
        growth={ 4.6, 3.5, 3.95, 3.75, 3.3, 3.75, 4, 4 },
        recruit='I accept your mission.',
        profile='An expert in reconnaissance and infiltration, Shino is one who every ninja aspires to be like. Armed with a surplus of weapons, quick thinking and dexterity to compliment, she is able to complete any mission without difficulty. The reason why she doesn\'t aim for Khage, the number one ninja, is because she is unable to perform any ninjutsu. However, that doesn\'t stop her from striving to become a great ninja.',
        mode=2,
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1.25, 1, 1.25, 1, 1, 1 },
        unique={
            icon=57,
            name='Weapons Master',
            description='After a successful attack, gain a buff that increases damage for that attack type by 30% that lasts 2 turns\n\nAdept with all weapons and know when to use them',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target enemy and successful
                    if not target.isActor and result:isSuccessfulAttack() then
                        if not result.acting then
                            result.acting = {}
                        end

                        if not result.acting.buffs then
                            result.acting.buffs = {}
                        end

                        local skillElement = skill:element()
                        if skillElement == 1 or skillElement == 2 or skillElement == 3 then
                            local buffId = 15 + skillElement
                            result.acting.buffs[#result.acting.buffs + 1] = self:applyBuffToTarget({
                                id=buffId, turn=2
                            }, self)
                        end

                    end
                end,
                editDamageActing=function(self, actingBattler, skill, target, value)
                    if value > 0 then
                        local checkBuffs
                        if self.buffs[self.hyperId] then
                            checkBuffs = { 16, 17, 18 }
                        else
                            local skillElement = skill:element()
                            if skillElement == 1 or skillElement == 2 or skillElement == 3 then
                                checkBuffs = { 15 + skillElement }
                            end
                        end

                        if checkBuffs then
                            for i = 1, #checkBuffs do
                                if self.buffs[checkBuffs[i]] then
                                    value = math.round(value * 1.3)
                                    break
                                end
                            end
                        end
                    end
                    return value
                end
            }
        },
        hyper={
            --effect is in unique
            name='Triwield',
            description='Damage increase from Weapons Master applies to all attack types\n\nWielding three weapons is trival for an expert on weapons',
            hyperId=10,
            icon=58
        }
    }, {
        name='Lea',
        rating=2,
        skills={ 1, 5, 62, 63, 196, 245 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_044_01',
                face='Face_FH_044_01',
                character='Character_FH_044_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_044_02',
                face='Face_FH_044_01',
                character='Character_FH_044_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_044_03',
                face='Face_FH_044_01',
                character='Character_FH_044_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_044_04',
                face='Face_FH_044_01',
                character='Character_FH_044_04',
                cost=1000
            }
        },
        stats={ 190, 120, 185, 180, 160, 180, 160, 170 },
        growth={ 4.5, 3.9, 4.2, 4.1, 3.7, 4, 3.9, 4 },
        recruit='This will be tough, but I\'ll lay my life for this.',
        profile='Lea possesses the leopard anima, known to be swift and fierce. As one of the strongest in the anima clan, she serves the chief as his bodyguard and assists in maintaining order within the clan. She may act as a ferocious leopard, but deep down she is kind, thinking of others before herself.',
        mode=3,
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Bodyguard',
            description='If an ally has less than or equal to 30% hp, there is 35% chance to take their damage\n\nProtect all that are in need of assistance',
            effects={
                editTargetsParty=function(self, actingBattler, skill, targets, battleManager)
                    for i = 1, #targets do
                        --not self and low hp
                        if targets[i] ~= self and targets[i]:hpRate() <= 0.3 then
                            local chance = self.buffs[self.hyperId] and 1 or 0.35
                            if math.random() < chance then
                                targets[i] = self
                            end
                        end
                    end

                    return targets
                end
            }
        },
        hyper={
            --effect in unique, i also want damage reduction but dont know how to do it
            name='Protector',
            description='Bodyguard chance increase to 100%\n\nLay your life on the line for your allies',
            hyperId=10,
            icon=58
        }
    }, {
        name='Mina',
        rating=1,
        skills={ 1, 60, 10, 66, 199, 246 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_045_01',
                face='Face_FH_045_01',
                character='Character_FH_045_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_045_02',
                face='Face_FH_045_01',
                character='Character_FH_045_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_045_03',
                face='Face_FH_045_01',
                character='Character_FH_045_03',
                cost=1000
            }
        },
        stats={ 185, 105, 180, 155, 140, 150, 155, 160 },
        growth={ 4.2, 3.4, 4, 3.85, 3.5, 3.8, 3.9, 3.7 },
        recruit='After this, I\'m sure to have a great tale to tell. I\'m already excited.',
        profile='The travelling swordsman, Mina, is often seen frequenting bars and taverns to speak of the adventurers she\'s had. Though the stories she speaks are so improbable, her listeners enjoy those tales as fiction. This matters naught to Mina, as she enjoys speaking of such tales purely for people to enjoy, and thus continues to travel in search for more adventures to tell.',
        mode=4,
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Storyteller',
            description='On the 1st turn and every 5th turn thereafter grant all allies a random stat buff that lasts 3 turns\n\nA good storyteller knows how to invoke any emotion from their audience',
            effects={
                startInput=function(self, battleManager)
                    local turnMod = self.buffs[self.hyperId] and 1 or 5
                    if battleManager.turn == 1 or (battleManager.turn % turnMod == 0) then
                        local buff = {
                            id=math.floor(math.random() * 6) + 3,
                            value=1,
                            turn=3
                        }
                        local aliveActors = battleManager:aliveMembers(true)
                        for i = 1, #aliveActors do
                            self:applyStatBuffToTarget(buff, aliveActors[i])
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Engaging Story',
            description='Storyteller now applies every turn\n\nReciting such a story will keep everyone invested',
            hyperId=10,
            icon=58
        }
    }, {
        name='Robin',
        rating=1,
        skills={ 3, 50, 123, 168, 190, 247 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_046_01',
                face='Face_FH_046_01',
                character='Character_FH_046_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_046_02',
                face='Face_FH_046_01',
                character='Character_FH_046_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_046_03',
                face='Face_FH_046_01',
                character='Character_FH_046_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_046_04',
                face='Face_FH_046_01',
                character='Character_FH_046_04',
                cost=1000
            }
        },
        stats={ 165, 115, 170, 150, 170, 140, 145, 160 },
        growth={ 4.1, 3.7, 3.9, 3.7, 3.9, 3.5, 3.95, 3.65 },
        recruit='This looks like it\'ll be trouble, let me help.',
        profile='A member of the anima clan, Robin possesses the owl anima. With her owl\'s expertise in wind magic and the clan\'s customary training with the sword, Robin is proficient in both physical and magical attacks. Trustworthy and reliable, if anyone has any problems, Robin is the first person they seek.',
        mode=4,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75, 1, 1 },
        unique={
            icon=57,
            name='Owl Wind',
            description='All allies begin every battle with a 2 stage AGI buff that last 3 turns\n\nThe owl anima can reverse the winds to blow in your favour',
            effects={
                startWave=function(self, battleManager)
                    local aliveActors = battleManager:aliveMembers(true)
                    local buff = {
                        id=7,
                        value=2,
                        turn=3
                    }
                    for i = 1, #aliveActors do
                        self:applyStatBuffToTarget(buff, aliveActors[i])
                    end
                end,
                startInput=function(self, battleManager)
                    if self.buffs[self.hyperId] then
                        local aliveActors = battleManager:aliveMembers(true)
                        local owlGustBuffId = 19
                        for i = 1, #aliveActors do
                            self:applyBuffToTarget({
                                id=owlGustBuffId, turn=1
                            }, aliveActors[i])
                        end
                    end
                end
            }
        },
        hyper={
            --Effect in unique
            name='Owl Gust',
            description='Every turn apply a buff to all allies which increases speed by 100\n\nThe owl anima turns its winds into gust',
            hyperId=10,
            icon=58
        }
    }, {
        name='Raya',
        rating=2,
        skills={ 1, 5, 11, 13, 180, 248 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_047_01',
                face='Face_FH_047_01',
                character='Character_FH_047_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_047_02',
                face='Face_FH_047_01',
                character='Character_FH_047_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_047_03',
                face='Face_FH_047_01',
                character='Character_FH_047_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_047_04',
                face='Face_FH_047_01',
                character='Character_FH_047_04',
                cost=1000
            }
        },
        stats={ 200, 120, 200, 170, 155, 160, 170, 190 },
        growth={ 4.5, 3.8, 4.2, 3.9, 4, 3.7, 4.1, 4.2 },
        recruit='Let me join, I need to grow stronger.',
        profile='The only child of the chief of the anima clan, everyone saw Raya as a suitable successor to continue the efforts of clan. However Raya deems herself a failure as she is unable to control her wolf anima, the most dangerous ever known to have existed. Despite the strong encouragement from her clan, she refuses their aid and has set off on a journey on her own, to tame her wolf and prove to herself she is capable of leading her clan as the next generation.',
        mode=2,
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 1 },
        unique={
            icon=57,
            name='Lone Warrior',
            description='Increase ATK by 3% for each empty or dead party slot\n\nSometimes more allies hinders a person\'s progress, these kinds of people are lone warriors',
            effects={
                statsExtra=function(self, statId)
                    local extra = 1
                    if statId > 2 and (statId == 3 or self.hyper) then
                        if self.party then
                            --always count 5 to include empty slots
                            for i = 1, 5 do
                                if not self.party[i] or self.party[i]:isDead() then
                                    extra = extra + 0.03
                                end
                            end
                        end
                    end

                    return extra
                end
            }
        },
        hyper={
            --effect in unique
            name='Solitary Soldier',
            description='Lone Warrior stat increase now applies to all basic stats (excluding MHP, MMP)\n\nAlthough solo, they can still exhibit outstanding growth',
            hyperId=10,
            icon=58
        }
    }, {
        name='Raya (Wolf)',
        rating=3,
        skills={ 1, 151, 155, 16, 180, 249 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_048_01',
                face='Face_FH_048_01',
                character='Character_FH_048_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_048_02',
                face='Face_FH_048_01',
                character='Character_FH_048_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_048_03',
                face='Face_FH_048_01',
                character='Character_FH_048_01',
                cost=400
            }
        },
        stats={ 205, 140, 215, 190, 180, 180, 175, 200 },
        growth={ 4.9, 4, 4.5, 4.3, 4, 4.1, 4.15, 4.35 },
        recruit='This power is dangerous, it\'ll definitely help... If I can control it.',
        profile='If the situation calls for it, Raya will not hesitate to call forth her wolf anima, though the wolf\'s power makes it difficult to control. Raya has continued to trained herself to control such ferocious strength, however it does not fully obey her command just yet. Nevertheless she continues to strive for mastery of her power, so that she can return to her clan proud.',
        mode=5,
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        unique={
            icon=57,
            name='Untammed Wolf',
            description='Successful attacks have a 20% chance to perform a basic slash attack which applies a DEF debuff that lasts 3 turns\n\nThe wolf anima has yet to be controlled',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target is enemy, not dead, successful hit
                    if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() then
                        local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                        if math.random() < chance then
                            local skillId = 284
                            battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { target })
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Restrained Wolf',
            description='Untammed Wolf chance increase to 60%\n\nYou may be able to keep the wolf under check, but still be wary of its rampage',
            hyperId=10,
            icon=58
        }
    }, {
        name='Tipha',
        rating=1,
        skills={ 3, 46, 51, 188, 206, 250 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_049_01',
                face='Face_FH_049_01',
                character='Character_FH_049_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_049_02',
                face='Face_FH_049_01',
                character='Character_FH_049_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_049_03',
                face='Face_FH_049_01',
                character='Character_FH_049_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_049_04',
                face='Face_FH_049_01',
                character='Character_FH_049_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_049_05',
                face='Face_FH_049_01',
                character='Character_FH_049_05',
                cost=1000
            }
        },
        stats={ 180, 100, 165, 160, 145, 150, 160, 180 },
        growth={ 4.15, 3.5, 4, 3.6, 3.5, 3.6, 3.9, 4.05 },
        recruit='Disaster is approaching, we must stop it.',
        profile='The tengu are a race of mythical hybrids that have historically been considered pests akin to birds of prey. However folktale of their dangerous nature are well past their time and Tipha is a prime example. Working day and night, travelling near and far, she makes sure the world is in order and solves any disaster, in hopes to replace those old stories.',
        mode=3,
        elements={ 1, 1, 0.75, 1, 1, 1, 1, 1.25, 1, 1, 1 },
        unique={
            icon=57,
            name='Blade Shield',
            description='20% chance to reduce damage to 0\n\nThe tengu blades that surround you form a barrier that can shield any attack',
            effects={
                editDamageTarget=function(self, actingBattler, skill, target, value)
                    --actingBattler is enemy
                    if not actingBattler.isActor then
                        local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                        if math.random() < chance then
                            return 0
                        end
                    end

                    return value
                end,
                --cheat for counter blade
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --self isnt dead, acting is enemy, successful damage
                    if not self:isDead() and not actingBattler.isActor and result:isSuccessfulAttack() then
                        --check buffs applied by counter blade
                        local counterBuffId = 8
                        local skillId = 285
                        if self.buffs[counterBuffId] then
                            battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { actingBattler })
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Tengu Shield',
            description='Blade Shield chance increase to 60%\n\nConjure more tengu blades to shield yourself',
            hyperId=10,
            icon=58
        }
    }, {
        name='Tipha (Origin)',
        rating=2,
        skills={ 3, 121, 124, 53, 206, 251 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_050_01',
                face='Face_FH_050_01',
                character='Character_FH_050_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_050_02',
                face='Face_FH_050_01',
                character='Character_FH_050_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_050_03',
                face='Face_FH_050_01',
                character='Character_FH_050_01',
                cost=400
            }
        },
        stats={ 190, 120, 180, 165, 170, 170, 170, 200 },
        growth={ 4.4, 3.8, 4.15, 3.75, 4, 3.85, 4.05, 4.3 },
        recruit='This power that was once feared, I\'ll use it to help.',
        profile='Embracing her heritage, Tipha is able to tap into her ancestral origin and awaken her hereditary powers, that which was feared in ancient history. Of course, contrasting her ancestors domination and predatory nature, Tipha uses her abilities to better the world.',
        mode=1,
        elements={ 1, 1, 0.75, 1, 1, 1, 1, 1.25, 0.75, 1, 1 },
        unique={
            icon=57,
            name='Blade Shield',
            description='20% chance to reduce damage to 0\n\nThe tengu blades that surround you form a barrier that can shield any attack',
            effects={
                editDamageTarget=function(self, actingBattler, skill, target, value)
                    --actingBattler is enemy
                    if not actingBattler.isActor then
                        local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                        if math.random() < chance then
                            return 0
                        end
                    end

                    return value
                end,
            }
        },
        hyper={
            --effect in unique
            name='Tengu Shield',
            description='Blade Shield chance increase to 60%\n\nConjure more tengu blades to shield yourself',
            hyperId=10,
            icon=58
        }
    }, {
        name='Aria',
        rating=1,
        skills={ 1, 6, 8, 192, 200, 252 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_051_01',
                face='Face_FH_051_01',
                character='Character_FH_051_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_051_02',
                face='Face_FH_051_01',
                character='Character_FH_051_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_051_03',
                face='Face_FH_051_01',
                character='Character_FH_051_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_051_04',
                face='Face_FH_051_01',
                character='Character_FH_051_04',
                cost=1000
            }
        },
        stats={ 180, 105, 170, 160, 140, 150, 165, 170 },
        growth={ 4.2, 2.9, 4, 3.75, 3.5, 3.7, 4, 4.1 },
        recruit='I don\'t mind where you take me, I know it\'ll be the right path.',
        profile='Many have met or know of the wanderer Aria, not because she is renown but simply because she has travelled far and wide. Coupled with her outgoing nature, many enjoy her companionship and are upset when she has to say goodbye to continue her search. The reason for her travels, to find her lost memories. Though wherever the end of her journey may be, she\'ll continue to put one foot in front of the other, as thats the only way one can make memories.',
        mode=4,
        elements={ 1, 1, 1, 1, 1, 1.25, 1.25, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Traveller',
            description='All allies begin every battle with a 2 stage LUK buff that lasts 3 turns\n\nThose that have travelled far and wide are always eager to set off on a new adventure with companions',
            effects={
                startWave=function(self, battleManager)
                    local aliveActors = battleManager:aliveMembers(true)
                    local buff = {
                        id=8,
                        value=2,
                        turn=3
                    }
                    for i = 1, #aliveActors do
                        self:applyStatBuffToTarget(buff, aliveActors[i])
                    end
                end,
                startInput=function(self, battleManager)
                    if self.buffs[self.hyperId] then
                        local aliveActors = battleManager:aliveMembers(true)
                        local kindheartedBuffId = 20
                        for i = 1, #aliveActors do
                            self:applyBuffToTarget({
                                id=kindheartedBuffId, turn=1
                            }, aliveActors[i])
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Kindhearted',
            description='Every turn apply a buff to all allies which increases crit damage\n\nKind in nature, these people will also support and encourage you',
            hyperId=10,
            icon=58
        }
    }, {
        name='Aria (Wind)',
        rating=2,
        skills={ 1, 6, 122, 127, 200, 253 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_052_01',
                face='Face_FH_052_01',
                character='Character_FH_052_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_052_02',
                face='Face_FH_052_01',
                character='Character_FH_052_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_052_03',
                face='Face_FH_052_01',
                character='Character_FH_052_01',
                cost=400
            }
        },
        stats={ 190, 115, 185, 170, 160, 170, 180, 190 },
        growth={ 4.4, 3.4, 4.2, 3.95, 3.75, 3.95, 4.15, 4.3 },
        recruit='My power is special. Where it came from, who knows? But so long as I have it, I\'ll use it to help.',
        profile='When Aria awoke with amnesia, the only thing with her was a sword. After swinging the sword a couple of strikes, not only was her swordmanship perfect, the sword had seemingly gained wind affinity. Such sorcery is only possible if Aria wields that specific sword. It has been trialed by Aria with other swords, and other swordsman wielding that sword, none to avail. Perhaps uncovering the truth of that power is the key to finding her lost memories.',
        mode=1,
        elements={ 1, 1, 1, 1, 1, 1.25, 1.25, 1, 0.75, 1, 1 },
        unique={
            icon=57,
            name='Traveller',
            description='All allies begin every battle with a 2 stage LUK buff that lasts 3 turns\n\nThose that have travelled far and wide are always eager to set off on a new adventure with companions',
            effects={
                startWave=function(self, battleManager)
                    local aliveActors = battleManager:aliveMembers(true)
                    local buff = {
                        id=8,
                        value=2,
                        turn=3
                    }
                    for i = 1, #aliveActors do
                        self:applyStatBuffToTarget(buff, aliveActors[i])
                    end
                end,
                startInput=function(self, battleManager)
                    if self.buffs[self.hyperId] then
                        local aliveActors = battleManager:aliveMembers(true)
                        local kindheartedBuffId = 20
                        for i = 1, #aliveActors do
                            self:applyBuffToTarget({
                                id=kindheartedBuffId, turn=1
                            }, aliveActors[i])
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Kindhearted',
            description='Every turn apply a buff to all allies which increases crit damage\n\nKind in nature, these people will also support and encourage you',
            hyperId=10,
            icon=58
        }
    }, {
        name='Penelope',
        rating=1,
        skills={ 2, 64, 100, 125, 165, 254 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_053_01',
                face='Face_FH_053_01',
                character='Character_FH_053_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_053_02',
                face='Face_FH_053_01',
                character='Character_FH_053_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_053_03',
                face='Face_FH_053_01',
                character='Character_FH_053_03',
                cost=1000
            }
        },
        stats={ 155, 130, 140, 150, 180, 160, 140, 140 },
        growth={ 4.05, 3.9, 3.6, 3.65, 4.1, 3.8, 3.8, 3.7 },
        recruit='What a quest! I\'m sure to learn something new.',
        profile='If you have a question, there\'s no one better to ask than Penelope. Armed with a bottomless pit of knowledge, all the young elves look to her for guidance and perhaps some random facts. \'Knowledge is never-ending\' is the motto she lives by, and as such is on a never-ending quest to gain knowledge.',
        mode=2,
        elements={ 1.25, 1.25, 1.25, 0.75, 1, 1, 0.75, 1, 0.75, 1, 1 },
        unique={
            icon=57,
            name='Infinite Knowledge',
            description='On the 1st turn and every 5th turn thereafter gain a MAT buff that lasts 3 turns\n\nKnowledge knows no bounds',
            effects={
                startInput=function(self, battleManager)
                    if battleManager.turn == 1 or (battleManager.turn % 5 == 0) then
                        local buff = {
                            id=5,
                            value=1,
                            turn=3
                        }
                        self:applyStatBuffToTarget(buff, self)
                    end
                end,
                updateStatBuffTurns=function(self)
                    for i = 1, #self.statBuffs do
                        local statBuff = self.statBuffs[i]
                        if statBuff.value ~= 0 then
                            if not (self.buffs[self.hyperId] and statBuff.value > 0) then
                                local newTurn = statBuff.turn - 1
                                if newTurn == 0 then
                                    self:removeEffectIcon(CONSTANTS.statBuffsIcons(i, statBuff.value).icon)
                                    statBuff.value = 0
                                end
                                statBuff.turn = newTurn
                            end
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Everlasting Wisdom',
            description='Positive stat buff turns do not tick down at the end of turn\n\nHalloween',
            hyperId=10,
            icon=58
        }
    }, {
        name='Penelope (Spirits)',
        rating=3,
        skills={ 2, 69, 103, 128, 172, 254 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_054_01',
                face='Face_FH_054_01',
                character='Character_FH_054_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_054_02',
                face='Face_FH_054_01',
                character='Character_FH_054_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_054_03',
                face='Face_FH_054_01',
                character='Character_FH_054_01',
                cost=400
            }
        },
        stats={ 180, 160, 180, 185, 205, 200, 170, 160 },
        growth={ 4.5, 4.4, 3.95, 4.1, 4.6, 4.3, 4.1, 4 },
        recruit='I summon thee, Ifirit, Udyine, Sylph. Lend us your aid.',
        profile='The summon spirits of fire, water and air have all made a pact with Penelope. It is very rare for a summon spirit to deem an individual worthy to form a pact, let alone three as each spirit embodies different values, yet Penelope has done it. Such a feat speaks of her strong adaptability. Armed with vast knowledge as well as her magical prowess, she uses the power of the summon spirits to do what is right.',
        mode=4,
        elements={ 1.25, 1.25, 1.25, 0.75, 1, 1, 0.75, 1, 0.75, 1, 1 },
        unique={
            icon=57,
            name='Summon Spirits',
            description='Casting a skill will apply a buff to all allies which provides resist to that skill\'s element\n\nOnce invoked, spirits are able to protect you from the elements',
            effects={
                completeActionActingSelf=function(self, actingBattler, skill, targets, battleManager)
                    local skillElement = skill:element()
                    local skillId
                    if skillElement == 4 then
                        skillId = self.buffs[self.hyperId] and 289 or 286
                    elseif skillElement == 7 then
                        skillId = self.buffs[self.hyperId] and 290 or 287
                    elseif skillElement == 9 then
                        skillId = self.buffs[self.hyperId] and 291 or 288
                    end

                    if skillId then
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), battleManager:aliveMembers(true))
                    end
                end
            }
        },
        hyper={
            --effect is in unique
            name='Spirit Guardians',
            description='Damage reduced by Summon Spirits resist buff increased to 50%\n\nThe spirits are vowed to protect you',
            hyperId=10,
            icon=58
        }
    }, {
        name='Kumiho',
        rating=2,
        skills={ 3, 139, 18, 165, 184, 255 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_055_01',
                face='Face_FH_055_01',
                character='Character_FH_055_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_055_02',
                face='Face_FH_055_01',
                character='Character_FH_055_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_055_03',
                face='Face_FH_055_01',
                character='Character_FH_055_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_055_04',
                face='Face_FH_055_01',
                character='Character_FH_055_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_055_05',
                face='Face_FH_055_01',
                character='Character_FH_055_05',
                cost=1000
            }
        },
        stats={ 190, 120, 185, 170, 195, 180, 160, 150 },
        additional={ 0, 0.05, 0.08, 0.15, 0.4 },
        growth={ 4.4, 3.9, 4.2, 3.9, 4.3, 4, 3.9, 3.8 },
        recruit='If I\'m with you, maybe then I\'ll make a name for myself.',
        profile='Having nine tails, many confuse Kumiho for the notorious fox spirit, known for its mischevious pranks. It doesn\'t help that she also excels with the same type of magic as her cousin. Thus, she carries around a large glaive so people can differentiate her and make a name for herself. Though now, many just see her as a fox wielding a weapon much too large for her.',
        mode=3,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        unique={
            icon=57,
            name='Mischief',
            description='Grant 15% evasion and if an attack is evaded, perform a strong pierce attack to the attacker\n\nAll fox spirits are mischievous, you don\'t know what they\'ll do',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --acting is enemy, evade
                    if not actingBattler.isActor and result.target and result.target.damage and result.target.damage.isEvade then
                        local skillId = 302
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { actingBattler })
                    end
                end
            }
        },
        hyper={
            --buff has stats bonus
            name='Elusive',
            description='Increase evasion by 20%\n\nIt\'s hard to catch a fox spirit, even harder if they\'re making an effort to stay hidden',
            hyperId=13,
            icon=58
        }
    }, {
        name='Saki',
        rating=2,
        skills={ 1, 42, 76, 65, 208, 256 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_056_01',
                face='Face_FH_056_01',
                character='Character_FH_056_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_056_02',
                face='Face_FH_056_01',
                character='Character_FH_056_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_056_03',
                face='Face_FH_056_01',
                character='Character_FH_056_03',
                cost=1000
            }
        },
        stats={ 190, 125, 175, 180, 195, 190, 175, 180 },
        growth={ 4.4, 4.1, 4.1, 4.1, 4.3, 4.2, 4.15, 3.95 },
        recruit='Remember, I still have something I need to finish. Everything else is just training, even this.',
        profile='Saki is the last surviving member of the Ichiya clan. The details of her clan\'s extinction is something she keeps secret, but is clearly her drive to push forward. As a high rank ninja, she has cleared many missions, some of which were considered impossible. However, completing such missions are trival for Saki, as she has her mind set for something far dangerous.',
        mode=5,
        elements={ 1, 1, 1, 0.75, 0.75, 1.25, 1.25, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Sharagin',
            description='Increase damage by 30% when attacking an enemy\'s weak element\n\nThe signature eye jutsu of clan Ichiya, grants the ability to more effectviely strike weakness points',
            effects={
                editDamageActing=function(self, actingBattler, skill, target, value)
                    if not target.isActor then
                        if self:elementRateToTarget(skill, target) > 1 then
                            value = math.round(value * 1.3)
                        end 
                    end

                    return value
                end
            }
        },
        hyper={
            --buff has stats bonus
            name='Maengo Sharagin',
            description='Increase stun chance to 100%\n\nThe awakened form of the Ichiya eye jutsu, unlocked only after one has experienced trauma',
            hyperId=14,
            icon=58
        }
    }, {
        name='Saki (Butterfly)',
        rating=3,
        skills={ 1, 75, 138, 65, 181, 257 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_057_01',
                face='Face_FH_057_01',
                character='Character_FH_057_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_057_02',
                face='Face_FH_057_01',
                character='Character_FH_057_01',
                cost=400
            }
        },
        stats={ 200, 140, 180, 190, 205, 200, 180, 190 },
        growth={ 4.6, 4.3, 4.2, 4.2, 4.4, 4.3, 4.2, 4.1 },
        recruit='You\'re mission is harder than I thought. I\'m not afraid to use my secret art.',
        profile='Inheriting the blood of the Ichiya clan, Saki is able to perform her clan\'s signature ninjutsu, \'Susana\'. People liken the art to a beautiful butterfly annihilating whatever crosses its path, capable of destorying villages whole. Being such a dangerous skill, she vowed to use it only if she deems it necessary.',
        mode=2,
        elements={ 1, 1, 1, 0.75, 0.75, 1.25, 1.25, 1, 1, 0.75, 1 },
        unique={
            icon=57,
            name='Susana Shield',
            description='When attacked perform a basic light attack to the attacker\n\nSusana will naturally react to anything that harms the main body',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --self isnt dead, acting is enemy, successful damage
                    if not self:isDead() and not actingBattler.isActor and result:isSuccessfulAttack() then
                        local skillId = self.buffs[self.hyperId] and 301 or 300
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { actingBattler })
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Bloodsucking Butterfly',
            description='Attack from Susana Shield now drains\n\nSusana can absorb the charka of its target',
            hyperId=10,
            icon=58
        }
    }, {
        name='Narita',
        rating=1,
        skills={ 2, 42, 29, 114, 185, 258 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_058_01',
                face='Face_FH_058_01',
                character='Character_FH_058_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_058_02',
                face='Face_FH_058_01',
                character='Character_FH_058_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_058_03',
                face='Face_FH_058_01',
                character='Character_FH_058_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_058_04',
                face='Face_FH_058_01',
                character='Character_FH_058_04',
                cost=1000
            }
        },
        stats={ 175, 110, 175, 160, 170, 160, 165, 160 },
        growth={ 4.3, 3.4, 4, 3.65, 3.8, 3.65, 3.9, 3.8 },
        recruit='I\'ll help. That\'ll get me closer to my dream, to become number one.',
        profile='Narita, a mischevious ninja whose dream is to become the number one ninja, Khage. However, due to her continual antics, the other villages mock her aspirations. Nevertheless, Narita continues to work hard so that she can become Khage and realise her vision of peace for the village.',
        mode=1,
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        unique={
            icon=57,
            name='Shadow Clone',
            description='All attacks are followed up with a weak bash attack\n\nA secret clone ninjutsu that creates a near-perfect body double',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target is enemy, not dead, successful hit
                    if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() then
                        local skillId = 292
                        local followupTargets = self.buffs[self.hyperId] and battleManager:aliveMembers(false) or { target }
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), followupTargets)
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Thousand Clones',
            description='Shadow Clone attack now targets all enemies\n\nSummon a thousand clones to attack your enemies',
            hyperId=10,
            icon=58
        }
    }, {
        name='Narita (Fox)',
        rating=3,
        skills={ 2, 152, 14, 114, 156, 259 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_059_01',
                face='Face_FH_059_01',
                character='Character_FH_059_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_059_02',
                face='Face_FH_059_01',
                character='Character_FH_059_01',
                cost=400
            }
        },
        stats={ 210, 145, 195, 190, 205, 185, 175, 190 },
        growth={ 4.7, 4.2, 4.25, 4.2, 4.3, 4.2, 4.1, 4.3 },
        recruit='The fox and I have a truce. You\'ll have his help as well.',
        profile='The tailed-foxed spirit, sealed within Narita at her birth, has been feeding of her chakra akin to a parasite in hopes to break out of its seal and wreak havoc as it once did. Though after a mutual understanding, Narita and the fox came to an agreement and she is now allowed full control of the fox\'s chakra.',
        mode=1,
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 0.75 },
        unique={
            icon=57,
            name='Fox Clone',
            description='All attacks are followed up with a weak dark attack\n\nCreate a shadow clone using the fox\'s charka',
            effects={
                postActionActingSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --target is enemy, not dead, successful hit
                    if not target.isActor and not target:isDead() and result:isSuccessfulAttack() and not result:isFollowup() then
                        local skillId = 293
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { target })
                        if self.buffs[self.hyperId] then
                            battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { target })
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Destructive Fox',
            description='Fox Clone attack repeats one additional time\n\nThe fox isn\'t satisfied with such a weak attack',
            hyperId=10,
            icon=58
        }
    }, {
        name='Sun-Ni',
        rating=1,
        skills={ 1, 30, 20, 187, 210, 260 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_060_01',
                face='Face_FH_060_01',
                character='Character_FH_060_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_060_02',
                face='Face_FH_060_01',
                character='Character_FH_060_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_060_03',
                face='Face_FH_060_01',
                character='Character_FH_060_01',
                cost=400
            }, {
                name='Recolour C', 
                picture='Battler_FH_060_04',
                face='Face_FH_060_01',
                character='Character_FH_060_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_060_05',
                face='Face_FH_060_01',
                character='Character_FH_060_05',
                cost=1000
            }
        },
        stats={ 200, 95, 170, 175, 150, 170, 140, 160 },
        growth={ 4.5, 3.4, 4, 3.9, 3.4, 3.8, 3.9, 3.7 },
        recruit='Ni hao! Hope you don\'t mind me helping.',
        profile='A warrior from a foreign land, Sun-Ni brings with her new knowledge and experiences. Many are in awe of the tales from her homeland, such as the heroes that journeyed to the west, or the tactics of a military strategist. Little do they know she has a part in all the stories she tells.',
        mode=3,
        elements={ 1, 1, 1, 1, 1.25, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Counter Cleave',
            description='When attacked perform a weak slash attack to all enemies\n\nAttacking with such a long sword, you\'re bound to hit people unintentionally',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --self isnt dead, acting is enemy, successful damage
                    if not self:isDead() and not actingBattler.isActor and result:isSuccessfulAttack() then
                        local skillId = self.buffs[self.hyperId] and 295 or 294
                        battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), battleManager:aliveMembers(false))
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Hyper Cleave',
            description='Increase damage dealt by Counter Cleave\n\nA long sword that grows longer will deal more damage',
            hyperId=10,
            icon=58
        }
    }, {
        name='Sun-Ni (Dragon)',
        rating=3,
        skills={ 1, 67, 20, 169, 187, 261 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_061_01',
                face='Face_FH_061_01',
                character='Character_FH_061_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_061_02',
                face='Face_FH_061_01',
                character='Character_FH_061_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_061_03',
                face='Face_FH_061_01',
                character='Character_FH_061_01',
                cost=400
            }
        },
        stats={ 210, 130, 200, 200, 200, 200, 170, 180 },
        growth={ 4.9, 4.1, 4.2, 4.3, 4.2, 4.3, 4.1, 4.2 },
        recruit='Mou man tai! I\'ll just use my full power.',
        profile='Sealed within Sun-Ni\'s sheath is a dragon she once fought. To reward her efforts for defeating it in battle, the dragon gave away its spirit, granting her the use of its devestating power should the need present itself. Even if Sun-Ni is already formidable without that power, it has saved her on many occasions, like during the battle of gods or the tournament of power.',
        mode=3,
        elements={ 1, 1, 1, 0.75, 1.25, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Dragon Skin',
            description='When attacked 35% chance to gain a DEF or RES buff (depending on attack type) that lasts 3 turns\n\nA dragon\'s skin can adapt to anything that attacks it',
            effects={
                postActionTargetSelf=function(self, actingBattler, skill, target, result, battleManager)
                    --self isnt dead, acting is enemy, successful damage
                    if not self:isDead() and not actingBattler.isActor and result:isSuccessfulAttack() then
                        if math.random() < 0.35 then
                            local skillId
                            if skill:type() == 2 then
                                skillId = self.buffs[self.hyperId] and 299 or 297
                            else
                                skillId = self.buffs[self.hyperId] and 298 or 296
                            end
                            battleManager:addFollowup(self, MAIN.DATA.SKILLS.getSkill(skillId, 1), { self })
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Dragon Claws',
            description='Dragon skin now also applies a corresponding ATK or MAT buff\n\nPrime the dragon\'s claws for any situation',
            hyperId=10,
            icon=58
        }
    }, {
        name='Nikolette',
        rating=1,
        skills={ 1, 27, 8, 16, 180, 262 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_062_01',
                face='Face_FH_062_01',
                character='Character_FH_062_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_062_02',
                face='Face_FH_062_01',
                character='Character_FH_062_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_062_03',
                face='Face_FH_062_01',
                character='Character_FH_062_03',
                cost=1000
            }
        },
        stats={ 170, 90, 180, 160, 140, 150, 150, 180 },
        growth={ 4.1, 3.4, 4, 3.8, 3.6, 3.7, 3.8, 4.1 },
        recruit='Perhaps here I\'ll find what I\'m looking for.',
        profile='A former treasure hunter, Nikolette would investigate any rumour so long as it spoke of riches. Searching underground caves, entering active volcanoes, swimming to the depths of the sea, there was nothing that would stop her if there was treasure to be had. However after unearthing a cursed sword, something changed and her drive for treasure was lost. She assures her fellow hunters that she is still searching for a kind of treasure, but for what that is, she won\'t say.',
        mode=5,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 1, 1 },
        unique={
            icon=57,
            name='Ruthless',
            description='Applying 1 stage stat debuffs are increased to 2 stage stat debuffs\n\nA treasure hunter will do anything to get what they want',
            effects={
                editStatBuffSelf=function(self, value)
                    if value < 0 then
                        value = value * 2
                    end
                    return value
                end,
                applyStatDebuffSelf=function(self, statBuff)
                    if self.buffs[self.hyperId] then
                        local newStatBuff = {
                            id=statBuff.id,
                            value=1,
                            turn=statBuff.turn
                        }
                        return self:applyStatBuffToTarget(newStatBuff, self)
                    end
                end
            }
        },
        hyper={
            --Effect in unique
            name='Steal',
            description='Applying stat debuffs will grant the user the corresponding buff\n\nA treasure hunter leaves nothing behind',
            hyperId=10,
            icon=58
        }
    }, {
        name='Nikolette (Curse)',
        rating=2,
        skills={ 1, 27, 17, 160, 198, 263 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_063_01',
                face='Face_FH_063_01',
                character='Character_FH_063_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_063_02',
                face='Face_FH_063_01',
                character='Character_FH_063_01',
                cost=400
            }
        },
        stats={ 205, 120, 195, 185, 170, 180, 175, 200 },
        growth={ 4.5, 3.45, 4.15, 4.05, 3.9, 4, 3.95, 4.3 },
        recruit='This power may be cursed, but I\'m prepared for the consequences.',
        profile='With cursed sword in hand, Nikolette can activate its dark power to torment any opponent, though wielding such power comes at a price. However this doesn\'t deter Nikolette and has instead has strengthened her resolve and accepts whatever it costs to achieve what needs to be done.',
        mode=1,
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 1.25, 0.75 },
        unique={
            icon=57,
            name='Cursed Sword',
            description='Basic attacks now hit 0, 1, 2 or 3 times (more common to hit 1 then 2)\n\nThis cursed sword has a mind of its own',
            effects={
                editTargetsSelf=function(self, actingBattler, skill, targets, battleManager)
                    --attack skill id
                    if skill.data.id == 1 then
                        local counts = { 0, 3, 2, 2, 1, 1, 1, 1 }
                        local randomCount = counts[math.floor(math.random() * #counts) + 1]

                        --if its zero it wont show an animation
                        local currentTarget = targets[1]
                        targets = {}
                        for i = 1, randomCount do
                            targets[i] = currentTarget
                        end
                    end

                    return targets
                end,
                completeActionActingSelf=function(self, actingBattler, skill, targets, battleManager)
                    if self.buffs[self.hyperId] and math.random() < 0.5 then
                        battleManager:addFollowup(self, skill, targets)
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Uncontained Affliction',
            description='All actions have a 50% chance to repeat\n\nThe curse will be useful once in a while',
            hyperId=10,
            icon=58
        }
    }, {
        name='Clara',
        rating=2,
        skills={ 1, 16, 157, 142, 200, 264 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_064_01',
                face='Face_FH_064_01',
                character='Character_FH_064_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_064_02',
                face='Face_FH_064_01',
                character='Character_FH_064_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_064_03',
                face='Face_FH_064_01',
                character='Character_FH_064_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_064_04',
                face='Face_FH_064_01',
                character='Character_FH_064_04',
                cost=1000
            }
        },
        stats={ 200, 140, 190, 180, 190, 180, 165, 170 },
        growth={ 4.9, 3.6, 4.1, 4, 4.1, 4, 3.8, 3.8 },
        recruit='I\'ve seen many things, but even this is a first for me. I\'m curious to see how it ends.',
        profile='History books seemingly show portraits of Claravaya (Clara) as a renown queen, though under a different name. Interestingly, this phenomenon reoccurs in historical texts, paintings, sculptures, even legends and folktale, all referencing her but under a different title and name. Indeed all these depictions are true, for she has lived many lives. Existing since the dawn of Infinity, she plans to continue living with desire to see the end.',
        mode=1,
        elements={ 1, 1, 1, 1.25, 1.25, 1, 1, 1, 1, 0.75, 0.75 },
        unique={
            icon=57,
            name='Eternal Life',
            description='Increase HP recovered from all sources increased by 25%\n\nStaying healthy is the first step to a long life',
            effects={
                gainHp=function(self, gain)
                    local requireReturn = false
                    if gain > 0 then
                        gain = math.round(gain * 1.25)
                        requireReturn = true
                    end

                    self.stats[1] = math.max(0, math.min(self:maxHp(), self:hp() + gain))

                    return requireReturn and gain
                end,
                skillDrain=function(self, skill)
                    return (self.buffs[self.hyperId] and skill:type() ~= 3) or skill.data.drain
                end
            }
        },
        hyper={
            --effect in unique
            name='Vampire',
            description='All attacks now drain\n\nEternal life is not a blessing but a curse sustained by unwillingly absorbing other life',
            hyperId=10,
            icon=58
        }
    }, {
        name='Anastasia II',
        rating=2,
        skills={ 2, 78, 33, 173, 211, 265 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_065_01',
                face='Face_FH_065_01',
                character='Character_FH_065_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_065_02',
                face='Face_FH_065_01',
                character='Character_FH_065_01',
                cost=400
            }, {
                name='Recolour B', 
                picture='Battler_FH_065_03',
                face='Face_FH_065_01',
                character='Character_FH_065_01',
                cost=400
            }, {
                name='Modern', 
                picture='Battler_FH_065_04',
                face='Face_FH_065_01',
                character='Character_FH_065_04',
                cost=1000
            }
        },
        stats={ 190, 130, 190, 175, 185, 170, 180, 190 },
        growth={ 4.7, 3.6, 4.1, 3.95, 4.05, 3.9, 4, 4.1 },
        recruit='We must end this cycle of war. You\'ll have my aid.',
        profile='Queen Anastasia II was a problem child during her youth. After an unsuccessful attempt to dethrone the queen (physically), she was forced to serve Her Majesty as a slave. Expecting cruel treatment, she was puzzled by the queen\'s kindness towards her. Hearing the vast number of stories the queen had shared, she learnt more about the world and that hatred brings a never-ending cycle. With a new light she devoted her life to the queen, eventually inheriting the title and assumed a new name, in honour of the person that changed her life.',
        mode=5,
        elements={ 1, 0.75, 1, 1.25, 0.75, 1, 1, 1, 1, 1, 1 },
        unique={
            icon=57,
            name='Queen\'s Orders',
            description='Every turn 20% chance to apply a debuff to enemies which reduces speed to 1\n\nThe queen orders you to stand down',
            effects={
                startInput=function(self, battleManager)
                    local aliveEnemies = battleManager:aliveMembers(false)
                    local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                    local queensOrdersDebuffId = 6
                    for i = 1, #aliveEnemies do
                        if math.random() < chance then
                            self:applyDebuffToTarget({
                                id=queensOrdersDebuffId, turn=1
                            }, aliveEnemies[i])
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Order\'s Absolute',
            description='Queen\'s Orders chance increase to 60%\n\nYou must obey the demands of the queen',
            hyperId=10,
            icon=58
        }
    }, {
        name='Anastasia II (Bless)',
        rating=3,
        skills={ 2, 79, 142, 173, 211, 266 },
        skins={
            {
                name='Normal', 
                picture='Battler_FH_066_01',
                face='Face_FH_066_01',
                character='Character_FH_066_01',
                cost=0
            }, {
                name='Recolour A', 
                picture='Battler_FH_066_02',
                face='Face_FH_066_01',
                character='Character_FH_066_01',
                cost=400
            }
        },
        stats={ 205, 150, 200, 190, 205, 185, 185, 195 },
        growth={ 5, 3.7, 4.2, 4.15, 4.35, 4.2, 4.2, 4.4 },
        recruit='This power is proof of my rehabilitation. I\'ll use it to fight against that which threatens the world.',
        profile='Shortly after Anastasia II succeeded the throne, the retired queen passed to her successor one final gift, a mysterious blessing granting mythical magic. While having power is great, Anastasia sees this a proof of her inheritance as well as the approval of her predecessor. Hence she uses her power, not for the misdeeds she used to do, but for her kingdom which she proudly stands for.',
        mode=1,
        elements={ 1, 1, 1, 1.25, 0.75, 1, 1, 1, 1, 0.75, 1 },
        unique={
            icon=57,
            name='Queen\'s Orders',
            description='Every turn 20% chance to apply a debuff to enemies which reduces speed to 1\n\nThe queen orders you to stand down',
            effects={
                startInput=function(self, battleManager)
                    local aliveEnemies = battleManager:aliveMembers(false)
                    local chance = self.buffs[self.hyperId] and 0.6 or 0.2
                    local queensOrdersDebuffId = 6
                    for i = 1, #aliveEnemies do
                        if math.random() < chance then
                            self:applyDebuffToTarget({
                                id=queensOrdersDebuffId, turn=1
                            }, aliveEnemies[i])
                        end
                    end
                end
            }
        },
        hyper={
            --effect in unique
            name='Order\'s Absolute',
            description='Queen\'s Orders chance increase to 60%\n\nYou must obey the demands of the queen',
            hyperId=10,
            icon=58
        }
    }
}

M.getActor = function(actorId)
    return actors[actorId]
end 

return M