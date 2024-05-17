local M = {}

local jobs = {
    {
        id=1,
        name='Waiter I',
        description='Handle the orders of customers, if you do well you\'ll earn some tips.',
        reward={
            category=0,
            count=100
        },
        duration=28800
    },
    {
        id=2,
        name='Chef I',
        description='Learning how to handle knives in the kitchen is equivalent to training with blades.',
        reward={
            category=1,
            id=6,
            count=2
        },
        duration=28800
    },
    {
        id=3,
        name='Break I',
        description='Allocated break time, use this chance to recharge your energy.',
        reward={
            category=1,
            id=3,
            count=2
        },
        duration=28800
    },
    {
        id=4,
        name='Admin I',
        description='Handle all the paper work of the cafe.',
        reward={
            category=1,
            id=10,
            count=4
        },
        duration=28800
    },
    {
        id=5,
        name='Maintenance I',
        description='Ensure the quality of all tools in the cafe, you can keep all the broken screws.',
        reward={
            category=1,
            id=11,
            count=4
        },
        duration=28800
    },
    {
        id=6,
        name='Dishes I',
        description='Don\'t worry too much about breaking them, broken ceramic has another use.',
        reward={
            category=1,
            id=12,
            count=4
        },
        duration=28800
    },
    {
        id=7,
        name='Cleaner I',
        description='Someone needs to clean up the rubbish, but hey, one man\'s trash is another man\'s treasure.',
        reward={
            category=1,
            ids={ 10, 11, 12 },
            count=6
        },
        duration=28800
    },
    {
        id=8,
        name='Waiter II',
        description='Handle the orders of customers, if you do well you\'ll earn some tips.',
        reward={
            category=0,
            count=200
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=9,
        name='Chef II',
        description='Learning how to handle knives in the kitchen is equivalent to training with blades.',
        reward={
            category=1,
            id=7,
            count=2
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=10,
        name='Break II',
        description='Allocated break time, use this chance to recharge your energy.',
        reward={
            category=1,
            id=4,
            count=2
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=11,
        name='Admin II',
        description='Handle all the paper work of the cafe.',
        reward={
            category=1,
            id=10,
            count=8
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=12,
        name='Maintenance II',
        description='Ensure the quality of all tools in the cafe, you can keep all the broken screws.',
        reward={
            category=1,
            id=11,
            count=8
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=13,
        name='Dishes II',
        description='Don\'t worry too much about breaking them, broken ceramic has another use.',
        reward={
            category=1,
            id=12,
            count=8
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=14,
        name='Cleaner II',
        description='Someone needs to clean up the rubbish, but hey, one man\'s trash is another man\'s treasure.',
        reward={
            category=1,
            ids={ 10, 11, 12 },
            count=12
        },
        duration=57600,
        requirements={
            guildLevel=5
        }
    },
    {
        id=15,
        name='Waiter III',
        description='Handle the orders of customers, if you do well you\'ll earn some tips.',
        reward={
            category=0,
            count=300
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    },
    {
        id=16,
        name='Chef III',
        description='Learning how to handle knives in the kitchen is equivalent to training with blades.',
        reward={
            category=1,
            id=8,
            count=2
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    },
    {
        id=17,
        name='Break III',
        description='Allocated break time, use this chance to recharge your energy.',
        reward={
            category=1,
            id=3,
            count=6
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    },
    {
        id=18,
        name='Admin III',
        description='Handle all the paper work of the cafe.',
        reward={
            category=1,
            id=10,
            count=12
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    },
    {
        id=19,
        name='Maintenance III',
        description='Ensure the quality of all tools in the cafe, you can keep all the broken screws.',
        reward={
            category=1,
            id=11,
            count=12
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    },
    {
        id=20,
        name='Dishes III',
        description='Don\'t worry too much about breaking them, broken ceramic has another use.',
        reward={
            category=1,
            id=12,
            count=12
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    },
    {
        id=21,
        name='Cleaner III',
        description='Someone needs to clean up the rubbish, but hey, one man\'s trash is another man\'s treasure.',
        reward={
            category=1,
            ids={ 10, 11, 12 },
            count=18
        },
        duration=86400,
        requirements={
            guildLevel=7
        }
    }
}

local checkActorSkillsForElement = function(actor, elementId)
    local allSkills = actor:allSkills()
    for i = 2, #allSkills do
        if allSkills[i]:element() == elementId then
            return true
        end
    end
    return false
end

local bonuses = {
    {
        id=1,
        description='Member has a slash skill (excluding attack)',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 1)
        end
    },
    {
        id=2,
        description='Member has a bash skill (excluding attack)',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 2)
        end
    },
    {
        id=3,
        description='Member has a pierce skill (excluding attack)',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 3)
        end
    },
    {
        id=4,
        description='Member has a fire skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 4)
        end
    },
    {
        id=5,
        description='Member has a thunder skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 5)
        end
    },
    {
        id=6,
        description='Member has a ice skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 6)
        end
    },
    {
        id=7,
        description='Member has a water skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 7)
        end
    },
    {
        id=8,
        description='Member has a earth skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 8)
        end
    },
    {
        id=9,
        description='Member has a wind skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 9)
        end
    },
    {
        id=10,
        description='Member has a light skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 10)
        end
    },
    {
        id=11,
        description='Member has a dark skill',
        condition=function(actor)
            return checkActorSkillsForElement(actor, 11)
        end
    }
}

M.getAllJobs = function()
    return jobs
end

M.getJob = function(jobId)
    return jobs[jobId]
end

M.getAllBonuses = function()
    return bonuses
end

M.getBonus = function(bonusId)
    return bonuses[bonusId]
end

return M