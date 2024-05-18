local M = {}

local buffs = {
    {
        id=1,
        name='Hp Regen Up',
        icon=75,
        additional={ 0.15, 0, 0, 0, 0 }
    },
    {
        id=2,
        name='Mp Regen Up',
        icon=76,
        additional={ 0, 0.15, 0, 0, 0 }
    },
    {
        id=3,
        name='Critical Up',
        icon=77,
        additional={ 0, 0, 0.2, 0, 0 }
    },
    {
        id=4,
        name='Evasion Up',
        icon=78,
        additional={ 0, 0, 0, 0.2, 0 }
    },
    {
        id=5,
        name='Stun Up',
        icon=79,
        additional={ 0, 0, 0, 0, 0.3 }
    },
    {
        id=6,
        name='Stealth',
        icon=42
    }, 
    {
        id=7,
        name='Provoke',
        icon=41
    },
    {
        id=8,
        name='Counter',
        icon=80,
    },
    nil,
    {
        id=10,
        name='Hyper (Generic)',
        icon=58
    },
    {
        id=11,
        name='Hyper (Lily)',
        icon=58,
        additional={ 0, 0, 0.24, 0, 0 }
    },
    {
        id=12,
        name='Hyper (Illia/Puck)',
        icon=58,
        elements={ 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5 }
    },
    {
        id=13,
        name='Hyper (Kumiho)',
        icon=58,
        additional={ 0, 0, 0, 0.2, 0 }
    },
    {
        id=14,
        name='Hyper (Saki)',
        icon=58,
        additional={ 0, 0, 0, 0, 1 }
    }, 
    {
        id=15,
        name='Beauty',
        icon=57,
        speed=81
    },
    {
        id=16,
        name='Slash Master',
        icon=15
    },
    {
        id=17,
        name='Bash Master',
        icon=16
    },
    {
        id=18,
        name='Pierce Master',
        icon=17
    },
    {
        id=19,
        name='Owl Gust',
        icon=82,
        speed=50
    },
    {
        id=20,
        name='Kindhearted',
        icon=83
    },
    {
        id=21,
        name='Fire Resist',
        icon=18,
        elements={ [4]=0.75 }
    },
    {
        id=22,
        name='Water Resist',
        icon=21,
        elements={ [7]=0.75 }
    },
    {
        id=23,
        name='Wind Resist',
        icon=23,
        elements={ [9]=0.75 }
    },
    {
        id=24,
        name='Fire Resist x2',
        icon=18,
        elements={ [4]=0.5 }
    },
    {
        id=25,
        name='Water Resist x2',
        icon=21,
        elements={ [7]=0.5 }
    },
    {
        id=26,
        name='Wind Resist x2',
        icon=23,
        elements={ [9]=0.5 }
    }

}

M.getBuff = function(buffId)
    return buffs[buffId]
end

return M