local M = {}

local options = {
    general={ --General
        {
            title='Click animation',
            description='Show click animation',
            key='clickAnimation',
            items={
                {
                    text='No',
                    value=false
                },
                {
                    text='Yes',
                    value=true
                }
            }
        },
        {
            title='Message Speed',
            description='Adjust message speed',
            key='messageSpeed',
            items={
                {
                    text='Normal',
                    value=1
                },
                {
                    text='Fast',
                    value=2
                },
                {
                    text='Instant',
                    value=3
                }
            }
        }
    },
    audio={ --Audio
        {
            title='BGM',
            description='Adjust BGM Volume',
            key='bgmVolume',
            items={
                {
                    text='0%',
                    value=0
                },
                {
                    text='20%',
                    value=20
                },
                {
                    text='40%',
                    value=40
                },
                {
                    text='60%',
                    value=60
                },
                {
                    text='80%',
                    value=80
                },
                {
                    text='100%',
                    value=100
                }
            }
        },
        {
            title='ME',
            description='Adjust ME Volume',
            key='meVolume',
            items={
                {
                    text='0%',
                    value=0
                },
                {
                    text='20%',
                    value=20
                },
                {
                    text='40%',
                    value=40
                },
                {
                    text='60%',
                    value=60
                },
                {
                    text='80%',
                    value=80
                },
                {
                    text='100%',
                    value=100
                }
            }
        },
        {
            title='SE',
            description='Adjust SE Volume',
            key='seVolume',
            items={
                {
                    text='0%',
                    value=0
                },
                {
                    text='20%',
                    value=20
                },
                {
                    text='40%',
                    value=40
                },
                {
                    text='60%',
                    value=60
                },
                {
                    text='80%',
                    value=80
                },
                {
                    text='100%',
                    value=100
                }
            }
        },
    },
    battle={ --Battle
        {
            title='Battle Speed',
            description='Adjust Battle Speed',
            key='battleSpeed',
            items={
                {
                    text='1x',
                    value=1
                },
                {
                    text='2x',
                    value=2
                }
            }
        },
        {
            title='Auto Battle',
            description='Automatically select action and start turn',
            key='autoBattle',
            items={
                {
                    text='No',
                    value=1
                },
                {
                    text='Yes',
                    value=2
                }
            }
        },
        {
            title='Auto Target',
            description='Target to select when auto batle (1 enemy scope)',
            key='autoTarget',
            items={
                {
                    text='Previous',
                    value=1
                },
                {
                    text='Weakest',
                    value=2
                },
                {
                    text='Strongest',
                    value=3
                }
            }
        },
        {
            title='Auto Buff',
            description='Use buff skills when auto battle (apply for self only)',
            key='autoBuff',
            items={
                {
                    text='No',
                    value=false
                },
                {
                    text='Yes',
                    value=true
                }
            }
        },
        {
            title='Auto Debuff',
            description='Use debuff skills when auto battle (apply for target enemy only)',
            key='autoDebuff',
            items={
                {
                    text='No',
                    value=false
                },
                {
                    text='Yes',
                    value=true
                }
            }
        },
        {
            title='Auto Ultimate',
            description='Use ultimate skills when auto battle',
            key='autoUltimate',
            items={
                {
                    text='No',
                    value=false
                },
                {
                    text='Yes',
                    value=true
                }
            }
        },
        {
            title='Stop Auto Hyper',
            description='Disable auto when any actor gains hyper',
            key='autoHyper',
            items={
                {
                    text='No',
                    value=false
                },
                {
                    text='Yes',
                    value=true
                }
            }
        },
        {
            title='Stop Auto Boss',
            description='Disable auto when encounter boss enemy',
            key='autoBoss',
            items={
                {
                    text='No',
                    value=false
                },
                {
                    text='Yes',
                    value=true
                }
            }
        },
    },
    data={ --Data
        {
            title='Delete Save',
            description='Delete save data',
            key='delete',
            items={
                {
                    text='Delete',
                    value=true
                }
            }
        }
    }
}


M.getOptions = function(key)
    return options[key]
end

return M