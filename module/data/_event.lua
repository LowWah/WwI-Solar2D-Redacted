local M = {}

--Event module, maunally update this??

M.getQuest = function() 
    return {
        {
            name='Story',
            picture={
                type='bust',
                imageName='Bust_FH_024_01',
                frame=1
            },
            floors={
                { --Floor 1
                    terrain=18,
                    enemies={
                        level=30,
                        type='standard',
                        waves={ 265, 267, 269 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=150,
                            party=600,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false,
                    preBattle=true,
                    postBattle=true
                },
                { --Floor 2
                    terrain=18,
                    requirePrevious=true,
                    enemies={
                        level=30,
                        type='standard',
                        waves={ 266, 268, 270 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=150,
                            party=600,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false,
                    postBattle=true
                },
                { --Floor 3
                    terrain=19,
                    requirePrevious=true,
                    enemies={
                        level=32,
                        type='standard',
                        waves={ 271, 273, 275 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=160,
                            party=640,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false,
                    preBattle=true,
                    postBattle=true
                },
                { --Floor 4
                    terrain=19,
                    requirePrevious=true,
                    enemies={
                        level=32,
                        type='standard',
                        waves={ 271, 272, 274 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=160,
                            party=640,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false
                },
                { --Floor 5
                    terrain=19,
                    requirePrevious=true,
                    enemies={
                        level=33,
                        type='standard',
                        waves={ 273, 275, 276 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=165,
                            party=660,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        }
                    },
                    canAuto=true,
                    preBattle=true,
                    postBattle=true
                },
                { --Floor 6
                    terrain=20,
                    requirePrevious=true,
                    enemies={
                        level=35,
                        type='standard',
                        waves={ 277, 278, 281 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=175,
                            party=700,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false,
                    preBattle=true,
                    postBattle=true
                },
                { --Floor 7
                    terrain=20,
                    requirePrevious=true,
                    enemies={
                        level=36,
                        type='standard',
                        waves={ 279, 281, 282 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=180,
                            party=720,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={
                            {
                                category=1,
                                id=20,
                                count=120
                            }
                        }
                    },
                    canAuto=true,
                    preBattle=true,
                    postBattle=true
                },
                { --Floor 8
                    terrain=21,
                    requirePrevious=true,
                    enemies={
                        level=39,
                        type='standard',
                        waves={ 280, 281, 283 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={
                            guild=195,
                            party=780,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={
                            {
                                category=1,
                                id=20,
                                count=150
                            }
                        }
                    },
                    canAuto=true,
                    preBattle=true,
                    postBattle=true
                },
                { --Floor 9
                    terrain=24,
                    requirePrevious=true,
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=100
                            }
                        },
                        battle={},
                        general={}
                    },
                    preBattle=true,
                }
            }
        },
        {
            name='Hard',
            requirements={
                quest='event',
                stage=1,
                text='Complete Story'
            },
            picture={
                type='bust',
                imageName='Bust_FH_024_01',
                frame=1
            },
            floors={
                { --Floor 1
                    terrain=18,
                    enemies={
                        level=60,
                        type='standard',
                        waves={ 265, 267, 269 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=300,
                            party=1200,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false
                },
                { --Floor 2
                    terrain=18,
                    requirePrevious=true,
                    enemies={
                        level=60,
                        type='standard',
                        waves={ 266, 268, 270 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=300,
                            party=1200,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false
                },
                { --Floor 3
                    terrain=19,
                    requirePrevious=true,
                    enemies={
                        level=64,
                        type='standard',
                        waves={ 271, 273, 275 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=320,
                            party=1280,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false
                },
                { --Floor 4
                    terrain=19,
                    requirePrevious=true,
                    enemies={
                        level=64,
                        type='standard',
                        waves={ 271, 272, 274 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=320,
                            party=1280,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false
                },
                { --Floor 5
                    terrain=19,
                    requirePrevious=true,
                    enemies={
                        level=66,
                        type='standard',
                        waves={ 273, 275, 276 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=330,
                            party=1320,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        }
                    },
                    canAuto=true
                },
                { --Floor 6
                    terrain=20,
                    requirePrevious=true,
                    enemies={
                        level=70,
                        type='standard',
                        waves={ 277, 278, 281 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=350,
                            party=1400,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={}
                    },
                    canAuto=false
                },
                { --Floor 7
                    terrain=20,
                    requirePrevious=true,
                    enemies={
                        level=72,
                        type='standard',
                        waves={ 279, 281, 282 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=360,
                            party=1440,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={
                            {
                                category=1,
                                id=20,
                                count=240
                            }
                        }
                    },
                    canAuto=true
                },
                { --Floor 8
                    terrain=21,
                    requirePrevious=true,
                    enemies={
                        level=78,
                        type='standard',
                        waves={ 280, 281, 283 }
                    },
                    rewards={
                        first={
                            {
                                category=0,
                                id=1,
                                count=250
                            },
                            {
                                category=1,
                                id=20,
                                count=200
                            }
                        },
                        battle={
                            guild=390,
                            party=1560,
                            bonus={ 24, 43, 53, 64 }
                        },
                        general={
                            {
                                category=1,
                                id=20,
                                count=300
                            }
                        }
                    },
                    canAuto=true
                }
            }
        },
        {
            name='Exam',
            picture={
                type='bust',
                imageName='Bust_FH_053_03',
                frame=1
            },
            floors={ --create fake floors for the % related to % correct
                {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
            }
        }

    }
end

M.getEventName = function()
    return 'School'
end

M.drawEventPanel = function(input)
    local TEXT = MAIN.UI.TEXT
    local y = input.y

    --2
    TEXT.drawText({
        parent=input.parent,
        x=input.x,
        y=y,
        width=input.width,
        text='Story',
        fontColour=CONSTANTS.textColourPink
    })

    y = y + CONSTANTS.textHeight
    --3
    TEXT.drawTextWithWrapping({
        parent=input.parent,
        x=input.x,
        y=y,
        width=input.width,
        text='Nu wakes up to a childhood friend telling her to get ready for school. But she\'s never had a childhood friend. And school? That was something she had given up long ago, so what brings her to this fantasy she once wished for?'
    })

    y = y + CONSTANTS.textHeight * 8 + CONSTANTS.lineHeight
    --5
    TEXT.drawText({
        parent=input.parent,
        x=input.x,
        y=y,
        width=input.width,
        text='Exam',
        fontColour=CONSTANTS.textColourPink
    })

    y = y + CONSTANTS.textHeight
    --6
    TEXT.drawTextWithWrapping({
        parent=input.parent,
        x=input.x,
        y=y,
        width=input.width,
        text='Your daily test. Score high to get more rewards. Don\'t worry if you don\'t know the answer, the teacher can give you a hint. But if you\'re really desperate you\'ll have to cheat, just don\'t get caught.'
    })

end

return M