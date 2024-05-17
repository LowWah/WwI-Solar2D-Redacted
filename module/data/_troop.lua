local M = {}

--troops are groups of enemies with coordiate positions, anchor is centred
local troops = {
    --Intro grasslands
    { --1
        {
            enemyId=1,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+24
        }, {
            enemyId=2,
            x=display.contentWidth*3/5,
            y=display.contentCenterY+12
        }
    }, 
    { --2
        {
            enemyId=2,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+12
        }, {
            enemyId=1,
            x=display.contentWidth*3/5,
            y=display.contentCenterY+24
        }
    },
    { --3
        {
            enemyId=4,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --4
        {
            enemyId=5,
            x=display.contentCenterX,
            y=display.contentCenterY-12
        }
    },
    --GRASSLANDS
    { --5
        {
            enemyId=1,
            x=display.contentWidth/3,
            y=display.contentCenterY+24
        }, 
        {
            enemyId=2,
            x=display.contentCenterX,
            y=display.contentCenterY+12
        }, 
        {
            enemyId=1,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+24
        }
    },
    { --6
        {
            enemyId=2,
            x=display.contentWidth/3,
            y=display.contentCenterY+12
        }, 
        {
            enemyId=1,
            x=display.contentCenterX,
            y=display.contentCenterY+24
        }, 
        {
            enemyId=2,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+12
        }
    },
    { --7
        {
            enemyId=3,
            x=display.contentCenterX,
            y=display.contentCenterY+24
        }
    },
    { --8
        {
            enemyId=1,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+48
        }, 
        {
            enemyId=5,
            x=display.contentWidth*3/5,
            y=display.contentCenterY-24
        }
    },
    { --9
        {
            enemyId=4,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=2,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+12
        }
    },
    { --10
        {
            enemyId=6,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=6,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY
        }
    },
    { --11
        {
            enemyId=7,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    },
    { --12
        {
            enemyId=8,
            x=display.contentWidth/3,
            y=display.contentCenterY-36
        }, 
        {
            enemyId=10,
            x=display.contentCenterX,
            y=display.contentCenterY+24
        }, 
        {
            enemyId=9,
            x=display.contentWidth*2/3,
            y=display.contentCenterY-36
        }
    },
    { --13
        {
            enemyId=6,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=3,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+12
        }
    },
    { --14
        {
            enemyId=11,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil, nil,
    --Wasteland
    { --20
        {
            enemyId=16,
            x=display.contentWidth*2/5-72,
            y=display.contentCenterY+72
        }, 
        {
            enemyId=15,
            x=display.contentWidth*2/5,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=17,
            x=display.contentWidth*3/5,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=18,
            x=display.contentWidth*3/5+72,
            y=display.contentCenterY+72
        }
    },
    { --21
        {
            enemyId=18,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=19,
            x=display.contentCenterX,
            y=display.contentCenterY+72
        }, 
        {
            enemyId=17,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY-72
        }
    },
    { --22
        {
            enemyId=15,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=19,
            x=display.contentCenterX,
            y=display.contentCenterY+72
        }, 
        {
            enemyId=16,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY-72
        }
    },
    { --23
        {
            enemyId=20,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY-24
        }, 
        {
            enemyId=15,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+36
        }
    },
    { --24
        {
            enemyId=21,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=18,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY
        }
    },
    { --25
        {
            enemyId=23,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=17,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+36
        }
    },
    { --26
        {
            enemyId=24,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --27
        {
            enemyId=22,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=22,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY
        }
    },
    { --28
        {
            enemyId=17,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=21,
            x=display.contentCenterX,
            y=display.contentCenterY+72
        }, 
        {
            enemyId=15,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY-72
        }
    },
    { --29
        {
            enemyId=25,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=16,
            x=display.contentWidth/3-24,
            y=display.contentCenterY+72
        },
        {
            enemyId=16,
            x=display.contentWidth*2/3+24,
            y=display.contentCenterY+72
        }
    }, nil, nil, nil, nil, nil, 
    --Volcanic
    { --35
        {
            enemyId=34,
            x=display.contentWidth*2/5,
            y=display.contentCenterY-36
        }, 
        {
            enemyId=30,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+36
        }
    }, 
    { --36
        {
            enemyId=31,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+48
        }, 
        {
            enemyId=32,
            x=display.contentCenterX,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=33,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+24
        }
    }, 
    { --37
        {
            enemyId=39,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, 
    { --38
        {
            enemyId=34,
            x=display.contentWidth/3,
            y=display.contentCenterY-72
        }, 
        {
            enemyId=34,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }, 
        {
            enemyId=32,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+84
        }
    }, 
    { --39
        {
            enemyId=39,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        }, 
        {
            enemyId=33,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY
        }
    }, 
    { --40
        {
            enemyId=35,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        }, 
        {
            enemyId=31,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+36
        }
    }, 
    { --41
        {
            enemyId=40,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, 
    { --42
        {
            enemyId=30,
            x=display.contentWidth/3-24,
            y=display.contentCenterY+72
        }, 
        {
            enemyId=30,
            x=display.contentWidth*2/3+24,
            y=display.contentCenterY+72
        }, 
        {
            enemyId=36,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    }, 
    { --43
        {
            enemyId=37,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        }, 
        {
            enemyId=38,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY
        }
    }, 
    { --44
        {
            enemyId=42,
            x=display.contentWidth/3,
            y=display.contentCenterY
        }, 
        {
            enemyId=41,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil, nil,
    --Galvanic
    { --50
        {
            enemyId=53,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY-36
        },
        {
            enemyId=53,
            x=display.contentWidth*3/5-24,
            y=display.contentCenterY-36
        },
        {
            enemyId=53,
            x=display.contentWidth*2/5+24,
            y=display.contentCenterY+60
        },
        {
            enemyId=53,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+60
        }
    },
    { --51
        {
            enemyId=55,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    },
    { --52
        {
            enemyId=50,
            x=display.contentWidth*2/5-36,
            y=display.contentCenterY-72
        },
        {
            enemyId=51,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY-72
        },
        {
            enemyId=52,
            x=display.contentCenterX,
            y=display.contentCenterY+72
        }
    },
    { --53
        {
            enemyId=56,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=54,
            x=display.contentWidth/3,
            y=display.contentCenterY+72
        },
        {
            enemyId=54,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+72
        }
    },
    { --54
        {
            enemyId=58,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --55
        {
            enemyId=57,
            x=display.contentWidth/3+48,
            y=display.contentCenterY-36
        }, 
        {
            enemyId=57,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+36
        }
    },
    { --56
        {
            enemyId=60,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        }, 
        {
            enemyId=61,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY
        }
    },
    { --57
        {
            enemyId=59,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --58
        {
            enemyId=64,
            x=display.contentWidth*2/5-84,
            y=display.contentCenterY-72
        },
        {
            enemyId=62,
            x=display.contentWidth*3/5-24,
            y=display.contentCenterY-72
        },
        {
            enemyId=63,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+60
        },
        {
            enemyId=65,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+60
        }
    },
    { --59
        {
            enemyId=66,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil, nil, 
    --Ice Cave
    { --65
        {
            enemyId=71,
            x=display.contentWidth*2/5-36,
            y=display.contentCenterY+24
        },
        {
            enemyId=70,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+36
        },
        {
            enemyId=72,
            x=display.contentCenterX,
            y=display.contentCenterY-72
        }
    },
    { --66
        {
            enemyId=75,
            x=display.contentWidth/3+36,
            y=display.contentCenterY-24
        }, 
        {
            enemyId=73,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    },
    { --67
        {
            enemyId=76,
            x=display.contentCenterX,
            y=display.contentCenterY+24
        }
    },
    { --68
        {
            enemyId=77,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        },
        {
            enemyId=74,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY+60
        },
        {
            enemyId=74,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+60
        }
    },
    { --69
        {
            enemyId=76,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+24
        }, 
        {
            enemyId=75,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY-24
        }
    },
    { --70
        {
            enemyId=78,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --71
        {
            enemyId=79,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        },
        {
            enemyId=77,
            x=display.contentWidth/3,
            y=display.contentCenterY+72
        },
        {
            enemyId=74,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+72
        }
    },
    { --72
        {
            enemyId=80,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        }, 
        {
            enemyId=81,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY
        }
    },
    { --73
        {
            enemyId=82,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --74
        {
            enemyId=84,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        },
        {
            enemyId=83,
            x=display.contentWidth/3-48,
            y=display.contentCenterY+60
        },
        {
            enemyId=83,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+60
        }
    }, nil, nil, nil, nil, nil,
    --Sea
    { --80
        {
            enemyId=90,
            x=display.contentWidth/3,
            y=display.contentCenterY+24
        },
        {
            enemyId=92,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        },
        {
            enemyId=91,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+24
        }
    },
    { --81
        {
            enemyId=93,
            x=display.contentWidth*2/5-48,
            y=display.contentCenterY-48
        },
        {
            enemyId=96,
            x=display.contentWidth*3/5-48,
            y=display.contentCenterY-48
        },
        {
            enemyId=95,
            x=display.contentWidth*2/5+36,
            y=display.contentCenterY+60
        },
        {
            enemyId=94,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+60
        }
    },
    { --82
        {
            enemyId=97,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY+24
        },
        {
            enemyId=98,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+24
        }
    },
    { --83
        {
            enemyId=101,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY
        },
        {
            enemyId=102,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY
        }
    },
    { --84
        {
            enemyId=103,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        },
        {
            enemyId=100,
            x=display.contentWidth/3,
            y=display.contentCenterY+60
        },
        {
            enemyId=100,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+60
        }
    },
    { --85
        {
            enemyId=98,
            x=display.contentCenterX-72,
            y=display.contentCenterY-60
        },
        {
            enemyId=97,
            x=display.contentCenterX+72,
            y=display.contentCenterY-60
        },
        {
            enemyId=99,
            x=display.contentWidth/3,
            y=display.contentCenterY+72
        },
        {
            enemyId=99,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+72
        }
    },
    { --86
        {
            enemyId=105,
            x=display.contentWidth/3+36,
            y=display.contentCenterY-24
        },
        {
            enemyId=104,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    },
    { --87
        {
            enemyId=106,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        },
        {
            enemyId=96,
            x=display.contentWidth/3,
            y=display.contentCenterY+72
        },
        {
            enemyId=96,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+72
        }
    },
    { --88
        {
            enemyId=107,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --89
        {
            enemyId=108,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil, nil,
    --Cave
    { --95
        {
            enemyId=115,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        },
        {
            enemyId=116,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+36
        },
        {
            enemyId=116,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+36
        }
    },
    { --96
        {
            enemyId=116,
            x=display.contentCenterX,
            y=display.contentCenterY+36
        },
        {
            enemyId=115,
            x=display.contentWidth/3+12,
            y=display.contentCenterY-24
        },
        {
            enemyId=115,
            x=display.contentWidth*2/3-12,
            y=display.contentCenterY-24
        }
    },
    { --97
        {
            enemyId=117,
            x=display.contentWidth/3,
            y=display.contentCenterY
        },
        {
            enemyId=117,
            x=display.contentCenterX,
            y=display.contentCenterY
        },
        {
            enemyId=117,
            x=display.contentWidth*2/3,
            y=display.contentCenterY
        }
    },
    { --98
        {
            enemyId=120,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        },
        {
            enemyId=119,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+24
        }
    },
    { --99
        {
            enemyId=121,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=118,
            x=display.contentWidth/3,
            y=display.contentCenterY+48
        },
        {
            enemyId=118,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+48
        }
    },
    { --100
        {
            enemyId=122,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --101
        {
            enemyId=123,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        },
        {
            enemyId=124,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY
        }
    },
    { --102
        {
            enemyId=125,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --103
        {
            enemyId=126,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --104
        {
            enemyId=128,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        },
        {
            enemyId=127,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+36
        }
    }, nil, nil, nil, nil, nil,
    --Cliff
    { --110
        {
            enemyId=135,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+48
        },
        {
            enemyId=136,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        },
        {
            enemyId=137,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+48
        }
    },
    { --111
        {
            enemyId=138,
            x=display.contentWidth*2/5,
            y=display.contentCenterY
        },
        {
            enemyId=138,
            x=display.contentWidth*3/5,
            y=display.contentCenterY
        }
    },
    { --112
        {
            enemyId=140,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    },
    { --113
        {
            enemyId=140,
            x=display.contentCenterX+36,
            y=display.contentCenterY-72
        },
        {
            enemyId=139,
            x=display.contentWidth/3-24,
            y=display.contentCenterY+60
        },
        {
            enemyId=139,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+60
        }
    },
    { --114
        {
            enemyId=141,
            x=display.contentWidth*2/5-12,
            y=display.contentCenterY-24
        },
        {
            enemyId=138,
            x=display.contentWidth*3/5+12,
            y=display.contentCenterY+24
        }
    },
    { --115
        {
            enemyId=142,
            x=display.contentWidth*2/5-12,
            y=display.contentCenterY+24
        },
        {
            enemyId=136,
            x=display.contentWidth*3/5+12,
            y=display.contentCenterY-12
        }
    },
    { --116
        {
            enemyId=143,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=141,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    },
    { --117
        {
            enemyId=144,
            x=display.contentWidth/3+48,
            y=display.contentCenterY-36
        },
        {
            enemyId=142,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+36
        }
    },
    { --118
        {
            enemyId=145,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        }
    },
    { --119
        {
            enemyId=147,
            x=display.contentWidth/3+24,
            y=display.contentCenterY
        },
        {
            enemyId=146,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+60
        }
    }, nil, nil, nil, nil, nil,
    --Heaven
    { --125
        {
            enemyId=155,
            x=display.contentWidth*2/5-12,
            y=display.contentCenterY-24
        },
        {
            enemyId=156,
            x=display.contentCenterX,
            y=display.contentCenterY+48
        },
        {
            enemyId=155,
            x=display.contentWidth*3/5+12,
            y=display.contentCenterY-24
        }
    },
    { --126
        {
            enemyId=156,
            x=display.contentWidth*2/5-12,
            y=display.contentCenterY+48
        },
        {
            enemyId=155,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        },
        {
            enemyId=156,
            x=display.contentWidth*3/5+12,
            y=display.contentCenterY+48
        }
    },
    { --127
        {
            enemyId=161,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --128
        {
            enemyId=157,
            x=display.contentWidth/3,
            y=display.contentCenterY+36
        },
        {
            enemyId=157,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+36
        },
        {
            enemyId=159,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        }
    },
    { --129
        {
            enemyId=162,
            x=display.contentWidth*2/5,
            y=display.contentCenterY-24
        },
        {
            enemyId=156,
            x=display.contentWidth*3/5,
            y=display.contentCenterY+60
        }
    },
    { --130
        {
            enemyId=161,
            x=display.contentWidth/3+36,
            y=display.contentCenterY-24
        },
        {
            enemyId=160,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    },
    { --131
        {
            enemyId=163,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=158,
            x=display.contentWidth/3,
            y=display.contentCenterY+36
        },
        {
            enemyId=158,
            x=display.contentCenterX,
            y=display.contentCenterY+72
        },
        {
            enemyId=158,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+36
        }
    },
    { --132
        {
            enemyId=165,
            x=display.contentWidth/3+36,
            y=display.contentCenterY-12
        },
        {
            enemyId=164,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    },
    { --133
        {
            enemyId=166,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    },
    { --134
        {
            enemyId=167,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=168,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil, nil,
    --Purgatory
    { --140
        {
            enemyId=176,
            x=display.contentWidth/3,
            y=display.contentCenterY
        },
        {
            enemyId=175,
            x=display.contentCenterX,
            y=display.contentCenterY
        },
        {
            enemyId=176,
            x=display.contentWidth*2/3,
            y=display.contentCenterY
        }
    },
    { --141
        {
            enemyId=176,
            x=display.contentWidth/3,
            y=display.contentCenterY
        },
        {
            enemyId=177,
            x=display.contentCenterX,
            y=display.contentCenterY+12
        },
        {
            enemyId=176,
            x=display.contentWidth*2/3,
            y=display.contentCenterY
        }
    },
    { --142
        {
            enemyId=178,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --143
        {
            enemyId=179,
            x=display.contentWidth/3+48,
            y=display.contentCenterY-12
        },
        {
            enemyId=175,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    { --144
        {
            enemyId=180,
            x=display.contentCenterX,
            y=display.contentCenterY-36
        },
        {
            enemyId=177,
            x=display.contentWidth/3+12,
            y=display.contentCenterY+60
        },
        {
            enemyId=177,
            x=display.contentWidth*2/3-12,
            y=display.contentCenterY+60
        }
    },
    { --145
        {
            enemyId=182,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=181,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+36
        }
    },
    { --146
        {
            enemyId=185,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --147
        {
            enemyId=183,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-48
        },
        {
            enemyId=184,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }    
    },
    { --148
        {
            enemyId=186,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-12
        },
        {
            enemyId=187,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+48
        }
    },
    { --149
        {
            enemyId=188,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    }, nil, nil, nil, nil, nil, 
    --Forest
    { --155
        {
            enemyId=196,
            x=display.contentCenterX-48,
            y=display.contentCenterY-36
        },
        {
            enemyId=197,
            x=display.contentCenterX+48,
            y=display.contentCenterY+48
        },
        {
            enemyId=195,
            x=display.contentWidth/3,
            y=display.contentCenterY+48
        },
        {
            enemyId=198,
            x=display.contentWidth*2/3,
            y=display.contentCenterY-36
        }
    },
    { --156
        {
            enemyId=202,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        },
        {
            enemyId=199,
            x=display.contentWidth/3,
            y=display.contentCenterY+12
        },
        {
            enemyId=200,
            x=display.contentCenterX,
            y=display.contentCenterY+60
        },
        {
            enemyId=201,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+12
        }
    },
    { --157
        {
            enemyId=203,
            x=display.contentWidth/3+48,
            y=display.contentCenterY+24
        },
        {
            enemyId=204,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    { --158
        {
            enemyId=208,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=207,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+12
        }
    },
    { --159
        {
            enemyId=209,
            x=display.contentWidth/3+36,
            y=display.contentCenterY+24
        },
        {
            enemyId=210,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    },
    { --160
        {
            enemyId=211,
            x=display.contentCenterX,
            y=display.contentCenterY-48
        },
        {
            enemyId=205,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+48
        },
        {
            enemyId=205,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+48
        }
    },
    { --161
        {
            enemyId=212,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --162
        {
            enemyId=214,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=213,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    },
    { --163
        {
            enemyId=215,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=206,
            x=display.contentWidth/3,
            y=display.contentCenterY+48
        },
        {
            enemyId=206,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+48
        }
    },
    { --164
        {
            enemyId=217,
            x=display.contentWidth/3,
            y=display.contentCenterY
        },
        {
            enemyId=216,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil, nil,
    --Jungle
    { --170
        {
            enemyId=225,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+60
        },
        {
            enemyId=227,
            x=display.contentCenterX,
            y=display.contentCenterY-36
        },
        {
            enemyId=226,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+60
        }
    },
    { --171
        {
            enemyId=228,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=229,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --172
        {
            enemyId=230,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY-36
        },
        {
            enemyId=231,
            x=display.contentWidth*3/5-24,
            y=display.contentCenterY-36
        },
        {
            enemyId=231,
            x=display.contentWidth*2/5+24,
            y=display.contentCenterY+72
        },
        {
            enemyId=230,
            x=display.contentWidth*3/5+24,
            y=display.contentCenterY+72
        }
    },
    { --173
        {
            enemyId=235,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=232,
            x=display.contentWidth/3+36,
            y=display.contentCenterY+72
        },
        {
            enemyId=232,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+72
        }
    },
    { --174
        {
            enemyId=237,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=234,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+72
        },
        {
            enemyId=234,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+72
        }
    },
    { --175
        {
            enemyId=239,
            x=display.contentWidth/3+36,
            y=display.contentCenterY+24
        },
        {
            enemyId=240,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    },
    { --176
        {
            enemyId=238,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --177
        {
            enemyId=236,
            x=display.contentCenterX,
            y=display.contentCenterY-72
        },
        {
            enemyId=233,
            x=display.contentWidth/3+24,
            y=display.contentCenterY+84
        },
        {
            enemyId=233,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY+84
        }
    },
    { --178
        {
            enemyId=243,
            x=display.contentWidth*2/5-84,
            y=display.contentCenterY-72
        },
        {
            enemyId=244,
            x=display.contentWidth*3/5-24,
            y=display.contentCenterY-72
        },
        {
            enemyId=241,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+60
        },
        {
            enemyId=242,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+60
        }
    },
    { --179
        {
            enemyId=246,
            x=display.contentCenterX,
            y=display.contentCenterY-60
        },
        {
            enemyId=245,
            x=display.contentWidth/3,
            y=display.contentCenterY+60
        },
        {
            enemyId=245,
            x=display.contentWidth*2/3,
            y=display.contentCenterY+60
        }
    },
    nil, nil, nil, nil, nil,
    --general soldiers tier 1
    { --185
        {
            enemyId=256,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=255,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --186
        {
            enemyId=255,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=257,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    { --187
        {
            enemyId=256,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=257,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    --general soldiers tier 2
    { --188
        {
            enemyId=258,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --189
        {
            enemyId=259,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=257,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    { --190
        {
            enemyId=256,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=261,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    { --191
        {
            enemyId=260,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=255,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    --general soldiers tier 3
    { --192
        {
            enemyId=262,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --193
        {
            enemyId=260,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=259,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    },
    { --194
        {
            enemyId=259,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=261,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    },
    { --195
        {
            enemyId=260,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=261,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+24
        }
    }, nil, nil, nil, nil,
    --Chapter 1
    { --200
        {
            enemyId=265,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil,
    --Chapter 3
    { --205
        {
            enemyId=270,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --206
        {
            enemyId=271,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil,
    --Chapter 5
    { --210
        {
            enemyId=275,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil,
    --Chapter 6
    { --215
        {
            enemyId=280,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --216
        {
            enemyId=281,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }, nil, nil, nil,
    --Chapter 8
    { --220
        {
            enemyId=285,
            x=display.contentCenterX,
            y=display.contentCenterY
        } 
    }, nil, nil, nil, nil,
    --Chapter 9
    { --225
        {
            enemyId=290,
            x=display.contentCenterX,
            y=display.contentCenterY
        } 
    }, nil, nil, nil, nil,
    --Chapter 11
    { --230
        {
            enemyId=295,
            x=display.contentCenterX,
            y=display.contentCenterY
        } 
    }, nil, nil, nil, nil,
    --side 1
    { --235
        {
            enemyId=300,
            x=display.contentWidth/3+48,
            y=display.contentCenterY+24
        },
        {
            enemyId=300,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+24
        }
    },
    { --236
        {
            enemyId=302,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=301,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --237
        {
            enemyId=303,
            x=display.contentWidth/3+60,
            y=display.contentCenterY-48
        },
        {
            enemyId=303,
            x=display.contentWidth*2/3-60,
            y=display.contentCenterY+48
        }
    },
    { --238
        {
            enemyId=304,
            x=display.contentWidth/3+36,
            y=display.contentCenterY+24
        },
        {
            enemyId=305,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    },
    { --239
        {
            enemyId=306,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --240
        {
            enemyId=307,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --241
        {
            enemyId=301,
            x=display.contentWidth*2/5-108,
            y=display.contentCenterY-72
        },
        {
            enemyId=302,
            x=display.contentCenterX+12,
            y=display.contentCenterY-72
        },
        {
            enemyId=304,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+60
        },
        {
            enemyId=305,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+60
        }
    },
    { --242
        {
            enemyId=308,
            x=display.contentCenterX,
            y=display.contentCenterY-24
        }
    }, nil, nil,
    --Side 2
    { --245
        {
            enemyId=315,
            x=display.contentWidth/3+36,
            y=display.contentCenterY
        },
        {
            enemyId=315,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY
        }
    }, nil, nil, nil, nil,
    --Side 3
    { --250
        {
            enemyId=322,
            x=display.contentWidth/3+36,
            y=display.contentCenterY-48
        },
        {
            enemyId=321,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY-48
        },
        {
            enemyId=320,
            x=display.contentCenterX,
            y=display.contentCenterY+72
        }
    },
    { --251
        {
            enemyId=323,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --252
        {
            enemyId=327,
            x=display.contentWidth*2/5-108,
            y=display.contentCenterY-72
        },
        {
            enemyId=326,
            x=display.contentCenterX+12,
            y=display.contentCenterY-72
        },
        {
            enemyId=324,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+60
        },
        {
            enemyId=325,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+60
        }
    },
    { --253
        {
            enemyId=328,
            x=display.contentWidth/3+36,
            y=display.contentCenterY+24
        },
        {
            enemyId=329,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --254
        {
            enemyId=331,
            x=display.contentWidth*2/5-108,
            y=display.contentCenterY-72
        },
        {
            enemyId=333,
            x=display.contentCenterX+12,
            y=display.contentCenterY-72
        },
        {
            enemyId=330,
            x=display.contentWidth*2/5,
            y=display.contentCenterY+60
        },
        {
            enemyId=332,
            x=display.contentWidth*3/5+36,
            y=display.contentCenterY+60
        }
    }, nil, nil, nil, nil, nil,
    --Side 4
    { --260
        {
            enemyId=342,
            x=display.contentCenterX+36,
            y=display.contentCenterY-60
        },
        {
            enemyId=340,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+60
        },
        {
            enemyId=341,
            x=display.contentWidth/3+48,
            y=display.contentCenterY+48
        }
    }, nil, nil, nil, nil,
    --Event
    { --265
        {
            enemyId=345,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=345,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --266
        {
            enemyId=347,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=346,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+12
        }
    },
    { --267
        {
            enemyId=346,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-36
        },
        {
            enemyId=347,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY-48
        },
        {
            enemyId=345,
            x=display.contentCenterX,
            y=display.contentCenterY+60
        }
    },
    { --268
        {
            enemyId=348,
            x=display.contentWidth/3+72,
            y=display.contentCenterY-60
        },
        {
            enemyId=348,
            x=display.contentWidth*2/3-72,
            y=display.contentCenterY+48
        }
    },
    { --269
        {
            enemyId=349,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --270
        {
            enemyId=350,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --271
        {
            enemyId=351,
            x=display.contentWidth/3+24,
            y=display.contentCenterY-60
        },
        {
            enemyId=351,
            x=display.contentCenterX-24,
            y=display.contentCenterY+60
        },
        {
            enemyId=351,
            x=display.contentWidth*2/3-24,
            y=display.contentCenterY-24
        }
    },
    { --272
        {
            enemyId=352,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=352,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --273
        {
            enemyId=353,
            x=display.contentWidth/3+48,
            y=display.contentCenterY
        },
        {
            enemyId=353,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY
        }
    },
    { --274
        {
            enemyId=354,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --275
        
        {
            enemyId=352,
            x=display.contentWidth/3+12,
            y=display.contentCenterY-84
        },
        {
            enemyId=353,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY-60
        },
        {
            enemyId=351,
            x=display.contentWidth*2/5-24,
            y=display.contentCenterY+72
        },
        {
            enemyId=351,
            x=display.contentWidth*3/5,
            y=display.contentCenterY+72
        }
    },
    { --276
        {
            enemyId=355,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --277
        {
            enemyId=356,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --278
        {
            enemyId=357,
            x=display.contentWidth/3+60,
            y=display.contentCenterY+48
        },
        {
            enemyId=358,
            x=display.contentWidth*2/3-60,
            y=display.contentCenterY-48
        }
    },
    { --279
        {
            enemyId=356,
            x=display.contentWidth/3+60,
            y=display.contentCenterY+48
        },
        {
            enemyId=358,
            x=display.contentWidth*2/3-60,
            y=display.contentCenterY-48
        }
    },
    { --280
        {
            enemyId=356,
            x=display.contentWidth/3+48,
            y=display.contentCenterY+12
        },
        {
            enemyId=357,
            x=display.contentWidth*2/3-48,
            y=display.contentCenterY+12
        }
    },
    { --281
        {
            enemyId=358,
            x=display.contentCenterX,
            y=display.contentCenterY-72
        },
        {
            enemyId=357,
            x=display.contentWidth/3+36,
            y=display.contentCenterY+48
        },
        {
            enemyId=356,
            x=display.contentWidth*2/3-36,
            y=display.contentCenterY+48
        }
    },
    { --282
        {
            enemyId=359,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    },
    { --283
        {
            enemyId=360,
            x=display.contentCenterX,
            y=display.contentCenterY
        }
    }
}

M.getTroop = function(troopId)
    return troops[troopId]
end

return M