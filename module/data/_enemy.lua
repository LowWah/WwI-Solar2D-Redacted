local M = {}

local enemies = {
    --grasslands
    { --1
        name='Bunny',
        hpGauge=1,
        skills={ 2, 310 },
        stats={ 150, 0, 140, 135, 120, 130, 155, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1, 1, 1.25 },
        growth={ 8, 0, 4.8, 4.5, 4.1, 4.3, 5.1, 5 },
        picture='Mountain Bunny',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --2
        name='Cat',
        hpGauge=1,
        skills={ 1, 311, 312 },
        stats={ 130, 0, 130, 130, 150, 140, 135, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 7.7, 0, 4.5, 4.5, 5, 4.7, 4.6, 4.8 },
        picture='Halloween Black Cat',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --3
        name='Snail',
        hpGauge=2,
        skills={ 2, 313, 314 },
        stats={ 300, 0, 140, 160, 140, 150, 140, 135 },
        elements={ 0.75, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.6, 0, 4.9, 5.4, 5, 5.2, 4.6, 4.6 },
        picture='Mountain Snail',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[4].value <= 0 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --4
        name='Goat',
        hpGauge=2,
        skills={ 2, 315 },
        stats={ 210, 0, 150, 155, 135, 145, 140, 140 },
        elements={ 1, 0.75, 1, 1, 1, 1.25, 1, 0.75, 1.25, 1, 1 },
        growth={ 9.4, 0, 5, 5.3, 4.8, 5.3, 4.8, 4.7 },
        picture='Mountain Goat',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            local skills = { 1, 2 }
            skillId = skills[math.floor(math.random() * #skills) + 1]

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --5
        name='Greathorn',
        hpGauge=2,
        skills={ 2, 180, 316 },
        stats={ 190, 0, 170, 150, 150, 140, 150, 155 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1, 1, 1.25 },
        growth={ 9.2, 0, 5.3, 4.8, 5.1, 4.7, 5, 5.2 },
        picture='Mountain Greathorn Goat',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --6
        name='Warthog',
        hpGauge=2,
        skills={ 2, 317, 318 },
        stats={ 200, 0, 160, 160, 160, 160, 155, 150 },
        elements={ 1, 1, 1, 1.25, 1.25, 0.75, 0.75, 1, 1, 1, 1 },
        growth={ 9.3, 0, 5.1, 5.1, 5.1, 5.1, 4.9, 4.8 },
        picture='Mountain Warthog',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self:hpRate() < 0.5 and battleManager.turn % 2 == 1 then
                skillId = 2
                for i = 1, #battleManager.currentEnemies do
                    if battleManager.currentEnemies[i] == self then
                        targetId = i
                        break
                    end
                end
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --7
        name='Peacock',
        hpGauge=2,
        skills={ 3, 319, 320 },
        stats={ 750, 0, 170, 165, 190, 180, 160, 175 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75, 1, 1 },
        growth={ 20, 0, 5.4, 5.2, 5.8, 5.6, 5.3, 5.5 },
        picture='Mountain Peacock',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --8
        name='Rabbit Archer',
        hpGauge=1,
        skills={ 3, 186, 321, 322 },
        stats={ 285, 0, 180, 145, 160, 140, 155, 145 },
        elements={ 1, 1, 0.75, 1.25, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.4, 0, 5.2, 4.7, 5, 4.6, 5.1, 5 },
        picture='Rabbit Warriors Archer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            --if knight is dead and not stealth then stealth
            if battleManager.currentEnemies[2]:isDead() and not self.buffs[6] then
                skillId = 2
            elseif battleManager.turn % 2 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --9
        name='Rabbit Bandit',
        hpGauge=1,
        skills={ 3, 323 },
        stats={ 300, 0, 170, 155, 150, 150, 180, 185 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.6, 0, 5, 4.9, 4.6, 4.8, 5.4, 5.5 },
        picture='Rabbit Warriors Bandit',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --10
        name='Rabbit Knight',
        hpGauge=1,
        skills={ 1, 187, 18 },
        stats={ 360, 0, 160, 180, 140, 175, 150, 140 },
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1.25, 1, 1.25, 1, 1, 1 },
        growth={ 10, 0, 4.8, 5.4, 4.6, 5.3, 4.7, 4.6 },
        picture='Rabbit Warriors Knight',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if not self.buffs[7] then
                skillId = 2
            elseif battleManager.turn % 3 == 2 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --11
        name='Aries',
        hpGauge=3,
        boss=true,
        skills={ 2, 315, 316, 324 },
        stats={ 2300, 0, 170, 150, 155, 140, 160, 155 },
        elements={ 1, 0.75, 1, 1, 1, 1.25, 1.25, 0.75, 1, 1, 1.25 },
        growth={ 80, 0, 5.6, 5.3, 5.4, 5.1, 5.2, 5.1 },
        picture='Zodiac Aries B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 8 == 0 then
                skillId = 4
            elseif battleManager.turn % 2 == 0 then
                local skills = { 1, 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil,
    { --15
        name='Goblin Archer',
        hpGauge=1,
        skills={ 3, 321 },
        stats={ 180, 0, 150, 130, 140, 120, 140, 140 },
        elements={ 1, 1, 0.75, 1, 1.25, 1, 1.25, 1, 1, 1, 1 },
        growth={ 7.7, 0, 5, 4.5, 4.8, 4.4, 4.5, 4.6 },
        picture='Goblin Archer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 2 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --16
        name='Goblin Grunt',
        hpGauge=1,
        skills={ 2, 316 },
        stats={ 185, 0, 140, 140, 130, 135, 135, 130 },
        elements={ 1, 0.75, 1, 1, 1.25, 1, 1.25, 1, 1, 1, 1 },
        growth={ 8.2, 0, 4.6, 4.9, 4.4, 4.7, 4.4, 4.3 },
        picture='Goblin Grunt',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --17
        name='Goblin Mage',
        hpGauge=1,
        skills={ 2, 96, 77 },
        stats={ 180, 0, 140, 120, 155, 130, 135, 130 },
        elements={ 1.25, 1.25, 1.25, 1, 0.75, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.8, 0, 4.6, 4.4, 5.1, 4.9, 4.4, 4.3 },
        picture='Goblin Mage',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 2 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --18
        name='Goblin Raider',
        hpGauge=1,
        skills={ 1, 19 },
        stats={ 185, 0, 145, 135, 130, 125, 140, 140 },
        elements={ 0.75, 1, 1, 1, 1.25, 1, 1.25, 1, 1, 1, 1 },
        growth={ 8, 0, 4.8, 4.7, 4.4, 4.6, 4.6, 4.4 },
        picture='Goblin Raider',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 3 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --19
        name='Goblin Elite',
        hpGauge=2,
        skills={ 1, 18 },
        stats={ 200, 0, 160, 145, 140, 140, 140, 145 },
        elements={ 0.75, 1, 1, 1, 1.25, 1, 1.25, 1, 1, 1, 1 },
        growth={ 9.4, 0, 5, 4.8, 4.6, 4.6, 4.7, 4.9 },
        picture='Goblin Elite',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 3 == 2 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --20
        name='Orc Archer',
        hpGauge=2,
        skills={ 3, 325 },
        stats={ 200, 0, 175, 140, 160, 140, 145, 150 },
        elements={ 1, 1, 0.75, 1.25, 1, 1.25, 1, 1, 1, 1, 1 },
        growth={ 9.3, 0, 5.3, 4.7, 5.1, 4.6, 5.1, 5.3 },
        picture='Orc Archer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --21
        name='Orc Swordsman',
        hpGauge=2,
        skills={ 1, 19 },
        stats={ 210, 0, 170, 145, 150, 140, 150, 145 },
        elements={ 0.75, 1, 1, 1.25, 1, 1.25, 1, 1, 1, 1, 1 },
        growth={ 9.4, 0, 5.2, 4.9, 4.8, 4.7, 5.3, 5.2 },
        picture='Orc Sword Warrior',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --22
        name='Orc Warrior',
        hpGauge=2,
        skills={ 1, 12, 13, 326 },
        stats={ 215, 0, 160, 155, 145, 150, 145, 155 },
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1.25, 1, 1, 1, 1, 1 },
        growth={ 9.6, 0, 5.1, 5, 4.7, 4.9, 5.1, 5.4 },
        picture='Orc Axe Warrior',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 4 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --23
        name='Orc Warlock',
        hpGauge=2,
        skills={ 2, 64, 327 },
        stats={ 190, 0, 155, 145, 175, 165, 140, 155 },
        elements={ 1.25, 1.25, 1.25, 0.75, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 9.3, 0, 5, 4.8, 5.4, 5.1, 5, 5.4 },
        picture='Orc Warlock',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --24
        name='Orc Drummer',
        hpGauge=2,
        skills={ 2, 193, 328 },
        stats={ 810, 0, 180, 170, 160, 160, 155, 180 },
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1.25, 1, 1, 1, 1, 1 },
        growth={ 22, 0, 5.7, 5.5, 5.3, 5.3, 5.2, 5.7 },
        picture='Orc War Drummer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            elseif battleManager.turn % 3 == 2 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --25
        name='Orc Chief',
        hpGauge=3,
        boss=true,
        skills={ 1, 231, 329 },
        stats={ 1800, 0, 165, 155, 150, 155, 150, 165 },
        elements={ 0.75, 0.75, 1, 1.25, 1, 1.25, 1, 1, 1, 1, 1 },
        growth={ 70, 0, 5.5, 5.4, 5.2, 5.3, 5.3, 5.5 },
        picture='Boss Orc Chief Grunt',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 5 == 1 then
                skillId = 2
            elseif battleManager.turn % 2 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --30
        name='Fire Bat',
        hpGauge=1,
        skills={ 2, 330 },
        stats={ 140, 0, 145, 130, 125, 130, 150, 150 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 0.75 },
        growth={ 7.8, 0, 4.9, 4.4, 4.3, 4.3, 4.9, 4.9 },
        picture='Fire Elemental Bat',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --31
        name='Fire Salamander',
        hpGauge=1,
        skills={ 2, 331 },
        stats={ 160, 0, 135, 140, 150, 140, 140, 135 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 0.75, 1, 1, 1 },
        growth={ 8.2, 0, 4.5, 4.9, 4.9, 4.8, 4.4, 4.3 },
        picture='Fire Salamander',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --32
        name='Fire Snake',
        hpGauge=1,
        skills={ 2, 332, 333 },
        stats={ 150, 0, 140, 135, 135, 130, 140, 145 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 8, 0, 4.6, 4.5, 4.6, 4.5, 4.8, 4.9 },
        picture='Fire Snake',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --33
        name='Fire Turtle',
        hpGauge=1,
        skills={ 2, 313 },
        stats={ 180, 0, 135, 150, 135, 150, 135, 130 },
        elements={ 0.75, 1.25, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9, 0, 4.5, 5, 4.5, 5, 4.4, 4.3 },
        picture='Fire Turtle',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[4].value <= 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --34
        name='Fire Vulture',
        hpGauge=2,
        skills={ 3, 330, 334 },
        stats={ 200, 0, 165, 145, 145, 140, 160, 160 },
        elements={ 1, 1, 1, 0.75, 1.25, 1, 1.25, 1, 0.75, 1, 1 },
        growth={ 8.9, 0, 5.2, 4.7, 5, 4.6, 5.1, 5.1 },
        picture='Fire Vulture',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --35
        name='Fire Bull',
        hpGauge=2,
        skills={ 2, 335, 336 },
        stats={ 420, 0, 155, 160, 140, 145, 145, 160 },
        elements={ 1, 0.75, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 9.2, 0, 4.9, 5.2, 4.5, 4.7, 4.9, 5.2 },
        picture='Fire Bull',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            else
                local skills = { 1, 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --36
        name='Fire Dragonspawn',
        hpGauge=2,
        skills={ 2, 67, 337 },
        stats={ 380, 0, 150, 145, 165, 155, 140, 150 },
        elements={ 1, 1, 1, 0.75, 1, 1.25, 1.25, 1, 1, 1, 1 },
        growth={ 8.8, 0, 4.8, 4.8, 5.4, 5.2, 4.6, 4.7 },
        picture='Fire Dragonspawn',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --37
        name='Fire Lion',
        hpGauge=2,
        skills={ 1, 338, 339 },
        stats={ 460, 0, 155, 155, 140, 145, 145, 160 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 9, 0, 5.1, 5.1, 4.6, 4.9, 4.9, 5.2 },
        picture='Fire Lion',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() and enemy.statBuffs[3].value <= 0 then
                    skillId = 2
                    break
                end
            end

            if skillId ~= 2 and battleManager.turn % 3 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --38
        name='Fire Sabretooth',
        hpGauge=2,
        skills={ 1, 340 },
        stats={ 440, 0, 165, 160, 150, 145, 145, 150 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 9.3, 0, 5.2, 5, 5, 4.8, 4.9, 5.1 },
        picture='Fire Sabretooth',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --39
        name='Fire Toad',
        hpGauge=2,
        skills={ 2, 337 },
        stats={ 420, 0, 150, 150, 165, 150, 145, 155 },
        elements={ 1, 1, 1, 0.75, 1, 1.25, 1, 1, 1, 1, 1 },
        growth={ 9.3, 0, 5, 4.9, 5.3, 4.9, 4.9, 5 },
        picture='FIre Toad',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --40
        name='Fire Golem',
        hpGauge=2,
        skills={ 2, 341, 342 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 0.75, 1, 1, 1.25, 0.75, 1, 1, 1 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Fire Volcanic Golem',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --41
        name='Blazia',
        hpGauge=2,
        skills={ 2, 64, 343 },
        stats={ 790, 0, 150, 160, 180, 175, 170, 155 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 18, 0, 5.2, 5.3, 5.7, 5.6, 5.5, 5.2 },
        picture='Elemental Spirit Fire Blazia',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --42
        name='Ignis',
        boss=true,
        hpGauge=3,
        skills={ 1, 66, 344, 345 },
        stats={ 1600, 0, 180, 165, 155, 160, 160, 155 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 62, 0, 5.8, 5.4, 5.4, 5.3, 5.2, 5.1 },
        picture='Elemental Titan Ignis',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 5 == 1 then
                skillId = 3
            elseif battleManager.turn % 5 == 3 then
                skillId = 2
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil, nil,
    { --50
        name='Clockwork Moon',
        hpGauge=1,
        skills={ 2, 346, 347 },
        stats={ 170, 0, 135, 150, 140, 150, 135, 145 },
        elements={ 1, 1.25, 1, 0.75, 1, 1, 0.75, 1, 1, 1, 1 },
        growth={ 8.6, 0, 4.4, 4.8, 4.5, 4.8, 4.3, 4.4 },
        picture='Clockwork Mini A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            local enemyIsLow
            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() then
                    if enemy:hpRate() <= 0.25 then
                        enemyIsLow = i
                    end

                    if enemy.statBuffs[4].value <= 0 or enemy.statBuffs[6].value <= 0 then
                        skillId = 2
                    end
                end
            end

            if skillId ~= 2 and enemyIsLow and battleManager.turn % 2 == 1 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --51
        name='Clockwork Sun',
        hpGauge=1,
        skills={ 2, 348, 349 },
        stats={ 150, 0, 135, 135, 150, 145, 140, 150 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1.25, 1.25, 1, 1, 1 },
        growth={ 7.8, 0, 4.4, 4.4, 4.9, 4.8, 4.6, 4.7 },
        picture='Clockwork Mini B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --52
        name='Clockwork Star',
        hpGauge=1,
        skills={ 3, 350, 351 },
        stats={ 160, 0, 150, 135, 135, 145, 140, 150 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 0.75, 1.25 },
        growth={ 7.9, 0, 5, 4.6, 4.4, 4.4, 4.4, 5 },
        picture='Clockwork Mini C',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --53
        name='Clockwork Slime',
        hpGauge=1,
        skills={ 2, 352 },
        stats={ 140, 0, 140, 140, 130, 135, 140, 140 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 7.9, 0, 4.8, 4.7, 4.3, 4.4, 4.4, 4.8 },
        picture='Clockwork Slime',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --54
        name='Clockwork Spider',
        hpGauge=1,
        skills={ 2, 353 },
        stats={ 160, 0, 135, 140, 145, 140, 150, 150 },
        elements={ 1, 1, 1, 1.25, 0.75, 1, 0.75, 1.25, 1, 1, 1 },
        growth={ 8, 0, 4.2, 4.3, 4.6, 4.3, 4.6, 4.6 },
        picture='Clockwork Spider Mini',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --55
        name='Clockwork Iron Maiden',
        hpGauge=2,
        skills={ 3, 354, 355 },
        stats={ 480, 0, 145, 155, 140, 145, 135, 140 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1.25, 0.75 },
        growth={ 9.4, 0, 5, 5.2, 4.8, 5.1, 4.8, 5.1 },
        picture='Clockwork Iron Maiden',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --56
        name='Clockwork Arachnid',
        hpGauge=2,
        skills={ 2, 353, 356 },
        stats={ 450, 0, 145, 145, 160, 145, 150, 150 },
        elements={ 1, 1, 1, 1.25, 0.75, 1, 0.75, 1.25, 1, 1, 1 },
        growth={ 10.4, 0, 5, 5, 5.6, 5, 5.1, 5.3 },
        picture='Clockwork Spider',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            elseif battleManager.turn % 3 == 2 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --57
        name='Clockwork Bird',
        hpGauge=2,
        skills={ 3, 357 },
        stats={ 390, 0, 155, 150, 140, 150, 160, 140 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 0.75, 1, 1 },
        growth={ 9.1, 0, 5.4, 5.2, 5, 5.2, 5.4, 4.9 },
        picture='Clockwork Aerial',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --58
        name='Clockwork Dragon',
        hpGauge=2,
        skills={ 2, 358, 359 },
        stats={ 460, 0, 150, 155, 170, 160, 145, 140 },
        elements={ 1, 1, 1, 0.75, 0.75, 1.25, 1, 1.25, 1, 1, 1 },
        growth={ 9.4, 0, 5.2, 5.2, 5.5, 5.2, 5, 4.9 },
        picture='Clockwork Dragon',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --59
        name='Clockwork Juggernaut',
        hpGauge=2,
        skills={ 2, 78, 360 },
        stats={ 780, 0, 160, 170, 140, 165, 135, 135 },
        elements={ 1, 0.75, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 22, 0, 5.5, 5.8, 5.2, 5.7, 4.8, 4.8 },
        picture='Clockwork Juggernaut',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --60
        name='Clockwork King',
        hpGauge=2,
        skills={ 1, 5, 361 },
        stats={ 460, 0, 180, 160, 150, 145, 150, 155 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 0.75, 1.25 },
        growth={ 10, 0, 5.8, 5.5, 5.4, 5.4, 5.2, 5.3 },
        picture='Clockwork King',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --61
        name='Clockwork Queen',
        hpGauge=2,
        skills={ 2, 77, 362 },
        stats={ 420, 0, 160, 155, 190, 170, 170, 160 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 0.75, 1.25 },
        growth={ 9.6, 0, 5.4, 5.4, 5.8, 5.7, 5.6, 5.2 },
        picture='Clockwork Queen',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --62
        name='Clockwork Swordsman',
        hpGauge=2,
        skills={ 1, 19 },
        stats={ 220, 0, 175, 160, 150, 145, 165, 145 },
        elements={ 0.75, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 9.5, 0, 5.7, 5.5, 5.2, 5.3, 5.6, 5.3 },
        picture='Clockwork Knight B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --63
        name='Clockwork Fighter',
        hpGauge=2,
        skills={ 1, 25, 78 },
        stats={ 240, 0, 170, 190, 150, 180, 150, 160 },
        elements={ 1, 0.75, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 10, 0, 5.5, 5.8, 5.2, 5.8, 5.3, 5.6 },
        picture='Clockwork Knight C',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --64
        name='Clockwork Priest',
        hpGauge=2,
        skills={ 2, 77, 363 },
        stats={ 205, 0, 150, 160, 180, 175, 155, 145 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 9.4, 0, 5.3, 5.5, 5.9, 5.7, 5.3, 5.2 },
        picture='Clockwork Knight D',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --65
        name='Clockwork Lancer',
        hpGauge=2,
        skills={ 3, 364 },
        stats={ 225, 0, 170, 160, 150, 155, 165, 160 },
        elements={ 1, 1, 0.75, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 9.6, 0, 5.7, 5.5, 5.2, 5.5, 5.5, 5.6 },
        picture='Clockwork Prototype',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --66
        name='Huanglong',
        boss=true,
        hpGauge=3,
        skills={ 2, 77, 181, 365 },
        stats={ 2250, 0, 160, 150, 180, 150, 155, 160 },
        elements={ 1, 1, 1, 0.75, 0.75, 1.25, 1, 1.25, 1, 1, 1 },
        growth={ 78, 0, 5.5, 5.3, 5.7, 5.3, 5.1, 5.2 },
        picture='Boss Dragon Huanglong',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 10 == 0 then
                skillId = 4
            elseif battleManager.turn % 10 == 7 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, 
    { --70
        name='Ice Glacier',
        hpGauge=1,
        skills={ 2, 366 },
        stats={ 180, 0, 130, 150, 130, 150, 135, 145 },
        elements={ 1, 1.25, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 8.6, 0, 4.6, 5, 4.6, 5, 4.5, 4.8 },
        picture='Ice Glacier SPawn',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --71
        name='Ice Spike',
        hpGauge=1,
        skills={ 3, 367 },
        stats={ 160, 0, 145, 130, 140, 130, 140, 135 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 8.2, 0, 5, 4.5, 4.9, 4.5, 4.8, 4.6 },
        picture='Ice Spike',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --72
        name='Ice Whisp',
        hpGauge=1,
        skills={ 2, 86 },
        stats={ 155, 0, 135, 130, 150, 140, 135, 145 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 8.1, 0, 4.6, 4.5, 5.1, 4.8, 4.5, 4.9 },
        picture='Ice Whisp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --73
        name='Ice Bat',
        hpGauge=1,
        skills={ 2, 368 },
        stats={ 140, 0, 145, 130, 125, 130, 150, 150 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 0.75 },
        growth={ 7.8, 0, 4.9, 4.4, 4.3, 4.3, 4.9, 4.9 },
        picture='Ice Cave Bat',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --74
        name='Snowball',
        hpGauge=1,
        skills={ 2, 383, 366 },
        stats={ 160, 0, 145, 130, 145, 130, 130, 140 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 8.3, 0, 4.8, 4.5, 4.8, 4.5, 4.5, 4.8 },
        picture='Ice Snowball',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2, 3 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --75
        name='Ice Bird',
        hpGauge=2,
        skills={ 2, 368, 369 },
        stats={ 350, 0, 160, 140, 155, 140, 145, 140 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 0.75, 1, 1 },
        growth={ 9.4, 0, 5.2, 4.8, 5, 4.8, 4.9, 4.8 },
        picture='Ice Avian',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --76
        name='Ice Turtle',
        hpGauge=2,
        skills={ 2, 313, 366 },
        stats={ 410, 0, 140, 160, 140, 155, 140, 140 },
        elements={ 0.75, 1.25, 0.75, 1.25, 1, 0.75, 0.75, 1, 1, 1, 1 },
        growth={ 9.8, 0, 5, 5.4, 4.9, 5.3, 4.6, 4.8 },
        picture='Ice Turtle',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[4].value <= 0 then
                skillId = 2
            elseif battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --77
        name='Snobros',
        hpGauge=2,
        skills={ 2, 370 },
        stats={ 390, 0, 140, 140, 165, 145, 155, 155 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 9.4, 0, 4.8, 4.9, 5.4, 4.9, 5.2, 5.2 },
        picture='Ice Snobros',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --78
        name='Yeti',
        hpGauge=2,
        skills={ 1, 90, 371 },
        stats={ 500, 0, 160, 150, 140, 140, 145, 140 },
        elements={ 1, 0.75, 1, 1.25, 1, 0.75, 1, 1, 1, 1.25, 1 },
        growth={ 10, 0, 5.6, 5.4, 5.1, 5.1, 5, 4.9 },
        picture='Ice Yeti',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --79
        name='Snowman',
        hpGauge=2,
        skills={ 1, 180, 372 },
        stats={ 440, 0, 155, 140, 140, 145, 145, 155 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 9.6, 0, 5.5, 5.3, 5.2, 5.2, 5.1, 5.4 },
        picture='Ice Snowman',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --80
        name='Ice Lion',
        hpGauge=2,
        skills={ 1, 338, 373 },
        stats={ 460, 0, 155, 155, 140, 145, 145, 160 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 9, 0, 5.1, 5.1, 4.6, 4.9, 4.9, 5.2 },
        picture='Ice Lion',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() and enemy.statBuffs[3].value <= 0 then
                    skillId = 2
                    break
                end
            end

            if skillId ~= 2 and battleManager.turn % 3 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --81
        name='Ice Bull',
        hpGauge=2,
        skills={ 2, 335, 374 },
        stats={ 420, 0, 155, 160, 140, 145, 145, 160 },
        elements={ 1, 0.75, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 9.2, 0, 4.9, 5.2, 4.5, 4.7, 4.9, 5.2 },
        picture='Ice Bull',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            else
                local skills = { 1, 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --82
        name='Ice Ogre',
        hpGauge=2,
        skills={ 2, 375, 376, 377 },
        stats={ 800, 0, 190, 160, 180, 155, 160, 160 },
        elements={ 1, 0.75, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 21, 0, 5.8, 5.4, 5.6, 5.4, 5.4, 5.5 },
        picture='Ice Ogre',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --83
        name='Frost Orb',
        hpGauge=1,
        skills={ 2, 86 },
        stats={ 1000, 0, 140, 145, 170, 165, 140, 150 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 20, 0, 5.3, 5.5, 5.6, 5.5, 5.4, 5.4 },
        picture='Arcane Orb Frost',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --84
        name='Shiva',
        boss=true,
        hpGauge=3,
        skills={ 2, 86, 327, 378 },
        stats={ 1550, 0, 145, 150, 180, 165, 150, 160 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 60, 0, 5.4, 5.4, 5.8, 5.6, 5.3, 5.4 },
        picture='Megapack III Elemental Lords Ice Maiden',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 10 == 0 then
                skillId = 4
            elseif battleManager.turn % 10 == 4 or battleManager.turn % 10 == 8 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil,
    { --90
        name='Seahorse',
        hpGauge=1,
        skills={ 3, 379 },
        stats={ 160, 0, 130, 135, 140, 140, 140, 140 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.6, 0, 4.5, 4.6, 4.9, 4.8, 5, 4.9 },
        picture='Sea Horse',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --91
        name='Octi',
        hpGauge=1,
        skills={ 2, 380 },
        stats={ 180, 0, 135, 130, 135, 130, 135, 140 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 8, 0, 4.8, 4.4, 4.8, 4.4, 4.5, 4.7 },
        picture='Sea Octi',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self:hpRate() <= 0.5 and battleManager.turn % 2 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, 
    { --92
        name='Shelltacke',
        hpGauge=1,
        skills={ 2, 332 },
        stats={ 170, 0, 145, 135, 130, 130, 140, 130 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.8, 0, 5.1, 4.4, 4.5, 4.3, 4.7, 4.4 },
        picture='Sea Shelltacke',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --93
        name='Sunfish',
        hpGauge=1,
        skills={ 2, 318 },
        stats={ 200, 0, 135, 145, 135, 145, 135, 135 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 8.1, 0, 4.6, 4.9, 4.6, 4.9, 4.5, 4.6 },
        picture='Sea Fish A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --94
        name='Headfish',
        hpGauge=1,
        skills={ 2, 96 },
        stats={ 160, 0, 130, 135, 150, 140, 140, 140 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.7, 0, 4.5, 4.6, 5, 4.7, 4.8, 4.7 },
        picture='Sea Fish B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --95
        name='Tailfish',
        hpGauge=1,
        skills={ 2, 381 },
        stats={ 160, 0, 150, 140, 135, 135, 145, 140 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.7, 0, 5, 4.7, 4.5, 4.6, 4.8, 4.7 },
        picture='Sea Fish C',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --96
        name='Piranos',
        hpGauge=1,
        skills={ 2, 382 },
        stats={ 160, 0, 150, 135, 140, 135, 140, 150 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.6, 0, 5.2, 4.6, 4.8, 4.6, 5, 5.1 },
        picture='Sea Piranos',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --97
        name='Sea Horntle',
        hpGauge=1,
        skills={ 3, 384 },
        stats={ 180, 0, 140, 135, 130, 135, 130, 135 },
        elements={ 0.75, 1.25, 0.75, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 8, 0, 5, 4.7, 4.5, 4.7, 4.4, 4.5 },
        picture='Sea Horntle',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --98
        name='Sea Turtle',
        hpGauge=1,
        skills={ 2, 318 },
        stats={ 180, 0, 135, 140, 130, 140, 130, 135 },
        elements={ 0.75, 1.25, 0.75, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 8, 0, 4.7, 4.8, 4.5, 4.8, 4.4, 4.5 },
        picture='Sea Turtle',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --99
        name='Sea Tortoad',
        hpGauge=1,
        skills={ 2, 96 },
        stats={ 170, 0, 135, 135, 150, 145, 135, 135 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.9, 0, 4.6, 4.8, 5, 4.9, 4.5, 4.4 },
        picture='Sea Tortoad',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --100
        name='Seagull',
        hpGauge=1,
        skills={ 3, 385 },
        stats={ 180, 0, 140, 135, 135, 135, 140, 140 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 0.75, 1, 1 },
        growth={ 8.1, 0, 4.9, 4.4, 4.6, 4.4, 4.8, 4.7 },
        picture='Sea Beach Seagull',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --101
        name='Octopus',
        hpGauge=2,
        skills={ 2, 380, 386 },
        stats={ 420, 0, 160, 145, 160, 150, 140, 155 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 10, 0, 5.1, 4.7, 5.1, 4.7, 4.8, 5 },
        picture='Sea Octopus',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self:hpRate() <= 0.25 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --102
        name='Jellyfish',
        hpGauge=2,
        skills={ 3, 387 },
        stats={ 390, 0, 180, 140, 140, 140, 160, 155 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 9.6, 0, 5.4, 4.6, 4.7, 4.4, 5.1, 5.1 },
        picture='Sea Jellyfish',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --103
        name='Pelican',
        hpGauge=2,
        skills={ 3, 385, 388 },
        stats={ 440, 0, 165, 140, 165, 140, 145, 145 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 0.75, 1, 1 },
        growth={ 10.2, 0, 5.2, 4.7, 5.1, 4.7, 4.6, 4.6 },
        picture='Sea Beach Pelican',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2, 3 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --104
        name='Abismos',
        hpGauge=2,
        skills={ 1, 95, 389 },
        stats={ 420, 0, 180, 160, 150, 150, 150, 165 },
        elements={ 0.75, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 9.8, 0, 5.7, 5.5, 5.2, 5.3, 5.4, 5.6 },
        picture='Sea Abismos',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            elseif battleManager.turn % 4 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --105
        name='Mermaid',
        hpGauge=2,
        skills={ 3, 96, 323, 390 },
        stats={ 410, 0, 160, 155, 175, 165, 145, 170 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 9.7, 0, 5.5, 5.3, 5.6, 5.4, 5.2, 5.7 },
        picture='Sea Mermaid Warrior Sion',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 5 == 1 then
                skillId = 4
            elseif battleManager.turn % 5 == 2 and math.random() < 0.5 then
                skillId = 3
            elseif battleManager.turn % 5 == 4 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --106
        name='Shark',
        hpGauge=2,
        skills={ 2, 180, 391 },
        stats={ 390, 0, 200, 140, 180, 140, 180, 145 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 9.5, 0, 5.9, 5.1, 5.4, 5, 5.8, 5 },
        picture='Sea Shark',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --107
        name='Sea Golem',
        hpGauge=2,
        skills={ 2, 392, 393 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 1, 1.25, 1, 0.75, 0.75, 1, 1, 1 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Sea Beach Turtle Golem',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --108
        name='Pisces',
        boss=true,
        hpGauge=3,
        skills={ 2, 382, 391, 394, 395 },
        stats={ 2250, 0, 180, 155, 175, 155, 170, 160 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 76, 0, 5.7, 4.8, 3.8, 5.6, 5.2, 5.4, 5.3 },
        picture='Zodiac Creatures Pisces',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 12 == 0 then
                skillId = 5
            elseif battleManager.turn % 12 == 4 or battleManager.turn % 12 == 8 then
                skillId = 4
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil,
    { --115
        name='Earth Imp',
        hpGauge=1,
        skills={ 3, 112 },
        stats={ 160, 0, 135, 130, 145, 140, 130, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1.25, 0.75 },
        growth={ 7.7, 0, 4.4, 4.3, 4.6, 4.5, 4.3, 4.5 },
        picture='Earth Leaf Imp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --116
        name='Earth Snake',
        hpGauge=1,
        skills={ 2, 332, 396 },
        stats={ 150, 0, 140, 135, 135, 130, 140, 145 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 8, 0, 4.6, 4.5, 4.6, 4.5, 4.8, 4.9 },
        picture='Earth Snake',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --117
        name='Earth Wisp',
        hpGauge=1,
        skills={ 2, 111 },
        stats={ 150, 0, 135, 130, 140, 140, 135, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 8, 0, 4.4, 4.4, 4.6, 4.8, 4.3, 4.6 },
        picture='Earth Wisp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --118
        name='Earth Bush',
        hpGauge=1,
        skills={ 2, 111, 315 },
        stats={ 170, 0, 135, 145, 135, 145, 130, 135 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 8.4, 0, 4.5, 4.7, 4.5, 4.7, 4.3, 4.4 },
        picture='Earth Bush Wisp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2, 3 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --119
        name='Earth Turtle',
        hpGauge=2,
        skills={ 2, 313, 315 },
        stats={ 410, 0, 140, 160, 140, 155, 140, 140 },
        elements={ 0.75, 1.25, 0.75, 1, 1, 1, 0.75, 0.75, 1.25, 1, 1 },
        growth={ 9.8, 0, 5, 5.4, 4.9, 5.3, 4.6, 4.8 },
        picture='Earth Turtle',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[4].value <= 0 then
                skillId = 2
            elseif battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --120
        name='Earth Spawn',
        hpGauge=2,
        skills={ 2, 397 },
        stats={ 400, 0, 170, 150, 135, 135, 140, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 9.6, 0, 5.4, 5.2, 4.8, 4.8, 4.9, 5.1 },
        picture='Earth Spawn',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --121
        name='Earth Mandrake',
        hpGauge=2,
        skills={ 2, 111, 398 },
        stats={ 340, 0, 140, 140, 170, 160, 140, 155 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 0.75, 1.25, 1, 1 },
        growth={ 9.2, 0, 4.8, 4.9, 5.4, 5.3, 5.1, 5.2 },
        picture='Earth Mandrake',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self:hpRate() <= 0.5 and battleManager.turn % 2 == 0 then
                skillId = 3
            elseif battleManager.turn % 2 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --122
        name='Cave Dragon',
        hpGauge=2,
        skills={ 2, 399, 400 },
        stats={ 460, 0, 150, 155, 170, 160, 145, 140 },
        elements={ 1, 1, 1, 0.75, 1, 1.25, 1, 0.75, 1.25, 1, 1 },
        growth={ 9.4, 0, 5.2, 5.2, 5.5, 5.2, 5, 4.9 },
        picture='Cave Dweller Blind Dragon',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --123
        name='Earth Bull',
        hpGauge=2,
        skills={ 2, 335, 401 },
        stats={ 420, 0, 155, 160, 140, 145, 145, 160 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 9.2, 0, 4.9, 5.2, 4.5, 4.7, 4.9, 5.2 },
        picture='Earth Bull',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 2
            else
                local skills = { 1, 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --124
        name='Earth Lion',
        hpGauge=2,
        skills={ 1, 338, 402 },
        stats={ 460, 0, 155, 155, 140, 145, 145, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 9, 0, 5.1, 5.1, 4.6, 4.9, 4.9, 5.2 },
        picture='Earth Lion',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() and enemy.statBuffs[3].value <= 0 then
                    skillId = 2
                    break
                end
            end

            if skillId ~= 2 and battleManager.turn % 3 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --125
        name='Cave Worm',
        hpGauge=2,
        skills={ 2, 403, 404 },
        stats={ 890, 0, 190, 150, 170, 140, 175, 135 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 24, 0, 5.9, 5.4, 5.5, 5.3, 5.7, 5.3 },
        picture='Cave Dweller Worm',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --126
        name='Rock Golem',
        hpGauge=2,
        skills={ 2, 397, 405 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Earth Rock Golem',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --127
        name='Earth Gemstone',
        hpGauge=1,
        skills={ 2, 111, 406 },
        stats={ 800, 0, 150, 160, 180, 180, 150, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 21, 0, 5.4, 5.6, 6, 5.9, 5.5, 5.3 },
        picture='Elemental Gemstone Earth',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 10 == 4 then
                skillId = 3
            elseif battleManager.turn % 10 == 8 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --128
        name='Daidarabotchi',
        boss=true,
        hpGauge=3,
        skills={ 2, 397, 405, 407 },
        stats={ 1800, 0, 175, 170, 155, 165, 150, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 64, 0, 5.6, 5.6, 5.4, 5.5, 5.1, 5.4 },
        picture='Boss Daidarabotchi',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 10 == 0 then
                skillId = 4
            elseif battleManager.turn % 10 == 5 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId

        end
    }, nil, nil, nil, nil, nil, nil,
    { --135
        name='Wind Bunny',
        hpGauge=1,
        skills={ 2, 408 },
        stats={ 150, 0, 140, 135, 120, 130, 155, 150 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 8, 0, 4.8, 4.5, 4.1, 4.3, 5.1, 5 },
        picture='Wind Bunny',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --136
        name='Wind Razor',
        hpGauge=1,
        skills={ 1, 409 },
        stats={ 170, 0, 150, 140, 130, 135, 135, 130 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 8, 0, 5.1, 4.4, 4.7, 4.3, 4.5, 4.4 },
        picture='Wind Feathered Razor',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --137
        name='Wind Snake',
        hpGauge=1,
        skills={ 2, 332, 410 },
        stats={ 150, 0, 140, 135, 135, 130, 140, 145 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 8, 0, 4.6, 4.5, 4.6, 4.5, 4.8, 4.9 },
        picture='Wind Snake',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --138
        name='Wind Fairy',
        hpGauge=1,
        skills={ 2, 120, 125 },
        stats={ 210, 0, 135, 140, 155, 150, 140, 140 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 0.75, 1.25 },
        growth={ 9.2, 0, 4.5, 4.6, 4.8, 4.7, 4.5, 4.6 },
        picture='Wind Fairy',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --139
        name='Wind Wisp',
        hpGauge=1,
        skills={ 2, 120 },
        stats={ 150, 0, 135, 130, 140, 140, 135, 140 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 8, 0, 4.4, 4.4, 4.6, 4.8, 4.3, 4.6 },
        picture='Wind Wisp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --140
        name='Wind Spawn',
        hpGauge=2,
        skills={ 2, 126, 417 },
        stats={ 400, 0, 145, 140, 170, 150, 150, 140 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 9.6, 0, 5.1, 5.1, 5.5, 5.3, 5.4, 5 },
        picture='Wind Spawn',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            elseif not self.buffs[4] then
                skillId = 3
                for i = 1, #battleManager.currentEnemies do
                    if battleManager.currentEnemies[i] == self then
                        targetId = i
                        break
                    end
                end
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --141
        name='Wind Harpy',
        hpGauge=2,
        skills={ 1, 411, 412 },
        stats={ 440, 0, 165, 150, 160, 145, 150, 155 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 9.8, 0, 5.5, 5.3, 5.4, 5.3, 5.4, 5.3 },
        picture='Wind Harpy',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2, 3 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --142
        name='Wind Mantis',
        hpGauge=2,
        skills={ 1, 413, 417 },
        stats={ 430, 0, 180, 145, 160, 140, 150, 145 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 9.7, 0, 5.8, 5.3, 5.4, 5.2, 5.3, 5.2 },
        picture='Wind Mantis',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                skillId = 2
            elseif not self.buffs[4] then
                skillId = 3
                for i = 1, #battleManager.currentEnemies do
                    if battleManager.currentEnemies[i] == self then
                        targetId = i
                        break
                    end
                end
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --143
        name='Wind Lion',
        hpGauge=2,
        skills={ 1, 338, 414 },
        stats={ 460, 0, 155, 155, 140, 145, 145, 160 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 9, 0, 5.1, 5.1, 4.6, 4.9, 4.9, 5.2 },
        picture='Wind Lion',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() and enemy.statBuffs[3].value <= 0 then
                    skillId = 2
                    break
                end
            end

            if skillId ~= 2 and battleManager.turn % 3 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --144
        name='Wind Bird',
        hpGauge=2,
        skills={ 2, 411, 412 },
        stats={ 350, 0, 160, 140, 155, 140, 145, 140 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 9.4, 0, 5.2, 4.8, 5, 4.8, 4.9, 4.8 },
        picture='Wind Avian',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --145
        name='Wind Golem',
        hpGauge=2,
        skills={ 2, 415, 416 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Wind Feathered Golem',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --146
        name='Wind Orb',
        hpGauge=1,
        skills={ 2, 120, 417 },
        stats={ 800, 0, 150, 160, 180, 170, 140, 135 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 21, 0, 5.4, 5.6, 6, 5.9, 5.5, 5.3 },
        picture='Arcane Orb Wind',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 9 == 6 then
                skillId = 3
                targetId = 1
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --147
        name='Ventoss',
        boss=true,
        hpGauge=3,
        skills={ 3, 418, 419, 420 },
        stats={ 1700, 0, 160, 165, 180, 170, 165, 160 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 63, 0, 5.4, 5.5, 5.8, 5.6, 5.4, 5.4 },
        picture='Boss Wind Titan Ventoss',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 9 == 0 then
                skillId = 4
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil, nil,
    { --155
        name='Light Slime',
        hpGauge=1,
        skills={ 2, 421 },
        stats={ 165, 0, 140, 140, 130, 135, 140, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 8.2, 0, 4.8, 4.7, 4.3, 4.4, 4.4, 4.8 },
        picture='Light Slime',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --156
        name='Light Snake',
        hpGauge=1,
        skills={ 2, 332, 422 },
        stats={ 150, 0, 140, 135, 135, 130, 140, 145 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 8, 0, 4.6, 4.5, 4.6, 4.5, 4.8, 4.9 },
        picture='Light Snake',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --157
        name='Light Wisp',
        hpGauge=1,
        skills={ 2, 137 },
        stats={ 150, 0, 135, 130, 140, 140, 135, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 8, 0, 4.4, 4.4, 4.6, 4.8, 4.3, 4.6 },
        picture='Light Wisp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --158
        name='Light Gem',
        hpGauge=1,
        skills={ 2, 137, 423, 424 },
        stats={ 160, 0, 135, 135, 140, 135, 140, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 8.1, 0, 4.4, 4.4, 4.6, 4.4, 4.4, 4.4 },
        picture='Light Gemstone A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2, 3, 4 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --159
        name='Light Eye',
        hpGauge=2,
        skills={ 2, 187 },
        stats={ 460, 0, 145, 175, 145, 175, 145, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 10, 0, 5.2, 5.6, 5.2, 5.6, 5.2, 5.2 },
        picture='Light Creatures Throne',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if not self.buffs[7] then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --160
        name='Light Scholar',
        hpGauge=2,
        skills={ 2, 137, 165, 202, 425 },
        stats={ 360, 0, 140, 145, 160, 150, 140, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 9.2, 0, 5, 5.2, 5.4, 5.4, 5.3, 5.4 },
        picture='Light Scholar Angel',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            local summon = battleManager.currentEnemies[1]
            if not summon:isDead() then
                if summon:hpRate() <= 0.5 and battleManager.turn % 2 == 0 then
                    skillId = 3
                    targetId = 1
                elseif summon.statBuffs[3].value <= 0 then
                    skillId = 5
                    targetId = 1
                elseif summon.statBuffs[4].value <= 0 or summon.statBuffs[6].value <= 0 then
                    skillId = 4
                    targetId = 1
                else
                    local skills = { 1, 2 }
                    skillId = skills[math.floor(math.random() * #skills) + 1]
                end
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
            
        end
    },
    { --161
        name='Light Summon',
        hpGauge=2,
        skills={ 2, 421, 426 },
        stats={ 480, 0, 165, 150, 140, 150, 140, 135 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 10.3, 0, 5.6, 5.4, 5.2, 5.4, 5.1, 5.1 },
        picture='Light Summoned Angel',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --162
        name='Light Wolf',
        hpGauge=2,
        skills={ 1, 427, 428 },
        stats={ 380, 0, 165, 150, 140, 140, 155, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 9.4, 0, 5.5, 5.3, 5.2, 5.2, 5.4, 5.5 },
        picture='Light Wolf',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --163
        name='Holy Orb',
        hpGauge=2,
        skills={ 2, 137, 165, 429 },
        stats={ 440, 0, 150, 165, 170, 165, 140, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 9.9, 0, 5.2, 5.4, 5.5, 5.4, 5.2, 5.2 },
        picture='Light Holy Orb',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() then
                    if enemy.statBuffs[4].value <= 0 or enemy.statBuffs[6].value <= 0 then
                        skillId = 4
                        targetId = 0
                        break
                    elseif enemy:hpRate() <= 0.25 then
                        skillId = 3
                        targetId = i
                    end
                end
            end

            if skillId ~= 1 then
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --164
        name='Light Knight',
        hpGauge=2,
        skills={ 3, 430, 431 },
        stats={ 500, 0, 190, 170, 150, 160, 155, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 11, 0, 5.8, 5.6, 5.2, 5.3, 5.5, 5.5 },
        picture='Light Angel Knight',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --165
        name='Light Maiden',
        hpGauge=2,
        skills={ 2, 137, 432 },
        stats={ 460, 0, 155, 160, 190, 180, 170, 165 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 10.6, 0, 5.4, 5.5, 5.8, 5.7, 5.6, 5.5 },
        picture='Light Angel Maiden',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --166
        name='Light Dragon',
        hpGauge=2,
        skills={ 2, 433, 434 },
        stats={ 900, 0, 160, 175, 180, 175, 160, 165 },
        elements={ 1, 1, 1, 0.75, 1, 1.25, 1, 1, 1, 0.75, 1.25 },
        growth={ 22, 0, 5.5, 5.6, 5.7, 5.6, 5.3, 5.3 },
        picture='Light Dragon',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --167
        name='Novus',
        boss=true,
        hpGauge=2,
        skills={ 2, 435, 436, 437 },
        stats={ 1200, 0, 190, 170, 150, 160, 165, 155 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 44, 0, 5.8, 5.6, 5.3, 5.5, 5.5, 5.4 },
        picture='Boss God Novus',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 9 == 0 then
                if battleManager.currentEnemies[2]:isDead() then
                    skillId = 4
                elseif math.random() < 0.5 then
                    skillId = 4
                else
                    local skills = { 1, 2 }
                    skillId = skills[math.floor(math.random() * #skills) + 1]
                end
            elseif battleManager.turn % 3 == 0 then
                if battleManager.currentEnemies[2]:isDead() then
                    skillId = 3
                elseif math.random() < 0.5 then
                    skillId = 3
                else
                    local skills = { 1, 2 }
                    skillId = skills[math.floor(math.random() * #skills) + 1]
                end
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --168
        name='Innova',
        boss=true,
        hpGauge=2,
        skills={ 2, 137, 141, 438 },
        stats={ 1000, 0, 160, 160, 190, 180, 155, 165 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 39, 0, 5.4, 5.5, 5.8, 5.7, 5.4, 5.5 },
        picture='Boss Goddess Innova',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 9 == 0 then
                if battleManager.currentEnemies[1]:isDead() then
                    skillId = 4
                elseif battleManager.currentEnemies[1].inputSkill ~= 4 then
                    skillId = 4
                else
                    local skills = { 1, 2 }
                    skillId = skills[math.floor(math.random() * #skills) + 1]
                end
            elseif battleManager.turn % 3 == 0 then
                if battleManager.currentEnemies[1]:isDead() then
                    skillId = 3
                elseif battleManager.currentEnemies[1].inputSkill ~= 3 then
                    skillId = 3
                else
                    local skills = { 1, 2 }
                    skillId = skills[math.floor(math.random() * #skills) + 1]
                end
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil,
    { --175
        name='Devilimp',
        hpGauge=1,
        skills={ 3, 439 },
        stats={ 160, 0, 135, 130, 145, 140, 130, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 7.7, 0, 4.4, 4.3, 4.6, 4.5, 4.3, 4.5 },
        picture='Darkness Devilimp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --176
        name='Darkness Wisp',
        hpGauge=1,
        skills={ 2, 150 },
        stats={ 150, 0, 135, 130, 140, 140, 135, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 8, 0, 4.4, 4.4, 4.6, 4.8, 4.3, 4.6 },
        picture='Darkness Wisp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --177
        name='Darkness Slime',
        hpGauge=1,
        skills={ 2, 440 },
        stats={ 165, 0, 140, 140, 130, 135, 140, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 8.2, 0, 4.8, 4.7, 4.3, 4.4, 4.4, 4.8 },
        picture='Darkness Slime',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --178
        name='Reaper',
        hpGauge=2,
        skills={ 1, 441, 442 },
        stats={ 420, 0, 170, 150, 150, 140, 160, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.1, 0, 5.5, 5.3, 5.2, 5.2, 5.4, 5.4 },
        picture='Darkness Reaper',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --179
        name='Imp',
        hpGauge=2,
        skills={ 3, 157, 443  },
        stats={ 420, 0, 165, 140, 165, 140, 150, 155 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.1, 0, 5.5, 5.2, 5.5, 5.2, 5.3, 5.4 },
        picture='Darkness Imp',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --180
        name='GhastMallow',
        hpGauge=2,
        skills={ 2, 159, 440  },
        stats={ 460, 0, 155, 170, 155, 170, 145, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.6, 0, 5.3, 5.6, 5.3, 5.6, 5.1, 5.4 },
        picture='Darkness Slime GhastMallow',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            else 
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --181
        name='Dullahan',
        hpGauge=2,
        skills={ 1, 150, 444 },
        stats={ 460, 0, 160, 160, 160, 160, 145, 145 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.5, 0, 5.4, 5.4, 5.4, 5.4, 5.3, 5.3 },
        picture='Darkness Dullahan',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2, 3 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --182
        name='Succubus',
        hpGauge=2,
        skills={ 1, 445, 446 },
        stats={ 430, 0, 165, 140, 165, 140, 160, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.3, 0, 5.5, 5.3, 5.5, 5.3, 5.4, 5.4 },
        picture='Darkness Succubus',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --183
        name='Reaper Angel',
        hpGauge=2,
        skills={ 1, 442, 444 },
        stats={ 480, 0, 170, 150, 160, 145, 150, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 10.2, 0, 5.7, 5.4, 5.2, 5.3, 5.3, 5.4 },
        picture='Darkness Angel Reaper',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 2
            else 
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --184
        name='Darkness Angel',
        hpGauge=2,
        skills={ 1, 444, 447 },
        stats={ 460, 0, 165, 145, 155, 145, 160, 165 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 9.8, 0, 5.7, 5.4, 5.2, 5.3, 5.5, 5.6 },
        picture='Darkness Angel',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 2 then
                skillId = 3
            else 
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --185
        name='Darkness Behemoth',
        hpGauge=2,
        skills={ 2, 440, 448 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Darkness Behemoth',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --186
        name='Mage Cultist',
        hpGauge=2,
        skills={ 2, 150, 449 },
        stats={ 500, 0, 150, 160, 175, 170, 150, 165 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 10.4, 0, 5.3, 5.4, 5.6, 5.6, 5.3, 5.4 },
        picture='Darkness Cultist Mage',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --187
        name='Darkness Flame',
        hpGauge=2,
        skills={ 2, 150, 343, 450 },
        stats={ 460, 0, 145, 150, 190, 160, 175, 155 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1.25, 0.75 },
        growth={ 9.8, 0, 5.2, 5.3, 5.8, 5.5, 5.6, 5.3 },
        picture='Darkness Flame',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 4
            elseif math.random() < 0.5 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --188
        name='Shaccad\'Yoggoth',
        boss=true,
        hpGauge=3,
        skills={ 2, 440, 451, 452 },
        stats={ 2400, 0, 180, 150, 155, 140, 150, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 76, 0, 5.7, 5.3, 5.4, 5.3, 5.3, 5.5 },
        picture='Boss Eldritch God Shaccad\'Yoggoth',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 8 == 0 then
                skillId = 4
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil,
    { --195
        name='Blue Flower',
        hpGauge=1,
        skills={ 2, 453, 86, 96 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 1, 1, 1, 1.25, 1.25, 0.75, 0.75, 1, 1, 1, 1 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest Blue Flower',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[5].value <= 0 and math.random() < 0.5 then
                skillId = 2
            elseif math.random() < 0.5 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --196
        name='Pink Flower',
        hpGauge=1,
        skills={ 2, 453, 454, 455 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1, 1, 1, 1, 1.25, 1.25 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest Pink Flower',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 and math.random() < 0.5 then
                skillId = 2
            elseif math.random() < 0.5 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --197
        name='Red Flower',
        hpGauge=1,
        skills={ 2, 453, 343, 77 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 1, 1, 1, 0.75, 0.75, 1.25, 1, 1, 1, 1, 1 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest Red Flower',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[5].value <= 0 and math.random() < 0.5 then
                skillId = 2
            elseif math.random() < 0.5 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --198
        name='White Flower',
        hpGauge=1,
        skills={ 2, 453, 456, 137 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest White Flower',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if (self.statBuffs[3].value <= 0 or self.statBuffs[5].value <= 0) and math.random() < 0.5 then
                skillId = 2
            elseif math.random() < 0.5 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --199
        name='Darkluff',
        hpGauge=1,
        skills={ 1, 150 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest Darkluff',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --200
        name='Mobun',
        hpGauge=1,
        skills={ 2, 77 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest Mobun',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --201
        name='Noxluff',
        hpGauge=1,
        skills={ 1, 120 },
        stats={ 140, 0, 135, 135, 135, 135, 135, 135 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 7.6, 0, 4.4, 4.4, 4.4, 4.4, 4.4, 4.4 },
        picture='Forest Noxluff',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --202
        name='Kawabun',
        hpGauge=1,
        skills={ 2, 457, 458 },
        stats={ 180, 0, 130, 140, 140, 140, 130, 130 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25 },
        growth={ 8, 0, 4.2, 4.6, 4.5, 4.6, 4.2, 4.3 },
        picture='Forest Kawabun',
        startInput=function(self, battleManager)
            --ai to get skill + target--ai to get skill + target
            local skillId = 1
            local targetId = 0

            for i = 1, #battleManager.currentEnemies do
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() then
                    if battleManager.turn % 2 == 1 and enemy:hpRate() <= 0.25 then
                        skillId = 3
                        break
                    elseif enemy.statBuffs[4].value <= 0 or enemy.statBuffs[6].value <= 0 then
                        skillId = 2
                        break
                    end
                end
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --203
        name='Mushroom',
        hpGauge=1,
        skills={ 2, 459 },
        stats={ 240, 0, 135, 150, 145, 140, 135, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1, 1, 1 },
        growth={ 8.4, 0, 4.4, 5, 5, 4.8, 4.6, 4.8 },
        picture='Forest Shroom',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --204
        name='Shroomy',
        hpGauge=1,
        skills={ 2, 460 },
        stats={ 220, 0, 150, 135, 135, 130, 140, 135 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1, 1, 1 },
        growth={ 8.1, 0, 5, 4.4, 4.5, 4.4, 4.8, 4.5 },
        picture='Forest Shroomy',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --205
        name='Carnivore Plant',
        hpGauge=1,
        skills={ 2, 461, 462 },
        stats={ 240, 0, 150, 135, 140, 135, 140, 150 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 0.75, 1, 1, 1 },
        growth={ 8.1, 0, 5.1, 4.4, 4.6, 4.4, 4.7, 5 },
        picture='Toxic Carnivorous Plant A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --206
        name='Sprout',
        hpGauge=1,
        skills={ 2, 316 },
        stats={ 260, 0, 140, 145, 135, 140, 135, 140 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 0.75, 0.75, 1, 1 },
        growth={ 8.4, 0, 4.9, 5.1, 4.6, 5, 4.6, 4.8 },
        picture='Forest Sprout',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --207
        name='Fairy',
        hpGauge=2,
        skills={ 2, 165, 200, 423 },
        stats={ 340, 0, 140, 150, 160, 160, 155, 140 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1, 1 },
        growth={ 9.2, 0, 4.7, 4.8, 5, 5.1, 4.9, 4.7 },
        picture='Forest Fairy Filia',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            local dragon = battleManager.currentEnemies[1]
            if not dragon:isDead() then
                if dragon:hpRate() <= 0.5 and battleManager.turn % 2 == 1 then
                    skillId = 2
                    targetId = 1
                elseif dragon.statBuffs[3].value <= 0 or dragon.statBuffs[5].value <= 0 then
                    skillId = 3
                    targetId = 1
                else
                    local skills = { 1, 4 }
                    skillId = skills[math.floor(math.random() * #skills) + 1]
                end
            elseif self:hpRate() <= 0.5 and battleManager.turn % 2 == 1 then
                skillId = 2
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --208
        name='Fairy Dragon',
        hpGauge=2,
        skills={ 1, 463, 464 },
        stats={ 480, 0, 160, 150, 160, 150, 140, 140 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 0.75, 0.75, 1, 1 },
        growth={ 10.4, 0, 5, 4.7, 5, 4.7, 4.3, 4.4 },
        picture='Forest Fairy Dragon Xinbal',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --209
        name='Spora',
        hpGauge=2,
        skills={ 2, 465, 467 },
        stats={ 400, 0, 140, 145, 160, 145, 140, 155 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1, 1, 1 },
        growth={ 10, 0, 4.6, 4.7, 5, 4.7, 4.6, 4.9 },
        picture='Forest Spora',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 6 == 3 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --210
        name='Uzu',
        hpGauge=2,
        skills={ 2, 466, 467 },
        stats={ 400, 0, 140, 145, 160, 145, 140, 155 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1, 1, 1 },
        growth={ 10, 0, 4.6, 4.7, 5, 4.7, 4.6, 4.9 },
        picture='Forest Uzu',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 6 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --211
        name='Threehead Plant',
        hpGauge=2,
        skills={ 2, 468 },
        stats={ 400, 0, 170, 140, 150, 140, 160, 155 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 0.75, 1, 1, 1 },
        growth={ 9.8, 0, 5.4, 4.8, 5.2, 4.8, 5.3, 5.2 },
        picture='Toxic Carnivorous Plant C',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --212
        name='Forest Golem',
        hpGauge=2,
        skills={ 2, 469, 470 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 1.25, 1, 1, 1, 0.75, 0.75, 1, 1 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Forest Golem',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --213
        name='Forest Deer',
        hpGauge=2,
        skills={ 2, 182, 471 },
        stats={ 460, 0, 180, 160, 165, 160, 190, 155 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 10.9, 0, 5.6, 5.4, 5.4, 5.4, 5.8, 5.2 },
        picture='Forest Deer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[7].value <= 0 then
                skillId = 2
            elseif battleManager.turn % 4 == 2 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --214
        name='Forest Panda',
        hpGauge=2,
        skills={ 2, 25, 33, 180 },
        stats={ 500, 0, 165, 180, 160, 180, 155, 170 },
        elements={ 0.75, 0.75, 0.75, 1, 1.25, 1, 1, 1, 1, 1, 1 },
        growth={ 11.4, 0, 5.4, 5.8, 5.3, 5.8, 5.2, 5.6 },
        picture='Forest Panda',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if self.statBuffs[3].value <= 0 then
                skillId = 4
            elseif battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --215
        name='Forest Tree',
        hpGauge=2,
        skills={ 2, 472, 473 },
        stats={ 550, 0, 160, 180, 160, 180, 155, 180 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 0.75, 0.75, 1, 0.75 },
        growth={ 11.6, 0, 5.3, 5.8, 5.3, 5.8, 5.2, 5.8 },
        picture='Forest Tree',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 1 then
                skillId = 2
            elseif battleManager.turn % 4 == 3 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --216
        name='Yggdrasil',
        hpGauge=2,
        skills={ 1, 474, 475 },
        stats={ 820, 0, 180, 170, 160, 165, 175, 165 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 0.75, 0.75, 1, 1 },
        growth={ 22, 0, 5.8, 5.4, 5.3, 5.4, 5.7, 5.5 },
        picture='Boss Dryad Yggdrasil',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --217
        name='Queen Rafflesia',
        boss=true,
        hpGauge=3,
        skills={ 2, 476, 467, 477 },
        stats={ 1700, 0, 170, 170, 185, 170, 160, 160 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 0.75, 0.75, 1, 1 },
        growth={ 56, 0, 5.6, 5.5, 5.7, 5.5, 5.4, 5.3 },
        picture='Boss Dryad Queen Rafflesia',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil, nil,
    { --225
        name='Eyehopper',
        hpGauge=1,
        skills={ 2, 310 },
        stats={ 190, 0, 150, 135, 125, 130, 135, 130 },
        elements={ 0.75, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 8, 0, 4.8, 4.6, 4.3, 4.4, 4.4, 4.3 },
        picture='Insects eyehopper',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --226
        name='Grasshopper',
        hpGauge=1,
        skills={ 2, 478, 479 },
        stats={ 170, 0, 140, 135, 125, 130, 140, 140 },
        elements={ 0.75, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 7.8, 0, 4.6, 4.5, 4.3, 4.4, 4.8, 4.8 },
        picture='Forest Grasshopper',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if not self.buffs[4] then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --227
        name='Waterstrider',
        hpGauge=1,
        skills={ 2, 480 },
        stats={ 160, 0, 130, 130, 140, 135, 140, 135 },
        elements={ 0.75, 1.25, 0.75, 1, 1, 1, 0.75, 1, 1, 1, 1 },
        growth={ 7.6, 0, 4.4, 4.4, 4.7, 4.5, 4.6, 4.4 },
        picture='Insects Waterstrider',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --228
        name='Ant Lion',
        hpGauge=1,
        skills={ 2, 187, 481 },
        stats={ 260, 0, 135, 150, 130, 145, 135, 135 },
        elements={ 0.75, 1, 0.75, 1.25, 1, 1, 1, 0.75, 1, 1, 1 },
        growth={ 8.4, 0, 4.5, 4.9, 4.4, 4.8, 4.4, 4.4 },
        picture='Insects Ant Lion',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if not self.buffs[7] then
                skillId = 2
            elseif battleManager.turn % 2 == 1 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --229
        name='Fire Ant',
        hpGauge=1,
        skills={ 2, 482, 483 },
        stats={ 220, 0, 150, 130, 140, 130, 145, 140 },
        elements={ 0.75, 1.25, 0.75, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 7.8, 0, 5, 4.4, 4.8, 4.4, 4.8, 4.7 },
        picture='Insects Fire Ant',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --230
        name='Roach',
        hpGauge=1,
        skills={ 2, 187 },
        stats={ 160, 0, 135, 130, 130, 130, 150, 150 },
        elements={ 0.75, 1.25, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 1.25, 0.75 },
        growth={ 7.7, 0, 4.6, 4.6, 4.4, 4.5, 4.9, 4.9 },
        picture='Insects Roach',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if not self.buffs[7] then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --231
        name='Tick',
        hpGauge=1,
        skills={ 2, 484 },
        stats={ 180, 0, 135, 140, 130, 140, 135, 140 },
        elements={ 0.75, 1.25, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 0.75, 1.25, 0.75 },
        growth={ 8, 0, 4.6, 4.8, 4.4, 4.8, 4.5, 4.5 },
        picture='Insects Tick',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if self.statBuffs[4].value <= 0 or self.statBuffs[6].value <= 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --232
        name='Caterpillar',
        hpGauge=1,
        skills={ 2, 485 },
        stats={ 220, 0, 140, 145, 140, 145, 135, 135 },
        elements={ 1, 1.25, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 8.2, 0, 4.7, 4.8, 4.6, 4.7, 4.4, 4.5 },
        picture='Insects Caterpillar B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --233
        name='Spider',
        hpGauge=1,
        skills={ 2, 486 },
        stats={ 160, 0, 135, 140, 145, 140, 150, 150 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1, 1, 1 },
        growth={ 8, 0, 4.4, 4.5, 4.8, 4.5, 4.8, 4.8 },
        picture='Forest Spider',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --234
        name='Scarab',
        hpGauge=1,
        skills={ 2, 487 },
        stats={ 200, 0, 150, 145, 135, 140, 140, 135 },
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1 },
        growth={ 8, 0, 5.1, 4.8, 4.5, 4.6, 4.7, 4.5 },
        picture='Insects Scarab',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --235
        name='Butterfly',
        hpGauge=2,
        skills={ 2, 488 },
        stats={ 460, 0, 145, 150, 170, 160, 155, 145 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 1, 0.75, 1, 1 },
        growth={ 10.2, 0, 4.8, 5.2, 5.6, 5.4, 5.4, 5.3 },
        picture='Insects Lunar Butterfly',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --236
        name='Widow',
        hpGauge=2,
        skills={ 2, 486, 489 },
        stats={ 450, 0, 145, 145, 160, 145, 150, 150 },
        elements={ 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1, 1, 1 },
        growth={ 10.4, 0, 5, 5, 5.6, 5, 5.1, 5.3 },
        picture='Forest Imperial Widow',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            elseif battleManager.turn % 3 == 2 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --237
        name='Hercules Beetle',
        hpGauge=2,
        skills={ 2, 487, 490 },
        stats={ 500, 0, 170, 160, 150, 140, 155, 160 },
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1 },
        growth={ 10.8, 0, 5.8, 5.6, 5.4, 5.2, 5.5, 5.6 },
        picture='Insects Giant Bug Hercules',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if self.statBuffs[3].value <= 0 then
                skillId = 3
            elseif battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --238
        name='Centipede',
        hpGauge=2,
        skills={ 2, 491, 492 },
        stats={ 960, 0, 180, 170, 160, 150, 140, 140 },
        elements={ 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1, 1 },
        growth={ 12, 0, 5.8, 5.7, 5.3, 5.2, 5.1, 5.2 },
        picture='Insects Giant Bug Centipede',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --239
        name='Hell Mantis',
        hpGauge=2,
        skills={ 1, 479, 493 },
        stats={ 490, 0, 175, 155, 150, 140, 170, 165 },
        elements={ 0.75, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 10.6, 0, 5.7, 5.4, 5.2, 5.2, 5.7, 5.6 },
        picture='Insects Hell Mantis',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if not self.buffs[4] then
                skillId = 3
            elseif battleManager.turn % 4 == 2 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --240
        name='Sickle Mantis',
        hpGauge=2,
        skills={ 1, 479, 494 },
        stats={ 490, 0, 175, 155, 150, 140, 170, 165 },
        elements={ 0.75, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 10.6, 0, 5.7, 5.4, 5.2, 5.2, 5.7, 5.6 },
        picture='Insects Sickle Mantis',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if not self.buffs[4] then
                skillId = 3
            elseif battleManager.turn % 4 == 0 then
                skillId = 3
            end
        end
    },
    { --241
        name='Protector Ant',
        hpGauge=2,
        skills={ 2, 495, 496 },
        stats={ 400, 0, 160, 180, 155, 180, 150, 145 },
        elements={ 1, 0.75, 1, 1, 1, 1.25, 1.25, 1, 1, 1, 1 },
        growth={ 10.9, 0, 5.5, 5.8, 5.4, 5.8, 5.3, 5.2 },
        picture='Insects Black Ant Protector',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if self.statBuffs[4].value <= 0 or self.statBuffs[6].value <= 0 then
                skillId = 2
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --242
        name='Knight Ant',
        hpGauge=2,
        skills={ 1, 16, 180 },
        stats={ 380, 0, 180, 165, 150, 155, 160, 150 },
        elements={ 0.75, 1, 1, 1.25, 1.25, 1, 1, 1, 1, 1, 1 },
        growth={ 10.6, 0, 5.8, 5.4, 5.2, 5.3, 5.4, 5.3 },
        picture='Insects Black Ant Knight',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if self.statBuffs[3].value <= 0  then
                skillId = 3
            elseif battleManager.turn % 4 == 2 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --243
        name='Archer Ant',
        hpGauge=2,
        skills={ 3, 182, 497 },
        stats={ 370, 0, 170, 160, 150, 150, 190, 180 },
        elements={ 1, 1, 0.75, 1, 1, 1, 1, 1.25, 1.25, 1, 1 },
        growth={ 10.2, 0, 5.5, 5.3, 5.2, 5.3, 5.8, 5.7 },
        picture='Insects Black Ant Archer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if self.statBuffs[7].value <= 0  then
                skillId = 2
            elseif battleManager.turn % 4 == 3 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --244
        name='Mage Ant',
        hpGauge=2,
        skills={ 2, 181, 498 },
        stats={ 340, 0, 160, 150, 190, 180, 155, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 1.25 },
        growth={ 10, 0, 5.4, 5.4, 5.8, 5.8, 5.5, 5.6 },
        picture='Insects Black Ant Mage',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if self.statBuffs[5].value <= 0  then
                skillId = 2
            elseif battleManager.turn % 3 == 0 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --245
        name='Mosquito',
        hpGauge=2,
        skills={ 3, 499, 500 },
        stats={ 700, 0, 170, 150, 140, 140, 170, 180 },
        elements={ 1, 1.25, 0.75, 1, 1.25, 1, 1, 1, 0.75, 1, 1 },
        growth={ 20, 0, 5.6, 5.4, 5.3, 5.3, 5.8, 6 },
        picture='Vampiric Creatures Giant Mosquito',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 6 == 0 then
                skillId = 3
            elseif self:hpRate() <= 0.25 and battleManager.turn % 2 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --246
        name='Insect Queen',
        boss=true,
        hpGauge=3,
        skills={ 2, 498, 501, 502 },
        stats={ 1200, 0, 165, 165, 180, 165, 160, 170 },
        elements={ 1, 1, 1, 1.25, 1, 1, 1, 0.75, 0.75, 1.25, 0.75 },
        growth={ 40, 0, 5.5, 5.5, 5.7, 5.5, 5.4, 5.6 },
        picture='Boss Insect Queen',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 6 == 3 then
                skillId = 4
            elseif battleManager.turn % 2 == 1 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil, nil, nil,
    { --255
        name='Knight',
        hpGauge=1,
        skills={ 1, 5, 18 },
        stats={ 240, 0, 150, 150, 140, 140, 140, 150 },
        elements={ 0.75, 1.25, 1.25, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.8, 0, 5.4, 5.4, 5.3, 5.3, 5.3, 5.4 },
        picture='Knights Sword Common',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 2 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --256
        name='Lancer',
        hpGauge=1,
        skills={ 3, 41, 49 },
        stats={ 230, 0, 155, 145, 135, 140, 150, 145 },
        elements={ 1.25, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.5, 0, 5.5, 5.3, 5.2, 5.3, 5.4, 5.3 },
        picture='Knights Spear Common',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --257
        name='Blunderbuss',
        hpGauge=1,
        skills={ 3, 48, 503 },
        stats={ 200, 0, 165, 135, 135, 135, 160, 150 },
        elements={ 1.25, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.1, 0, 5.7, 5.1, 5.1, 5.1, 5.6, 5.5 },
        picture='Knight Blunderbuss Common',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --258
        name='Berserker',
        hpGauge=2,
        skills={ 1, 5, 16, 18 },
        stats={ 460, 0, 155, 175, 140, 170, 135, 135 },
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25 },
        growth={ 10.4, 0, 5.3, 5.7, 5.1, 5.7, 5.2, 5.2 },
        picture='Knight Axe Common',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 4 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --259
        name='Knight Elite',
        hpGauge=2,
        skills={ 1, 5, 18 },
        stats={ 480, 0, 160, 160, 150, 150, 150, 160 },
        elements={ 0.75, 1.25, 1.25, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 10.6, 0, 5.6, 5.6, 5.5, 5.5, 5.5, 5.6 },
        picture='Knight Sword Elite',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 2 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --260
        name='Lancer Elite',
        hpGauge=2,
        skills={ 3, 41, 49 },
        stats={ 460, 0, 165, 155, 140, 150, 160, 155 },
        elements={ 1.25, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 10.1, 0, 5.7, 5.5, 5.4, 5.5, 5.6, 5.5 },
        picture='Knight Spear Elite',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 1 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --261
        name='Blunderbuss Elite',
        hpGauge=2,
        skills={ 3, 48, 503 },
        stats={ 400, 0, 175, 140, 140, 140, 170, 160 },
        elements={ 1.25, 1.25, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.8, 0, 5.9, 5.3, 5.3, 5.3, 5.8, 5.7 },
        picture='Knight Blunderbuss Elite',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --262
        name='Berserker Elite',
        hpGauge=2,
        skills={ 1, 5, 16, 18 },
        stats={ 960, 0, 165, 185, 150, 180, 140, 140 },
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25 },
        growth={ 21, 0, 5.5, 5.9, 5.3, 5.9, 5.4, 5.4 },
        picture='Knight Axe Elite',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 4 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil,
    { --265
        name='Sovereign Leader',
        boss=true,
        hpGauge=3,
        skills={ 1, 5, 18, 329, 504 },
        stats={ 2400, 0, 170, 180, 150, 170, 140, 170 },
        elements={ 0.75, 0.75, 0.75, 1, 1.25, 1, 1.25, 1, 1, 1.25, 1 },
        growth={ 84, 0, 5.5, 5.8, 5.3, 5.6, 5.2, 5.5 },
        picture='Legendary Knights Minion Axe',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 10 == 0 then
                skillId = 5
            elseif battleManager.turn % 10 == 2 or battleManager.turn % 10 == 6 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --270
        name='Sakura',
        boss=true,
        hpGauge=3,
        skills={ 1, 89, 90, 18, 505 },
        stats={ 2200, 0, 175, 170, 150, 160, 170, 170 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 78, 0, 5.6, 5.5, 5.3, 5.4, 5.5, 5.5 },
        picture='Battler_FH_007_01',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 9 == 0 then
                skillId = 5
            elseif battleManager.turn % 3 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --271
        name='Charlotte',
        boss=true,
        hpGauge=3,
        skills={ 1, 12, 13, 18, 231 },
        stats={ 2400, 0, 180, 175, 150, 150, 155, 165 },
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25, 1, 1 },
        growth={ 81, 0, 5.7, 5.6, 5.2, 5.2, 5.3, 5.4 },
        picture='Battler_FH_012_01',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 6 == 1 then
                skillId = 5
            elseif battleManager.turn % 3 == 0 then
                skillId = 4
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil,
    { --275
        name='Demon Lord',
        boss=true,
        hpGauge=3,
        skills={ 1, 150, 444, 157, 441, 506, 507 },
        stats={ 2300, 0, 170, 170, 170, 170, 170, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 78, 0, 5.6, 5.6, 5.6, 5.6, 5.6, 5.6 },
        picture='Boss Hades',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 9 == 0 then
                local skills = { 6, 7 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            elseif battleManager.turn % 3 == 0 then
                local skills = { 4, 5 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            elseif math.random() < 0.5 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --280
        name='Lilith',
        boss=true,
        hpGauge=3,
        skills={ 2, 154, 158, 209, 235 },
        stats={ 2200, 0, 160, 160, 190, 170, 160, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 76, 0, 5.4, 5.5, 5.8, 5.7, 5.5, 5.4 },
        picture='Battler_FH_016_01',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 12 == 10 then
                skillId = 5
            elseif battleManager.turn % 6 == 1 then
                skillId = 4
            elseif battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --281
        name='Satiel',
        boss=true,
        hpGauge=3,
        skills={ 2, 508, 159, 509 },
        stats={ 2000, 0, 160, 170, 180, 180, 170, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75 },
        growth={ 74, 0, 5.4, 5.6, 5.7, 5.7, 5.6, 5.4 },
        picture='Library Book Master',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 8 == 0 then
                skillId = 4
            elseif battleManager.turn % 4 == 0 and self:hpRate() <= 0.25 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil,
    { --285
        name='Ralph',
        boss=true,
        hpGauge=3,
        skills={ 1, 5, 510, 511 },
        stats={ 2600, 0, 190, 170, 160, 170, 175, 175 },
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 84, 0, 5.8, 5.6, 5.4, 5.5, 5.6, 5.6 },
        picture='Boss Mythical Knight Goldnharl',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 9 == 0 then
                skillId = 4
            elseif battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --290
        name='Trence',
        boss=true,
        hpGauge=3,
        skills={ 2, 77, 80, 343, 512 },
        stats={ 2200, 0, 160, 165, 180, 180, 170, 160 },
        elements={ 1, 1, 1, 0.75, 0.75, 1, 1.25, 1.25, 1, 1, 1 },
        growth={ 77, 0, 5.4, 5.5, 5.7, 5.7, 5.6, 5.5 },
        picture='Aspiring Knight Palazo',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 12 == 0 then
                skillId = 5
            elseif battleManager.turn % 4 == 0 then
                skillId = 3
            elseif math.random() < 0.5 then
                local skills = { 2, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --295
        name='Bennet',
        boss=true,
        hpGauge=3,
        skills={ 2, 423, 142, 513 },
        stats={ 2500, 0, 160, 170, 190, 170, 155, 165 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75 },
        growth={ 81, 0, 5.4, 5.6, 5.8, 5.6, 5.3, 5.5 },
        picture='Megapack III Fallen Kings King Of Elves Dreyel',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0

            if battleManager.turn % 8 == 0 then
                skillId = 4
            elseif battleManager.turn % 4 == 0 and self:hpRate() <= 0.25 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --300
        name='Egypt Cobra',
        hpGauge=1,
        skills={ 2, 332, 396 },
        stats={ 260, 0, 150, 140, 155, 140, 140, 135 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 8.6, 0, 5.1, 5, 5.2, 5, 5.1, 5 },
        picture='Egypt Cobra',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --301
        name='Egypt Archer',
        hpGauge=1,
        skills={ 3, 322 },
        stats={ 220, 0, 150, 140, 140, 140, 150, 145 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 8.2, 0, 5.2, 5, 5, 5, 5.2, 5.1 },
        picture='Egypt Archer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --302
        name='Egypt Chariot',
        hpGauge=1,
        skills={ 3, 321, 325 },
        stats={ 460, 0, 155, 150, 140, 140, 140, 145 },
        elements={ 1, 1, 0.75, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 10.1, 0, 5.4, 5.3, 5.1, 5.2, 5.1, 5.3 },
        picture='Egypt Chariot',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 2 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --303
        name='Egypt Crocodile',
        hpGauge=2,
        skills={ 2, 514 },
        stats={ 460, 0, 160, 155, 135, 145, 135, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 0.75, 0.75, 1.25, 1, 1 },
        growth={ 10.4, 0, 5.6, 5.5, 5.2, 5.3, 5.3, 5.4 },
        picture='Egypt Crocodile',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --304
        name='Egypt Knight',
        hpGauge=2,
        skills={ 1, 515 },
        stats={ 410, 0, 160, 150, 135, 140, 155, 150 },
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 10.1, 0, 5.5, 5.5, 5.2, 5.3, 5.5, 5.4 },
        picture='Egypt Knight',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --305
        name='Egypt Mage',
        hpGauge=2,
        skills={ 2, 516, 517 },
        stats={ 360, 0, 140, 145, 170, 160, 140, 145 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 9.6, 0, 5.3, 5.3, 5.6, 5.6, 5.3, 5.4 },
        picture='Egypt Mage',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --306
        name='Egypt Hieracosphinx',
        hpGauge=2,
        skills={ 2, 518, 519 },
        stats={ 840, 0, 155, 165, 190, 170, 165, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 19, 0, 5.4, 5.5, 5.8, 5.6, 5.7, 5.4 },
        picture='Egypt Hieracosphinx',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --307
        name='Egypt Axe',
        hpGauge=2,
        skills={ 1, 5, 520 },
        stats={ 960, 0, 180, 180, 150, 150, 150, 170 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 24, 0, 5.7, 5.7, 5.2, 5.3, 5.2, 5.6 },
        picture='Egypt Axe',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --308
        name='Kratos',
        boss=true,
        hpGauge=3,
        skills={ 1, 519, 520, 504, 521 },
        stats={ 2400, 0, 180, 170, 180, 170, 170, 180 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 84, 0, 5.6, 5.5, 5.6, 5.5, 5.5, 5.6 },
        picture='Boss Son Of Valhalla',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 9 == 0 then
                local skills = { 4, 5 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            elseif battleManager.turn % 3 == 0 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil,
    { --315
        name='Pirate Bandit',
        boss=true,
        hpGauge=2,
        skills={ 1, 522, 19 },
        stats={ 1400, 0, 180, 160, 150, 150, 170, 175 },
        elements={ 0.75, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 39, 0, 5.7, 5.5, 5.2, 5.3, 5.6, 5.7 },
        picture='Pirate Bandit',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 and math.random() < 0.5 then
                skillId = 3
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil,
    { --320
        name='Fighter',
        boss=true,
        hpGauge=2,
        skills={ 1, 5, 16 },
        stats={ 1400, 0, 175, 170, 150, 150, 160, 160 },
        elements={ 0.75, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 30, 0, 5.5, 5.5, 5.3, 5.3, 5.4, 5.4 },
        picture='Elf_Assasin',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 2 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --321
        name='Hunter',
        boss=true,
        hpGauge=2,
        skills={ 3, 322, 497, 523 },
        stats={ 1200, 0, 180, 160, 150, 150, 165, 165 },
        elements={ 1, 1, 0.75, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 28, 0, 5.7, 5.4, 5.2, 5.2, 5.5, 5.4 },
        picture='Elf_Archer',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 4
            elseif battleManager.turn % 6 == 4 then
                local skills = { 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --322
        name='Spellcaster',
        boss=true,
        hpGauge=2,
        skills={ 2, 86, 524 },
        stats={ 1000, 0, 150, 150, 190, 180, 157, 160 },
        elements={ 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1, 1 },
        growth={ 24, 0, 5.3, 5.3, 5.8, 5.7, 5.3, 5.4 },
        picture='Elves Spellcaster',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --323
        name='Warrior',
        boss=true,
        hpGauge=3,
        skills={ 1, 231, 12, 13, 525 },
        stats={ 2600, 0, 180, 180, 150, 140, 150, 170 },
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1, 1.25 },
        growth={ 86, 0, 5.8, 5.7, 5.3, 5.3, 5.4, 5.6 },
        picture='Boss God Warrior Skoll',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 12 == 0 then
                skillId = 5
            elseif battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 3 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --324
        name='Knight',
        boss=true,
        hpGauge=2,
        skills={ 1, 526, 527, 18 },
        stats={ 1000, 0, 170, 170, 160, 160, 160, 165 },
        elements={ 1, 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1 },
        growth={ 22, 0, 5.6, 5.6, 5.5, 5.5, 5.5, 5.6 },
        picture='Legendary Knights Nobleman Ansellus',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 3 == 0 then
                skillId = 4
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --325
        name='Thief',
        boss=true,
        hpGauge=2,
        skills={ 1, 528, 529 },
        stats={ 800, 0, 165, 150, 150, 150, 170, 170 },
        elements={ 1, 1, 1, 1, 1.25, 1, 0.75, 1, 1, 1, 1 },
        growth={ 16, 0, 5.4, 5.3, 5.3, 5.3, 5.6, 5.6 },
        picture='Legendary Knights Dancer Zidh',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if not self.buffs[4] then
                skillId = 2
            elseif battleManager.turn % 2 == 0 and math.random() < 0.5 then
                skillId = 3
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --326
        name='Mage',
        boss=true,
        hpGauge=2,
        skills={ 2, 111, 530 },
        stats={ 800, 0, 150, 150, 180, 170, 150, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 16, 0, 5.3, 5.2, 5.7, 5.6, 5.3, 5.4 },
        picture='Mage Garrintan',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --327
        name='Bandit',
        boss=true,
        hpGauge=2,
        skills={ 3, 40, 49 },
        stats={ 900, 0, 175, 170, 140, 150, 160, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 19, 0, 5.6, 5.6, 5.2, 5.2, 5.3, 5.4 },
        picture='Medieval Bandit Dagger Gun',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --328
        name='Wizard',
        boss=true,
        hpGauge=2,
        skills={ 2, 531, 312, 439 },
        stats={ 1600, 0, 150, 170, 180, 170, 170, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 40, 0, 5.4, 5.5, 5.6, 5.5, 5.6, 5.5 },
        picture='Halloween Pumpkin Gentleman',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 6 == 3 then
                skillId = 3
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --329
        name='Witch',
        boss=true,
        hpGauge=2,
        skills={ 2, 532, 158, 508 },
        stats={ 1400, 0, 150, 160, 190, 165, 155, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 36, 0, 5.3, 5.4, 5.8, 5.4, 5.3, 5.6 },
        picture='Halloween Witch Baba',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 6 == 0 then
                skillId = 3
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --330
        name='Swordsman',
        boss=true,
        hpGauge=2,
        skills={ 1, 8, 12, 13, 16 },
        stats={ 1100, 0, 185, 160, 155, 160, 160, 165 },
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1.25, 1, 1.25, 1, 1, 1 },
        growth={ 21, 0, 5.7, 5.5, 5.4, 5.5, 5.4, 5.5 },
        picture='Aspiring Knight Gladius',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 5
            elseif battleManager.turn % 2 == 0 then
                local skills = { 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --331
        name='Priest',
        boss=true,
        hpGauge=2,
        skills={ 2, 533, 137, 165 },
        stats={ 1400, 0, 155, 170, 170, 180, 150, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.75, 0.75 },
        growth={ 24, 0, 5.4, 5.6, 5.6, 5.7, 5.4, 5.4 },
        picture='Aspiring Knight Valterra',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 6 == 0 then
                skillId = 4
                local lowestRate = 1.1
                for i = 1, #battleManager.currentEnemies do
                    if not battleManager.currentEnemies[i]:isDead() and battleManager.currentEnemies[i]:hpRate() < lowestRate then
                        targetId = i
                        lowestRate = battleManager.currentEnemies[i]:hpRate()
                    end
                end
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --332
        name='Assassin',
        boss=true,
        hpGauge=2,
        skills={ 3, 534, 535, 323 },
        stats={ 900, 0, 170, 150, 155, 150, 180, 180 },
        elements={ 0.75, 0.75, 0.75, 1, 1.25, 1, 1.25, 1, 1.25, 1, 1 },
        growth={ 19, 0, 5.5, 5.4, 5.3, 5.3, 5.7, 5.7 },
        picture='Assasin Garland',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 6 == 3 then
                skillId = 4
            else
                local skills = { 1, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --333
        name='Magician',
        boss=true,
        hpGauge=2,
        skills={ 2, 536, 141, 150 },
        stats={ 800, 0, 150, 150, 190, 170, 160, 170 },
        elements={ 1.25, 1.25, 1.25, 1, 1, 1, 1, 1, 1, 0.75, 0.75 },
        growth={ 16, 0, 5.3, 5.4, 5.8, 5.6, 5.5, 5.6 },
        picture='Legendary Knights Summoner Dante A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 2
            elseif battleManager.turn % 4 == 2 then
                skillId = 3
            else
                local skills = { 1, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil, nil, nil, nil, nil,
    { --340
        name='Rogue Sword',
        boss=true,
        hpGauge=2,
        skills={ 1, 18 },
        stats={ 1200, 0, 170, 160, 145, 150, 160, 160 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 28, 0, 5.6, 5.5, 5.3, 5.4, 5.5, 5.6 },
        picture='Rogue Bastard Sword',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --341
        name='Rogue Monk',
        boss=true,
        hpGauge=2,
        skills={ 3, 49 },
        stats={ 1500, 0, 160, 180, 150, 170, 145, 150 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 32, 0, 5.5, 5.7, 5.4, 5.6, 5.4, 5.5 },
        picture='Rogue Dagger Monk',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --342
        name='Rogue Dagger',
        boss=true,
        hpGauge=2,
        skills={ 3, 323 },
        stats={ 900, 0, 165, 150, 150, 145, 175, 175 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 26, 0, 5.5, 5.4, 5.3, 5.2, 5.7, 5.7 },
        picture='Rogue Twin Dagger',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }, nil, nil,
    { --345
        name='Soldier Sword',
        hpGauge=1,
        skills={ 1, 537 },
        stats={ 210, 0, 165, 165, 145, 150, 160, 160 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 1, 1 },
        growth={ 9.6, 0, 5.5, 5.5, 5.3, 5.3, 5.5, 5.5 },
        picture='Post-Modern Soldier C',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --346
        name='Soldier Submachine',
        hpGauge=1,
        skills={ 3, 538 },
        stats={ 200, 0, 170, 160, 150, 150, 170, 150 },
        elements={ 1, 1, 1, 1, 1, 1.25, 1, 1, 0.75, 1, 1 },
        growth={ 9.4, 0, 5.6, 5.5, 5.3, 5.3, 5.6, 5.4 },
        picture='Post-Modern Soldier B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 0 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --347
        name='Soldier Rifle',
        hpGauge=1,
        skills={ 3, 48 },
        stats={ 200, 0, 170, 160, 150, 150, 150, 170 },
        elements={ 1, 1, 1, 1, 1, 1, 1, 0.75, 1.25, 1, 1 },
        growth={ 9.4, 0, 5.6, 5.5, 5.3, 5.3, 5.4, 5.6 },
        picture='Post-Modern Soldier A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 2 then
                skillId = 2
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --348
        name='Soldier Scout',
        hpGauge=2,
        skills={ 1, 537, 539 },
        stats={ 360, 0, 170, 170, 170, 170, 150, 150 },
        elements={ 1, 1, 1, 0.75, 1, 1, 1.25, 1, 1, 0.75, 1.25 },
        growth={ 10.4, 0, 5.6, 5.6, 5.6, 5.6, 5.2, 5.2 },
        picture='Post-Modern Machinery Scout',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 and math.random() < 0.5 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --349
        name='Soldier Heavy',
        hpGauge=2,
        skills={ 2, 25, 540 },
        stats={ 900, 0, 160, 180, 150, 175, 150, 160 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 1, 1, 1.25, 1.25 },
        growth={ 11, 0, 5.5, 5.8, 5.4, 5.7, 5.4, 5.5 },
        picture='Post-Modern Machinery Heavy',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --350
        name='Soldier Assault',
        hpGauge=2,
        skills={ 3, 40, 538 },
        stats={ 860, 0, 180, 160, 150, 160, 170, 165 },
        elements={ 1, 1, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 1.25 },
        growth={ 10.4, 0, 5.7, 5.5, 5.4, 5.5, 5.6, 5.5 },
        picture='Post-Modern Machinery Assault',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --351
        name='Book Swarm',
        hpGauge=1,
        skills={ 2, 541 },
        stats={ 180, 0, 160, 150, 150, 150, 160, 150 },
        elements={ 1.25, 0.75, 0.75, 1.25, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 8.7, 0, 5.4, 5.2, 5.2, 5.2, 5.4, 5.2 },
        picture='Library Book Swarm',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --352
        name='Enchanted Books',
        hpGauge=2,
        skills={ 2, 542 },
        stats={ 240, 0, 160, 160, 170, 165, 155, 165 },
        elements={ 1.25, 0.75, 0.75, 1.25, 1, 1, 1, 1, 1, 0.75, 1 },
        growth={ 9.3, 0, 5.3, 5.3, 5.5, 5.4, 5.3, 5.5 },
        picture='Library Book Swarm B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --353
        name='Mimic Book',
        hpGauge=2,
        skills={ 2, 543 },
        stats={ 340, 0, 170, 160, 150, 150, 170, 150 },
        elements={ 0.75, 0.75, 0.75, 1, 1, 1, 1, 1, 1, 1.25, 0.75 },
        growth={ 10.2, 0, 5.6, 5.4, 5.2, 5.2, 5.6, 5.3 },
        picture='Mimic Book',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skills = { 1, 2 }
            local skillId = skills[math.floor(math.random() * #skills) + 1]
            local targetId = 0

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --354
        name='Book Golem',
        hpGauge=2,
        skills={ 2, 542, 544 },
        stats={ 840, 0, 170, 180, 160, 175, 155, 150 },
        elements={ 1, 0.75, 1, 1.25, 1, 1, 1, 0.75, 1, 1, 1 },
        growth={ 23, 0, 5.6, 5.8, 5.3, 5.7, 5.2, 5.2 },
        picture='Library Book Golem',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 4 == 3 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --355
        name='Penelope',
        boss=true,
        hpGauge=3,
        skills={ 2, 64, 100, 125, 165 },
        stats={ 1900, 0, 150, 160, 190, 180, 150, 150 },
        elements={ 1.25, 1.25, 1.25, 0.75, 1, 1, 0.75, 1, 0.75, 1, 1 },
        growth={ 75, 0, 5.4, 5.4, 5.8, 5.6, 5.3, 5.3 },
        picture='Battler_FH_053_03',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 8 == 0 then
                skillId = 5
                targetId = 1
            elseif battleManager.turn % 2 == 1 then
                local skills = { 2, 3, 4 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --356
        name='Red Brawler',
        hpGauge=2,
        skills={ 2, 25, 540 },
        stats={ 390, 0, 160, 170, 140, 160, 150, 160 },
        elements={ 1, 0.75, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 10.4, 0, 5.4, 5.6, 5.3, 5.5, 5.3, 5.5 },
        picture='Megapack III Red Guard A',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 2 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --357
        name='Red Soldier',
        hpGauge=2,
        skills={ 1, 5, 18 },
        stats={ 360, 0, 170, 160, 140, 160, 160, 150 },
        elements={ 0.75, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 10, 0, 5.6, 5.4, 5.3, 5.5, 5.5, 5.3 },
        picture='Megapack III Red Guard B',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 1 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --358
        name='Red Sniper',
        hpGauge=2,
        skills={ 3, 40, 48 },
        stats={ 320, 0, 170, 150, 140, 150, 170, 170 },
        elements={ 1, 1, 0.75, 1, 1, 1, 1, 1, 1, 1, 1 },
        growth={ 9.6, 0, 5.6, 5.3, 5.3, 5.3, 5.6, 5.6 },
        picture='Megapack III Red Guard C',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 3 == 0 then
                skillId = 3
            else
                local skills = { 1, 2 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --359
        name='Shino',
        boss=true,
        hpGauge=3,
        skills={ 1, 42, 9, 32, 183, 244 },
        stats={ 2100, 0, 175, 160, 135, 140, 180, 170 },
        elements={ 0.75, 0.75, 0.75, 1.25, 1, 1.25, 1, 1.25, 1, 1, 1 },
        growth={ 76, 0, 5.6, 5.3, 5.1, 5.2, 5.8, 5.6 },
        picture='Battler_FH_043_03',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 9 == 0 then
                skillId = 6
            elseif not self.buffs[4] then
                skillId = 5
            elseif battleManager.turn % 3 == 0 then
                skillId = 4
            else
                local skills = { 1, 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    },
    { --360
        name='Clara',
        boss=true,
        hpGauge=3,
        skills={ 1, 16, 157, 142, 264 },
        stats={ 2400, 0, 170, 160, 170, 160, 150, 160 },
        elements={ 1, 1, 1, 1.25, 1.25, 1, 1, 1, 1, 0.75, 0.75 },
        growth={ 82, 0, 5.6, 5.5, 5.6, 5.5, 5.3, 5.4 },
        picture='Battler_FH_064_04',
        startInput=function(self, battleManager)
            --ai to get skill + target
            local skillId = 1
            local targetId = 0
            if battleManager.turn % 6 == 1 then
                skillId = 5
            elseif self:hpRate() <= 0.5 and battleManager.turn % 6 == 0 then
                skillId = 4
            elseif battleManager.turn % 2 == 0 then
                local skills = { 1, 2, 3 }
                skillId = skills[math.floor(math.random() * #skills) + 1]
            end

            self.inputSkill = skillId
            self.target = targetId
        end
    }
}

M.getEnemy = function(enemyId)
    return enemies[enemyId]
end

return M