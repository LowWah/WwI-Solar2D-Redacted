local M = {}

--Make a data story collection to be able to map quest required completion with dialogue
local storycollection = {
    { -- 1 Main
        { --Intro
            name='Introduction',
            picture={
                type='bust',
                imageName='Bust_FH_015_01',
                frame=1
            },
            story={
                {
                    name='Introduction',
                    characters={ 15 },
                    quest=nil,
                    dialogue={
                        quest='intro',
                        stage=1,
                        floor=1,
                        battleResult=1
                    }
                }
            }
        }, 
        { -- Stage 1
            name='1 Mediators',
            picture={
                type='bust',
                imageName='Bust_FH_015_01',
                frame=1
            },
            story={
                {
                    name='Floor 1',
                    characters={ 5, 15, 19 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Prebattle',
                    characters={ 5, 15, 19 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=2
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=2,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Postbattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Postbattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=6,
                        battleResult=2
                    }
                }, {
                    name='Floor 7 Prebattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=7,
                        battleResult=1
                    }
                }, {
                    name='Floor 7 Postbattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=7,
                        battleResult=2
                    }
                }, {
                    name='Floor 8 Prebattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=8,
                        battleResult=1
                    }
                }, {
                    name='Floor 11 Postbattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=11
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=11,
                        battleResult=2
                    }
                }, {
                    name='Floor 12 Prebattle',
                    characters={ 5, 15 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=12,
                        battleResult=1
                    }
                }, {
                    name='Floor 12 Postbattle',
                    characters={ 5, 15, 16, 19 },
                    quest={
                        quest='main',
                        stage=1,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=1,
                        floor=12,
                        battleResult=2
                    }
                }
            }
        }, 
        { --Stage 2
            name='2 Aftermath',
            picture={
                type='bust',
                imageName='Bust_FH_014_01',
                frame=1
            },
            story={
                {
                    name='Floor 3 Postbattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 4 Postbattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=4,
                        battleResult=2
                    }
                }, {
                    name='Floor 5 Prebattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=5
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=5,
                        battleResult=1
                    }
                }, {
                    name='Floor 7 Prebattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=7,
                        battleResult=1
                    }
                }, {
                    name='Floor 10 Postbattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=10
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=10,
                        battleResult=2
                    }
                }, {
                    name='Floor 12 Postbattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=12,
                        battleResult=2
                    }
                }, {
                    name='Floor 13 Postbattle',
                    characters={ 14 },
                    quest={
                        quest='main',
                        stage=2,
                        floor=13
                    },
                    dialogue={
                        quest='main',
                        stage=2,
                        floor=13,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 3
            name='3 Honour',
            picture={
                type='bust',
                imageName='Bust_FH_017_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=3,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Postbattle',
                    characters={ 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Prebattle',
                    characters={ 7, 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=6,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Postbattle',
                    characters={ 7, 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=6,
                        battleResult=2
                    }
                }, {
                    name='Floor 7 Prebattle',
                    characters={ 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=7,
                        battleResult=1
                    }
                }, {
                    name='Floor 9 Postbattle',
                    characters={ 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=9
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=9,
                        battleResult=2
                    }
                }, {
                    name='Floor 10 Prebattle',
                    characters={ 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=10
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=10,
                        battleResult=1
                    }
                }, {
                    name='Floor 11 Postbattle',
                    characters={ 12, 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=11
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=11,
                        battleResult=2
                    }
                }, {
                    name='Floor 12 Prebattle',
                    characters={ 12, 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=12,
                        battleResult=1
                    }
                }, {
                    name='Floor 12 Postbattle',
                    characters={ 7, 12, 17 },
                    quest={
                        quest='main',
                        stage=3,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=3,
                        floor=12,
                        battleResult=2
                    }
                }
            }
        }, 
        { --Stage 4
            name='4 Monsters',
            picture={
                type='bust',
                imageName='Bust_FH_002_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 1 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Postbattle',
                    characters={ 1 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=2
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=2,
                        battleResult=2
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 1, 2, 53 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 4 Postbattle',
                    characters={ 1, 2, 9 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=4,
                        battleResult=2
                    }
                }, {
                    name='Floor 7 Postbattle',
                    characters={ 1, 2, 9 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=7,
                        battleResult=2
                    }
                }, {
                    name='Floor 10 Postbattle',
                    characters={ 1, 2 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=10
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=10,
                        battleResult=2
                    }
                }, {
                    name='Floor 11 Prebattle',
                    characters={ 1, 2, 9 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=11
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=11,
                        battleResult=1
                    }
                }, {
                    name='Floor 11 Postbattle',
                    characters={ 1, 2, 9, 53 },
                    quest={
                        quest='main',
                        stage=4,
                        floor=11
                    },
                    dialogue={
                        quest='main',
                        stage=4,
                        floor=11,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 5
            name='5 History',
            picture={
                type='bust',
                imageName='Bust_FH_045_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 45 },
                    quest={
                        quest='main',
                        stage=5,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 1 Postbattle',
                    characters={ 45 },
                    quest={
                        quest='main',
                        stage=5,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=1,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 4 Postbattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=4,
                        battleResult=2
                    }
                }, {
                    name='Floor 5 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=5
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=5,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=6,
                        battleResult=1
                    }
                }, {
                    name='Floor 8 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=8,
                        battleResult=1
                    }
                }, {
                    name='Floor 8 Postbattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=8,
                        battleResult=2
                    }
                }, {
                    name='Floor 9 Prebattle',
                    characters={ 45 },
                    quest={
                        quest='main',
                        stage=5,
                        floor=9
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=9,
                        battleResult=1
                    }
                }, {
                    name='Floor 10 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=10
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=10,
                        battleResult=1
                    }
                }, {
                    name='Floor 12 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=12,
                        battleResult=1
                    }
                }, {
                    name='Floor 12 Postbattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=12
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=12,
                        battleResult=2
                    }
                }, {
                    name='Floor 13 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=13
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=13,
                        battleResult=1
                    }
                }, {
                    name='Floor 15 Prebattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=15
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=15,
                        battleResult=1
                    }
                }, {
                    name='Floor 15 Postbattle',
                    characters={ },
                    quest={
                        quest='main',
                        stage=5,
                        floor=15
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=15,
                        battleResult=2
                    }
                }, {
                    name='Floor 16 Prebattle',
                    characters={ 45 },
                    quest={
                        quest='main',
                        stage=5,
                        floor=16
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=16,
                        battleResult=1
                    }
                }, {
                    name='Floor 16 Postbattle',
                    characters={ 45 },
                    quest={
                        quest='main',
                        stage=5,
                        floor=16
                    },
                    dialogue={
                        quest='main',
                        stage=5,
                        floor=16,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 6
            name='6 Return',
            picture={
                type='bust',
                imageName='Bust_FH_016_01',
                frame=1
            },
            story={
                {
                    name='Floor 6 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='main',
                        stage=6,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=6,
                        floor=6,
                        battleResult=2
                    }
                }, {
                    name='Floor 7 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='main',
                        stage=6,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=6,
                        floor=7,
                        battleResult=1
                    }
                }, {
                    name='Floor 7 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='main',
                        stage=6,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=6,
                        floor=7,
                        battleResult=2
                    }
                }, {
                    name='Floor 8 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='main',
                        stage=6,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=6,
                        floor=8,
                        battleResult=1
                    }
                }, {
                    name='Floor 8 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='main',
                        stage=6,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=6,
                        floor=8,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 7
            name='7 Allies',
            picture={
                type='bust',
                imageName='Bust_FH_065_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 65 },
                    quest={
                        quest='main',
                        stage=7,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=7,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Postbattle',
                    characters={ 64, 65 },
                    quest={
                        quest='main',
                        stage=7,
                        floor=2
                    },
                    dialogue={
                        quest='main',
                        stage=7,
                        floor=2,
                        battleResult=2
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 64, 65 },
                    quest={
                        quest='main',
                        stage=7,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=7,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Prebattle',
                    characters={ 64, 65 },
                    quest={
                        quest='main',
                        stage=7,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=7,
                        floor=6,
                        battleResult=1
                    }
                }, {
                    name='Floor 8 Prebattle',
                    characters={ 64, 65 },
                    quest={
                        quest='main',
                        stage=7,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=7,
                        floor=8,
                        battleResult=1
                    }
                }, {
                    name='Floor 9 Postbattle',
                    characters={ 64, 65 },
                    quest={
                        quest='main',
                        stage=7,
                        floor=9
                    },
                    dialogue={
                        quest='main',
                        stage=7,
                        floor=9,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 8
            name='8 Amends',
            picture={
                type='bust',
                imageName='Bust_FH_051_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 4 Postbattle',
                    characters={ 51, 62 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=4,
                        battleResult=2
                    }
                }, {
                    name='Floor 5 Prebattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=5
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=5,
                        battleResult=1
                    }
                }, {
                    name='Floor 8 Postbattle',
                    characters={ 41, 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=8
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=8,
                        battleResult=2
                    }
                }, {
                    name='Floor 10 Prebattle',
                    characters={ 12, 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=10
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=10,
                        battleResult=1
                    }
                }, {
                    name='Floor 10 Postbattle',
                    characters={ 12, 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=10
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=10,
                        battleResult=2
                    }
                }, {
                    name='Floor 11 Prebattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=11
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=11,
                        battleResult=1
                    }
                }, {
                    name='Floor 13 Prebattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=13
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=13,
                        battleResult=1
                    }
                }, {
                    name='Floor 13 Postbattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=13
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=13,
                        battleResult=2
                    }
                }, {
                    name='Floor 14 Prebattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=14
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=14,
                        battleResult=1
                    }
                }, {
                    name='Floor 14 Postbattle',
                    characters={ 51 },
                    quest={
                        quest='main',
                        stage=8,
                        floor=14
                    },
                    dialogue={
                        quest='main',
                        stage=8,
                        floor=14,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 9
            name='9 Virtue',
            picture={
                type='bust',
                imageName='Bust_FH_010_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Postbattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=1,
                        battleResult=2
                    }
                },
                {
                    name='Floor 2 Prebattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=2
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=2,
                        battleResult=1
                    }
                },
                {
                    name='Floor 3 Postbattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=3,
                        battleResult=2
                    }
                },
                {
                    name='Floor 4 Prebattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=4,
                        battleResult=1
                    }
                },
                {
                    name='Floor 4 Postbattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=4,
                        battleResult=2
                    }
                },
                {
                    name='Floor 6 Postbattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=6,
                        battleResult=2
                    }
                },
                {
                    name='Floor 7 Prebattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=7,
                        battleResult=1
                    }
                },
                {
                    name='Floor 7 Postbattle',
                    characters={ 10 },
                    quest={
                        quest='main',
                        stage=9,
                        floor=7
                    },
                    dialogue={
                        quest='main',
                        stage=9,
                        floor=7,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 10
            name='10 Beginning',
            picture={
                type='bust',
                imageName='Bust_FH_021_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 13 },
                    quest={
                        quest='main',
                        stage=10,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=10,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 13, 21 },
                    quest={
                        quest='main',
                        stage=10,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=10,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Postbattle',
                    characters={ 13, 21 },
                    quest={
                        quest='main',
                        stage=10,
                        floor=6
                    },
                    dialogue={
                        quest='main',
                        stage=10,
                        floor=6,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 11
            name='11 Traitor',
            picture={
                type='bust',
                imageName='Bust_FH_013_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 13, 21 },
                    quest={
                        quest='main',
                        stage=11,
                        floor=1
                    },
                    dialogue={
                        quest='main',
                        stage=11,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Postbattle',
                    characters={ 13 },
                    quest={
                        quest='main',
                        stage=11,
                        floor=3
                    },
                    dialogue={
                        quest='main',
                        stage=11,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 13 },
                    quest={
                        quest='main',
                        stage=11,
                        floor=4
                    },
                    dialogue={
                        quest='main',
                        stage=11,
                        floor=4,
                        battleResult=1
                    }
                }
            }
        }
    },
    { --2 Side
        { --Stage 1
            name='Summoning',
            picture={
                type='bust',
                imageName='Bust_FH_022_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 5, 15 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=1
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 5, 15, 22 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=3
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Postbattle',
                    characters={ 5, 15, 22, 23 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=3
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 5, 15, 22, 23 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=4
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 6 Postbattle',
                    characters={ 5, 15, 22, 23 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=6
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=6,
                        battleResult=2
                    }
                }, {
                    name='Floor 7 Prebattle',
                    characters={ 5, 15, 22, 23 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=7
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=7,
                        battleResult=1
                    }
                }, {
                    name='Floor 7 Postbattle',
                    characters={ 5, 15, 22, 23 },
                    quest={
                        quest='side',
                        stage=1,
                        floor=7
                    },
                    dialogue={
                        quest='side',
                        stage=1,
                        floor=7,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 2
            name='Mission',
            picture={
                type='bust',
                imageName='Bust_FH_043_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 43, 56, 58 },
                    quest={
                        quest='side',
                        stage=2,
                        floor=1
                    },
                    dialogue={
                        quest='side',
                        stage=2,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Prebattle',
                    characters={ 43, 56, 58 },
                    quest={
                        quest='side',
                        stage=2,
                        floor=2
                    },
                    dialogue={
                        quest='side',
                        stage=2,
                        floor=2,
                        battleResult=1
                    }
                }, {
                    name='Floor 4 Postbattle',
                    characters={ 43, 56, 58 },
                    quest={
                        quest='side',
                        stage=2,
                        floor=4
                    },
                    dialogue={
                        quest='side',
                        stage=2,
                        floor=4,
                        battleResult=2
                    }
                }, {
                    name='Floor 7 Postbattle',
                    characters={ 43, 56, 58 },
                    quest={
                        quest='side',
                        stage=2,
                        floor=7
                    },
                    dialogue={
                        quest='side',
                        stage=2,
                        floor=7,
                        battleResult=2
                    }
                }, {
                    name='Floor 8 Prebattle',
                    characters={ 43, 56, 58 },
                    quest={
                        quest='side',
                        stage=2,
                        floor=8
                    },
                    dialogue={
                        quest='side',
                        stage=2,
                        floor=8,
                        battleResult=1
                    }
                }, {
                    name='Floor 8 Postbattle',
                    characters={ 43, 56, 58 },
                    quest={
                        quest='side',
                        stage=2,
                        floor=8
                    },
                    dialogue={
                        quest='side',
                        stage=2,
                        floor=8,
                        battleResult=2
                    }
                }
            }
        },
        { --Stage 3
            name='Demon Lord',
            picture={
                type='bust',
                imageName='Bust_FH_016_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=1
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 1 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=1
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=1,
                        battleResult=2
                    }
                }, {
                    name='Floor 2 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=2
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=2,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=2
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=2,
                        battleResult=2
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=3
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=3
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=4
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 4 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=4
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=4,
                        battleResult=2
                    }
                }, {
                    name='Floor 5 Prebattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=5
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=5,
                        battleResult=1
                    }
                }, {
                    name='Floor 5 Postbattle',
                    characters={ 16 },
                    quest={
                        quest='side',
                        stage=3,
                        floor=5
                    },
                    dialogue={
                        quest='side',
                        stage=3,
                        floor=5,
                        battleResult=2
                    }
                },
            }
        },
        { --Stage 4
            name='Friends',
            picture={
                type='bust',
                imageName='Bust_FH_018_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 17 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=1
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=1,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Prebattle',
                    characters={ 8, 17 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=2
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=2,
                        battleResult=1
                    }
                }, {
                    name='Floor 2 Postbattle',
                    characters={ 8, 17 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=2
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=2,
                        battleResult=2
                    }
                }, {
                    name='Floor 3 Prebattle',
                    characters={ 8, 17 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=3
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=3,
                        battleResult=1
                    }
                }, {
                    name='Floor 3 Postbattle',
                    characters={ 8, 17, 18 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=3
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=3,
                        battleResult=2
                    }
                }, {
                    name='Floor 4 Prebattle',
                    characters={ 8, 17, 18 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=4
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=4,
                        battleResult=1
                    }
                }, {
                    name='Floor 5 Postbattle',
                    characters={ 8, 17, 18 },
                    quest={
                        quest='side',
                        stage=4,
                        floor=5
                    },
                    dialogue={
                        quest='side',
                        stage=4,
                        floor=5,
                        battleResult=2
                    }
                }
            }
        }
    },
    { --3 Event
        { --1 School
            name='School',
            picture={
                type='bust',
                imageName='Bust_FH_024_01',
                frame=1
            },
            story={
                {
                    name='Floor 1 Prebattle',
                    characters={ 24, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=1
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=1,
                        battleResult=1
                    }
                }, 
                {
                    name='Floor 1 Postbattle',
                    characters={ 24, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=1
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=1,
                        battleResult=2
                    }
                },
                {
                    name='Floor 2 Postbattle',
                    characters={ 24, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=2
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=2,
                        battleResult=2
                    }
                },
                {
                    name='Floor 3 Prebattle',
                    characters={ 24, 53, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=3
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=3,
                        battleResult=1
                    }
                },
                {
                    name='Floor 3 Postbattle',
                    characters={ 24, 53 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=3
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=3,
                        battleResult=2
                    }
                },
                {
                    name='Floor 5 Prebattle',
                    characters={ 24, 53, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=5
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=5,
                        battleResult=1
                    }
                },
                {
                    name='Floor 5 Postbattle',
                    characters={ 24, 53, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=5
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=5,
                        battleResult=2
                    }
                },
                {
                    name='Floor 6 Prebattle',
                    characters={ 24, 43, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=6
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=6,
                        battleResult=1
                    }
                },
                {
                    name='Floor 6 Postbattle',
                    characters={ 24, 43 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=6
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=6,
                        battleResult=2
                    }
                },
                {
                    name='Floor 7 Prebattle',
                    characters={ 24, 43 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=7
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=7,
                        battleResult=1
                    }
                },
                {
                    name='Floor 7 Postbattle',
                    characters={ 24, 43, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=7
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=7,
                        battleResult=2
                    }
                },
                {
                    name='Floor 8 Prebattle',
                    characters={ 24, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=8
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=8,
                        battleResult=1
                    }
                },
                {
                    name='Floor 8 Postbattle',
                    characters={ 24, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=8
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=8,
                        battleResult=2
                    }
                },
                {
                    name='Floor 9',
                    characters={ 24, 43, 53, 64 },
                    quest={
                        quest='event',
                        stage=1,
                        floor=9
                    },
                    dialogue={
                        quest='event',
                        stage=1,
                        floor=9,
                        battleResult=1
                    }
                }
            }
        }
    },
    { --4 Other
        { --Tower
            name='Tower',
            picture={
                type='stage',
                imageName='Tower',
                frame=1
            },
            story={
                {
                    name='Fear of heights',
                    characters={ 3, 8 },
                    quest={
                        quest='other',
                        stage=1,
                        floor=1
                    },
                    dialogue={
                        quest='other',
                        stage=1,
                        floor=1,
                        battleResult=1
                    }
                },
                {
                    name='Rampage',
                    characters={ 48 },
                    quest={
                        quest='other',
                        stage=1,
                        floor=2
                    },
                    dialogue={
                        quest='other',
                        stage=1,
                        floor=2,
                        battleResult=1
                    }
                },
                {
                    name='God\'s Lookout',
                    characters={ 60 },
                    quest={
                        quest='other',
                        stage=1,
                        floor=3
                    },
                    dialogue={
                        quest='other',
                        stage=1,
                        floor=3,
                        battleResult=1
                    }
                }
            }
        },
        {
            name='Arena',
            picture={
                type='stage',
                imageName='Arena'
            },
            story={
                {
                    name='Spotlight',
                    characters={ 1 },
                    quest={
                        quest='other',
                        stage=2,
                        floor=1
                    },
                    dialogue={
                        quest='other',
                        stage=2,
                        floor=1,
                        battleResult=1
                    }
                },
                {
                    name='Competition',
                    characters={ 57, 59 },
                    quest={
                        quest='other',
                        stage=2,
                        floor=2
                    },
                    dialogue={
                        quest='other',
                        stage=2,
                        floor=2,
                        battleResult=1
                    }
                }
            }
        },
        {
            name='Labyrinth',
            picture={
                type='stage',
                imageName='Cave'
            },
            story={
                {
                    name='Gemstones',
                    characters={ 11 },
                    quest={
                        quest='other',
                        stage=3,
                        floor=1
                    },
                    dialogue={
                        quest='other',
                        stage=3,
                        floor=1,
                        battleResult=1
                    }
                },
                {
                    name='Forge',
                    characters={ 53 },
                    quest={
                        quest='other',
                        stage=3,
                        floor=2
                    },
                    dialogue={
                        quest='other',
                        stage=3,
                        floor=2,
                        battleResult=1
                    }
                }
            }
        }

    }
    
}

--[[
    1 - Main
    2 - Side
    3 - Event
    4 - Other
]]

M.getStoryCollection = function(collectionId)
    return storycollection[collectionId]
end

return M