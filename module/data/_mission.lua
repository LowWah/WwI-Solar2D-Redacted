local M = {}

local missions = {
    { --Daily
        {
            id=1,
            name='Login between 12:00AM to 11:59PM',
            required=1,
            reward={
                category=1,
                id=3,
                count=1
            }
        }, 
        {
            id=2,
            name='Login between 12:00AM to 11:59PM',
            required=1,
            requirements={
                guildLevel=6
            },
            reward={
                category=1,
                id=17,
                count=1
            }
        }, 
        {
            id=3,
            name='Clear 1 main/side/event stage',
            required=1,
            reward={
                category=0,
                count=200
            }
        }, 
        {
            id=4,
            name='Clear 5 gear/tome/onslaught stages',
            required=5,
            reward={
                category=1,
                id=4,
                count=1
            }
        }, 
        {
            id=5,
            name='Recruit 1 actor',
            required=1,
            reward={
                category=2,
                id=1,
                count=5
            }
        }, 
        {
            id=6,
            name='Level up any actor 1 time',
            required=1,
            reward={
                category=1,
                id=6,
                count=1
            }
        },
        {
            id=7,
            name='Upgrade any skill 1 time',
            required=1,
            reward={
                category=1,
                id=10,
                count=10
            }
        }, 
        {
            id=8,
            name='Level up any equipment 1 time',
            required=1,
            reward={
                category=1,
                id=11,
                count=10
            }
        }, 
        {
            id=9,
            name='Level up any gem 1 time',
            required=1,
            reward={
                category=1,
                id=12,
                count=10
            }
        }
    }, { --Weekly
        {
            id=1,
            name='Login on 5 different days',
            required=5,
            reward={
                category=1,
                id=3,
                count=5
            }
        }, 
        {
            id=2,
            name='Clear 5 main/side/event stage',
            required=5,
            reward={
                category=0,
                count=1000
            }
        }, 
        {
            id=3,
            name='Clear 25 gear/tome/onslaught stages',
            required=25,
            reward={
                category=1,
                id=4,
                count=5
            }
        }, 
        {
            id=4,
            name='Clear 10 tower stages',
            required=10,
            reward={
                category=1,
                id=15,
                count=10
            }
        }, 
        {
            id=5,
            name='Complete 20 arena challenges',
            required=20,
            reward={
                category=1,
                id=16,
                count=2000
            }
        }, 
        {
            id=6,
            name='Enter the labyrinth 5 times',
            required=5,
            reward={
                category=1,
                id=17,
                count=1
            }
        }, 
        {
            id=7,
            name='Recruit 10 actors',
            required=10,
            reward={
                category=1,
                id=1,
                count=1
            }
        }, 
        {
            id=8,
            name='Rate up any actor 1 time',
            required=1,
            reward={
                category=2,
                id=1,
                count=20
            }
        }
    }, { --Achivements
        --[[
        {
            id=1,
            name='Login between 12:00AM to 11:59PM',
            required=1,
            reward={
                category=1,
                id=3,
                count=1
            }
        }]]
    }
}

M.getMissions = function(category)
    return missions[category]
end

return M