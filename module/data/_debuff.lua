local M = {}

local debuffs = {
    {
        id=1,
        name='Stun',
        icon=56,
        restriction=true
    },
    {
        id=2,
        name='Flammable',
        icon=18,
        elements={ [4]=1.25 }
    },
    nil, nil,
    {
        id=5,
        name='Encore Mark',
        icon=1
    },
    {
        id=6,
        name='Queen\'s Orders',
        icon=84,
        speed=-999
    }
}

M.getDebuff = function(buffId)
    return debuffs[buffId]
end

return M