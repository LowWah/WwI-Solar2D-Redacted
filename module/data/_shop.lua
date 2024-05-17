local M = {}

local shopItems = {
    general={
        {
            item={ --Flyer
                category=1,
                id=1
            },
            cost={
                category=0,
                count=1000
            }
        },
        {
            item={ --Energy
                category=1,
                id=4
            },
            cost={
                category=0,
                count=400
            }
        },
        {
            item={ --EXP
                category=1,
                id=8
            },
            cost={
                category=0,
                count=500
            }
        },
        {
            item={ --Tome Sheets
                category=1,
                id=10
            },
            cost={
                category=0,
                count=100
            }
        },
        {
            item={ --Equipment screws
                category=1,
                id=11
            },
            cost={
                category=0,
                count=100
            }
        },
        {
            item={ --Gem fragments
                category=1,
                id=12
            },
            cost={
                category=0,
                count=100
            }
        },
        {
            item={ --Labyrinth Map
                category=1,
                id=17
            },
            cost={
                category=0,
                count=1000
            }
        }
    },
    event={
        {
            item={ --Flyer
                category=1,
                id=1
            },
            cost={
                category=1,
                id=20,
                count=1500
            }
        },
        {
            item={ --Energy
                category=1,
                id=4
            },
            cost={
                category=1,
                id=20,
                count=600
            }
        },
        {
            item={ --EXP
                category=1,
                id=8
            },
            cost={
                category=1,
                id=20,
                count=750
            }
        },
        {
            item={ --Tome Sheets
                category=1,
                id=10
            },
            cost={
                category=1,
                id=20,
                count=150
            }
        },
        {
            item={ --Equipment screws
                category=1,
                id=11
            },
            cost={
                category=1,
                id=20,
                count=150
            }
        },
        {
            item={ --Gem fragments
                category=1,
                id=12
            },
            cost={
                category=1,
                id=20,
                count=150
            }
        },
        {
            item={ --weapon
                category=5,
                id=171,
            },
            cost={
                category=1,
                id=20,
                count=300
            }
        },
        {
            item={ --body
                category=6,
                id=108,
            },
            cost={
                category=1,
                id=20,
                count=300
            }
        },
        {
            item={ --head
                category=7,
                id=108,
            },
            cost={
                category=1,
                id=20,
                count=300
            }
        },
        {
            item={ --leg
                category=8,
                id=129,
            },
            cost={
                category=1,
                id=20,
                count=300
            }
        }
    },
    tower={
        {
            item={ --Flyer
                category=1,
                id=1
            },
            cost={
                category=1,
                id=15,
                count=10
            }
        },
        {
            item={ --Energy
                category=1,
                id=4
            },
            cost={
                category=1,
                id=15,
                count=4
            }
        },
        {
            item={ --EXP
                category=1,
                id=8
            },
            cost={
                category=1,
                id=15,
                count=5
            }
        },
        {
            item={ --Tome Sheets
                category=1,
                id=10,
                count=10
            },
            cost={
                category=1,
                id=15,
                count=1
            }
        },
        {
            item={ --Equipment screws
                category=1,
                id=11,
                count=10
            },
            cost={
                category=1,
                id=15,
                count=1
            }
        },
        {
            item={ --Gem fragments
                category=1,
                id=12,
                count=10
            },
            cost={
                category=1,
                id=15,
                count=1
            }
        },
        {
            item={ --weapon
                category=5,
                id=169,
            },
            cost={
                category=1,
                id=15,
                count=2
            }
        },
        {
            item={ --body
                category=6,
                id=106,
            },
            cost={
                category=1,
                id=15,
                count=2
            }
        },
        {
            item={ --head
                category=7,
                id=106,
            },
            cost={
                category=1,
                id=15,
                count=2
            }
        },
        {
            item={ --leg
                category=8,
                id=127,
            },
            cost={
                category=1,
                id=15,
                count=2
            }
        }
    },
    arena={
        {
            item={ --Flyer
                category=1,
                id=1
            },
            cost={
                category=1,
                id=16,
                count=2000
            }
        },
        {
            item={ --Energy
                category=1,
                id=4
            },
            cost={
                category=1,
                id=16,
                count=800
            }
        },
        {
            item={ --EXP
                category=1,
                id=8
            },
            cost={
                category=1,
                id=16,
                count=1000
            }
        },
        {
            item={ --Tome Sheets
                category=1,
                id=10
            },
            cost={
                category=1,
                id=16,
                count=200
            }
        },
        {
            item={ --Equipment screws
                category=1,
                id=11
            },
            cost={
                category=1,
                id=16,
                count=200
            }
        },
        {
            item={ --Gem fragments
                category=1,
                id=12
            },
            cost={
                category=1,
                id=16,
                count=200
            }
        },
        {
            item={ --weapon
                category=5,
                id=170,
            },
            cost={
                category=1,
                id=16,
                count=400
            }
        },
        {
            item={ --body
                category=6,
                id=107,
            },
            cost={
                category=1,
                id=16,
                count=400
            }
        },
        {
            item={ --head
                category=7,
                id=107,
            },
            cost={
                category=1,
                id=16,
                count=400
            }
        },
        {
            item={ --leg
                category=8,
                id=128,
            },
            cost={
                category=1,
                id=16,
                count=400
            }
        }
    }
}

M.getShopItems = function(key)
    return shopItems[key]
end

return M