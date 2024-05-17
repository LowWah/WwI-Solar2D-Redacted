local M = {}

local items = {
    { --1 General
        {
            id=1,
            name='Flyer',
            icon=155,
            description='1 free recruitment'
        }, nil, {
            id=3,
            name='Battery I',
            icon=156,
            description='Restore 1 energy',
            recycle={
                category=-1,
                count=1
            }
        }, {
            id=4,
            name='Battery II',
            icon=157,
            description='Restore 2 energy',
            recycle={
                category=-1,
                count=2
            }
        }, nil, {
            id=6,
            name='EXP Booster I',
            icon=158,
            description='Gain 1000 Exp'
        }, {
            id=7,
            name='EXP Booster II',
            icon=159,
            description='Gain 2000 Exp'
        }, {
            id=8,
            name='EXP Booster III',
            icon=160,
            description='Gain 4000 Exp'
        }, nil, {
            id=10,
            name='Tome Sheets',
            icon=161,
            description='Sheets from recycled tomes'
        }, {
            id=11,
            name='Equipment Screws',
            icon=162,
            description='Screws from recycled equipment'
        }, {
            id=12,
            name='Gem Fragments',
            icon=163,
            description='Fragments from recycled gems'
        }, nil, nil, {
            id=15,
            name='Tower Pearl',
            icon=164,
            description='Rewards gained from tower'
        }, {
            id=16,
            name='Arena Coin',
            icon=165,
            description='Rewards gained from arena'
        }, {
            id=17,
            name='Labyrinth Map',
            icon=166,
            description='A map to navigate the labyrinth'
        }, nil, nil, {
            id=20,
            name='Event Crystal',
            icon=167,
            description='Rewards gained from event'
        }
    }, 
    { --2 Token
        {
            id=1,
            name='Generic Token',
            icon=85,
            description='Increase rating of any member'
        }, nil, nil, nil, nil, nil, nil, nil, nil, nil, {
            id=11,
            name='Melaine Token',
            icon=86,
            description='Increase rating of Melaine',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=12,
            name='Elie Token',
            icon=87,
            description='Increase rating of Elie',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=13,
            name='Sofie Token',
            icon=88,
            description='Increase rating of Sofie',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=14,
            name='Inari Token',
            icon=89,
            description='Increase rating of Inari',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=15,
            name='Lily Token',
            icon=90,
            description='Increase rating of Lily',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=16,
            name='Meryl Token',
            icon=91,
            description='Increase rating of Meryl',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=17,
            name='Sakura Token',
            icon=92,
            description='Increase rating of Sakura',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=18,
            name='Annie Token',
            icon=93,
            description='Increase rating of Annie',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=19,
            name='Ebonie Token',
            icon=94,
            description='Increase rating of Ebonie',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=20,
            name='Justine Token',
            icon=95,
            description='Increase rating of Justine',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=21,
            name='Opal Token',
            icon=96,
            description='Increase rating of Opal',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=22,
            name='Charolette Token',
            icon=97,
            description='Increase rating of Charolette',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=23,
            name='Illia Token',
            icon=98,
            description='Increase rating of Illia',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=24,
            name='Frieda Token',
            icon=99,
            description='Increase rating of Frieda',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=25,
            name='Iris Token',
            icon=100,
            description='Increase rating of Iris',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=26,
            name='Lilith Token',
            icon=101,
            description='Increase rating of Lilith',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=27,
            name='Cerene Token',
            icon=102,
            description='Increase rating of Cerene',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=28,
            name='Nova Token',
            icon=103,
            description='Increase rating of Nova',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=29,
            name='Liana Token',
            icon=104,
            description='Increase rating of Liana',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=30,
            name='Viera Token',
            icon=105,
            description='Increase rating of Viera',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=31,
            name='Puck Token',
            icon=106,
            description='Increase rating of Puck',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=32,
            name='Azalea Token',
            icon=107,
            description='Increase rating of Azalea',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=33,
            name='Miko Token',
            icon=108,
            description='Increase rating of Miko',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=34,
            name='Nu Token',
            icon=109,
            description='Increase rating of Nu',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, {
            id=51,
            name='Athena Token',
            icon=126,
            description='Increase rating of Athena',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=52,
            name='Athena (Ghost) Token',
            icon=127,
            description='Increase rating of Athena (Ghost)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=53,
            name='Shino Token',
            icon=128,
            description='Increase rating of Shino',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=54,
            name='Lea Token',
            icon=129,
            description='Increase rating of Lea',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=55,
            name='Mina Token',
            icon=130,
            description='Increase rating of Mina',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=56,
            name='Robin Token',
            icon=131,
            description='Increase rating of Robin',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=57,
            name='Raya Token',
            icon=132,
            description='Increase rating of Raya',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=58,
            name='Raya (Wolf) Token',
            icon=133,
            description='Increase rating of Raya (Wolf)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=59,
            name='Tipha Token',
            icon=134,
            description='Increase rating of Tipha',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=60,
            name='Tipha (Origin) Token',
            icon=135,
            description='Increase rating of Tipha (Origin)',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=61,
            name='Aria Token',
            icon=136,
            description='Increase rating of Aria',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=62,
            name='Aria (Wind) Token',
            icon=137,
            description='Increase rating of Aria (Wind)',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=63,
            name='Penelope Token',
            icon=138,
            description='Increase rating of Penelope',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=64,
            name='Penelope (Spirits) Token',
            icon=139,
            description='Increase rating of Penelope (Spirits)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=65,
            name='Kumiho Token',
            icon=140,
            description='Increase rating of Kumiho',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=66,
            name='Saki Token',
            icon=141,
            description='Increase rating of Saki',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=67,
            name='Saki (Butterfly) Token',
            icon=142,
            description='Increase rating of Saki (Butterfly)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=68,
            name='Narita Token',
            icon=143,
            description='Increase rating of Narita',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=69,
            name='Narita (Fox) Token',
            icon=144,
            description='Increase rating of Narita (Fox)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=70,
            name='Sun-Ni Token',
            icon=145,
            description='Increase rating of Sun-Ni',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=71,
            name='Sun-Ni (Dragon) Token',
            icon=146,
            description='Increase rating of Sun-Ni (Dragon)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }, {
            id=72,
            name='Nikolette Token',
            icon=147,
            description='Increase rating of Nikolette',
            recycle={
                category=2,
                id=1,
                count=5
            }
        }, {
            id=73,
            name='Nikolette (Curse) Token',
            icon=148,
            description='Increase rating of Nikolette (Curse)',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=74,
            name='Clara Token',
            icon=149,
            description='Increase rating of Clara',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=75,
            name='Anastasia II Token',
            icon=150,
            description='Increase rating of Anastasia II',
            recycle={
                category=2,
                id=1,
                count=10
            }
        }, {
            id=76,
            name='Anastasia II (Bless) Token',
            icon=151,
            description='Increase rating of Anastasia II (Bless)',
            recycle={
                category=2,
                id=1,
                count=50
            }
        }
    }, 
    { --3 Tome
        {
            id=1,
            name='Physical Tome I',
            icon=169,
            description='Upgrade physical skills',
            recycle={
                category=1,
                id=10,
                count=2
            }
        }, {
            id=2,
            name='Physical Tome II',
            icon=170,
            description='Upgrade physical skills',
            recycle={
                category=1,
                id=10,
                count=4
            }
        }, {
            id=3,
            name='Physical Tome III',
            icon=171,
            description='Upgrade physical skills',
            recycle={
                category=1,
                id=10,
                count=6
            }
        }, {
            id=4,
            name='Energy Tome I',
            icon=172,
            description='Upgrade fire and thunder skills',
            recycle={
                category=1,
                id=10,
                count=2
            }
        }, {
            id=5,
            name='Energy Tome III',
            icon=173,
            description='Upgrade fire and thunder skills',
            recycle={
                category=1,
                id=10,
                count=4
            }
        }, {
            id=6,
            name='Energy Tome III',
            icon=174,
            description='Upgrade fire and thunder skills',
            recycle={
                category=1,
                id=10,
                count=6
            }
        }, {
            id=7,
            name='Cold Tome I',
            icon=175,
            description='Upgrade water and ice skills',
            recycle={
                category=1,
                id=10,
                count=2
            }
        }, {
            id=8,
            name='Cold Tome II',
            icon=176,
            description='Upgrade water and ice skills',
            recycle={
                category=1,
                id=10,
                count=4
            }
        }, {
            id=9,
            name='Cold Tome III',
            icon=177,
            description='Upgrade water and ice skills',
            recycle={
                category=1,
                id=10,
                count=6
            }
        }, {
            id=10,
            name='Nature Tome I',
            icon=178,
            description='Upgrade wind and earth skills',
            recycle={
                category=1,
                id=10,
                count=2
            }
        }, {
            id=11,
            name='Nature Tome II',
            icon=179,
            description='Upgrade wind and earth skills',
            recycle={
                category=1,
                id=10,
                count=4
            }
        }, {
            id=12,
            name='Nature Tome III',
            icon=180,
            description='Upgrade wind and earth skills',
            recycle={
                category=1,
                id=10,
                count=6
            }
        }, {
            id=13,
            name='Elemental Tome I',
            icon=183,
            description='Upgrade light and dark skills',
            recycle={
                category=1,
                id=10,
                count=2
            }
        }, {
            id=14,
            name='Elemental Tome II',
            icon=184,
            description='Upgrade light and dark skills',
            recycle={
                category=1,
                id=10,
                count=4
            }
        }, {
            id=15,
            name='Elemental Tome III',
            icon=185,
            description='Upgrade light and dark skills',
            recycle={
                category=1,
                id=10,
                count=6
            }
        }, {
            id=16,
            name='Support Tome I',
            icon=186,
            description='Upgrade support skills',
            recycle={
                category=1,
                id=10,
                count=2
            }
        }, {
            id=17,
            name='Support Tome II',
            icon=187,
            description='Upgrade support skills',
            recycle={
                category=1,
                id=10,
                count=4
            }
        }, {
            id=18,
            name='Support Tome III',
            icon=188,
            description='Upgrade support skills',
            recycle={
                category=1,
                id=10,
                count=6
            }
        }
    }, 
    { --4 Gem
        {
            id=1,
            name='Atk+',
            icon=189,
            description='A common gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=1
            },
            upgrade={
                category=1,
                id=12,
                count=5
            }
        },
        {
            id=2,
            name='Def+',
            icon=189,
            description='A common gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=1
            },
            upgrade={
                category=1,
                id=12,
                count=5
            }
        },
        {
            id=3,
            name='Mat+',
            icon=189,
            description='A common gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=1
            },
            upgrade={
                category=1,
                id=12,
                count=5
            }
        },
        {
            id=4,
            name='Res+',
            icon=189,
            description='A common gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=1
            },
            upgrade={
                category=1,
                id=12,
                count=5
            }
        },
        {
            id=5,
            name='Agi+',
            icon=189,
            description='A common gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=1
            },
            upgrade={
                category=1,
                id=12,
                count=5
            }
        },
        {
            id=6,
            name='Luk+',
            icon=189,
            description='A common gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=1
            },
            upgrade={
                category=1,
                id=12,
                count=5
            }
        },
        {
            id=7,
            name='Mhp+',
            icon=190,
            description='An uncommon gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=8,
            name='Mmp+',
            icon=190,
            description='An uncommon gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=9,
            name='Hpr+',
            icon=190,
            description='An uncommon gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=10,
            name='Mpr+',
            icon=190,
            description='An uncommon gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=11,
            name='Cri+',
            icon=190,
            description='An uncommon gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=12,
            name='Eva+',
            icon=190,
            description='An uncommon gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=13,
            name='Stn+',
            icon=190,
            description='An uncommon gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=2
            },
            upgrade={
                category=1,
                id=12,
                count=10
            }
        },
        {
            id=14,
            name='Atk+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=15,
            name='Atk+ Mag+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=16,
            name='Atk+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=17,
            name='Atk+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=18,
            name='Atk+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=19,
            name='Def+ Mag+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=20,
            name='Def+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=21,
            name='Def+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=22,
            name='Def+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=23,
            name='Mag+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=24,
            name='Mag+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=25,
            name='Mag+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=26,
            name='Res+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=27,
            name='Res+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=28,
            name='Agi+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=29,
            name='Mhp+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=30,
            name='Mhp+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=31,
            name='Mhp+ Mag+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=32,
            name='Mhp+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=33,
            name='Mhp+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=34,
            name='Mhp+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=35,
            name='Mmp+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=36,
            name='Mmp+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=37,
            name='Mmp+ Mag+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=38,
            name='Mmp+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=39,
            name='Mmp+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=40,
            name='Mmp+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=41,
            name='Hpr+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=42,
            name='Hpr+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=43,
            name='Hpr+ Mat+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=44,
            name='Hpr+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=45,
            name='Hpr+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=46,
            name='Hpr+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=47,
            name='Mpr+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=48,
            name='Mpr+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=49,
            name='Mpr+ Mag+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=50,
            name='Mpr+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=51,
            name='Mpr+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=52,
            name='Mpr+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=53,
            name='Cri+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=54,
            name='Cri+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=55,
            name='Cri+ Mat+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=56,
            name='Cri+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=57,
            name='Cri+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=58,
            name='Cri+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=59,
            name='Eva+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=60,
            name='Eva+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=61,
            name='Eva+ Mat+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=61,
            name='Eva+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=62,
            name='Eva+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=63,
            name='Eva+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=64,
            name='Stn+ Atk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 1, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=65,
            name='Stn+ Def+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 1, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=66,
            name='Stn+ Mat+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 1, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=67,
            name='Stn+ Res+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 1, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=68,
            name='Stn+ Agi+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 1, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=69,
            name='Stn+ Luk+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 1 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=70,
            name='Mhp+ Mmp+',
            icon=191,
            description='A rare gem',
            stats={ 3, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=71,
            name='Mhp+ Hpr+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=72,
            name='Mhp+ Mpr+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=73,
            name='Mhp+ Cri+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=74,
            name='Mhp+ Eva+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=75,
            name='Mhp+ Stn+',
            icon=191,
            description='A rare gem',
            stats={ 3, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=76,
            name='Mmp+ Hpr+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=77,
            name='Mmp+ Mpr+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=78,
            name='Mmp+ Cri+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=79,
            name='Mmp+ Eva+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=80,
            name='Mmp+ Stn+',
            icon=191,
            description='A rare gem',
            stats={ 0, 3, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=81,
            name='Hpr+ Mpr+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0.002, 0, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=82,
            name='Hpr+ Cri+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=83,
            name='Hpr+ Eva+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=84,
            name='Hpr+ Stn+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.002, 0, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=85,
            name='Mpr+ Cri+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0.003, 0, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=86,
            name='Mpr+ Eva+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=87,
            name='Mpr+ Stn+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.002, 0, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=88,
            name='Cri+ Eva+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0.003, 0 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=89,
            name='Cri+ Stn+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.003, 0, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20
            }
        },
        {
            id=90,
            name='Eva+ Stn+',
            icon=191,
            description='A rare gem',
            stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.003, 0.005 },
            recycle={
                category=1,
                id=12,
                count=3
            },
            upgrade={
                category=1,
                id=12,
                count=20

            }
        }

    }, 
    { --5 Weapon
        {
            id=1,
            name='Physical. Sword',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=2,
            name='Physical. Sword',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=3,
            name='Physical. Sword',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=4,
            name='Physical. Wand',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=5,
            name='Physical. Wand',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=6,
            name='Physical. Wand',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=7,
            name='Physical. Mace',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=8,
            name='Physical. Mace',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=9,
            name='Physical. Mace',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=10,
            name='Physical. Broadsword',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=11,
            name='Physical. Broadsword',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=12,
            name='Physical. Broadsword',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=13,
            name='Physical. Dagger',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=14,
            name='Physical. Dagger',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=15,
            name='Physical. Dagger',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=16,
            name='Physical. Staff',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=17,
            name='Physical. Staff',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=18,
            name='Physical. Staff',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=19,
            name='Physical. Energy',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=20,
            name='Physical. Energy',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=21,
            name='Physical. Energy',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=22,
            name='Physical. Scythe',
            icon=197,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=23,
            name='Physical. Scythe',
            icon=198,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=24,
            name='Physical. Scythe',
            icon=199,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=25,
            name='Magical. Sword',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=26,
            name='Magical. Sword',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=27,
            name='Magical. Sword',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=28,
            name='Magical. Wand',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=29,
            name='Magical. Wand',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=30,
            name='Magical. Wand',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=31,
            name='Magical. Mace',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=32,
            name='Magical. Mace',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=33,
            name='Magical. Mace',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=34,
            name='Magical. Broadsword',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=35,
            name='Magical. Broadsword',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=36,
            name='Magical. Broadsword',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=37,
            name='Magical. Dagger',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=38,
            name='Magical. Dagger',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=39,
            name='Magical. Dagger',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=40,
            name='Magical. Staff',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=41,
            name='Magical. Staff',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=42,
            name='Magical. Staff',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=43,
            name='Magical. Energy',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=44,
            name='Magical. Energy',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=45,
            name='Magical. Energy',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=46,
            name='Magical. Scythe',
            icon=197,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=47,
            name='Magical. Scythe',
            icon=198,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=48,
            name='Magical. Scythe',
            icon=199,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=49,
            name='Damage. Sword',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=50,
            name='Damage. Sword',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=51,
            name='Damage. Sword',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=52,
            name='Damage. Wand',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=53,
            name='Damage. Wand',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=54,
            name='Damage. Wand',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=55,
            name='Damage. Mace',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=56,
            name='Damage. Mace',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=57,
            name='Damage. Mace',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=58,
            name='Damage. Broadsword',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=59,
            name='Damage. Broadsword',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=60,
            name='Damage. Broadsword',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=61,
            name='Damage. Dagger',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=62,
            name='Damage. Dagger',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=63,
            name='Damage. Dagger',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=64,
            name='Damage. Staff',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=65,
            name='Damage. Staff',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=66,
            name='Damage. Staff',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=67,
            name='Damage. Energy',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=68,
            name='Damage. Energy',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=69,
            name='Damage. Energy',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=70,
            name='Damage. Scythe',
            icon=197,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=71,
            name='Damage. Scythe',
            icon=198,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=72,
            name='Damage. Scythe',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=73,
            name='Guard. Sword',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=74,
            name='Guard. Sword',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=75,
            name='Guard. Sword',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=76,
            name='Guard. Wand',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=77,
            name='Guard. Wand',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=78,
            name='Guard. Wand',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=79,
            name='Guard. Mace',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=80,
            name='Guard. Mace',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=81,
            name='Guard. Mace',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=82,
            name='Guard. Broadsword',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=83,
            name='Guard. Broadsword',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=84,
            name='Guard. Broadsword',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=85,
            name='Guard. Dagger',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=86,
            name='Guard. Dagger',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=87,
            name='Guard. Dagger',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=88,
            name='Guard. Staff',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=89,
            name='Guard. Staff',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=90,
            name='Guard. Staff',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=91,
            name='Guard. Energy',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=92,
            name='Guard. Energy',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=93,
            name='Guard. Energy',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=94,
            name='Guard. Scythe',
            icon=197,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=95,
            name='Guard. Scythe',
            icon=198,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=96,
            name='Guard. Scythe',
            icon=199,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=97,
            name='Speed. Sword',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=98,
            name='Speed. Sword',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=99,
            name='Speed. Sword',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=100,
            name='Speed. Wand',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=101,
            name='Speed. Wand',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=102,
            name='Speed. Wand',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=103,
            name='Speed. Mace',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=104,
            name='Speed. Mace',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=105,
            name='Speed. Mace',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=106,
            name='Speed. Broadsword',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=107,
            name='Speed. Broadsword',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=108,
            name='Speed. Broadsword',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=109,
            name='Speed. Dagger',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=110,
            name='Speed. Dagger',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=111,
            name='Speed. Dagger',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=112,
            name='Speed. Staff',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=113,
            name='Speed. Staff',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=114,
            name='Speed. Staff',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=115,
            name='Speed. Energy',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=116,
            name='Speed. Energy',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=117,
            name='Speed. Energy',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=118,
            name='Speed. Scythe',
            icon=197,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=119,
            name='Speed. Scythe',
            icon=198,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=120,
            name='Speed. Scythe',
            icon=199,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=121,
            name='Chance. Sword',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=122,
            name='Chance. Sword',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=123,
            name='Chance. Sword',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=124,
            name='Chance. Wand',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=125,
            name='Chance. Wand',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=126,
            name='Chance. Wand',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=127,
            name='Chance. Mace',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=128,
            name='Chance. Mace',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=129,
            name='Chance. Mace',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=130,
            name='Chance. Broadsword',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=131,
            name='Chance. Broadsword',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=132,
            name='Chance. Broadsword',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=133,
            name='Chance. Dagger',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=134,
            name='Chance. Dagger',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=135,
            name='Chance. Dagger',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=136,
            name='Chance. Staff',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=137,
            name='Chance. Staff',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=138,
            name='Chance. Staff',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=139,
            name='Chance. Energy',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=140,
            name='Chance. Energy',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=141,
            name='Chance. Energy',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=142,
            name='Chance. Scythe',
            icon=197,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=143,
            name='Chance. Scythe',
            icon=198,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=144,
            name='Chance. Scythe',
            icon=199,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=145,
            name='Average. Sword',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=146,
            name='Average. Sword',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=147,
            name='Average. Sword',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 5, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=148,
            name='Average. Wand',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=149,
            name='Average. Wand',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=150,
            name='Average. Wand',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 5, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=151,
            name='Average. Mace',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=152,
            name='Average. Mace',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=153,
            name='Average. Mace',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=154,
            name='Average. Broadsword',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=155,
            name='Average. Broadsword',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=156,
            name='Average. Broadsword',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 3, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=157,
            name='Average. Dagger',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=158,
            name='Average. Dagger',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=159,
            name='Average. Dagger',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 3, 0, 0, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=160,
            name='Average. Staff',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=161,
            name='Average. Staff',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=162,
            name='Average. Staff',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 3, 3, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=163,
            name='Average. Energy',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=164,
            name='Average. Energy',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=165,
            name='Average. Energy',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 3, 0, 3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=166,
            name='Average. Scythe',
            icon=197,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=167,
            name='Average. Scythe',
            icon=198,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=168,
            name='Average. Scythe',
            icon=199,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 2, 0, 2, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=169,
            name='Tower. Mace',
            icon=199,
            description='Equip 2 - +10% Stn\nEquip 4 - +15% Stn',
            set=8,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=170,
            name='Arena. Mace',
            icon=199,
            description='Equip 2 - +5% Cri\nEquip 4 - +10% Cri',
            set=9,
            stats={ 0, 0, 3, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=171,
            name='School. Pencil',
            icon=199,
            description='Equip 2 - +2% Mmp\nEquip 4 - +5% Mpr',
            set=10,
            stats={ 0, 2, 0, 0, 3, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        }
    }, 
    { --6 Body
        {
            id=1,
            name='Physical. Chainmail',
            icon=200,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=2,
            name='Physical. Chainmail',
            icon=201,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=3,
            name='Physical. Chainmail',
            icon=202,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=4,
            name='Physical. Thornmail',
            icon=200,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=5,
            name='Physical. Thornmail',
            icon=201,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=6,
            name='Physical. Thornmail',
            icon=202,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=7,
            name='Physical. Cloak',
            icon=200,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=8,
            name='Physical. Cloak',
            icon=201,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=9,
            name='Physical. Cloak',
            icon=202,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=10,
            name='Physical. Cape',
            icon=200,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=11,
            name='Physical. Cape',
            icon=201,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=12,
            name='Physical. Cape',
            icon=202,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=13,
            name='Physical. Platemail',
            icon=200,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=14,
            name='Physical. Platemail',
            icon=201,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=15,
            name='Physical. Platemail',
            icon=202,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=16,
            name='Magical. Chainmail',
            icon=200,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=17,
            name='Magical. Chainmail',
            icon=201,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=18,
            name='Magical. Chainmail',
            icon=202,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=19,
            name='Magical. Thornmail',
            icon=200,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=20,
            name='Magical. Thornmail',
            icon=201,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=21,
            name='Magical. Thornmail',
            icon=202,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=22,
            name='Magical. Cloak',
            icon=200,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=23,
            name='Magical. Cloak',
            icon=201,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=24,
            name='Magical. Cloak',
            icon=202,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=25,
            name='Magical. Cape',
            icon=200,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=26,
            name='Magical. Cape',
            icon=201,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=27,
            name='Magical. Cape',
            icon=202,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=28,
            name='Magical. Platemail',
            icon=200,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=29,
            name='Magical. Platemail',
            icon=201,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=30,
            name='Magical. Platemail',
            icon=202,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=31,
            name='Damage. Chainmail',
            icon=200,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=32,
            name='Damage. Chainmail',
            icon=201,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=33,
            name='Damage. Chainmail',
            icon=202,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=34,
            name='Damage. Thornmail',
            icon=200,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=35,
            name='Damage. Thornmail',
            icon=201,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=36,
            name='Damage. Thornmail',
            icon=202,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=37,
            name='Damage. Cloak',
            icon=200,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=38,
            name='Damage. Cloak',
            icon=201,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=39,
            name='Damage. Cloak',
            icon=202,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=40,
            name='Damage. Cape',
            icon=200,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=41,
            name='Damage. Cape',
            icon=201,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=42,
            name='Damage. Cape',
            icon=202,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=43,
            name='Damage. Platemail',
            icon=200,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=44,
            name='Damage. Platemail',
            icon=201,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=45,
            name='Damage. Platemail',
            icon=202,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1% Atk/Mag',
            set=3,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=46,
            name='Guard. Chainmail',
            icon=200,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=47,
            name='Guard. Chainmail',
            icon=201,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=48,
            name='Guard. Chainmail',
            icon=202,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=49,
            name='Guard. Thornmail',
            icon=200,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=50,
            name='Guard. Thornmail',
            icon=201,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=51,
            name='Guard. Thornmail',
            icon=202,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=52,
            name='Guard. Cloak',
            icon=200,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=53,
            name='Guard. Cloak',
            icon=201,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=54,
            name='Guard. Cloak',
            icon=202,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=55,
            name='Guard. Cape',
            icon=200,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=56,
            name='Guard. Cape',
            icon=201,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=57,
            name='Guard. Cape',
            icon=202,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=58,
            name='Guard. Platemail',
            icon=200,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=59,
            name='Guard. Platemail',
            icon=201,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=60,
            name='Guard. Platemail',
            icon=202,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=61,
            name='Speed. Chainmail',
            icon=200,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=62,
            name='Speed. Chainmail',
            icon=201,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=63,
            name='Speed. Chainmail',
            icon=202,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=64,
            name='Speed. Thornmail',
            icon=200,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=65,
            name='Speed. Thornmail',
            icon=201,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=66,
            name='Speed. Thornmail',
            icon=202,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=67,
            name='Speed. Cloak',
            icon=200,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=68,
            name='Speed. Cloak',
            icon=201,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=69,
            name='Speed. Cloak',
            icon=202,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=70,
            name='Speed. Cape',
            icon=200,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=71,
            name='Speed. Cape',
            icon=201,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=72,
            name='Speed. Cape',
            icon=202,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=73,
            name='Speed. Platemail',
            icon=200,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=74,
            name='Speed. Platemail',
            icon=201,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=75,
            name='Speed. Platemail',
            icon=202,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=76,
            name='Chance. Chainmail',
            icon=200,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=77,
            name='Chance. Chainmail',
            icon=201,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=78,
            name='Chance. Chainmail',
            icon=202,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=79,
            name='Chance. Thornmail',
            icon=200,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=80,
            name='Chance. Thornmail',
            icon=201,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=81,
            name='Chance. Thornmail',
            icon=202,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=82,
            name='Chance. Cloak',
            icon=200,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=83,
            name='Chance. Cloak',
            icon=201,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=84,
            name='Chance. Cloak',
            icon=202,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=85,
            name='Chance. Cape',
            icon=200,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=86,
            name='Chance. Cape',
            icon=201,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=87,
            name='Chance. Cape',
            icon=202,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=88,
            name='Chance. Platemail',
            icon=200,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=89,
            name='Chance. Platemail',
            icon=201,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=90,
            name='Chance. Platemail',
            icon=202,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=91,
            name='Average. Chainmail',
            icon=200,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=92,
            name='Average. Chainmail',
            icon=201,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=93,
            name='Average. Chainmail',
            icon=202,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=94,
            name='Average. Thornmail',
            icon=200,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=95,
            name='Average. Thornmail',
            icon=201,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=96,
            name='Average. Thornmail',
            icon=202,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 1, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=97,
            name='Average. Cloak',
            icon=200,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=98,
            name='Average. Cloak',
            icon=201,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=99,
            name='Average. Cloak',
            icon=202,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=100,
            name='Average. Cape',
            icon=200,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=101,
            name='Average. Cape',
            icon=201,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=102,
            name='Average. Cape',
            icon=202,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 0, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=103,
            name='Average. Platemail',
            icon=200,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=104,
            name='Average. Platemail',
            icon=201,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=105,
            name='Average. Platemail',
            icon=202,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 6, 0, 0, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=106,
            name='Tower. Chainmail',
            icon=202,
            description='Equip 2 - +10% Stn\nEquip 4 - +15% Stn',
            set=8,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=107,
            name='Arena. Chainmail',
            icon=202,
            description='Equip 2 - +5% Cri\nEquip 4 - +10% Cri',
            set=9,
            stats={ 0, 0, 0, 4, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=108,
            name='School. Uniform',
            icon=202,
            description='Equip 2 - +2% Mmp\nEquip 4 - +5% Mpr',
            set=10,
            stats={ 0, 1, 0, 2, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        }
    }, 
    { --7 Head
        {
            id=1,
            name='Physical. Circlet',
            icon=203,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=2,
            name='Physical. Circlet',
            icon=204,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=3,
            name='Physical. Circlet',
            icon=205,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=4,
            name='Physical. Helmet',
            icon=203,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=5,
            name='Physical. Helmet',
            icon=204,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=6,
            name='Physical. Helmet',
            icon=205,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=7,
            name='Physical. Pointed Hat',
            icon=203,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=8,
            name='Physical. Pointed Hat',
            icon=204,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=9,
            name='Physical. Pointed Hat',
            icon=205,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=10,
            name='Physical. Garland',
            icon=203,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=11,
            name='Physical. Garland',
            icon=204,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=12,
            name='Physical. Garland',
            icon=205,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=13,
            name='Physical. Crown',
            icon=203,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=14,
            name='Physical. Crown',
            icon=204,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=15,
            name='Physical. Crown',
            icon=205,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=16,
            name='Magical. Circlet',
            icon=203,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=17,
            name='Magical. Circlet',
            icon=204,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=18,
            name='Magical. Circlet',
            icon=205,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=19,
            name='Magical. Helmet',
            icon=203,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=20,
            name='Magical. Helmet',
            icon=204,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=21,
            name='Magical. Helmet',
            icon=205,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=22,
            name='Magical. Pointed Hat',
            icon=203,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=23,
            name='Magical. Pointed Hat',
            icon=204,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=24,
            name='Magical. Pointed Hat',
            icon=205,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=25,
            name='Magical. Garland',
            icon=203,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=26,
            name='Magical. Garland',
            icon=204,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=27,
            name='Magical. Garland',
            icon=205,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=28,
            name='Magical. Crown',
            icon=203,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=29,
            name='Magical. Crown',
            icon=204,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=30,
            name='Magical. Crown',
            icon=205,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=31,
            name='Damage. Circlet',
            icon=203,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=32,
            name='Damage. Circlet',
            icon=204,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=33,
            name='Damage. Circlet',
            icon=205,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=34,
            name='Damage. Helmet',
            icon=203,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=35,
            name='Damage. Helmet',
            icon=204,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=36,
            name='Damage. Helmet',
            icon=205,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=37,
            name='Damage. Pointed Hat',
            icon=203,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=38,
            name='Damage. Pointed Hat',
            icon=204,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=39,
            name='Damage. Pointed Hat',
            icon=205,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=40,
            name='Damage. Garland',
            icon=203,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=41,
            name='Damage. Garland',
            icon=204,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=42,
            name='Damage. Garland',
            icon=205,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=43,
            name='Damage. Crown',
            icon=203,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=44,
            name='Damage. Crown',
            icon=204,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=45,
            name='Damage. Crown',
            icon=205,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=46,
            name='Guard. Circlet',
            icon=203,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=47,
            name='Guard. Circlet',
            icon=204,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=48,
            name='Guard. Circlet',
            icon=205,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=49,
            name='Guard. Helmet',
            icon=203,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=50,
            name='Guard. Helmet',
            icon=204,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=51,
            name='Guard. Helmet',
            icon=205,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=52,
            name='Guard. Pointed Hat',
            icon=203,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=53,
            name='Guard. Pointed Hat',
            icon=204,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=54,
            name='Guard. Pointed Hat',
            icon=205,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=55,
            name='Guard. Garland',
            icon=203,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=56,
            name='Guard. Garland',
            icon=204,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=57,
            name='Guard. Garland',
            icon=205,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=58,
            name='Guard. Crown',
            icon=203,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=59,
            name='Guard. Crown',
            icon=204,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=60,
            name='Guard. Crown',
            icon=205,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=61,
            name='Speed. Circlet',
            icon=203,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=62,
            name='Speed. Circlet',
            icon=204,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=63,
            name='Speed. Circlet',
            icon=205,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=64,
            name='Speed. Helmet',
            icon=203,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=65,
            name='Speed. Helmet',
            icon=204,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=66,
            name='Speed. Helmet',
            icon=205,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=67,
            name='Speed. Pointed Hat',
            icon=203,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=68,
            name='Speed. Pointed Hat',
            icon=204,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=69,
            name='Speed. Pointed Hat',
            icon=205,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=70,
            name='Speed. Garland',
            icon=203,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=71,
            name='Speed. Garland',
            icon=204,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=72,
            name='Speed. Garland',
            icon=205,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=73,
            name='Speed. Crown',
            icon=203,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=74,
            name='Speed. Crown',
            icon=204,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=75,
            name='Speed. Crown',
            icon=205,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=76,
            name='Chance. Circlet',
            icon=203,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=77,
            name='Chance. Circlet',
            icon=204,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=78,
            name='Chance. Circlet',
            icon=205,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=79,
            name='Chance. Helmet',
            icon=203,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=80,
            name='Chance. Helmet',
            icon=204,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=81,
            name='Chance. Helmet',
            icon=205,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=82,
            name='Chance. Pointed Hat',
            icon=203,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=83,
            name='Chance. Pointed Hat',
            icon=204,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=84,
            name='Chance. Pointed Hat',
            icon=205,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=85,
            name='Chance. Garland',
            icon=203,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=86,
            name='Chance. Garland',
            icon=204,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=87,
            name='Chance. Garland',
            icon=205,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=88,
            name='Chance. Crown',
            icon=203,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=89,
            name='Chance. Crown',
            icon=204,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=90,
            name='Chance. Crown',
            icon=205,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=91,
            name='Average. Circlet',
            icon=203,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=92,
            name='Average. Circlet',
            icon=204,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=93,
            name='Average. Circlet',
            icon=205,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=94,
            name='Average. Helmet',
            icon=203,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=95,
            name='Average. Helmet',
            icon=204,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=96,
            name='Average. Helmet',
            icon=205,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 2, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=97,
            name='Average. Pointed Hat',
            icon=203,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=98,
            name='Average. Pointed Hat',
            icon=204,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=99,
            name='Average. Pointed Hat',
            icon=205,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 1, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=100,
            name='Average. Garland',
            icon=203,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=101,
            name='Average. Garland',
            icon=204,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=102,
            name='Average. Garland',
            icon=205,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 2, 0, 2 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=103,
            name='Average. Crown',
            icon=203,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=104,
            name='Average. Crown',
            icon=204,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=105,
            name='Average. Crown',
            icon=205,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 6, -3, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=106,
            name='Tower. Circlet',
            icon=205,
            description='Equip 2 - +10% Stn\nEquip 4 - +15% Stn',
            set=8,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=107,
            name='Arena. Circlet',
            icon=205,
            description='Equip 2 - +5% Cri\nEquip 4 - +10% Cri',
            set=9,
            stats={ 0, 0, 0, 0, 0, 4, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=108,
            name='School. Mortarboard',
            icon=205,
            description='Equip 2 - +2% Mmp\nEquip 4 - +5% Mpr',
            set=10,
            stats={ 0, 1, 0, 0, 0, 2, 0, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        }
    }, 
    { --8 Leg
        {
            id=1,
            name='Physical. Boots',
            icon=206,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=2,
            name='Physical. Boots',
            icon=207,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=3,
            name='Physical. Boots',
            icon=208,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=4,
            name='Physical. Horseshoe',
            icon=206,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=5,
            name='Physical. Horseshoe',
            icon=207,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=6,
            name='Physical. Horseshoe',
            icon=208,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=7,
            name='Physical. Heels',
            icon=206,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=8,
            name='Physical. Heels',
            icon=207,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=9,
            name='Physical. Heels',
            icon=208,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=10,
            name='Physical. Steel Cap',
            icon=206,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=11,
            name='Physical. Steel Cap',
            icon=207,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=12,
            name='Physical. Steel Cap',
            icon=208,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=13,
            name='Physical. Joggers',
            icon=206,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=14,
            name='Physical. Joggers',
            icon=207,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=15,
            name='Physical. Joggers',
            icon=208,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=16,
            name='Physical. Slippers',
            icon=206,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=17,
            name='Physical. Slippers',
            icon=207,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=18,
            name='Physical. Slippers',
            icon=208,
            description='Equip 2 - +2% Def\nEquip 4 - +2% Atk',
            set=1,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=19,
            name='Magical. Boots',
            icon=206,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=20,
            name='Magical. Boots',
            icon=207,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=21,
            name='Magical. Boots',
            icon=208,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=22,
            name='Magical. Horseshoe',
            icon=206,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=23,
            name='Magical. Horseshoe',
            icon=207,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=24,
            name='Magical. Horseshoe',
            icon=208,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=25,
            name='Magical. Heels',
            icon=206,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=26,
            name='Magical. Heels',
            icon=207,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=27,
            name='Magical. Heels',
            icon=208,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=28,
            name='Magical. Steel Cap',
            icon=206,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=29,
            name='Magical. Steel Cap',
            icon=207,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=30,
            name='Magical. Steel Cap',
            icon=208,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=31,
            name='Magical. Joggers',
            icon=206,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=32,
            name='Magical. Joggers',
            icon=207,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=33,
            name='Magical. Joggers',
            icon=208,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=34,
            name='Magical. Slippers',
            icon=206,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=35,
            name='Magical. Slippers',
            icon=207,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=36,
            name='Magical. Slippers',
            icon=208,
            description='Equip 2 - +2% Res\nEquip 4 - +2% Mat',
            set=2,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=37,
            name='Damage. Boots',
            icon=206,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=38,
            name='Damage. Boots',
            icon=207,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=39,
            name='Damage. Boots',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=40,
            name='Damage. Horseshoe',
            icon=206,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=41,
            name='Damage. Horseshoe',
            icon=207,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=42,
            name='Damage. Horseshoe',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=43,
            name='Damage. Heels',
            icon=206,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=44,
            name='Damage. Heels',
            icon=207,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=45,
            name='Damage. Heels',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=46,
            name='Damage. Steel Cap',
            icon=206,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=47,
            name='Damage. Steel Cap',
            icon=207,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=48,
            name='Damage. Steel Cap',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=49,
            name='Damage. Joggers',
            icon=206,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=50,
            name='Damage. Joggers',
            icon=207,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=51,
            name='Damage. Joggers',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=52,
            name='Damage. Slippers',
            icon=206,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=53,
            name='Damage. Slippers',
            icon=207,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=54,
            name='Damage. Slippers',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +1.5% Atk/Mat',
            set=3,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=55,
            name='Guard. Boots',
            icon=206,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=56,
            name='Guard. Boots',
            icon=207,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=57,
            name='Guard. Boots',
            icon=208,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=58,
            name='Guard. Horseshoe',
            icon=206,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=59,
            name='Guard. Horseshoe',
            icon=207,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=60,
            name='Guard. Horseshoe',
            icon=208,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=61,
            name='Guard. Heels',
            icon=206,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=62,
            name='Guard. Heels',
            icon=207,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=63,
            name='Guard. Heels',
            icon=208,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=64,
            name='Guard. Steel Cap',
            icon=206,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=65,
            name='Guard. Steel Cap',
            icon=207,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=66,
            name='Guard. Steel Cap',
            icon=208,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=67,
            name='Guard. Joggers',
            icon=206,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=68,
            name='Guard. Joggers',
            icon=207,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=69,
            name='Guard. Joggers',
            icon=208,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=70,
            name='Guard. Slippers',
            icon=206,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=71,
            name='Guard. Slippers',
            icon=207,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=72,
            name='Guard. Slippers',
            icon=208,
            description='Equip 2 - +2% Mhp\nEquip 4 - +1.5% Def/Res',
            set=4,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=73,
            name='Speed. Boots',
            icon=206,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=74,
            name='Speed. Boots',
            icon=207,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=75,
            name='Speed. Boots',
            icon=208,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=76,
            name='Speed. Horseshoe',
            icon=206,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=77,
            name='Speed. Horseshoe',
            icon=207,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=78,
            name='Speed. Horseshoe',
            icon=208,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=79,
            name='Speed. Heels',
            icon=206,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=80,
            name='Speed. Heels',
            icon=207,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=81,
            name='Speed. Heels',
            icon=208,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=82,
            name='Speed. Steel Cap',
            icon=206,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=83,
            name='Speed. Steel Cap',
            icon=207,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=84,
            name='Speed. Steel Cap',
            icon=208,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=85,
            name='Speed. Joggers',
            icon=206,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=86,
            name='Speed. Joggers',
            icon=207,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=87,
            name='Speed. Joggers',
            icon=208,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=88,
            name='Speed. Slippers',
            icon=206,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=89,
            name='Speed. Slippers',
            icon=207,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=90,
            name='Speed. Slippers',
            icon=208,
            description='Equip 2 - +1% Agi\nEquip 4 - +2% Agi',
            set=5,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=91,
            name='Chance. Boots',
            icon=206,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=92,
            name='Chance. Boots',
            icon=207,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=93,
            name='Chance. Boots',
            icon=208,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=94,
            name='Chance. Horseshoe',
            icon=206,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=95,
            name='Chance. Horseshoe',
            icon=207,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=96,
            name='Chance. Horseshoe',
            icon=208,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=97,
            name='Chance. Heels',
            icon=206,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=98,
            name='Chance. Heels',
            icon=207,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=99,
            name='Chance. Heels',
            icon=208,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=100,
            name='Chance. Steel Cap',
            icon=206,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=101,
            name='Chance. Steel Cap',
            icon=207,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=102,
            name='Chance. Steel Cap',
            icon=208,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=103,
            name='Chance. Joggers',
            icon=206,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=104,
            name='Chance. Joggers',
            icon=207,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=105,
            name='Chance. Joggers',
            icon=208,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=106,
            name='Chance. Slippers',
            icon=206,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=107,
            name='Chance. Slippers',
            icon=207,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=108,
            name='Chance. Slippers',
            icon=208,
            description='Equip 2 - +1% Luk\nEquip 4 - +2% Luk',
            set=6,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=109,
            name='Average. Boots',
            icon=206,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=110,
            name='Average. Boots',
            icon=207,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=111,
            name='Average. Boots',
            icon=208,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=112,
            name='Average. Horseshoe',
            icon=206,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=113,
            name='Average. Horseshoe',
            icon=207,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=114,
            name='Average. Horseshoe',
            icon=208,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 0, 0, 0, 3, 3 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=115,
            name='Average. Heels',
            icon=206,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=116,
            name='Average. Heels',
            icon=207,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=117,
            name='Average. Heels',
            icon=208,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 1, 0, 1, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=118,
            name='Average. Steel Cap',
            icon=206,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=119,
            name='Average. Steel Cap',
            icon=207,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=120,
            name='Average. Steel Cap',
            icon=208,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, 1, 0, 1, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=121,
            name='Average. Joggers',
            icon=206,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=122,
            name='Average. Joggers',
            icon=207,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=123,
            name='Average. Joggers',
            icon=208,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, -2, 0, -2, 0, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=124,
            name='Average. Slippers',
            icon=206,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=125,
            name='Average. Slippers',
            icon=207,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=126,
            name='Average. Slippers',
            icon=208,
            description='Equip 4 - +0.5% All Stats (exclude Mhp/Mmp)',
            set=7,
            stats={ 0, 0, 0, -2, 0, -2, 8, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=127,
            name='Tower. Boots',
            icon=208,
            description='Equip 2 - +10% Stn\nEquip 4 - +15% Stn',
            set=8,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=128,
            name='Arena. Boots',
            icon=208,
            description='Equip 2 - +5% Cri\nEquip 4 - +10% Cri',
            set=9,
            stats={ 0, 0, 0, 0, 0, 0, 5, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=129,
            name='School. Shoes',
            icon=208,
            description='Equip 2 - +2% Mmp\nEquip 4 - +5% Mpr',
            set=10,
            stats={ 0, 2, 0, 0, 0, 0, 2, 0 },
            additional={ 0, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        }
    }, 
    { --9 Accessory
        {
            id=1,
            name='Max Hp',
            icon=211,
            description='',
            set=0,
            stats={ 5, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=2,
            name='Max Hp',
            icon=212,
            description='',
            set=0,
            stats={ 5, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=3,
            name='Max Hp',
            icon=213,
            description='',
            set=0,
            stats={ 5, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=4,
            name='Max Mp',
            icon=211,
            description='',
            set=0,
            stats={ 0, 5, 0, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=5,
            name='Max Mp',
            icon=212,
            description='',
            set=0,
            stats={ 0, 5, 0, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=6,
            name='Max Mp',
            icon=213,
            description='',
            set=0,
            stats={ 0, 5, 0, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=7,
            name='Attack',
            icon=211,
            description='',
            set=0,
            stats={ 0, 0, 2, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=8,
            name='Attack',
            icon=212,
            description='',
            set=0,
            stats={ 0, 0, 2, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=9,
            name='Attack',
            icon=213,
            description='',
            set=0,
            stats={ 0, 0, 2, 0, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=10,
            name='Defence',
            icon=211,
            description='',
            set=0,
            stats={ 0, 0, 0, 2, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=11,
            name='Defence',
            icon=212,
            description='',
            set=0,
            stats={ 0, 0, 0, 2, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=12,
            name='Defence',
            icon=213,
            description='',
            set=0,
            stats={ 0, 0, 0, 2, 0, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=13,
            name='Magic',
            icon=211,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 2, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=14,
            name='Magic',
            icon=212,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 2, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=15,
            name='Magic',
            icon=213,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 2, 0, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=16,
            name='Resist',
            icon=211,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 2, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=17,
            name='Resist',
            icon=212,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 2, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=18,
            name='Resist',
            icon=213,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 2, 0, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=19,
            name='Agility',
            icon=211,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 0, 2, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=20,
            name='Agility',
            icon=212,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 0, 2, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=21,
            name='Agility',
            icon=213,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 0, 2, 0 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=22,
            name='Luck',
            icon=211,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 0, 0, 2 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=23,
            name='Luck',
            icon=212,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 0, 0, 2 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=24,
            name='Luck',
            icon=213,
            description='',
            set=0,
            stats={ 0, 0, 0, 0, 0, 0, 0, 2 },
            --additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=25,
            name='Hp Regen',
            icon=211,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.01, 0, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=26,
            name='Hp Regen',
            icon=212,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.01, 0, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=27,
            name='Hp Regen',
            icon=213,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0.01, 0, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=28,
            name='Mp Regen',
            icon=211,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.01, 0, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=29,
            name='Mp Regen',
            icon=212,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.01, 0, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=30,
            name='Mp Regen',
            icon=213,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0.01, 0, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=31,
            name='Critical',
            icon=211,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.015, 0, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=32,
            name='Critical',
            icon=212,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.015, 0, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=33,
            name='Critical',
            icon=213,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0.015, 0, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=34,
            name='Evasion',
            icon=211,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.015, 0 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=35,
            name='Evasion',
            icon=212,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.015, 0 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=36,
            name='Evasion',
            icon=213,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0.015, 0 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=37,
            name='Stun',
            icon=211,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.02 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=38,
            name='Stun',
            icon=212,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.02 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=39,
            name='Stun',
            icon=213,
            description='',
            set=0,
            --stats={ 0, 0, 0, 0, 0, 0, 0, 0 },
            additional={ 0, 0, 0, 0, 0.02 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=40,
            name='Slash Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [1]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=41,
            name='Slash Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [1]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=42,
            name='Slash Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [1]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=43,
            name='Bash Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [2]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=44,
            name='Bash Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [2]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=45,
            name='Bash Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [2]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=46,
            name='Pierce Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [3]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=47,
            name='Pierce Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [3]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=48,
            name='Pierce Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [4]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=49,
            name='Fire Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [4]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=50,
            name='Fire Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [4]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=51,
            name='Fire Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [4]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=52,
            name='Thunder Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [5]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=53,
            name='Thunder Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [5]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=54,
            name='Thunder Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [5]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=55,
            name='Ice Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [6]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=56,
            name='Ice Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [6]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=57,
            name='Ice Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [6]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=58,
            name='Water Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [7]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=59,
            name='Water Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [7]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=60,
            name='Water Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [7]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=61,
            name='Earth Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [8]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=62,
            name='Earth Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [8]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=63,
            name='Earth Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [8]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=64,
            name='Wind Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [9]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=65,
            name='Wind Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [9]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=66,
            name='Wind Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [9]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=67,
            name='Light Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [10]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=68,
            name='Light Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [10]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=69,
            name='Light Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [10]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        },
        {
            id=70,
            name='Dark Resist',
            icon=211,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [11]=0.75 },
            slots=0,
            recycle={
                category=1,
                id=11,
                count=9
            },
            upgrade={
                category=1,
                id=11,
                count=10
            }
        },
        {
            id=71,
            name='Dark Resist',
            icon=212,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [11]=0.75 },
            slots=1,
            recycle={
                category=1,
                id=11,
                count=12
            },
            upgrade={
                category=1,
                id=11,
                count=15
            }
        },
        {
            id=72,
            name='Dark Resist',
            icon=213,
            description='Overrides base weak, does not stack with base resist',
            set=0,
            stats={ 2, 0, 0, 0, 0, 0, 0, 0 },
            --additional={ 0, 0, 0, 0, 0.02 },
            elements={ [11]=0.75 },
            slots=2,
            recycle={
                category=1,
                id=11,
                count=15
            },
            upgrade={
                category=1,
                id=11,
                count=20
            }
        }
    }
}

M.getAllItems = function(category)
    return items[category]
end

M.getItem = function(category, id)
    if category == 0 then
        return {
            id=0,
            name='Gold',
            icon=CONSTANTS.goldIcon,
            description='Currency used to purchase items'
        }
    end
    return M.getAllItems(category)[id]
end


local equipmentSet = {
    {
        id=1,
        name='Physical Set',
        effects={
            nil,
            {
                text='+2% Def',
                stats={
                    param=4,
                    value=0.02
                }
            },
            nil,
            {
                text='+2% Atk',
                stats={
                    param=3,
                    value=0.02
                }
            }
        }
    },
    {
        id=2,
        name='Magical Set',
        effects={
            nil,
            {
                text='+2% Res',
                stats={
                    param=6,
                    value=0.02
                }
            },
            nil,
            {
                text='+2% Mag',
                stats={
                    param=5,
                    value=0.02
                }
            }
        }
    },
    {
        id=3,
        name='Damage Set',
        effects={
            nil,
            {
                text='+2% Mmp',
                stats={
                    param=2,
                    value=0.02
                }
            },
            nil,
            {
                text='+1.5% Atk/Mag',
                stats={
                    params={ 3, 5 },
                    value=0.015
                }
            }
        }
    },
    {
        id=4,
        name='Guard Set',
        effects={
            nil,
            {
                text='+2% Mhp',
                stats={
                    param=1,
                    value=0.02
                }
            },
            nil,
            {
                text='+1.5% Def/Res',
                stats={
                    params={ 4, 6 },
                    value=0.015
                }
            }
        }
    },
    {
        id=5,
        name='Speed Set',
        effects={
            nil,
            {
                text='+1% Agi',
                stats={
                    param=7,
                    value=0.01
                }
            },
            nil,
            {
                text='+2% Agi',
                stats={
                    param=7,
                    value=0.02
                }
            }
        }
    },
    {
        id=6,
        name='Chance Set',
        effects={
            nil,
            {
                text='+1% Luk',
                stats={
                    param=8,
                    value=0.01
                }
            },
            nil,
            {
                text='+2% Luk',
                stats={
                    param=8,
                    value=0.02
                }
            }
        }
    },
    {
        id=7,
        name='Average Set',
        effects={
            nil,
            nil,
            nil,
            {
                text='+0.5% All Stats',
                stats={
                    params={ 3, 4, 5, 6, 7, 8 },
                    value=0.005
                }
            }

        }
    },
    {
        id=8,
        name='Tower Set',
        effects={
            nil,
            {
                text='+10% Stn',
                additional={
                    param=5,
                    value=0.1
                }
            },
            nil,
            {
                text='+15% Stn',
                additional={
                    param=5,
                    value=0.15
                }
            }
        }
    },
    {
        id=9,
        name='Arena Set',
        effects={
            nil,
            {
                text='+5% Cri',
                additional={
                    param=3,
                    value=0.05
                }
            },
            nil,
            {
                text='+10% Cri',
                additional={
                    param=3,
                    value=0.1
                }
            }
        }
    },
    {
        id=10,
        name='School Set',
        effects={
            nil,
            {
                text='+2% Mmp',
                stats={
                    param=2,
                    value=0.02
                }
            },
            nil,
            {
                text='+5% Mpr',
                additional={
                    params=2,
                    value=0.05
                }
            }
        }
    }
}

M.getEquipmentSet = function(setId)
    return equipmentSet[setId]
end

return M