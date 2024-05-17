local M = {}

local dialogue = {
    intro={
        { --Stage
            { --Floor
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Excuse me, you\'re that guild leader correct? The one that\'s handing out the flyers? I hear you\'re very strong.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I was hoping you could help us. I know you have your own troubles to face but our situation is dire and we really need assistance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I\'d be happy to join your guild as compensation, but please, will you help us?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='You will? Great! With your help, I\'m sure we\'ll be able to do it.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.PLAYER.INVENTORY.gainItem(1, 1, 10)
                                MAIN.UTILITY.gotoScene('scene.gacha.gacha', { category='force', value=15, nextScene='scene.title.initialize.initialize' })
                            end
                        }
                    }
                }
            }
        }
    },
    main={
        { --1 Mediators
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Grassland',
                        'Castle'
                    },
                    speakers={
                        {
                            name='Liana',
                            bust='Bust_FH_019_01',
                            face='Face_FH_019_01'
                        }, {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Thank you for agreeing to help. First let\'s head to the castle. There you can meet the princess and we\'ll explain the situataion.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2
                                } 
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Princess Lianna, I have returned and with me a companion, the one I spoke of. He has agreed to help.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={
                                {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Excellent. Thank you Iris.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Allow me to introduce myself. I am Lianna, princess of the Royal Guard. I\'m sure you\'re wondering why we so desperately need your aid.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='This land consists of two governing bodies, the North Nations and the South Sovereigns. Us, as the Royal Guard, act as intermediary, to ensure relations are at peace.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Out of nowhere, the South declared war against the North. We tried to negotiate, understand what they want, but...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='They attacked without warning, no interest in discussion. The Royal Guard is formidable, we\'re confident in our strength and capable of defending against either nation. What use would we be as intermediary if not so.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='But on this occasion our forces were decimated. They had this strange power, nothing I\'ve ever seen before, something out of this world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='We couldn\'t stop them. Our casualties were great. Even my father, he can no longer wield a sword...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='But we can not cry about what has happened. We must stop them now, lest they cause more harm to our world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='However, having faced them already, we know we are no match for them. Which is why we have requested your aid.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Iris tells me you are quite capable. Something about a guild, correct?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Yes, you\'ve seen the flyers, right? He has some kind of battle upcoming. To face something that endangers all of life and creation. He\'s strong, he\'ll be able to help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Excellent. Then let\'s discuss operations.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='The South Soverign\'s army are heading north following the mountain lines. We can cut them off if we follow the ocean stream that runs through.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='For that, we\'ll need transport. With hope that you would be joining us, I have already arranged a ship and a captain.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Yoo-hoo! Anyone home?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah, looks like she\'s arrived.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='That voice, isn\'t that...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={{
                                    bust=3,
                                    frame=3,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='Navy officer Lily here, reporting for duty!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Lily! What are you doing here! I thought I told you to stay away from this war, it\'s too dangerous.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Huh? Big sis, what do you mean? The captain said you wanted my help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='I asked for their most capable. The Navy captain recommended her...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Nope, I won\'t allow it, it\'s too dangerous.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Big sis, you don\'t have to worry so much, we can take care of ourselves you know.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Iris, I know you\'re worried for your sister, but we have no choice, we need all the help we can get.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Besides, if what you say about the guild leader is true, I\'m sure he won\'t let your sister come to any harm..'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Argh! Fine, you better make sure she\'s safe. If anything happens to her I\'ll make sure you live to regret it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='Lighten up big sis, it\'ll be fine.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=7,
                                dialogue='So you\'re that guild leader, huh? Nice to meet you, I\'ve heard some great things about you. I\'m looking forward to having this adventure with you~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Hey! You better not be thinking of anything funny with my sister!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                composer.setVariable('battleResult', 2)
                                if MAIN.PLAYER.QUEST.isFloorCleared(composer.getVariable('quest'), composer.getVariable('stage'), composer.getVariable('floor')) then
                                    MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                                else
                                    MAIN.UTILITY.gotoScene('scene.gacha.gacha', { category='force', value=5, nextScene='scene.battle.rewards.rewards' })
                                end
                            end
                        }
                    }
                }, 
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                    backgrounds={
                        'Castle',
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Liana',
                            bust='Bust_FH_019_01',
                            face='Face_FH_019_01'
                        }, {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=4
                                }, {
                                    bust=3,
                                    frame=1
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Now that all preperations have been made, it\'s time we make our move! As mediators we ensure no conflict arises under our watch, to ensure our land sees peace and prosperity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='We must stop the Sovereign\'s attempt at disrupting the peace we strive for. We must stop their war!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Not only is it our duty as the Royal Guard, if we leave them be, who knows what other disaters may follow.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='I hope after all this we can return to how things were before, save and peaceful.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='As we discussed, Lily will provide transport for us to intercept their march north.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='Leave the helm to me!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Iris and any others still capable fighting shall join you in battle.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We can\'t leave everything to you. This is our war, we\'ll fight as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes. In truth I would like to join you as well, however I need to stay and tend to those injured.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='As well, I can\'t fight my fullest in this dress. My combat suit is still torn from the last battle...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='But I have good faith you can accomplish this with or without my help. We trust you guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Now go! Put an end to this war!'
                            }
                        }, {
                            event='background',
                            type='hide'
                        },{
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }, {
                                    bust=3
                                } 
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=2,
                                    frame=4
                                }, {
                                    bust=3,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Alright, let\'s head to the ship. It\'s a short walk but we might have to fight a few monsters on the way.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Though for you, I\'m sure it\'ll no problem~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='You better make sure nothing happens to Lily, or else...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='Big sis, it\'ll be fine. Now let\'s get going!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                },
                { --postbattle
                    backgrounds={
                        'Ship'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Here\'s the ship! We\'ve made it, safe and sound. See big sis, I\'m fine, there\'s no need to worry.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Better safe than sorry...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='Though truthfully, you were quite impressive out there. It didn\'t seem like you had much trouble with those monsters.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='It looked like he had a harder time watching out for us than actually fighting monsters. He must\'ve been keeping what you said to heart big sis.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Then it was the right choice to ask for your help. We\'re counting on you guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Say, if you\'re a guild leader, that means you have a guild, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Why don\'t you ask some of them to join us? There\'s lots of room on the ship, we won\'t mind the extra company.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='That\'s not a bad idea. Seeing that our numbers have been weakened due to the last battle, it would help to get more people. Plus, with you as their leader, I\'m sure they\'re all quite formidable.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='You think so too? Then it\'s agreed! Feel free to bring along some members of your guild. We\'ll give them a warm welcome~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Oh, I wonder what kind of stories they\'ll share? The adventures they\'ve had with you and your guild. I can\'t wait~'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                local nextScene
                                if not MAIN.PLAYER.QUEST.isFloorCleared(composer.getVariable('quest'), composer.getVariable('stage'), composer.getVariable('floor')) then
                                    nextScene = 'scene.hub.hub'
                                end 
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards', { nextScene=nextScene })
                            end
                        }
                    }
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Ship'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Welcome aboard my ship. I am Navy officer Lily, and I shall be the captain for this voyage.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Although I\'m afraid today\'s agenda isn\'t one for sightseeing. We have a task we must accomplish.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='To defend against the advances of the South Sovereign. If we are unsuccessful, the peace and good will of this world, that which has been kept by my sister and you all, shall be in vain.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='So, I trust everyone on this ship to aid us in this task and to ensure no more harm befalls us or our world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Now then, let\'s set sail~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='How was that big sis? I wasn\'t recommended by the captain for nothing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'m a little impressed. To think my youngest sister could say words like that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Hehe.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='It\'d still be better if you didn\'t join this fight...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='But you\'re right. If we can\'t stop them, this world will fall to chaos. We can\'t let that happen, we need all the help we can get.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Right! Then, let\'s start the sails!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='It\'ll take a while before we reach our destination, no doubt there\'ll be monsters along the way. Remember to stay on guard until we reach land.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                } 
            }, 
            { --Floor 5
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=2
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'ve arrived at our destination. We have a grand task ahead of us, so I hope everyone had time to rest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Ignoring all the monsters of course.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Urgh, I don\'t feel well. Lily, are you sure you sailed you\'re ship right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Huh, big sis, you\'re sick? Everyone else looks ok and the water was quite calm today. You never were any good on sea.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Heh heh, I remember that one time you threw up on sis\'s dress. She didn\'t want to touch it so you were taking it off for her but you threw up a second time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='She told you to throw it out to sea, feed it to the fishes, haha.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Please, don\'t make me think of Azalea right now, I have enough to worry about as is...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Just give me a moment to rest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Sure, let\'s take a break so big sis can rest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Huh? Wait, what\'s that noise?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Oh no, it\'s them!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Urgh, I\'m not in top form right now. We\'ll have to wait before we strike.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='But look at their numbers! Are you sure we can face them?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Let me see. Urgh, give me a moment...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='You\'re right, they have more than before. Even with you on our side guild leader, I\'m not sure we can take them all on.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Then what should we do?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='We\'ll have to reduce their numbers. Perhaps we can fight them in smaller groups.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh, that\'s a good idea. How do we do that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Please give me some time, my head\'s still spinning. I can\'t think of any plans right now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Ah, right sorry. Get some rest, we\'ll keep watch.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='This might be a good time to check our equipment. Guild leader, you know where we can get the best equipment, right?'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                local nextScene
                                if not MAIN.PLAYER.QUEST.isFloorCleared(composer.getVariable('quest'), composer.getVariable('stage'), composer.getVariable('floor')) then
                                    nextScene = 'scene.hub.quest.quest'
                                end 
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards', { nextScene=nextScene })
                            end
                        }
                    }
                }
            }, 
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Everyone\'s ready and waiting. What\'s the plan big sis?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Right. Like I said before, such a large army is too much for us to handle. We should take them down in smaller groups.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I\'m thinking we create some sort of distraction. If we make some noise, perhaps they\'ll send some people to investigate. Then we can take them out bit by bit.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh, that sounds like it will work. But how can we get their attention?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I haven\'t thought of how just yet. We have to be cautious, if we make too much noise they might know we\'re attacking and send everyone.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Do you have any ideas guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='If we fight some monsters they\'ll assume we\'re random stragglers lost in the forest? You might be right. And if they believe that, they\'ll only send a small group to investigate, so they can continue their assault.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='That could work but we\'ll be wasting energy fighting monsters. Is there any other way?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Wait, what are you doing?!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Ah! Monsters incoming!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Sovereign Soldier',
                            bust=nil,
                            face=nil
                        }, {
                            name='Sovereign Leader',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                } , {
                                    bust=2,
                                    frame=6
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Why did you start fighting them, we were still planning.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Do you think they heard us?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I would expect so. Let\'s hide for now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Did you hear that sir? It sounded like some battle.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Yes, though I heard monsters as well. It may just be some poor fool lost in this forest. Someone go check it out.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Yes sir!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Ah, I see them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Only a few of them as well, it seems the plan worked. A bit reckless, but good job.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='What do we do now?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Now we strike. Everyone get ready!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 8
                { --prebattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Sovereign Soldier',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='So far so good, it\'s going according to plan. Is everyone ready?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Waiting for your command big sis.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Good. Keep in mind, as we continue fighting, we\'re bound to make more noise. No doubt they\'ll send more people to investigate, which works in our favour.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='However, if they stop sending soliders we\'ll probably need to fight some monsters again, to gain their attention again.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Umm, so we\'ll be fighting monsters and soldiers?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Exactly, and we may not have much time to rest between battles so be prepared.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Of course, you can count on me big sis!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Then, if we\'re all ready, let\'s go...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Attack!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Huh? You\'re from the Royal Guard. Dammit, we\'ve been ambused. Help! We\'re being attacked!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                }
            }, 
            { --Floor 9
            }, 
            { --Floor 10
            }, 
            { --Floor 11
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Sovereign Leader',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                } , {
                                    bust=2,
                                    frame=6
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='No, something\'s not right.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='We\'re just fighting monsters now. Where is everyone?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='So you\'re the ones causing all this trouble.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=3,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I sent a few people to investigate the noise, but they never came back. And now I see unconscious bodies everywhere. I take it you\'re the ones that did this.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='The Sovereign Leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I recognize you, you\'re from the Royal Guard. I take it you\'re here for revenge?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I\'m here to keep the peace of this world. To stop you from carrying out this war!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Ha! You can\'t stop me, you\'ve already tried. How did that turn out?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='With this new power, I can get whatever I want, nothing can stand in my way!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I hope you\'re ready to face what I have in store.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 12
                { --prebattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Sovereign Leader',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1,
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='The North and South have been at peace for so long, why is it now you\'ve decided to do this?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I\'ve come to realise that peace only exists in fiction. There will always be conflict, I\'ve seen it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='He\'s shown me the disasters that await, the wars that have come and gone. There is no reason to keep peace if we are to fall inevitably.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='We need power! We must fight! To protect ourselves against what\'s to come. The war upcoming!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='The war upcoming?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='That\'s right. With me commanding this world, I can protect us from that war. There may be sacrifices, but all is necessary if we want to survive this war.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I don\'t get it. If you want to protect everyone why are we fighting? Can\'t we work together?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='It\'s impossible, you\'re not strong enough. The war that\'s to come, their power is beyond our comprehension.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='That man, he has granted me this power. He has entrusted me with this task. To protect this world, to fight against that which seeks to destroy it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='And do so I shall, even if it means starting a war within our own world! We are protecting it for the greater good!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='However, now that you understand the situation I am willing to compromise. Tell the North to surrender their land. Let me be the sole leader to guide us through this war. If they agree, no harm shall befall them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='If your first instinct is to invade, how can we trust your words? We are the Royal Guard, mediators of this world. If you have no interest in properly negotiating, we\'ll give you the same as what you gave us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='No good, huh? What about you navy girl? I hear your captain is quite high in rank, I\'m sure the navy would be capable of helping us fight that war.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Umm, our duty as the navy is to make sure any goods are delivered safely and in good condition. We don\'t really look after that mediation thing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='We may not be as grand as the Royal Guard, but we have our own share of conflicts. Smuggling, illicit goods...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Even stow aways. Haha, that takes me back.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='So I... No I\'m sure I speak for everyone in the navy, we all wish to see our world without any conflict. So that our travels are of joy and laughter.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='What you\'re doing goes against what we strive for. We will never work with you!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Plus, I could never go against my sisters. Think of all the trouble I would get into.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Hmph. Well I gave you the chance, don\'t come begging for mercy after we\'re finished.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I guess I have to show you again just how useless you are without my power. I\'ll show you what it\'s like to be in a war you have no chance of winning!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Forest',
                        'Castle',
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Liana',
                            bust='Bust_FH_019_01',
                            face='Face_FH_019_01'
                        },
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Sovereign Leader',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=4
                                }, {
                                    bust=3,
                                    frame=6
                                }, {
                                    bust=4,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='What? No, but how?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Look who\'s begging now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Something\'s not right. It\'s you isn\'t it? That man, who are you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='That\'s the guild leader! You shouldn\'t have underestimated him, he fought against your power no sweat.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='What? You\'re the guild leader? Then what he said will come come sooner than I thought. This power isn\'t enough. How can we stop the war if you\'re already this strong?!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Then its inevitable, what he said will come to fruition. The war that will ruin us all...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='What do you mean?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='That man, the guild leader. He plans to start a war against that which created life, Infinity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='A war...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='With Infinity?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='To face off against that which all life and creation depends on. He wishes for the destruction of everything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='I must escape. I must tell him the guild leader is already making his move.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=4,
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Umm, guild leader, what was he talking about?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='It must be related to what\'s written in your flyers. There is someone you must stop, or else life as we know it will be destroyed.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='But he claims you are the one that will bring this destruction. That\'s not true, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Are you really planning to destroy Infinity? But how is that possible? Infinity is what created us, how can you destory something like that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Someone must have spread false words to him, there is no way anyone can do that...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Umm, guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='If you\'re staying quiet I guess this is something you can\'t share with us yet. Or perhaps it\'s something we won\'t be able to understand.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Regardless, when we requested your aid, you did not hesitate. I\'m sure someone like that would have a good reason for doing such a thing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='You\'re right big sis. We can trust him, he did help us after all.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='That\'s right, and with that I\'d say mission complete.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Let\'s return to the castle and inform the princess.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0,
                                }, {
                                    bust=2,
                                }, {
                                    bust=3,
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=3
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Princess Lianna, we have returned and have successfully stopped the South\'s invasion.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Excellent. Well done Iris, as well as to the rest of you, we could not have done this without you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='I think the guild leader deserves the most credit, he was the only one that could stop their leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'m not surprised. Thank you, truly. Without you we had no chance of winning.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I\'ll explain the rest of the details to you later, princess. We shouldn\'t hold up the guild leader any longer, he has a far greater task ahead of him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh yes, of course. Thank you once again. Without you, I cannot say we\'d be in the situation we are now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I pray your future endeavours all result in the same fasion as this one did.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Remember, I have promised myself to your guild. If you ever need my help, call for me and I\'ll be there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='I\'d be happy to help as well. If you ever need someone to sail some ships, you can count on me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I am still preoccupied with my duties here, but if in the near future you are still looking for people to join your guild, I would be honoured.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='So, until we meet again, I wish you all the best.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Thank you so much.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='Take care guild leader!'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0,
                                }, {
                                    bust=1,
                                }, {
                                    bust=2,
                                }, {
                                    bust=3,
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=3
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=5,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=1,
                                dialogue='So that\'s the guild leader, quite impressive. I\'m glad he was told to me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=4,
                                dialogue='I wasn\'t told about this war though, makes me wonder if there\'s some more truth to this...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=1,
                                dialogue='Oh well, I was told it would be a feast, and that it is.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=8,
                                dialogue='What a delite! I can already taste the guild leader. How delicious! I can\'t wait!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --2 Aftermath
            { --Floor 1
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Cafe'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh, a customer. Welcome to my cafe. Please, take a seat.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Cafe'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }, {
                            name='Monsters',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=6,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I hope it wasn\'t too much trouble getting here, it\'s basically a wasteland out there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hm? You don\'t know what happened? There was a war. Two people fighting against each other. Or was it one person against a group?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I can\'t recall. I was too busy running the cafe. In any case, that fight caused a lot of destruction. This is the aftermath. Not much left I\'m afraid.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Now it\'s just monsters. The only customers I get are wandering travelers such as yourself. My shop has taken quite the hit...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='But that\'s enough of that. What would you like to order? If you\'re unsure I can give some suggestions. Why don\'t you try one of the specials, they\'re what I\'m most proud of...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Sorry, did I hear correctly? You\'re not here to order? You\'re just passing by to search for someone?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Then I\'m afraid I must ask you to leave. I\'ll need the seats for actual customers.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Like that group over there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Grr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Please, take a seat. I\'ll be with you shortly.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Gaah!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Excuse me! Please don\'t throw the furniture.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Rrrraaaawwww!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Alright, I\'m afraid I must ask you to leave. It doesn\'t seem like you\'ll cooperate, so I have no choice but to use force.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Hey you. Since you\'re leaving as well, mind if you help kick them out. You seem more reasonable that those monsters.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Cafe'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Thanks for the help. Though we couldn\'t stop them from making a mess. Looks like I\'ll need to close shop for a while.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Say, you\'re quite strong. I think I know who you are. You\'re that guild leader, right? Who\'s trying to recruit members for a battle or something. Some of my customers spoke of you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I have an idea. Why don\'t you tell your guild members about this place. With all that they\'re doing, I\'m sure they\'ll want a place to relax.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='They\'ll be happy, you\'ll gain their trust and thanks and I\'ll get more business. How does that sound? It\'s a win win.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'ll even let them work if it gets busy. Of course I\'ll pay accordingly. What a great plan.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='And their first job can be to fix up this place. No payment though, this was partly your fault.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='You agree? Then it\'s a deal. You should head back to your guild and let them know.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='The cafe is open for business.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                local nextScene
                                if not MAIN.PLAYER.QUEST.isFloorCleared(composer.getVariable('quest'), composer.getVariable('stage'), composer.getVariable('floor')) then
                                    nextScene = 'scene.hub.hub'
                                end 
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards', { nextScene=nextScene })
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                    backgrounds={
                        'Wasteland'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=5,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='You actually managed to convince them to repair the cafe? Quite the talker aren\'t you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='But now I don\'t have anything to do. I haven\'t had some time off in ages. What to do...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I guess I can help you with your search, show you around the place. There\'s not much aroung though, you sure that person\'s here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You don\'t know? You\'re just wandering aimlessly? Well that makes things harder...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='We\'re still waiting anyway so what\'s to lose. I guess this is what you call retirement, wandering aimlessly until you find something you\'re interested in.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Well then, let me show you around, but don\'t expect much besides monsters. This was a war zone after all.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Volcanic'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='And here we are at the volcano. What a sight, wouldn\'t you say? Magma flowing from out the mountain, the unbearable heat...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='That volcano was originally dormat, but during that battle it became active again. I don\'t know how a dormant volcano becomes active, I doubt lighting a really large fire would work. Maybe you could bring it life by giving it Infinity?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Whatever happened, that\'s why this land\'s now barren. The heat burned everything. I\'m fortunate the cafe is some distance away from here, otherwise there\'s no way it would have survived.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And because of that everyone decided to leave. The monsters, they just adapted. You can see some over there, they\'re basically fire now. I\'m sure some water magic would cool them off.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Hmm? You\'re wondering why I stayed? To run my cafe of course. I\'m not going to quit just because there aren\'t any customers nearby.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='You have to adapt to any situation, whether it\'s a change in temperature, unstable terrain or even a virus outbreak, a good business knows how to adjust in any circumstance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Though I admit, it has been tough recently. Here\'s hoping our agreement will help me get back on track.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Anyhow, let\'s continue. Remember we\'re near the volcano so the monsters will be different.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Though I\'m sure you\'ll be able to handle them just fine..'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                }
            }, 
            { --Floor 8
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 9
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 10
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Volcanic'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well that\'s about everything. Like I said before, not much. We didn\'t find any clues about that person you\'re trying to find either.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I think it\'s time to head back. Your guild members should\'ve repaired the cafe by now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We\'ll go through this tunnel, it\'s a short cut. I believe it was made so people could hide from the battle. Thanks to whoever excavate it, everyone managed to escape safely.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? You don\'t want to go through the tunnel? It\'s too cramped? Sorry, I\'m not keen on traveling back through the volcano. This is a much shorter route, trust me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Let\'s make it quick? Yes, that\'s the spirit, making the shortcut even shorter. And who knows, perhaps the person you\'re looking for might still be hiding there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Though it\'ll probably be more likely for us to find their bones, given all the monsters, ha ha.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Huh? That was a joke, you don\'t have to be so scared...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 11
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 12
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Tower'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Alright, we\'re out. We didn\'t find anything inside but I wasn\'t expecting to. I noticed you weren\'t performing that well while inside the tunnel. Maybe cramped tunnels aren\'t to your liking?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='We\'re not far from the cafe now, just a bit more.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You\'re wondering whats that over there? It\'s the tower. The tunnel ends on the other side of the volcano, hence why we didn\'t see it before.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='What\'s in there? Again it\'s just monsters, I thought you\'d expect that by now...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Apparently there\'s monsters guarding every floor. You have to beat them to go up the next floor.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='That tower is the tallest in this world, it made a good tourist attraction. After they finished sight-seeing, they\'d head to the cafe to rest. Those were busy times.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='But if you want to investigate, please do it in your own time. I have no time to enter a 100 floored tower, I need to get back to work.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And I assure you it\'s only monsters there. The person you\'re looking for definetly won\'t be there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Treat it like a challenge or something, aim to reach the top. You might even find some good loot, if the monsters haven\'t taken it for themselves.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='If that\'s been cleared, let\'s keep going. Just a litte further.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                local nextScene
                                    if not MAIN.PLAYER.QUEST.isFloorCleared(composer.getVariable('quest'), composer.getVariable('stage'), composer.getVariable('floor')) then
                                        nextScene = 'scene.hub.quest.quest'
                                    end 
                                    MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards', { nextScene=nextScene })
                            end
                        }
                    }
                }
            }, 
            { --Floor 13
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Cafe'
                    },
                    speakers={
                        {
                            name='Frieda',
                            bust='Bust_FH_014_01',
                            face='Face_FH_014_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='We made it back, and the cafe\'s good as new. Your guild members did quite a fine job, I\'ll have to thank them later.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Well, that\'s everything. I have to get back to work, so I\'m afraid I can\'t entertain you any longer. It\'s a pleasure doing business with you. And good luck with your search.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='What\'s this? You have a flyer? Sure, I can post it here. Who knows, perhaps the person you\'re searching for might see it and contact you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Now, let\'s see here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh! It has everything on your flyer. So this is what you\'re doing... It\'s much more than what my customers spoke about.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='You\'ll definitely need as much help as you can get. It\'s a good thing we made that deal, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'ll just stick it here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='There, that should do it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Well, I need to get back to work and you need to continue doing what you\'re doing. I guess we both have our hands full.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Good luck and take care. Remember, my cafe will always be open for you.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1
                                }
                            }
                        }, {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                },{
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah, a customer. Welcome, please take a seat.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh, that flyer caught your eye? It\'s from a guild leader, he came by some time ago. Here, take a look.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='He and his guild members are regulars of the cafe. We have an arrangement. If you stay for long enough maybe some of his guild members might show up.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You know that thing he\'s trying to do, what\'s written on the flyers. His guild members told me about it. He\'s actually going against Infinity. Hard to believe, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I don\'t know how he plans to do that, but I\'ve seen him in battle and I\'m sure he has a good reason for doing this.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='That\'s why he\'s looking for members. He needs all the help he can get if he wants to do it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='That\'s all the gossip I have on that. If you want to know more, I\'d suggest you try ask him. His contact is down below.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='But that can come later. I\'m sure you\'re hungry. What would you like to order?'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --3 Honour
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ahhh! Someone help!!!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Take that monsters! Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh no, there\'s too many. I can\'t hold them off for much longer...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='You\'re here to help? That\'s great, I\'m almost all out of strength.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I\'ll finish these and you take the ones over there. I can do this, just a little more!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Yes, we did it! Thanks so much!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='What was I doing here? Training of course.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I live with the military army along with my sister, who\'s the leader. I want to be strong just like her.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='The others won\'t let me join because I\'m still young, so I come here to train on my own. This is a secret so don\'t tell anyone.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I can usually handle one or two monsters, but this time there were waves of them. I don\'t know why...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So it was a good thing you came when you did. Thank you mister.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='You know, you\'re pretty strong. Who are you? I\'d like to know a bit more about you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh, you\'re a guild leader? I remember sis and them talking about a guild leader. Maybe they\'re looking for you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Why don\'t you come back with me? Meet with sis and the army?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='You actually wanted to meet the military army? Oh, so that\'s why you\'re here.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Then as thanks for helping me, let me lead the way. Follow me guild leader!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Ermmm, so you\'re recruiting members to fight Infinity? I\'m not sure I quite understand, isn\'t Infinity what created us? How can you fight that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Huh? Possessed? Ummm, I\'m sorry, I still don\'t understand...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='But whatever you\'re doing, I\'m sure it must be good. You helped me after all. And you\'re strong, I\'m sure you can do it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well let\'s back. There\'ll still be monsters on the way back, so be prepared.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='I\'m not sure why the monsters seem really angry today but you\'ll take care of them, won\'t you?'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 5
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                    backgrounds={
                        'Fort'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Sakura',
                            bust='Bust_FH_007_01',
                            face='Face_FH_007_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='We made it. And look, Sakura\'s waiting for us. She\'s in the army as well. Hey Sakura!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=6,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Cerene, where were you? Everyone was starting to get worried.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh nothing in particular, just walking around outside. But look, I found the guild leader, you were looking for him, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Huh? That\'s the guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Cerene, get back! Stay away from him!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='What?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='He\'s here to steal the sword!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Huh? The sword? The one we\'re sworn to protect?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='He wants to use it to fight Infinity. He wants to end all life.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Fight Infinity? Yes, I know but... Did you really want to steal the sword? Is that why you\'re here? Why didn\'t you tell me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Whatever he says is a lies, he\'s the enemy. A envoy of Infinity warned us about him. We must stop him, lest we become victims of his war.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Umm, but he saved me? He told me everything about what he\'s doing. I didn\'t understand much, but he can\'t be a bad guy, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='He tricked you so that you\'d lead him here. Don\'t worry, it\'s not your fault. I\'m sure he would\'ve threatened you if you didn\'t help him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='No, but...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Guards, I need your help! The guild leader, he\'s here!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='You won\'t have your way guild leader!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Fort'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Sakura',
                            bust='Bust_FH_007_01',
                            face='Face_FH_007_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=6
                                }, {
                                    bust=2,
                                    frame=4,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Damn, you\'re strong, just like we were told. But we\'ll stop you, no matter what. Even if it costs me my life!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Guards, I\'ll cover your escape. Call for Charlotte, tell her the guild leader has come.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='What? You\'re calling for sis?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Guild leader, quick, we have to run!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Ah, wait! Cerene!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Jungle'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Charlotte',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=6,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I don\'t want you to fight sis. I know you\'re a good person, there must be another reason why you\'re here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We have to find him! Who know\'s what he\'ll do to my little sister.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Oh no, that\'s sis. She sounds angry, I don\'t think she\'ll want a friendly talk, we have to hide.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='We\'ll talk later. Quick, into the jungle.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 8
                { --prebattle
                }, 
                { --postbattle
                }
            }, 
            { --Floor 9
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Jungle'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Ok, we should be safe for now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Umm, so what was it you came here for? I know you said you were going to fight Infinity, but did you really want to steal the sword as well?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You didn\'t want to steal it? You just wanted to see if it was still there?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Wow! That\'s the story of the sword? And because of that...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I see. You\'re not the bad person then, thank goodness.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Infinity is the one that\'s bad. They\'re even tricking sis and the others.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='We have to explain everything to sis, though I\'m not sure she\'ll listen, she\'s quite angry.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'ll have to fight her. She\'s tough, so you should probably take some time to prepare.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 10
                { --prebattle
                    backgrounds={
                        'Jungle'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'ll be facing my sister, leader of the military army. She\'s the best, that\'s why she\'s the leader. It\'ll be tough.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Though if want to face Infinity, I\'m sure you have far tougher battles ahead. No offence to sis, she should be no problem for you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='If you\'re ready, let\'s leave. But we have to stay cautious. I wouldn\'t be surprised if sis manages to catch up to us, she\'s very good after all.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 11
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Charlotte',
                            bust='Bust_FH_012_01',
                            face='Face_FH_012_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Ah, sis...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=4,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='We\'ve got you now guild leader...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 12
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Charlotte',
                            bust='Bust_FH_012_01',
                            face='Face_FH_012_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=4
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Sis, you got it all wrong. He\'s not here to steal the sword, he just wanted to know if it\'s still here. Infinity is the bad guy, you were tricked.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='And you\'d believe this man over that which breathed us life? What lies did you tell her guild leader!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='No, just listen to him. If you hear his story, you\'ll understand.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='If you don\'t trust him, why don\'t you trust me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Everyone\'s always talking about how great my older sister is, how she always stands for what\'s right, honour those who fight for their own reason.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Even me, I believe that as well. I\'ve been secretly training, just so I can join the army. To follow in your footsteps...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='But what you\'re doing now stands against all that. You\'re not listening to us, but instead someone who says they\'re good? And that we\'re evil?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='What happened to my sister? The one that would hear me out if I did something wrong? Who\'d then tell me off since it was a bad thing to do.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='But you\'d still listen. You\'d explain why what I did was wrong. Where\'s that sis? Why aren\'t you listening to us now?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Cerene...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='All the things you\'ve done, they were minor, you didn\'t know the consequences. It\'s ok for you not to know some things, as long as you know for next time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='But that man, he plans to start a war. Think of what would happen! And he\'s cares naught for the casualties that will fall because of him and his battle.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I\'m doing this to protect us, to protect you. So we don\'t become victims of his mad war. '
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Sis...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='So we must stop him! Whether he is good or Infinity is bad, even if he\'s not trying to steal the sword, it matters not. I wish to stop this war he\'s going to start.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='And if my life is the cost to stop him from causing such destruction then so be it, I\'ll gladly accept. I shall die in honour!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Come! Face me guild leader!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland',
                        'Fort'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Charlotte',
                            bust='Bust_FH_012_01',
                            face='Face_FH_012_01'
                        }, {
                            name='Sakura',
                            bust='Bust_FH_007_01',
                            face='Face_FH_007_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2
                                }, {
                                    bust=2,
                                    frame=6,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Argh! You\'re too strong. I guess this is it. We\'re all doomed...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='No, please sis. Just listen to him. Let him explain everything.'
                            }
                        }, {
                            event='background',
                            type='hide',
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=2,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='So that\'s all that happened, it\'s quite hard to believe. To speak the truth, I can\'t say I completely understand everything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='That\'s ok sis, I don\'t quite understand everything either.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='But one thing I know, the guild leader is a good guy, he saved me after all.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Yes, looking back I realise I was the wrong. I was too hasty in beliving you would cause such destruction. I have dishonoured you and our name. Allow me to repent...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I shall slash my stomach, it is the only way to atone for my mistakes.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='No sis, don\'t!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='What? You forgive us? Instead you want us to help you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Ha ha ha, what a great man we\'ve stumbled across. To think I was set on fighting you just moments ago.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='You know, I\'ve really come to admire you. Everything you\'ve been through, what you\'re doing now. I\'m sure even now you\'re still fighting against your struggles.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I may be a fighter, but I still take the time to care for the others. I see their burdens as my own, for we are all victims in the fight against conflict.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I would be honoured to hear all that you\'ve been through. And to get to know you better.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Huh? You still need time to mend your broken heart?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='A relationship? No, that\'s not what I...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh no, sis...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Seems like the guild leader has more troubles than we thought. It\'s ok sis, maybe when this is all finished you can go for it~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='No I mean... Well... Anyway, moving on...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Please stay for a while, get some rest. You\'re welcome to take a look at the sword if you\'d like. And if you need anything else let me know, I\'d be glad to help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='But no funny business with sis, got it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Cerene!'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='So you\'re ready to leave? Thank you for coming here and explaining everything, and I\'m sorry for the misunderstanding.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You might have already forgave us, but I don\'t feel satisfied leaving it like that. Here, please take this.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? But that\'s the sword? Are you sure it\'s ok to give it to him?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yes. This sword, which was handed down to us through generations, that which we were sworn to protect. It loses meaning if we don\'t know the truth of it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Wouldn\'t it be right to give it to the one person who knows what it signifies? Much better than leaving in a box.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Right!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='As well, we promise you our aid. Should anything go wrong in your battle, call for us and we\'ll gladly assist.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='As one who has fought against you, I would be honoured to fight along side you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Don\'t forget me, I\'ll help as well, just like when you helped me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Cerene, I still need to speak with you about this \'special training\' you do...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Huh? Umm, special training, what\'s that? You must have heard me wrong...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Well then, good luck to you guild leader. May your upcoming battle be one that ends with victory.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='See you guild leader!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --4 Monsters
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }, {
                            name='Monsters',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, you\'re the guild leader. Thanks for responding to our call. Let\'s head back to the village, we\'ll explain the situation there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Grr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='What? They\'ve come here as well? Dammit, we\'ll have to fight.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='You\'re wondering who the enemy is?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Grr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Monsters...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Raaawwrrrr!!!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Look\'s like that\'s the last of them. Hey, you\'re pretty good guild leader. I guess that\'s why that person told us about you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Let\'s head to the village quick before they show up again. We\'ll explain everything there.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Tent',
                        'Wasteland'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_01',
                            face='Face_FH_053_01'
                        }, {
                            name='Elie',
                            bust='Bust_FH_002_01',
                            face='Face_FH_002_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Hello, I\'m back! And I brought the guild leader.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Welcome back Melaine. And good to meet you guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Penelope is the brains of this village, she can explain what\'s going on.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Right. Elie has yet to arrive, but we can begin without her. Now...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=3,
                                    frame=2,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Sorry I\'m late!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Not a problem at all, I was just about to start.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Ugh, Elie you should have come after she explained everything. Now you have to listen to all this again...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Now to begin, you may have already noticed but the monsters here are terribly enraged.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You see, just as we have come from Infinity, so to do monsters. However they are much more reliant on it than us. They don\'t fuel of food, oxygen and the like, only magic.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='It\'s quite tragic really, their bodies can only store Infinity, and thus it\'s their only source of energy. And, being mindless creatures, all they do is fight, consume magic and fight some more.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I\'ve been thinking of a way to artificially create Infinity\'s magic. That way the monsters won\'t need to attack each other nor us to attain magic. What we could do is...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Ugh! I don\'t want to hear this again. Can you just tell him what he needs to do...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Ah forgive me. It\'s all very interesting, I can\'t help not to discuss this.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Now then, as I said before monsters need Infinity to survive. And this item right here is full of it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='This is my ring, a family antique, passed down through generations.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='It was lost some time ago. When we found it was cursed with a large amount of Infinity\'s magic.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='After that the monsters started attacking us. From all that Penelope told us, I assume it\'s because they want the magic from that ring.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Penelope created that barrier to stop them from attacking the village. Being a know it all does have a use eventually.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh a barrier for that was easy. All we need to do is...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Ahem. Moving on...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Unfortunately for Elie, we\'ll have to destroy it unless we want to be comfortable living alongside enraged monsters. However there is one problem.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='This ring was created with powerful magic. It was made to be unbreakable.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Yes, I\'ve tried many different approaches, none to avail. Our only option is to destroy it with the same energy it was made from...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Sparks from the galvanic plains. Someone, somehow gathered electricity and shaped it into ring, creating an everlasting cycle of energy.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='How superb is that! I can only imagine what kind of magic made that possible. Of course I have my theories, one possibility is...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Ummm, since this is my ring so it\'s only fair for me to do it. However, with the monsters so aggressive, I don\'t think I can make the journey alone.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='That\'s why we\'re asking for your help. You\'re going to face Infinity after all. Helping us will be easy.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yes, we know what you plan to do. And, with the ring cursed with Infinity, it makes sense to ask for your aid.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='You\'ll help, won\'t you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='You will? That\'s great!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Excellent. Now, as well as Elie, the sisters Melaine and Ebonie will join you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Where is Ebonie by the way? I asked her to be here as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I don\'t know. She probably didn\'t want to hear you rambling again. I mean, who can blame her?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Don\'t worry, if we\'re fighting monsters she\'ll be there. It\'s one of the few things we can rely on her for.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Right. Well that\'s everything. Is there anything else you\'d like to know?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Huh? How did we know about your battle with Infinity? It\'s suppose to be a secret? Only a select few know of it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Ha ha, this is how I pieced together the puzzle. You see, there was a battle a while ago, in another world. Its aftermath, a barren land.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I felt it quite odd for a flourishing land to simply desertify like that without some kind of strong magic. And after some long days trying to figure out what sort of magic could do such a thing...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Some old man came and told us everything. About what happened with Infinity. And you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Hey, I would have figured it out eventually.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='That person found the ring and gave it back to me. But by then, it was already cursed. They explained everything and, with the ring being how it is, we knew it was the truth.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='That person also recommended you to help us. So that\'s why I asked for your help and here we are now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Hopefully that explains everything. You have a tough quest ahead so I\'ll leave it to you four. Safe travels.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                }, {
                                    bust=2
                                }, {
                                    bust=3
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='We\'re heading to the galvanic plains. We\'ll have to walk quite a distance before we get there though.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Remember, since we actually have the ring in hand, the monsters will come straight for us. You better be ready.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Where is Ebonie? I don\'t see her, are you sure she\'s coming?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Oh don\'t worry about her. If you can\'t see her that means she\'s doing her job. That\'s the only thing she\'s good at.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Well ok then.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ready? Let\'s go!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 4
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Cliff'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='Ebonie',
                            bust='Bust_FH_009_01',
                            face='Face_FH_009_01'
                        }, {
                            name='Elie',
                            bust='Bust_FH_002_01',
                            face='Face_FH_002_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Take that! Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='How\'s that? I beat 10.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='13'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Dammit Bonie! It\'s not fair if you\'re just hiding. Why don\'t you come out and face them like a proper fighter!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='You\'re worried about them? Ha ha. It\'s ok, they\'re always competing against each other.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='And besides, you\'re watching out for us as well. I don\'t think anything will go wrong.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='The next path we need to take is up this mountain. Be prepared to face more monsters as we go up.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 7
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Galvanic'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='Ebonie',
                            bust='Bust_FH_009_01',
                            face='Face_FH_009_01'
                        }, {
                            name='Elie',
                            bust='Bust_FH_002_01',
                            face='Face_FH_002_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='That makes 25. How about that Bonie?'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Hm? I gave up counting a long while back after I saw the guild leader fight. He\'s too strong, there\'s no point. We should let him handle everything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I\'m focusing on protecting Elie. Come Elie.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Umm, right.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                },
                                {
                                    bust=3
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='What! Grr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I can\'t beat you, I guess I\'ll protect Elie as well. We\'re heading into an electrified plain after all, it\'ll be dangerous.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Hey! Wait for us!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 8
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 9
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 10
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Galvanic'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='Elie',
                            bust='Bust_FH_002_01',
                            face='Face_FH_002_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=5,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=5
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Woah, look at that! There\'s a pool of electricity right there...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Yes, this is it. We\'re here...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 11
                { --prebattle
                    backgrounds={
                        'Galvanic'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='Ebonie',
                            bust='Bust_FH_009_01',
                            face='Face_FH_009_01'
                        }, {
                            name='Elie',
                            bust='Bust_FH_002_01',
                            face='Face_FH_002_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So this is where that ring was made. Pretty impressive.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I\'m impressed as well. To think someone could forge a ring from this whirlpool of electricity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='What\'s so special about it anyway? Why would someone go through all this trouble just to make a ring.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I was told this was originally a gift, one to represent an unbreakable bond. Hence why it was created to be indestructible.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='So now we pass it down our family, so that the bonds of our ancestors remain ever connected long after their passing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I see. Sounds very sweet, what do you think guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='What? That\'s the story of the ring? And you...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=7,
                                dialogue='Oh my!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=4,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Monsters incoming!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Grr... I wanted to hear more of the story, damn you monsters!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='My family ring...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='This isn\'t just about me, it\'s for you as well. We have to do this!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Galvanic',
                        'Tent'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        }, {
                            name='Ebonie',
                            bust='Bust_FH_009_01',
                            face='Face_FH_009_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_01',
                            face='Face_FH_053_01'
                        }, {
                            name='Elie',
                            bust='Bust_FH_002_01',
                            face='Face_FH_002_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Enemy eliminated.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Yep, but there\'s still one more thing we gotta do. Sounds like Infinity cursed that ring on purpose. To get to you...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=2,
                                dialogue='Are you sure you still want to destroy the ring? We understand if you don\'t...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='You\'re willing to do it? For us? How noble. To give up something so precious for the greater good.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Unlike someone I know...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Huh? What\'s that suppose to mean?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Oh you know what I mean. About the other day...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='That\'s it! Our whole journey all you\'ve been doing is hiding. Why don\'t I give you some action!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Fine with me, I\'m not so desperate for attention I need to finish my battles in style, I do my job quick and easy. I\'ll show you how it\'s done.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Take this! Ha!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }, {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=2,
                                dialogue='There\'s fighting here? Sparks are everywhere, hopefully they\'ll be ok...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=5,
                                dialogue='Well, if you\'re sure you want to destroy it, let\'s do it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=5,
                                dialogue='What? You want to be the one to destroy it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                dialogue='To let go of your past... You really are noble aren\'t you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Here, take it. Throw it into the pool of electricity, from where it came from.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Well that\'s it, we can go home and tell everyone the good news. With the ring gone, the monsters probably won\'t try to attack us. We should be safe going back.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=3,
                                dialogue='Hey, we\'re finished! Let\'s head back!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                face=true,
                                dialogue='Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                face=true,
                                dialogue='Too slow...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=5,
                                dialogue='Umm girls...'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=4
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1
                                }, {
                                    bust=4,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='... and that\'s all that happened.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I see, what a grand quest. And to learn more about that ring as well. How interesting. It seems your quest, guild leader, has only just begun.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=3,
                                dialogue='Thank you so much for your help guild leader!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yea, you\'re pretty great. I bet you could even take on an onslaught of monsters and not even sweat.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Hm? What\'s this? A note?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='It\'s from Bonie. She says if you need help just call her, she\'ll be nearby.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Don\'t trust her. You won\'t know if she\'s actually nearby to help or not. All she ever does is hide...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Instead, count on me to help you in your fight!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='I would like to help as well. With that ring having fallen to my hands, I\'m sure there\'s more for me to play a part in your story.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I think all of us would love to help you. Which such a grand quest in sight...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Think of what more I could learn! Joining the guild of he who wishes to fight Infinity. No doubt their battle will be one beyond our comprehension.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='The journey you\'ll travel to gather allies, the battles that\'ll take place, the destruction that\'ll result. How will you prevent such disaster? There\'s so much to see!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'d better leave now or else you won\'t hear the end of it...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='And not to mention the hardships that will befall. After all, you\'re the one that...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Go, go, go...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --5 History
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Tavern',
                        'Forest'
                    },
                    speakers={
                        {
                            name='Mina',
                            bust='Bust_FH_045_01',
                            face='Face_FH_045_01'
                        }, {
                            name='Man',
                            bust=nil,
                            face=nil
                        }, {
                            name='Woman',
                            bust=nil,
                            face=nil
                        }, {
                            name='Bartender',
                            bust=nil,
                            face=nil
                        }, {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                } 
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yoo-hoo! I\'m back!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Oh it\'s Mina!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Mina! Do you have another story for us today?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Of course, but first let me have a drink. The usual, if you\'d please!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Coming right up!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Here ya go!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ah, that hit the spot! Splendid as always.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Now, today\'s story will be a bit different. Instead of my travels, this will be about the guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='The guild leader? I\'ve heard about him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I hear he\'s amazing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Indeed he is. This is but one of the many stories he has written. Together with his party, they travel on a heroic quest to save the world from the grasp of evil.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Oh and apologies if I recite his name wrong. I\'m too used to calling him the guild leader.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                } 
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=5,
                                    frame=8
                                }, {
                                    bust=6,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=7,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=8,
                                dialogue='Everyone ready? Let\'s go!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=7,
                                frame=8,
                                dialogue='I want this over and done with...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=8,
                                dialogue='The task ahead will be long. We must cleanse the four crystals from the demon lords grasp, lest the world fall to ruins at the hands of greater evil.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=7,
                                frame=8,
                                dialogue='That\'s exactly why I want to get this over with. Think of how dangerous it\'ll be.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=8,
                                dialogue='Well, thank the guild leader for accepting this quest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=8,
                                dialogue='Hm? We have to do this? Yes, you are right. Of course we couldn\'t leave it as is. Think of what will happen. There was no other choice but to accept this task.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=7,
                                frame=8,
                                dialogue='Well someone else could have taken the job...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=8,
                                dialogue='I bet he just wanted the fame. Think of what would happen when we come back? We\'ll be called heroes.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=8,
                                dialogue='I doubt that was his reason. What\'s more likely was his promise to rid the world from danger, to give her a better future. Surely he\'s doing this on that claim.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=8,
                                dialogue='Nope, I don\'t approve their relationship.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=7,
                                frame=8,
                                dialogue='Can we just go already...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=8,
                                dialogue='Ah, sorry. Got distracted.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=8,
                                dialogue='We\'re travelling to the energy crystal. Remember there\'ll be monsters everywhere we go. We must stay vigilant.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Tavern'
                    },
                    speakers={
                        {
                            name='Mina',
                            bust='Bust_FH_045_01',
                            face='Face_FH_045_01'
                        }, {
                            name='Man',
                            bust=nil,
                            face=nil
                        }, {
                            name='Woman',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Mina, what gives! We wanted to hear the battles of the guild leader and his party members, not the members of the guild!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh, I\'m sorry but to tell the truth I don\'t actually know how those fights happened. The guild leader just said they defeated their enemies, not how.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I though it would be boring if I skipped all that so I thought I\'d just use the guild members to fill in. I\'m so sorry.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Don\'t worry about it. It\'s a much better story if you include that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I guess so. You do make stories more interesting by filling in those gaps. Please, continue Mina.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Great, thanks so much.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Continuing where I left off, the party made their way to the first crystal...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Volcanic',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Monster',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8
                                }, {
                                    bust=3,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='We finally made it. It\'s so hot...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Well duh! The energy crystal\'s right over there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='The energy crystal controls the life force of the land. Absorbing excess energy as heat and then dispersing it. It\'s no surprise it is a little hotter here than elsewhere.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='However, because of the demon lord\'s attempt to control the world, he has corrupted the crystal. This overwhelming heat is unnatural, we must purify it before the demon lord\'s plans are set into motion.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Grrr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Oh, that must be the guardian.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='We have to defeat that? Why did the demon lord make those monsters?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Err, to protect the crystal, why else?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Rawr!!!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Here it comes!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Volcanic',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Monster',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8,
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='That\'s it? I expected more to be honest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='It\'s better that it\'s easy. I\'ll proceed with the cleansing of the crystal. Please watch my back, it will take some time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='No problem.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Ummm guild leader, I\'m sorry for dragging you down. It looked like you were more worried about me than actually fighting.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ah I guess you haven\'t been with us long. That\'s just how he is, he tends to watch out for others more than himself. Don\'t worry about it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But keep him away from any sisters you have. He\'ll save her, fall in love and they\'ll be in a relationship without your approval...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='What? But I don\'t have any sisters...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='He knows what I\'m talking about...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ok, the crystal has been purified.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Alright, good job! Let\'s keep this momentum going. Onto the next crystal!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                    backgrounds={
                        'Forest',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=8
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='The next crystal is the nature crystal. It\'s said to lie on the peak of the highest mountain. Does anyone know where that is?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='No idea. Why would I care about the height of some mountains?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Umm actually I know, it\'s near my village.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Oh, your village? How exciting!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Well then, please lead the way.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Umm, ok...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                    backgrounds={
                        'Grassland',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='So that\'s your village? And the mountain is right over there. Looks like it\'ll be a trek, do you want to rest at your village first?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='You can go, but I\'m not going back there. Not yet...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='What? You\'re asking why? Ummm, I promised I\'d only come back when I was strong enough to wield my clan\'s sword. Right now I\'m nowhere near strong enough...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='So that\'s why you joined us? To get stronger?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Yes. It\'s been said our family will protect it for all eternity, until the chosen is ready to wield it in the battle that\'ll bring about the destruction of creation...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Can we talk about this some other time? I don\'t really want to talk about it since I\'m still... So weak...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Of course, we can discuss it once you\'re ready. Then let\'s start making our way to the top.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 7
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 8
                { --prebattle
                    backgrounds={
                        'Cliff',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='This is the top? We got here pretty quick. So much for the highest mountain.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Both the crystal and the guardian are waiting for us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Ummm right. If I want to grow stronger, I mustn\'t hesitate, just like the guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Let\'s do this!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Cliff',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8
                                }, {
                                    bust=3,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='We did it? Yes! We did it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hey, not bad. You\'re improving.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='I have the guild leader to thank. I\'m learning a lot from him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Oh no, don\'t you fall for his charm as well...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I\'ll proceed with the cleansing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='I still have some strength left. I\'ll keep watch, you two, please take a rest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='If you say so, we\'re counting on you.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }, {
                                    bust=3
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Some story he has, right? A sword destined to be used in some war. His clan, sworn to protect it. And him, the weakest, must wield it...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='That power it holds, no wonder you gotta be strong to wield it. And he\'s following you to become stronger. You\'re pretty amazing, huh?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hey, you\'re serious about my sister, right? You\'re not just messing around with her?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Yes, I know. Of course I know you feel. I\'ve been with you for a long time you know...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Well whatever, let\'s get some rest. The others will finish the job.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 9
                { --prebattle
                    backgrounds={
                        'Tavern',
                    },
                    speakers={
                        {
                            name='Mina',
                            bust='Bust_FH_045_01',
                            face='Face_FH_045_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='After the nature crystal came the cold crystal. Their destination, an underground ice cave.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='But first, they had to travel across the sea. Of course the dangers there were present as well...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 10
                { --prebattle
                    backgrounds={
                        'IceCave',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=8,
                                }, {
                                    bust=3,
                                    frame=8,
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='We\'ve made it to our destination. Thank the goddess, I don\'t think I would have lasted a second longer.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ha ha. You two almost threw up.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Urgh. Don\'t talk about throwing up, it might make me do it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Huh? What\'s that? You want us to keep going? Determined aren\'t you? Did you hear that? The guild leader wants us to keep going, \'quickly\' as well..'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Please, give us a moment to rest...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ah! He\'s walking on ahead, guess he really wants to do this quickly.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Actually, doesn\'t he have a fear of enclosed spaces? Like caves and tunnels? This kind of fits the bill.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And there he goes... You two better hurry up if you don\'t want to get left behind.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Ugh... Wait for us!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 11
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 12
                { --prebattle
                    backgrounds={
                        'IceCave',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Look, we\'re in an open clearing. You should be ok now, right guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Well let\'s hope he is, after all the guardian...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='It\'s coming right for us!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'IceCave',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ha! Easy. Things are much easier when the guild leader is in top performance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I guess even the guild leader has a weakness.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Be sure to remember it in case you ever need to fight him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Hm? When would we ever need to fight him?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I don\'t know? If you\'re mad at him for marrying your sister?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ha ha. sure. I\'ll keep that to mind.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='I hope we won\'t ever need to fight each other.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I know what you mean. It\'d be a pain to go against him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Anyway, can you start the cleansing?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Of course, bear with me for a moment.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='There, that should do it. Now there\'s just one more to go, the elemental crystal.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 13
                { --prebattle
                    backgrounds={
                        'Grassland',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='So explain to me how we\'ll get to the elemental crystal again?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='The elemental crystal lies in the center of heaven, the land looking down at us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Heaven. That\'s high up in the skies, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Yes. Fortunately, thanks to the guild leader and his past connections we have a mode of transport. Guild leader, if you will.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Huh? We\'re really going to do all that? That sounds so tedious...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Can\'t we just skip to the part where we\'re in heaven looking for the crystal?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='But we have to do it. How else will we get there?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ugh! Fine. Guild leader if, for whatever reason, you\'re telling people of this story skip this part and start from when we\'re fighting monsters. I don\'t want to do all that again...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 14
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 15
                { --prebattle
                    backgrounds={
                        'Heaven',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='There\'s the crystal!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='And a strong looking guardian.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='This is the final crystal. No doubt this is the demon lord\'s strongest creation, it\'s final effort to stop us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Well, what are we waiting for? Let\'s fell it!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Heaven',
                    },
                    speakers={
                        {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Trefle',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8
                                }, {
                                    bust=3,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Is that it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='That\'s it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='We did it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Yes, but one final thing remains. Give me a moment...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='I can\'t believe we actually did it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Amazing right? It\'s because we\'re a team. Because of you and you...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You as well guild leader, you did a lot.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='There, everything\'s finished.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Yes!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='We finished such a dangerous quest, we\'ll come back as heroes!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You think you\'re ready to go home after this?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Umm... No, I don\'t feel ready yet. But maybe if we continue travelling? Face more dangers together?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ah, well we have been travelling together for quite some time already. Maybe less so with you, but us three have been together for who knows how long.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='We\'ve had many join as well as leave. Some were joyous celebrations while others were more tragic.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='To tell the truth, I was hoping this would be my last time together with this party. I\'m not so keen to fight these battles anymore. It\'s becoming harder for me to keep up.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I have discussed this with the guild leader and he as well wishes to retire.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hmm, I guess I shouldn\'t be too surprised, he has someone waiting for him back home...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You know what guild leader? For all your efforts I\'ll give you my blessing. Go, live a slow life with my sister, I\'ll approve your marriage.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Me and the kid will continue this party without you two.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Huh? You will?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Don\'t sound so surprised. I need to let of some steam so I\'ll stay with you a while longer.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Unless I\'m not good enough? You want the guild leader? Well then, good luck with that. See ya.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='No no, I\'ll be happy to party with you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='This may be the end of this party, but this is also the beginning of a new chapter in our lives. Just as we have fought hard in this quest, we must continue to aim for success no matter what we do.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Right!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hear that guild leader? If you want a marriage, you\'d better make it grand. A big wedding, a nice ring and...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Make her happy, don\'t ever betray her. Promise?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Well, I believe that concludes our quest. Let\'s head home.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 16
                { --prebattle
                    backgrounds={
                        'Tavern',
                    },
                    speakers={
                        {
                            name='Mina',
                            bust='Bust_FH_045_01',
                            face='Face_FH_045_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And thus the party returned home expecting a joyous celebration for their victory.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='But alas, they were unaware their quest was not over yet. With the crystal\'s no longer suppling power for the demon lord, he decided to wreak havoc in person, laying to waste to many villages in anger.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And so, the final task for the party. To defeat the demon lord...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Tavern',
                    },
                    speakers={
                        {
                            name='Mina',
                            bust='Bust_FH_045_01',
                            face='Face_FH_045_01'
                        }, {
                            name='Man',
                            bust=nil,
                            face=nil
                        }, {
                            name='Woman',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And with that final strike, the demon lord met his demise. The party, having conquered the final calamity, were now renown as the hero party, that which ended the reign of the demon lord.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Wow! What a story.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Superb as always Mina.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='No problem at all. It\'s stories like these that make me want to continue travelling and see new experiences for me to share.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I have a question. If those heroes were as renown as you say they were, how come we\'ve never heard of them? Even the guild leader, we only know of him from what he is doing now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ah, a good question. You see, this story is only one chapter of the guild leader\'s history. I have yet to tell what happens next.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='A story of tragedy. A traitor, one who wished for power, uncovered Infinity and was left in bewilderment.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='The result of that individual\'s actions led the world to despise the hero party, thus erasing their great feat from history.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Terror, destruction looms the world. A fate far worse than that of the era of the demon lord. The only hope to stop impending doom would be this battle which we are now fighting for...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='However that story is for another day. I can\'t recite the whole story in a single book. It makes for better storytelling if such tales were broken into chapters. Wouldn\'t you agree?'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --6 Return
            { --Floor 1
                { --prebattle
                },
                { --postbatle
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbatle
                }
            }, 
            { --Floor 3
                { --prebattle
                },
                { --postbatle
                }
            }, 
            { --Floor 4
                { --prebattle
                },
                { --postbatle
                }
            }, 
            { --Floor 5
                { --prebattle
                },
                { --postbatle
                }
            }, 
            { --Floor 6
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Purgatory',
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ah you actually came.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Welcome to my home!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Purgatory',
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'m so glad you came, my message actually worked.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I did have to use Infinity\'s name, but at least it got you to come.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I know who you are guild leader. You are one of the heroes that put to rest the era of the demon lord, my ancestor.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Hm? Revenge? You think I called you here for that? Ha! How humourous.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='I\'d rather admit I\'m enamoured by you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You, who betrayed those that you held dear. Regretting your actions, you searched for a way to take back what was done.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Which led to the discovery of limitless power, Infinity. The power that brought about existance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Though unaware that your discovery led to the awakening of an entity who would claim Infinity for themselves, thus placing the world at mercy of that individual.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And so, the only way to face it, you trained. Trained for centuries until you were ready.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='But no matter how good you are, one man cannot hope to face such a being alone, you require members to be a party.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Which marked the beginning of your never-ending quest to gather members, all in hopes to battle against that which you have unleashed upon the world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Such a story, such strength, such passion...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='Ah! I can\'t hold it any more, I\'m too hungry. Quick, let\'s begin...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='A grand banquet, with you as the main course!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Purgatory',
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }, {
                            name='Satiel',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ah! How delightful! You make for a fine meal guild leader!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ve had my fill now. I see I can\'t match you in strength.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='That just means my stomach still has more room to fatten. Perhaps another day I\'ll be able to feed on you completely.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well, as promised, I\'ll tell you everything about Infinty.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? You\'re questioning why I would reveal such secrets? You don\'t trust me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I have no interest in your petty squabble with Infinity, nor my ancestors desire to rule the world. I live only to fill my hunger.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'re lucky you\'re stronger than me. Otherwise, with that comment you made just now, I would end you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I\'ll only speak of this once so you better listen carefully.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Dear me, that won\'t do Lilith.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Hm? Oh it\'s just you. Infinity\'s little errand boy.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=3,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Lilith, are you sure you\'re aware of the consequences? You failed to complete master\'s request. I\'m afraid this will be your last meal.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 8
                { --prebattle
                    backgrounds={
                        'Purgatory',
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }, {
                            name='Satiel',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You demons live in servitude to Infinity. For the task of protecting it, you have been granted a piece of its power.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And with such power, it\'s no surprise many of you attempt to conquer the world. Especially when Infinity is dormant, there\'s no fear of anyone stopping you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But now, with master\'s awakening, we must obey his will as we have sworn to. Failure is not an option. I\'m afraid with your defeat against our enemy, you must pay the price.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Hm? Did Infinity tell you to come or are you working overtime like a good little lamb.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='All I do is for the sake of Infinity, he has no need to involve himself with failure.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You must return the power that has been granted to you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='What? Return Infinity\'s power? Ha ha. I haven\'t heard of a joke so sweet. But if you\'re serious, then your master hasn\'t told you anything. Hiding a meal like that, how humorous. Ha ha.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You laugh at your a situation? Then I guess you\'re ready to face the consequences.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='What?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ha ha ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='That can\'t be! You don\'t have Infinity\'s power?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Of course not, things taste better if I use my own utensils.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But I felt master\'s power during your battle...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Unless...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='It\'s you! You\'re the one with Infinity\'s power!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Like I said, your master hasn\'t invited you to the main course. Perhaps he doesn\'t want you ruining his meal.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='That means the situation is dire than I thought. I must stop you. This time there will be no pawns, I\'ll do it myself.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='That power doesn\'t belong to you guild leader! Return it! Return it at once!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Purgatory',
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }, {
                            name='Satiel',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh! It\'s no wonder why all my attempts to stop him ended in failure. If he has Infinity\'s power...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ha ha. This makes for a fine dessert even if I\'m already full. What will you do now?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I must return to master. Urge him to quickly proceed with the next stage of the plan.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You\'ll know to regret this guild leader, once the world disappears from existence...'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well I guess that\'s that. There\'s still a lot more you need to do if you want to stop him, though I expect you know that already.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hm? You\'re asking why I\'m not helping Infinty?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Like I said before I have no interest in their plans, I only wish to eat to my hearts content. There is nothing that will convince me otherwise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Although he did speak of how delicious you were, perhaps hoping I\'d be able to stop you but you\'re too big a meal for me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I heard you were planning some war, but Infinity never spoke to me about that. It could be he doesn\'t see you a threat, and the one most concerned was our little fanatic here. Even tricking commoners to try stop you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Little did our lamb know, you already attained a portion of limitless power. There\'s no way peasants could match against you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hopefully that clears up any doubt you have on me. Now then, your reward for filling my stomach...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ll tell you how to stop Infinity.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --7 Allies
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Village',
                        'Castle'
                    },
                    speakers={
                        {
                            name='Anastasia II',
                            bust='Bust_FH_065_01',
                            face='Face_FH_065_01'
                        }, {
                            name='Child',
                            bust=nil,
                            face=nil
                        }, {
                            name='Knight',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You found my teddy! Thank you so much Queen Ana!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='It\'s no problem at all. It\'s my duty to care for all my subjects, no matter how little they are.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Guild leader! What a surprise! What brings you to the kindgom?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'re asking for a favour? It must be serious. Come, let\'s head back to the palace.'
                            }
                        },{
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So? What is it that you need my help with?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Are you serious? You want me to ask my soldiers to join your battle? To risk their lives in a fight they have no chance in?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Well you are right, I did say I would do all I can to help you in this battle, but remember I must serve my kingdom as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I have joined your guild so that we can prevent the dangers that Infinity has planned, so that my subjects can live in the peace they deserve.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I alone shall take this burden. Sending my men to a battle they cannot fight is not how I wish for them to spend their last moments.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='What about the guild? You\'ve gathered quite a number of us now, everyone capable in their own right. Aren\'t we sufficient enough?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='As we are now, we\'re not enought? I don\'t know if you\'re being extra cautious or Infinity really is that great...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='But I\'m sorry, I can\'t ask my men to join us. This battle would be too much for them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='If you say what we have now is not enough, I wonder what else we can even do...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Queen Ana, there are monsters approaching.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Again? They\'ve been attacking a lot recently. Perhaps we\'re getting closer to that battle...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We\'ll have to hold of our discussion. Though I was unable to help you when you asked, I hope you will still help us?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Thank you. I\'ll call for the soldiers. Make your way first and take care of as much as you can until we arrive.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland',
                    },
                    speakers={
                        {
                            name='Anastasia II',
                            bust='Bust_FH_065_01',
                            face='Face_FH_065_01'
                        }, {
                            name='Clara',
                            bust='Bust_FH_064_01',
                            face='Face_FH_064_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=5,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='You managed to take out most of them before we even got here, impressive as always.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='But if you\'re this capable and you\'re still worried about the upcoming battle, what else we can do...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Hm? What\'s happening here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah! Queen...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I go by Clara now, remember?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Oh right, Clara. Well, what brings you here? Have you finally come back to the kingdom?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='No, I was just walking by and heard some noise. I came to see what it was.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Though the guild leader\'s here as well, I take it he took part in this as usual. What brings him here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Hmm, I see. So you came to ask her that? And how did you respond Anastasia?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I wish I could help but I don\'t think we should let the soldiers join our battle. It would be too much for them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yes, I agree as well. Having more numbers wouldn\'t be helpful in that situation.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='But then what else can we do?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well, I do have one suggestion. Though I\'m surprised the guild leader hasn\'t thought of yet.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Huh? What is it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Why spoil a surprise? Why don\'t we see it first?'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Wasteland',
                    },
                    speakers={
                        {
                            name='Anastasia II',
                            bust='Bust_FH_065_01',
                            face='Face_FH_065_01'
                        }, {
                            name='Clara',
                            bust='Bust_FH_064_01',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Anastasia, are you sure you can join us? Don\'t you have a kingdom to tend to?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Well yes, but I am also part of the guild. It would be helpful to know of the matters upcoming, so that I can prepare myself and the kingdom.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='A fair answer, do you have any concerns guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='You\'re happy for me to join? Thank you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Alright, let\'s head off.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 4
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 5
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                    backgrounds={
                        'Cave',
                    },
                    speakers={
                        {
                            name='Anastasia II',
                            bust='Bust_FH_065_01',
                            face='Face_FH_065_01'
                        }, {
                            name='Clara',
                            bust='Bust_FH_064_01',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'re almost there, just need to head into the deepest part of this cave.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='A cave? I thought the guild leader was afraid of enclosed spaces, why are we going inside?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh but this is a cave he should be very familiar with, isn\'t that right guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Really? Why is that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Let\'s leave it for when we get there.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 7
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 8
                { --prebattle
                    backgrounds={
                        'Cave',
                    },
                    speakers={
                        {
                            name='Anastasia II',
                            bust='Bust_FH_065_01',
                            face='Face_FH_065_01'
                        }, {
                            name='Clara',
                            bust='Bust_FH_064_01',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='This looks like an ordinary cave, what\'s so special about it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You\'ll know soon enough.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Though guild leader, are you sure you\'re ok being here? No offence but your performance is rather lacking.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Just goes to show not everyone can be perfect. Both you and I have our own faults, am I wrong?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='No you\'re right. I just hope the guild leader will be at full strength when we need him, otherwise...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='As do I. We\'ll need all we have to face Infinity.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 9
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Cave',
                    },
                    speakers={
                        {
                            name='Anastasia II',
                            bust='Bust_FH_065_01',
                            face='Face_FH_065_01'
                        }, {
                            name='Clara',
                            bust='Bust_FH_064_01',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='What? Why was there a monster of that strength here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Why? Because of that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Huh? That\'s...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='What\'s a giant crater doing here?'
                            }
                        },{
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Because this is where the guild leader uncovered Infinity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='To save the one you loved, you travelled. Far and wide, climbing mountains, exploring valleys, even tunneling caves which you so dreaded.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Eventually you found yourself here, where Infinity slept. Even now you can still feel its power lingering, hence why that monster grew to be that powerful. '
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You took only a portion of Infinity, yet its power was overwhelming. You couldn\'t contain it and it spilled. With that much power, no single person could control it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Fortunately you weren\'t alone. There were others beside  you, those that promised to aid you in your quest. To relieve your burden, they took a piece of that power as well. '
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Then that means...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yes, I hope the guild leader has realised the same.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='There are others that care capable of fighting such dangers alongside you, those that have the same strength as you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='They are the ones who are capable of joining you in this battle. With them by your side, we may stand a chance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Go! Find those who have the strength to join your cause. Find those that once pledged themselves to aid you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Those that once stood by your side, those that you call...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Allies.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --8 Amends
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Jungle'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=5,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='You\'re looking for someone? You can count on me to help! We\'ll find him in no time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Let\'s go!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 4
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland',
                        'Village'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Nikolette',
                            bust='Bust_FH_062_01',
                            face='Face_FH_062_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Well, we haven\'t found anything yet...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='But don\'t worry, I\'m sure we\'ll find him. There\'s a town nearby, why don\'t we head there and see if anyone has seen him.'
                            }
                        },{
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Oh, look who\'s here as well!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Aria and the guild leader, I\'ve found quite the pair. What brings you two together?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='We\'re trying to find one of the guild leader\'s former companions, but we haven\'t found him yet...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Say, you\'re good at finding stuff right? Care to join?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='A treasure hunt huh? I admit, I am getting rusty, haven\'t been on a hunt ever since I found the sword. I do need to get back to it eventually.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='But looking for a person doesn\'t really interest me, I\'m afraid I\'ll have to decline.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh, that\'s a shame. I heard you were good at finding things.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Good? You must have heard wrong, I\'m not good, I\'m the best!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Alright, I won\'t join you but I\'ll tell you all you need to know to become a great treasure hunter!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='First you gotta start with some clues. There\'s no point searching for treasure if there\'s nothing to find.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Search for clues. Got it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='The more you have the easier it is to find what your looking for. Gather as much as you can until you know where to go.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Oh, but remember clues can take you anywhere and they may not even be true. You gotta be prepared, it\'s not just searching for clues, travelling takes time as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='No problem, I can wander wherever the winds take me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Now, when you arrive at your destination, check your surroundings. Make sure the rumours led you to the right place.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Search the terrain, unearth rocks, reach into hidden cracks, any evidence that says the treasure\'s nearby.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ok, search for evidence.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Then you just gotta keep going until you find what your looking for. May take days, even weeks. You might even find traps instead of treasure. All treasure hunters are prepared for anything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Be prepared for anything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Finally, revel in the glory of finding the treasure before your rivals, that is what us treasure hunters live for.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='For glory... Well for the guild leader, this is to make amends.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='To make amends... Right, this is much more than a game for you. I don\'t think I should join this one.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='I really do need to hone my skills sometime soon. I should start my search early otherwise it\'ll end up too late...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well anyway, I hope you know now what it is to be a treasure hunter. If you follow my steps, I\'m sure you\'ll find him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Yes, I learnt a lot. This might even help with my search, haha. Thanks a lot Nikolette.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Well then, I\'ll catch you guys later.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Alright, first step, we need to find clues. I\'ll go around and ask people if they heard of things that seem impossible, I\'m sure that would describe someone as strong as him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You can have a break, we\'ll meet back here once you\'re ready.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                    backgrounds={
                        'Village'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Good news! I\'ve pieced together a whole bunch of stories from what the townsfolk heard. We even have different rumours we can investigate, surely one of them has got to be him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='First, people have told me there\'s someone with the strength of a dragon trying to capture an escaped convict. That could be him, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh you say that\'s Sun-Ni. Ah, that could be right.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Next we have a hero that wields dark magic fighting to restore order in a land inhabited by machines. A hero, that\'s got to be him!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh yes, you\'re right. Justine also fits that description. She is a \'hero\' after all.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='How about this? Someone with so much magical power, they accidently blew up a village, and is doing all they can to assist with repairs.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Huh? That was Nova? Oh dear, another one of her mishaps. I hope she\'s ok.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='All these rumours seem to be about our guild members. Even the next one, a giant fox and giant butterfly, that could be Narita and Saki just having another fight.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='We have a strong group of people in our guild, don\'t we?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well, that\'s all the rumours I\'ve heard here, but thinking about our guild members has given me an idea.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Let\'s go find Athena! She\'ll definitely know of any rumours that sound impossible to believe.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 7
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 8
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Galvanic'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Athena',
                            bust='Bust_FH_041_01',
                            face='Face_FH_041_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='There she is! Athena~!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Say, it\'s Aria and the guild leader. What\'s up? You two want to head into a cave with me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ha ha, relax I\'m only joking.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Though we really need to do something about that fear of yours.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Give him a break, he can do just about everything else you know.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Yeah, if only he had the same courage as me, he\'d be unstoppable.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well anyway, we\'re looking for someone, someone very powerful. We were wondering if you heard of any rumours that might lead to someone like that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Someone powerful. Hmmm let me see...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Ignoring all the rumours about the guild members, there is one that might fit the bill.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='They say that a mountain, the one near the military, is moving. It\'s been taking more steps for sightseers to get there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Really? A moving mountain?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='That\'s what I hear. If someone is actually moving it, they must be very powerful.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='I\'ve been meaning to take a look myself, but for some reason my ghost keeps draging me elsewhere, seems it wants me to take care of something else first.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You two can investigate for me, hopefully it actually is a person, even better if it\'s the one you\'re looking for.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes, this sounds like a proper clue. We\'ll head there then, thanks a lot.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Don\'t mention it. And if you\'d like, you\'re free to join me in investigating all the other places I have in mind. I\'m sure there\'s a cave just waiting for you, haha.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Let\'s stick with this one for now, not everyone is as courageous as you Athena.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 9
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 10
                { --prebattle
                    backgrounds={
                        'Grassland',
                        'Fort'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Charolette',
                            bust='Bust_FH_012_01',
                            face='Face_FH_012_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=5,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Since we\'re heading to the mountain, why don\'t we pay a visit to the military, I\'m sure there\'s someone who\'d be pleased to see you. '
                            }
                        },{
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Guild leader! Welcome back!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=1,
                                    frame=1,
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Oh, and Aria\'s with you as well...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Hey Charolette! We were just passing by. What\'s the latest?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We were just about to make our rounds. Would you care to join? It would make it a lot easier.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well guild leader? What do you say?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Gosh, you\'re so nice, always willing to help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Yes, he is...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well, let\'s head out. This will be quick with you two helping.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Charolette',
                            bust='Bust_FH_012_01',
                            face='Face_FH_012_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=6
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Woah, there were quite a lot of them. Are you doing this everyday?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Unfortunately so. They\'re numbers are growing and are becoming more vicious as of late.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='What was that guild leader? You say it\'s because Infinity is about to make its move? That would make sense.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I guess we should head back and continue what we were doing. Sorry to cut your meeting short.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='It\'s alright, I probably shouldn\'t have asked for your help, you have more important things to do. Go, we can handle the rest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='But remember, you\'re always welcome here. If you want to rest or talk, I\'m here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Ehmm, the military has promised you our aid, we\'ll help you when you need us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Hehe~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='What\'s funny?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh its nothing, let\'s go guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='*psst* Charolette, I\'m rooting for you.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 11
                { --prebattle
                    backgrounds={
                        'Cliff'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Alright, we\'re at the mountain. Next thing Nikolette said is to find evidence...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh? Look at the ground here. It\'s very soft, as if it\'s been moved recently.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='And over there, there\'s some unnatural markings on the walls. This seems like it\'s from a sword...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Looks like it goes straight up. I guess we know where to head next.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='And remember, be prepared for anything!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 12
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 13
                { --prebattle
                    backgrounds={
                        'Cliff'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='It\'s a monster! Is this what moved the mountain? It must be strong, get ready!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Cliff'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Monsters',
                            bust=nil,
                            face=nil
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Is that all? It was strong, but I don\'t think it\'s strong enough to move mountains. Let\'s keep cautious...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='GRRRR!!!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='What! There\'s more of them? We\'re surrounded! What should we do?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Huh? There\'s someone else here? Watch out, I\'ve already started my attack!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='What?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Woah! The ground, it\'s shaking! Are we moving?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='The monsters, they\'re gone now. Is this the one the rumours spoke of?'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Oh, it\'s you. Long time no see.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 14
                { --prebattle
                    backgrounds={
                        'Cliff'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='We did it! We found him, your former ally from the hero party.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hero party, that takes me back. How long has it been? Three, maybe four centuries? This power, cursed with infinite life, time have no meaning. We are only waiting for that day...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I heard you\'re a guild leader now, trying to recruit people to fight against Infinity...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I don\'t blame you for what you did you know. You just did what you thought was best. Though with what happened, it\'s obvious everyone would hate what you did.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But you had the courage to follow it through. Not many could have made a choice. It\'s not fair they put the blame on you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='If they were in your shoes, I\'m sure they would feel hard-pressed on a choice as well. I know I would...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='What was that? You don\'t regret what you\'ve done but now you\'re trying to make amends? I know, that\'s how you are.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Huh? You want me to join your guild? Is that why you were searching for me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Oh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You know I already faced Infinity. I gathered a group, not unlike the guild you have now, and tried to stop them before they began their plans...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='We were decimated. A once flourishing land turned baren because we could do nothing against it\'s power.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I don\'t even know what happened to my group, if they\'re even alive. I excavated a tunnel in hopes everyone could escape. I don\'t know if they managed to make it...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Even with my powers of Infinity, we couldn\'t stop it. I don\'t know what chance we have against fighting it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Umm, sorry to interrupt, but I think it would be good if I introduced myself.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'m Aria, a member of the guild.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I\'ve actually lost my memories. When I awoke, all I had with me was this sword. No other clues to go by.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So I wandered. Fought against monsters, entered towns and villages, spoke to people to see if they had any rumours I could follow up on regarding my past.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Gosh, I think I\'m starting to get the hang of the whole treasure hunting thing, haha.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Eventually I found my way into the guild. I thought maybe if I joined, we might travel around and find some hints into my past.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='But then I learned the truth about the guild, and the troubles of the guild leader. He truely wants to fix the mess he made, that\'s why he formed the guild.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But what if the thing we\'re trying to do is impossible. I\'ve already tried and failed.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Then you can use what you learnt going forward. If you\'ve already tried, then you know what went wrong. Learn from that mistake and next time you can do it better.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='It\'s much harder if you\'ve lost your memories and you don\'t know what you\'ve done before...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='But we can always start anew. Even if I don\'t know what happened in my past, the new paths I\'ve wandered, that\'s what\'s in my heart now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Even the guild leader hasn\'t given up. When he was first labelled a traitor, he didn\'t sink into regret. He\'s trying to fix his mistakes, knowing what would happen if he didn\'t.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='After his first lost against Infinity, he formed a guild, knowing that he alone was unable to fix the mess he made.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='What? You\'ve already fought Infinity?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='So you already know how strong it is, but that didn\'t stop you. You started a guild...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='So how about now? Do you think you\'re strong enough? To fight and win?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='No? I thought so...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='But that\'s why we need your help. With you on our side, we\'re closer than where we were before.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But what good are we if we\'re still too weak...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='What? You\'re asking me what I was doing here? To fight monsters.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='And? Why were you fighting monsters?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Because I am weak, I was useless in that battle. At least now I can fight off the monsters that are attacking those unarmed.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You\'re not weak, you\'re strong enough to move mountains. Not everyone can do that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But I know my current strength is still not enough...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Huh? What\'s this? A sword? Wait, this is... Why do you have it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I did tell you what it\'s for, right? Why am I destined to wield it if I just run away like this...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You say knowing when to run away is the right choice? So that you can live to fight another day? There\'s no point in losing your life...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I guess you would know better than me. You\'ve travelled far more than I have, battled more, and lost more...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Alright, I\'ll join you, but on one condition.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Only if you and your guild beat me. I\'ve been fighting monsters non-stop ever since my lost and I\'m sure I\'m still not strong enough to face Infinity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='If you can\'t beat me now, I\'ll give you another three centuries to strengthen your guild and face me again, but by then we both know it\'d be too late.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Show me you have the strength and resolve to fight the battle that will determine the fate of us all!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Alright, let\'s do this guild leader!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Cliff'
                    },
                    speakers={
                        {
                            name='Aria',
                            bust='Bust_FH_051_01',
                            face='Face_FH_051_01'
                        }, {
                            name='Ralph',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh. I guess I should have expected this. You\'re a very good leader, makes sense your guild members are just as good.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You win.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Yay, we did it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You and your guild, perhaps we do have a chance...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Watching your guild has made me wonder about my former group as well, the one I formed to face Infinity. They were just as strong as your guild. No doubt they would be of great assistance if they were to join.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I think it would be best if I search for them. We\'ll need all the help we can get.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And don\'t worry, I\'ll be back before the final battle. I won\'t run, I promise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hm? What\'s this? You\'re giving me the sword? Heh, I thought I told you I\'m not good enough yet...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Very well, with the sword of Excalibur in my hand, I promise to fulfil my destiny as your sword, just as the first knight did, she who was bestowed this gift to serve the gods.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Alright then. I\'m heading off. I\'ll meet you at the final battle.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I\'d say that went very well!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So, where to next guild leader?'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --9 Virtue
            { --Floor 1
                { --prebattle
                },
                { --postbattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Have no fear! The hero Justine is here!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah guild leader, you\'re here as well. Then this will be quick. Let\'s stop the villain.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Huh? What do you mean we\'re too late?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Look around? Oh I see. This village. It\'s already in ruins.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 2
                { --prebattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=6,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Another village in ruins. What use am I as a hero if I can\'t stop these disasters.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I won\'t let another tragedy happen again...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Hurry, we have to go after him before he does anything more. Tell me where he went. I\'ll put an end him!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Calm down? What do you mean calm down? How can I relax knowing he could be out there doing more harm.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I know he was your friend or ally or whatever, but that doesn\'t mean we should leave him be. He\'s already destroyed a village.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='You have a plan? I don\'t care about a plan, so long as we stop him. I\'m going ahead, with or without you.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            },
            { --Floor 3
                { --prebattle
                },
                { --postbattle
                    backgrounds={
                        'Wasteland'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        },
                        {
                            name='Trence',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Good we made it. He\'s right over there.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh... Help... Me...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Wasteland'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        },
                        {
                            name='Trence',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, 
                                {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='You won\'t be causing any more destruction villain. We\'ll stop you!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ah... Guild leader... Please... Help...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                    backgrounds={
                        'Wasteland'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        },
                        {
                            name='Trence',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=1
                                },
                                {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ha. That\'s what happens when you turn to evil. Now then...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Prepare to meet your end.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What! Guild leader, why are you stopping me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ahh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='MUST ESCAPE'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? He disappeared...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Guild leader! Why did you stop me? You let him get away!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'re saying what happened is he\'s lost control because of Infinity. If we take away some of Infinity\'s influence we can save him? Is that possible?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='You don\'t know? You want to gamble on something like that? He\'s dangerous roaming around like that. If you can\'t save him, then we\'re risking lives for no reason. It would have been safer to end him right there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='He\'ll be a great benefit to the upcoming war if we can save him?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='... I don\'t want anymore lives to be lost. Especially if they were on my hands. If he causes any more harm and it was me who could have stopped him, then I...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='If it becomes like that day... My mistakes, my regret... They still haunt me, and they will forever...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='No, I\'m not like you. I can\'t show virtue to those I crimed, ask for their forgivness and try to fix what\'s wrong. It\'s too late, they\'re already dead.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I\'ve accepted that. I\'m moving on. From that day onwards, I\'ve devoted myself to my cause. No one will ever lose they lives under my watch.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='A hero is a person you can rely on, that you can trust to fulfil their promise. And I\'m devoting myself to that title.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='With a task this grant, I\'ll do whatever it takes, no matter the consequences!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I\'m going to make sure your friend won\'t ever cause any more casualties. Don\'t try to stop me!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 5
                { --prebattle
                },
                { --postbattle
                }
            },
            { --Floor 6
                { --prebattle
                },
                { --postbattle
                    backgrounds={
                        'Galvanic'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        },
                        {
                            name='Trence',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                },
                                {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I hope you\'re ready. This time you won\'t be so lucky.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Galvanic'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        },
                        {
                            name='Trence',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, 
                                {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='You thought you could get away from me? I would never let evil escape my eye.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I hope you\'re prepared. The guild leader\'s not going to save you this time, he\'s sticking to the right side of justice.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='To end all the disasters that behalf this world. And that includes you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh... Do... It...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Haaa!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                    backgrounds={
                        'Galvanic',
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Justine',
                            bust='Bust_FH_010_01',
                            face='Face_FH_010_01'
                        },
                        {
                            name='Trence',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                },
                                {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='This is the end!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh... I\'m... Sorry...'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Well guild leader? What are you waiting for? Hurry up!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What do I mean? I\'ve knocked him unconcious. Do whatever you think you can do to save him. I\'m giving you your chance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='But if he wakes up still possessed I\'m finishing it.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, 
                                {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So? How is he?'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={
                                {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Argh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I\'m alive. And I\'m in control... What did you do?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Oh I see. That must have been quite the burden. I\'m sorry for putting you in that state.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And you, young lady. I apologize. I know my actions must have caused you distress.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='You wouldn\'t know how much it pains me to watch destruction right in front of me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='The only reason you\'re still alive is because the guild leader said you\'d be useful in the upcoming war. That war will be even more disastrous that what you\'ve done.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I take it you\'re back in control now, given you\'re not trying to kill us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Yes, it was Infinity\'s sheer power that consumed me. I couldn\'t control it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='When we all first received Infinity\'s power I knew it was too much for me to handle, I\'m not as youthful as you guys were. I never dared to use it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='So instead of helping, all I could do was wander. Waiting until the fated day, when Infinity takes over the world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Some time ago, by chance, I stumbled upon your ring. To my surprise an elf claimed it as her own. I assume you gave it away after that incident.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Helpless as I was, all I could do was tell them about you, in hopes they could give you the help you need. Because I couldn\'t do anything but I knew you were still trying.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But just before, Ralph told me he was joining you. He believes you can do it, so long as you have enough support. He encouraged me to join you as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Blinded by such wishful thinking, I wanted to master Infinity so I could stand by you when the time arrives.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='But you couldn\'t control it, so you went on a rampage.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Yes, magic pouring out of me endlessly, destruction following me everywhere I went. It was like that magic has a mind of its own. I wanted to help, but it was you who ended up helping me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='That poor village...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='We\'ve all made mistakes. We can\'t change what\'s done, we have to move forward. The guild leader is fighting to stop the calamity he brought upon us. I vow to never make the same mistake again.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What will you do? For what reason did I spare your life? How do you plan to bring back your good faith? Your virtue?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Or would you rather be dead? I can still make that happen if you think your life would cause more harm than good.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I want to help, of course I do. But how can I help? Another incident like that then I\'m better of dead like you said. But without that power I\'m worthless, just another casualty you need to worry about. It\'s the same either way...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='What was that guild leader? Power alone does not make one\'s victory? What a quote, you say this is something I taught you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Heh, I guess I really have aged seeing as I don\'t recall something like that...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You are right. I should have accepted I can\'t join you in battle. If I want to help I\'ll just have to do it elsewhere.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='My knowledge and experiences, I\'ll gladly share them with you and your guild. I can even seek out more allies to aid us if needed.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I\'m such a fool, you\'ve already surpassed me long ago. There\'s no need to fight alongside you. I should have acknowledged my student is already the master.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Young lady, I promise I\'ll put this life you\'ve spared to good use. You don\'t have to worry about me anymore.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Good. I was skeptical but maybe you really were a real hero like the guild leader says.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Haha. Perhaps back when I was younger.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Guild leader, do you mind if I return to the guild with you. I know you won\'t need my assistance, but perhaps there are other fledgling ladies that could make do with my guidance.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You\'d be glad? Excellent. I\'ll support you in whatever way I can.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='To face the calamity that awaits...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }

            }
        }, 
        { --10 Beginning
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Jungle'
                    },
                    speakers={
                        {
                            name='Illia',
                            bust='Bust_FH_013_01',
                            face='Face_FH_013_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Thank you for meeting with me guild leader. I know there was more that you were supposed to do but we don\'t have that luxury anymore.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Infinity is beginning it\'s plans. We must strike now lest we leave our lives in its hands.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We\'ll head back to fairyland. There we can discuss our plans. Father has already begun the preperations.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Tent'
                    },
                    speakers={
                        {
                            name='Illia',
                            bust='Bust_FH_013_01',
                            face='Face_FH_013_01'
                        }, {
                            name='Puck',
                            bust='Bust_FH_021_01',
                            face='Face_FH_021_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We\'re waiting for Puck, she has all the details of what to do from father.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=6,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I\'m here, sorry it look so long. It\'s just, your father gave me a whole bunch of other tasks to do including the stuff here as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='There\'s no need to be sorry. If father told you to do all that, its for good reason.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So, what\'s the latest of father\'s plans?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We were able to replicate it with only fairy dust. While it\'s not perfect, once we get Infinity he\'s certain we can do it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Excellent. We may have a chance after all.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='And that\'s why we need your help guild leader! You\'re a key part in our plan.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Let me explain. I don\'t know if you know this but us fairy\'s have a natural affinity with all the elements.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We can sense the slightest change from heat to cold, feel the life of nature, attuned to both physical and elemental.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='And of course Infinity, the essence that began everything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='We already knew there was something amiss when you awoke Infinity, and our ancestors did all they could to prevent the upcoming attrocity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Every generation, the fairy king or queen works behind the scenes to prevent any mishaps with Infinity. Just like demons serve to protect it, us fairys work to prevent any disasters that may result.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Your actions was one of them, spilling that essence into the moral realm. We tried our best to prevent anymore leakage but we failed. I\'m sure you know the consequence.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='It assimilated an individual. Now, with new found sentience, it can devise strategy to continue it\'s natural course. To return everything to where it came from.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='My father, the current fairy king, has devised a plan so that we can fight Infinity on a level playing field.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='He sent me off to do all sorts of things for this you know, some of them being almost impossible. I had to work even harder for those...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='He knows you\'re capable of doing all that and more. We can only ever leave things of that importance to those we trust. Otherwise we end up doing things half-heartedly...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='It\'s all right Illia, you don\'t have to blame yourself for that. It\'s all been resolved. We\'ve all learnt from it as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Now then, while I could explain everything that I did it might take days, I\'ll get straight to the point.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Just as Infinity created this universe, the fairy king has proved that it\'s possible to create another dimension.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We call this new dimension Void, a vast space filled only with nothingness. If we can lure Infinity there, and with nothing assimilate it will eventually starve.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='That\'s when we take it out. For good.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'ve proved that creating such a dimension is possible with just fairy dust, but fairy dust alone is not enough.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We need Infinity. That\'s why we need you, we need your power.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So? What do you say? Will you help us? With this plan we\'ll have a much better chance at winning.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'re wondering what will happen if Infinity is gone? Who can say, but I\'d much rather take that chance instead of getting assimilated by Infinity. What other choice do we have?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What\'s that? We still have what Lilith has told you? Do you trust her?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='She is a demon, a servant to Infinity. They live to ensure it\'s survival. Why should we believe what she said?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You trust her? Because she is a member of the guild? Then what about us? We have promised to aid you in your fight as well, do you doubt our plan?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes of course, it\'s always better to have a backup in case we fail. Very well, we\'ll begin with our plan and if we are unsuccessful, there\'s no other choice other than to follow through with Lilith\'s.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Alright, what\'s our next move Puck.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Now that the guild leader is onboard we need to make sure that everything we\'re doing is actually possible with Infinity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='We couldn\'t test it without Infinity of course, we need you to try it and make sure it actually works.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Right. Let\'s find a sutiable place to test this. We can\'t do it here in case of any accidents, we don\'t want to involve the other fairies.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='No problem, I know the perfect spot. That was one of the things your father told me to do as well. He has thought this plan through and through.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='If you\'re ready guild leader, let\'s head off!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 4
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 5
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Heaven'
                    },
                    speakers={
                        {
                            name='Illia',
                            bust='Bust_FH_013_01',
                            face='Face_FH_013_01'
                        }, {
                            name='Puck',
                            bust='Bust_FH_021_01',
                            face='Face_FH_021_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='We\'re here!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Right, the monsters are quiet here, we should be able to do this uninterrupted.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='This will be a big task for you guild leader, you\'ll need to be at full strength. Take a rest and once you\'re ready, we\'ll begin.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --11 Traitor
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Heaven',
                        'Void'
                    },
                    speakers={
                        {
                            name='Illia',
                            bust='Bust_FH_013_01',
                            face='Face_FH_013_01'
                        }, {
                            name='Puck',
                            bust='Bust_FH_021_01',
                            face='Face_FH_021_01'
                        }, {
                            name='Monsters',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You\'re ready now? Good. Then let\'s start. Puck we\'ll leave it to you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Right. Guild leader, all I need you to do add Infinity to this jar of magic dust. Then I can cast the right magic and it\'ll spin a new dimension.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Assuming Infinity keeps it stable, we should be able to enter and leave as we wish.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='That jar looks small. Are you sure its enough fairy dust.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Well, this is only a test right? We\'re not even sure if it\'ll work as we think it will. '
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Good point, we\'ll start small then. Guild leader, just add a small amount for now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Here you go, all yours~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yep, that should do it. And look, nothing out of the ordinary just yet. I\'ll continue with the formula.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Mmmm...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Alright, I\'m ready. Stay back you two.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Let\'s hope this works.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='There it is, we did it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Good work Puck.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='And it hasn\'t imploded yet. Infinity was indeed the key to make it work.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So, how does it work? Can we just go in?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='You can if you like, but please just wait, let me mark the location. If the entrance closes while you\'re inside you\'ll be stuck and I won\'t be able to find you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Alright, I got it. Now you can enter all you like.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='The guild leader and I will enter. We\'ll leave a bit of Infinity in there and leave. Wait while and, if father is correct, its power should have reduced.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Puck you stay out here. If we haven\'t come back after some time, you can enter and bring us back.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Got it. Guild leader, I\'ll need you to charge this jar as well, as a spare. Just in case.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Yes, its better to be safer than sorry...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Yep, that\'s good enough. Thank you guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Alright, we\'re heading off. Come find us if it\'s been longer than an hour or so.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                }, {
                                    bust=2,
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So this is the void. What a strange place. Odd isn\'t it? There\'s just nothing...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well I certainly wouldn\'t want to be trapped here. Let\'s do our thing and head back. Waiting on you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You\'re finished?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes, you\'re right. You can feel Infinity so easily when all there is is nothing. You can feel how powerful it is...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Well, let\'s hope the next time we come back it\'s become weaker. Then for sure we\'ll be able to fight Infinity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Alright, let\'s head back.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Wait, do you feel that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Yes, that\'s right. There\'s something else besides us here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='RAAAWR!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Void'
                    },
                    speakers={
                        {
                            name='Illia',
                            bust='Bust_FH_013_01',
                            face='Face_FH_013_01'
                        }, {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Monsters? Damn, where did they come from? Did they follow us here? What about Puck?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Ahahaha! Followed you? Oh forgive me, I thought you invited us here.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='It\'s good to see you again, guild leader...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Void'
                    },
                    speakers={
                        {
                            name='Illia',
                            bust='Bust_FH_013_01',
                            face='Face_FH_013_01'
                        }, {
                            name='Bennett',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=8,
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='How did you get here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='How? You do know I have that same power right? And you made it so easy for me, like leaving the door open for your friend to come in.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='So why are you here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='The guild leader should know. I told him the next time we meet...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I\'ll kill him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? Aren\'t you another one from the hero party?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hero party? What a joke. Hasn\'t he told you what he did?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='He has, he\'s told everyone of us in the guild.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And? You\'re still siding with him after that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='He\'s trying to make amends, fix what he\'s done wrong.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Some things can\'t be fixed you know. Once gone, forever gone. There were so many that relied on him, trusted him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And he broke that bond for his own selfishness. He is a traitor in their eyes. That can never be fixed.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Hahaha, it\'s just so funny really. He did all that to bring back the one he loved, only for her to give up her life again in guilt.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Pathetic.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Well? You\'re awfully quite guild leader, do you have anything to say?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You\'re asking me of my plans? I thought it\'d be obivious by now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='I am serving Infinity to stop you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You think that by doing all these good deeds it\'ll undo the disaster you\'ve created. I\'m here to show you that you can\'t save everything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Sometimes there are things you have to accept are lost. Before was one of those times, and this one is as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='You\'re really willing to let Infinity follow through it\'s plans? Don\'t you care what will happen?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='It can do whatever it wants. Destroy, create, assimilate, I care naught for what will happen to me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='As the hero party, we travelled far and wide, helping any that are in need of aid. Of course, with the guild leader being as he is, we would stop for anyone, even if it was out of our way.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='He probably won\'t admit it because all he cares for are the ones he helped. We have lost many during these mundane tasks, yet still he strives forward.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But when it\'s his turn to lose something he holds dear, he can\'t accept it? He has to scour the world to get it back? Sacrifice others just because he thinks he\'s in the right? How unfair is that!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And even now he refuses to admit he lost, saying he can fix this calamity he brought upon this world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Well guild leader? Isn\'t that why you\'re doing all this? Because you don\'t want to admit defeat?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Haha, you\'re still spouting that \'save everyone\' nonsense. I guess I just have to prove it to you then.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Don\'t think I\'m doing this because Infinity told me to, no this is personal.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='For once, I want to hear you say you lose.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And I\'ll do anything to make that happen!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }
        }
    },
    side={
        { --Summoning
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah guild leader, thank you so much for coming.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I know this is quite out of the way for you, but I\'m glad you\'re helping.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We\'re waiting for Lily as well. She should be coming soon, let\'s give her some time.'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='I\'m here, let\'s head off!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh? The guild leader\'s here as well? What a nice surprise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Yes, I\'ve asked him to come in case things don\'t go as planned.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='They said nothing bad would happen. I think you\'re more worried than they are.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='They need to take this more seriously. I mean think of what could happen...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But whatever happens, it\'s ok. The guild leader\'s with us~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Yes, because I asked him to come. They don\'t even think of the dangers.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Well if you\'re thinking of it as least one person is.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='They should learn to think for themselves...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='But you\'ll always be worried about them, no matter what they do. That\'s just how you are, big sis!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='In any case, we have no time to waste. Let\'s head off.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Alright! Let\'s go see a god~'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Shrine'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Azalea',
                            bust='Bust_FH_022_01',
                            face='Face_FH_022_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='We made it! And look there\'s sis. Hey sis!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Huh? Lily and Iris?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Watch out!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Shrine'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Azalea',
                            bust='Bust_FH_022_01',
                            face='Face_FH_022_01'
                        }, {
                            name='Miko',
                            bust='Bust_FH_023_01',
                            face='Face_FH_023_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=2,
                                    focus=true
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='I\'m so sorry, you two came at a bad time...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Oh, there\'s actually three of you. I assume this is the guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Well yes, but more importantly...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Miko! Care to explain what happened?'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=3,
                                    frame=6,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='A failure. As your sister said, you came at a bad moment, thus witnessing what transpired.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Azalea! This glyph must be a perfect circle, that\'s why the incantation when wrong.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='What? But it\'s impossible to draw a perfect circle by hand. And that wasn\'t the problem. I lost concentration because I saw my sisters.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='You should know not to get distracted during these summonings, lest you summon something far more dangerous. They must be perfect. You still need more practice.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Yes Miko.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Don\'t worry about Miko, she might be a bit strict but she means well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='So you\'re the guild leader? My sisters told me about you, heard you prevented a war between the North and South. Nice work.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                dialogue='You should have seen him, he was amazing~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='We couldn\'t have done it without him. So I thought he could also help you as well, with the summoning of the god.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Hm? Well we are summoning the god of strength, but it has never started any fights against us. We should be ok.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Besides it is our duty to resolve any conflict should they occur. There is no reason to bring in strangers or siblings to aid us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Ummm. I only tell them what we\'re doing. I don\'t ask them to help, just Iris always insists on coming...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=3,
                                dialogue='Ha ha. Big sis always forces herself into this.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I care for your safety. What if you summon something so dangerous that you are unable to stop?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Then that is our mistake. But know that I would never let such a situation occur, for that would go against all the training we commit ourselves to.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Ugh! You can\'t keep up that perfect act forever. There\'ll be one day where you slip up. What happens then?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I would never. We have trained to follow the rituals to perfection.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Grr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Ok everyone, let\'s calm down. Our next summoning will be a god. It\'d be more dangerous than those spirits I just summoned if something went wrong.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Let\'s take this time to rest.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Yes, of course. If your mind isn\'t focused then anything you attempt will likely fail. We will take that break until you are ready.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Shrine'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Azalea',
                            bust='Bust_FH_022_01',
                            face='Face_FH_022_01'
                        }, {
                            name='Miko',
                            bust='Bust_FH_023_01',
                            face='Face_FH_023_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Kratos',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Has everyone cooled down? I guess we should explain to the guild leader what we\'re doing, just in case he needs to step in.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Miko, do you wanna start?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='We are shrine madiens, those that maintain the shrine, or in other words, the gateway to other worlds. Very frequently we\'ll see spirits, and ocassionally gods, come through.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Thus we must be sure to maintain good relations with them, lest they wreck havoc upon our world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='A summoning, which I performed just before, allows us to call for spirits or gods so we can communicate with them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='There are generally two outcomes to a summoning. If we can come to some sort of agreement, then we\'ll form a pact, allow them entry to our world with some condition.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='However, if there are disagreements, then we proceed with a sealing, deny them access to this gateway until someone calls for some renegotiation.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='It\'s those disagreements that worry me. More often than not it becomes a battle to forcefully seal them away.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Of course we have trained for that as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=6,
                                dialogue='But this is the god of strength, that who boasts its power. Aren\'t you a bit scared?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Hm? That\'s true, but we\'ve never had any trouble dealing with it before. It should be fine.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Well it\'s better safe than sorry. Besides, if it\'s looking for strength, I think the guild leader\'s got it beat.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well I don\'t mind the extra company, how about you Miko?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='From what I have heard, the guild leader has a task far more important than watching us. I believe this would be a waste of time for him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='What did you say? You don\'t mind watching? If we summon a god we can\'t control, it may threaten the world like Infinity?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Have you no faith in us? This is our duty, we are always careful when doing our duties. Just watch.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Come Azalea, let\'s begin.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Umm, right.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Well she\'s letting you watch, so I guess it\'s ok.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Don\'t be afraid to jump in if you feel the situation is going poorly.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='With this prayer, I summon you...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Come, Kratos! God of strength!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Ah! Thank you for inviting me, it is an honour.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Tell us Kratos, god of strength. What is it you wish of this world?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='I seek strength. I felt a strong power in this world as of late...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Oh? I feel it already. Somewhere nearby...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='That man over there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='The guild leader...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='That man has no part in this ritual. Tell us what you want!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='It is pointless for me to visit a world that is powerless. That man will be a good test. Well? Those are my terms.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What does that mean?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='It wants to fight the guild leader...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=6,
                                dialogue='You\'re going to fight that? Are you sure you\'re up to it guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=3,
                                dialogue='Oh, you\'re right. Infinity is already a god, or perhaps something more. This will be a good test.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='He is eager as well. What of it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Fine. Do what you wish.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Thank you maiden.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='But before we can have a match, I\'ll need to test your strength. Try your hands at these first. Only then will you do battle against me.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 5
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Shrine'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Azalea',
                            bust='Bust_FH_022_01',
                            face='Face_FH_022_01'
                        }, {
                            name='Miko',
                            bust='Bust_FH_023_01',
                            face='Face_FH_023_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Kratos',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=2,
                                }, {
                                    bust=3,
                                    frame=1
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Well done. You managed to defeat them all.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='But now it is time for the true test...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Shrine'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Azalea',
                            bust='Bust_FH_022_01',
                            face='Face_FH_022_01'
                        }, {
                            name='Miko',
                            bust='Bust_FH_023_01',
                            face='Face_FH_023_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Kratos',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=2,
                                }, {
                                    bust=3,
                                    frame=1
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='It looks like those took no effort out of you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Very well, time for the real challenge. Come, face me!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Shrine'
                    },
                    speakers={
                        {
                            name='Iris',
                            bust='Bust_FH_015_01',
                            face='Face_FH_015_01'
                        }, {
                            name='Azalea',
                            bust='Bust_FH_022_01',
                            face='Face_FH_022_01'
                        }, {
                            name='Miko',
                            bust='Bust_FH_023_01',
                            face='Face_FH_023_01'
                        }, {
                            name='Lily',
                            bust='Bust_FH_005_01',
                            face='Face_FH_005_01'
                        }, {
                            name='Kratos',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=2,
                                }, {
                                    bust=3,
                                    frame=1
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Excellent! Your strength is indeed worthy.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='To speak the truth, this is not my full strength. That ritual the madiens perform bring us in a weakened state, most likely to avoid us terrorizing your world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='But I know you possess strength, and spirit. I acknowledge you, man with strength.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Hm? You say there is something you must defeat? One with greater strength than you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Ha ha ha. Your world is interesting.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Maiden, I would be glad to make a pact. I won\'t involve myself in that man\'s conflict, he must do it on his own. But for everything else, I shall lend you my strength.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='I acknowledge your vow, Kratos, god of strength. With that as your pact, I now give you free reign upon this world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Thank you maiden.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='Good luck with your task, man with strength. Perhaps another day we can bout again...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=2,
                                face=true,
                                dialogue='But with my full strength, ha ha ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Phew. Glad that\'s done. I always get nervous when meeting with gods.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Then you must continue training. Keeping a stable mind is a must during a summoning, even if you\'re meeting with gods or sisters.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Right!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='The summoning didn\'t go as I expected, but the outcome was still favourable. You have my thanks, guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Admit it, you\'re glad I brought him.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I said the outcome was also favourable. I expected this summoning to go well, regardless of his participation.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='You...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=3,
                                dialogue='Don\'t worry big sis, everyone\'s safe and nothing bad happened.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Well sis, now that you\'re done do you want to meet the other guild members? They all have their own exciting stories to share.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='That would be great! Is that ok Miko?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='You still have a few more duties to finish before the end of the day. I must ask you complete those first.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Ugh, give her a break. She can do them when she gets back.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='There is such thing as a schedule for a reason. We must abide to it, lest we become lax for even the simplest tasks.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='You\'re impossible to deal with, you know that!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='That is simply because I take pride in my work, unlike you...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='What! All you do is cry if something isn\'t perfect...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='How rude. If you aren\'t up to my standards I suggest you leave immediately.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I dare you say that again...'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }, {
                                    bust=3
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=2,
                                dialogue='There they go fighting again...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='I know they both mean well, they just see things differently.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='How about I finish my tasks quickly, then I\'ll meet you at the guild. That way I won\'t need to think about rushing back.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Ok. Does that work for you guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Great! I\'ll see you then.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                face=true,
                                dialogue='Hey guild leader! I\'m still watching you. You better not try anything funny with my sisters!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --Mission
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Village',
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Narita',
                            bust='Bust_FH_058_01',
                            face='Face_FH_058_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Saki',
                            bust='Bust_FH_056_01',
                            face='Face_FH_056_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh guild leader, what a surprise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Actually we\'ve just been assigned a new mission. We\'ll have to take care of that first...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='What? You want to help? Are you sure?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='That\'s great! If you\'re helping we\'ll finish this much quicker.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I\'ve already called for those two, they should be here soon.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Why\'d I gotta do a mission with her?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='I could say the same with you. Let\'s get this over with...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='You two took your time getting here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Sorry, she was complaining to me the whole way saying she didn\'t want to do a mission with me...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Oh, the guild leader\'s here.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Guild leader? Here? Ha! Take this! Sexy jutsu!'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=1,
                                    frame=7,
                                    focus=true
                                },
                            },
                        }, {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='Well? How was that? Have you finally fallen for my charms?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Stripping naked and covering yourself with clouds is hardly a jutsu. That will never work.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Here\'s an idea. Why don\'t you add a transformation justu, change into that girl he likes. That way he won\'t have to see your stupid face.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Yours is the only face that\'s stupid!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Come on, be serious you two. We have a mission to complete. Not to mention the guild leader taking time off to help us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Oh I\'ll get you one day guild leader~'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Right then, let me explain the mission details. This is an escort mission. We must ensure the safety of a builder entering the island of water.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='What? That\'s it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Boring...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Since the guild leader came at just the right moment he has agreed to help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='If the guild leader\'s here we don\'t need everyone for this mission. Let\'s kick out Narita.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Huh? Why don\'t we kick you out...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='That way I\'ll have the guild leader all to myself.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='The khage has asked all of us to do this. You don\'t want to disobey his orders, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Fine...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='When I become khage I\'ll give all my missions to Saki. That\'ll show her!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Show me what? That I\'m stronger than you? That you can\'t do your own missions?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='You want to see who\'s stronger now?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Fine with me! Let\'s do this!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }, {
                                    bust=3
                                }
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='We\'re getting distracted... Sorry guild leader but could you knock some sense into them.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=6
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh guild leader, I\'m so sorry for getting distracted. You\'ll forgive me won\'t you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='The guild leader\'s still as strong as ever. I wonder when I\'ll be able to catch up...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='If you\'ve both calmed down, let\'s get going. We still need to meet with the client.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Remember to stay cautious, don\'t expect the guild leader to do everything.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Of course, what good would I be if I can\'t do my own battles.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='Maybe if I defeat more enemies than Saki, the guild leader will fall for me.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Narita',
                            bust='Bust_FH_058_01',
                            face='Face_FH_058_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Saki',
                            bust='Bust_FH_056_01',
                            face='Face_FH_056_01'
                        }, {
                            name='Builder',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'re here. And that looks to be the client.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Hello, are you the ones that have accepted my request?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yes, that\'s us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Accepted? More like forced...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='This job should be simple. I just need you to protect... Err... Escort me to the Island of Water.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='That\'s it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Err... Yes, that\'s all...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Then let\'s hurry up, I have better things to do.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Ummm yes ma\'am.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Right. Narita, Saki you two take the front. I\'ll stay behind with the guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? Why can\'t I be with the guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Because she knows you\'ll only be a distraction to him...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Actually, you know what? Stay at the back with him, I\'ll be able to handle things better without you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Huh? If anything I\'ll be the one that finishes this before you. Let\'s go mister builder!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Ummm ok, but remember to be careful.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? Why?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='For escort missions, the only problem are monsters and they\'re easy to deal with.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Ummm right...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Guild leader, we should stay cautious, I feel there\'s something more to this mission.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='I can\'t rely on those two if they\'re fighting, but at least they\'ll serve as a good distraction. We\'ll use that to our advantage.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 3
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 4
                { --prebattle    
                }, 
                { --postbattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Narita',
                            bust='Bust_FH_058_01',
                            face='Face_FH_058_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Saki',
                            bust='Bust_FH_056_01',
                            face='Face_FH_056_01'
                        }, {
                            name='Builder',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=2
                                }, {
                                    bust=3,
                                    frame=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ha! Another one for me! How was that guild leader? Impressed?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='If you want to impress him, why don\'t you come back with a completely new personality. I\'m sure he\'d like that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='In fact everyone would.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Like your personality is any better. "Oh I\'m Saki, I\'m the best at everything. Watch me!"'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='I don\'t need to brag since it\'s true.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='No you... You just suck!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Couldn\'t come up with anything better? You\'re the one that sucks.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Alright, you asked for it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Heh, is that all you got?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Ahhh!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                },{
                                    bust=3
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Ummm, are you sure we\'re going to be ok?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Hm? You\'re talking about those two? Don\'t worry, they\'re stronger than they look. Worse case they\'ll use their ultimate ninjutsu. You need to be careful if that happens.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Errr ok. At least you seem reliable.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Yes, don\'t worry. We\'re nearing the island, we\'ll be there soon. Just need to take the ship now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='Thank you. I\'m glad nothing bad has happened, yet...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Guild leader, you feel it too, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Yes, that\'s right. There\'s a group following us. Seems like they\'re waiting for the right time to strike, but Narita and Saki are making too much of a commotion.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Fortunately that works in our favour. Let\'s continue watching.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 6
                { --prebattle
                },
                { --postbattle
                }
            }, 
            { --Floor 7
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Forest'
                    },
                    speakers={
                        {
                            name='Narita',
                            bust='Bust_FH_058_01',
                            face='Face_FH_058_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Saki',
                            bust='Bust_FH_056_01',
                            face='Face_FH_056_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=5
                                }, {
                                    bust=2,
                                    frame=2
                                }, {
                                    bust=3,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='That\'s impossible. No one could do that!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Ha ha! Well I did! It\'s the truth.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='It must be because of that beast power you have sealed inside you. We were all mistaken, it\'s actually a cow.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='You know it\'s a fox. Don\'t get it angry, it always takes it out on me...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Well a cow has four stomachs. How else would you explain being able to eat that much?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Ha! Just say it, I\'m better than you at eating food!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='What a pointless thing to be better at...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Hey, you heard that right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yeah, looks like they finally decided to show themselves.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 8
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Narita',
                            bust='Bust_FH_058_01',
                            face='Face_FH_058_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Saki',
                            bust='Bust_FH_056_01',
                            face='Face_FH_056_01'
                        }, {
                            name='Builder',
                            bust=nil,
                            face='Face_Other_001_01'
                        }, {
                            name='Assassin 1',
                            bust=nil,
                            face='Face_Other_001_01'
                        }, {
                            name='Assassin 2',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=6,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='We know you\'re here! Show yourselves!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=3,
                                face=true,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=3,
                                face=true,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=3,
                                face=true,
                                dialogue='Argh! You two argue so much it made my ears bleed!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='So? Why you were following us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=3,
                                face=true,
                                dialogue='Our target is the builder. We get paid quite the fortune if he\'s unable to do his job.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                face=true,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=3,
                                face=true,
                                dialogue='Our plan was to do it quickly and quietly... But you two made me lose my patience! So now, we\'re doing this the hard way.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You hear that? It\'s your fault they had to do it the hard way.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Why is it my fault? You\'re the one that started it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='No it wasn\'t...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=3,
                                face=true,
                                dialogue='Argh! I\'ve heard enough of your voices! Prepare to die!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='... and that\'s how it went. See, it\'s your fault.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='But your voice is more annoying. They lost their patience because of you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='They\'re still fighting...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=3,
                                face=true,
                                dialogue='Just shut up you two! You can talk all you want after I kill you!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Can\'t you see we\'re in the middle of something!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='You\'ve pissed me off as well! Take this...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Light release: Summon Susana!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Fox, don\'t mind me using your power!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=6,
                                frame=3,
                                face=true,
                                dialogue='What the? A butterfly and a fox? They\'re... They\'re monsters!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Grassland',
                        'Village'
                    },
                    speakers={
                        {
                            name='Narita',
                            bust='Bust_FH_058_01',
                            face='Face_FH_058_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Saki',
                            bust='Bust_FH_056_01',
                            face='Face_FH_056_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=2
                                }, {
                                    bust=3,
                                    frame=4
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Ha!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }, {
                                    bust=3
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Now they\'re just fighting each other. Things will get out of hand real quick now they\'ve released their ultimate ninjutsu...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Guild leader, sorry to trouble you again but do you mind dealing with this? You\'re the only person that can stop them right now.'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                },
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=6,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=2
                                }, {
                                    bust=3,
                                    frame=6
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Oh guild leader, I\'m so, so sorry. I\'ll make it up to you, please forgive me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Even with Susana, you managed to stop me. Just how much stronger do I need to be...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Quit complaining you two. If you haven\'t noticed we\'ve arrived at the Island of water.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Huh? Oh yeah. What happened to that man we were suppose to escort?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='He arrived safely thanks to the guild leader stopping you two before any harm was done. We\'ve sent him off already. Even received our reward.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='And what of the assassins?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='They\'re in custody here on the island. Seems there was some plot to stop the builder from building a bridge that would connect the island to the outer lands.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='That means mission complete. Good job everyone!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='You know I\'ll be reporting everything that happened to the khage, I doubt he\'d be pleased.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='He gave this mission to us specifically, I\'m sure he knew this was more than a simple escort mission.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='And we completed it! If I was khage I would give everyone a reward.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Except Saki.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Like I need a reward from you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well, we should also thank the guild leader. He was still focused on completing the mission.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Yes, thank you guild leader. Once again you have shown me there is still much more I need to do.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I\'m always thankful to you guild leader. I wish I could do something for you instead.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Thank you for lending your time once again. We know how busy you are so we always appreciate your help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Since the mission is complete we can take care of ourselves. You can go back to doing what it is you need to do.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh guild leader, if you\'re free do you want to have lunch with me? They have lots of good seafood here.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='I\'m sure he has better things to do than eat with a cow.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Huh? Do you wanna fight?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Sure! Name the time and place.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Please not again...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --Demon Lord
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Purgatory',
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }, {
                            name='Mage06',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Fighter01',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Hunter01',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh my! Guild leader, what brings you here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='What? You want to thank me for giving you information on Infinity.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='There\'s no need for that. I told you that was your reward for giving me a good feed.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hm? You make it an obligation to help those that are helping you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ha ha ha, what a humorous code of honour you have.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, would you look at the time. I\'m afraid I can\'t entertain you any longer, it\'s time for my lunch.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? You want to help? You do know what I do, correct? You still want to help?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ha ha ha ha ha. You really are something else.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Very well, you\'re free to help me conquer a few villages. A meal tastes better when shared with loved ones.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='But remember, we do not kill.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Only leave them in despair because that serves as the best seasoning in the meal of revenge. '
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='I\'m getting hungry just thinking about it. Quickly, let\'s go.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                },
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }, {
                                    bust=4,
                                    frame=8
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Ahhh! It\'s the demon lord!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                dialogue='She even has a companion, can we really do this?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='We won\'t know unless we try, and trying is the only way we can succeed. Let\'s do it!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='A light entree. I\'m sure they\'ll grow to become a delicious main course, but for now we let them marinate.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Onto the next dish!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 2
                { --prebattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Warrior02',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Damn you demon lord, attacking harmless villages. What did we ever do to you?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I may only be one man, but I carry the whole village on my shoulders...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='This is from all of us!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=6,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='What tough meat. They are a delicacy, not one to my preference.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='If I was looking for something tough, I\'d much prefer you guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hopefully the next dish has better taste.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Thief04',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Cleric01',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Fighter03',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Gunner01',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }, {
                                    bust=4,
                                    frame=8
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='The demon lord\'s here.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                dialogue='Finally! I was getting tired of waiting.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='That\'s her? She doesn\'t look that strong, this\'ll be easy.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='As long as we stay in formation, we\'ll win.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='They spoke big, but the portions didn\'t match. Such a shame. Guess we can\'t always rely on what\'s advertised.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Just means there\'s still more to come. Let\'s keep the feast going!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Mage05',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Mage09',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Errr, can you tell me again why we\'re here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You fool! You\'re the one that said we\'re the only ones capable of stopping her.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Her? Oh yes, her...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Oh hooo, she\'s a feast for sore eyes, wouldn\'t you say?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Gah, enough with your perversions!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Let\'s get this over with, my tea is getting cold.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, what a surprise. They weren\'t bad for something expired. Makes me reconsider eating past the due date.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='I can perhaps fit in one more meal. Let\'s hope we saved the best for last.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                    backgrounds={
                        'Ruins'
                    },
                    speakers={
                        {
                            name='Mage03',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Cleric03',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Lancer01',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }, {
                            name='Thief03',
                            bust='Bust_Other_001_01',
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=8
                                }, {
                                    bust=2,
                                    frame=8
                                }, {
                                    bust=3,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=4,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='You finally showed yourself demon lord.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I was mistaken, she\'s more powerful than I thought. Can we actually do this?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                dialogue='Heh, you\'re free to drop out if you\'re scared.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Keep calm and stay focused. That\'s our only chance of winning.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Ruins',
                        'Purgatory'
                    },
                    speakers={
                        {
                            name='Lilith',
                            bust='Bust_FH_016_01',
                            face='Face_FH_016_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah, what a fine meal.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Oh, don\'t worry guild leader, they\'re not as tasteful as you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ve had my fill, let\'s head home.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                },
                            },
                        },{
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                },
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Thank you for joining me guild leader, it made my meal much more enjoyable. I would be glad to eat together some other day.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What was that? You\'re asking me to help you in your fight against Infinity?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I told you before, I have no interest in your battle...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Although now that I think about it, you are the leader of a guild with a fair number of members...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='If I joined, then perhaps I can partake in whatever banquet your guild members prepare. They may need an extra mouth if you\'re unable to help them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ll give that some thought, but for now consider your thanks received.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ll need to walk off that meal I just had, so I\'m afraid that\'s all for today.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='I\'ll see you next time guild leader. I hope sooner rather than later.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }, 
        { --Friends
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Charolette',
                            bust='Bust_FH_012_01',
                            face='Face_FH_012_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Oh, guild leader. What brings you here?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='You\'re looking for Cerene?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Coming!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Glad you\'re joining us guild leader. I\'m ready now, let\'s go.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='And where are you going? With the guild leader no less, you should know he doesn\'t have time for games.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='But he said he wanted to come. To take a break. Even the guild leader needs to relax sometimes.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Well, we gotta run. Don\'t want to keep the others waiting. Let\'s hurry to the party!'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Party? Cerene! Get back here and explain yourself!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                }
            }, 
            { --Floor 2
                { --prebattle
                    backgrounds={
                        'City'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }, {
                            name='Fighter 1',
                            bust=nil,
                            face='Face_Other_001_01'
                        }, {
                            name='Fighter 2',
                            bust=nil,
                            face='Face_Other_001_01'
                        }, {
                            name='Fighter 3',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='She should be here somewhere. The city is so big, it\'s so easy to get lost.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ah, there she is!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=2,
                                    frame=4
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh, it looks like there\'re some people talking to her...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='I already beat you guys. The money\'s mine, why don\'t you give up already.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                face=true,
                                dialogue='You may have beaten us one-on-one, but together, we\'re sure to have you beat.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=6,
                                face=true,
                                dialogue='Losing to a litte girl? How pathetic, I won\'t accept such a shameful loss.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=5,
                                face=true,
                                dialogue='That money... I need it... For my wife... Give it to me!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Guild leader, quick! We have to help!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh, you two are here. I\'m sorry but I\'m not quite ready yet.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Though, you\'re more than welcome to help. It\'ll be quicker that way.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'City'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }, {
                            name='Fighter 1',
                            bust=nil,
                            face='Face_Other_001_01'
                        }, {
                            name='Fighter 2',
                            bust=nil,
                            face='Face_Other_001_01'
                        }, {
                            name='Fighter 3',
                            bust=nil,
                            face='Face_Other_001_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4
                                }, {
                                    bust=2,
                                    frame=4
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                face=true,
                                dialogue='Dammit! She\'s so strong!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=6,
                                face=true,
                                dialogue='Lost again? This can\'t be, what about my reputation?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=5,
                                face=true,
                                dialogue='No, without the money I can\'t... What about her... And me?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Argh! Alright you people, listen up!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='You! Losing to a little girl, isn\'t more shameful to gang up on a little girl?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=6,
                                face=true,
                                dialogue='Argh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='You! We both know your wife is throwing too much money into gachas. If you don\'t stop her, it\'ll keep happening. This money won\'t help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=5,
                                face=true,
                                dialogue='Oh...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='And you, there are some things you\'re better at than me. Work on your strengths, don\'t take the easy road. Keep training!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                face=true,
                                dialogue='Huh? Umm right...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Geez, why do I have to keep telling people these things. No one here seems to understand...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You should take example from guild leader. His problems are more grand than yours.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='The difference is he\'s trying to solve the problem from the source. Unlike you guys going for a quick fix.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Be more like him. Learn from your mistakes and improve. That\'s how I got to where I am as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=6,
                                face=true,
                                dialogue='She\'s right...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                face=true,
                                dialogue='Perhaps if I did put in more effort in my training...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=5,
                                frame=5,
                                face=true,
                                dialogue='Me too, I just wanted to avoid the problem. It\'s probably better to have a good, long talk instead...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well if that\'s settled, I\'ll take my leave. I have other things to attend to.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Yay Cerene! I\'m so excited, are you ready for the party?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Yes, of course. You, Nova, the guild leader, we\'re going to have so much fun.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Before we get there, let me buy some food for my siblings, otherwise I\'ll have to hear more complaints. Wait for me at the front gate.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='She\'s so responsible isn\'t she. She\'s only a bit older than me. I guess that\'s just how older sisters are like.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Let\'s head to the front and wait for her there.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }, 
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Nova said she had somewhere special in mind, do you know where that is?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Nope. She wants to keep it a surprise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Well if she\'s planning on using magic, I\'m sure we\'ll have another grand adventure. Haha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Whatever it is, I hope it goes well, for her sake. You know how she is when she makes a mistake.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='But no matter what happens, we\'ll all be there, together. Let\'s not keep her waiting.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                },
                { --postbattle
                    backgrounds={
                        'Grassland'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Nova',
                            bust='Bust_FH_018_01',
                            face='Face_FH_018_01'
                        }, {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Nova!'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='You\'re all here. Great!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 4
                { --prebattle
                    backgrounds={
                        'Grassland',
                        'Purgatory'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Nova',
                            bust='Bust_FH_018_01',
                            face='Face_FH_018_01'
                        }, {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }, {
                            name='Monsters',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                }, {
                                    bust=2,
                                    frame=3
                                }, {
                                    bust=3,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='So Nova, where are we going to have this party?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Hehe, we\'ll have it...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Up there!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Heaven?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Wow.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Just think. Up in the clouds, sipping tea. How romantic!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='How do we get there? Guild leader, you\'ve been there before, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='That\'s what you did to get there? I don\'t think we can do that...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Don\'t worry, I\'ve been practicing my magic for this. We\'ll make it there, I\'m sure of it...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Well, hopefully...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Everyone hold hands and stay close. The closer the better.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Closer?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='It\'s just a precaution, but let\'s stay close together. Like reeeaaaallllly close. Here guild leader, hold my hand.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Alright, I\'ll start the spell. And remember. Stay. Real. Close.'
                            }
                        }, {
                            event='background',
                            type='hide'
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }, {
                                    bust=3
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='And we\'re here!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Hmm...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='This is heaven?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Of course. See, over there, there\'s the...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='The creepy tentacles, the dark ground, dim lights...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='No, this isn\'t it. Where are my fluffy clouds, bright sunlight. We\'re not in heaven, this is purgatory.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I made a mistake again. Oh, I\'m so sorry. My spell was wrong. Why? What did I do this time...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='So this is purgatory. Can\'t say I\'ve been here before. It\'s kind of gloomy, reminds me of the sewage back in the city.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Say, guild leader. Sis told me to stay away from this place because this is where demons live.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Does Lilith live here as well? I can\'t imagine anyone living in a place like this.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Lilith?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Oh, Lilith! That\'s it! She was teaching me about demon magic the other day. I must have mixed up my spells.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Oh I\'m so sorry. Mixing up my spells... How can I call myself a witch if I keep getting my spells mixed up...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Grrr...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=4,
                                dialogue='Hey, did you hear that? Sounds like we have some uninvited guests to this party.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Let\'s take care of them before we discuss anything more.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='I\'ll do it. This was my fault, I\'ll get rid of the monsters.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Ah!!!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }
            }, 
            { --Floor 5
                { --prebattle
                }, 
                { --postbattle
                    backgrounds={
                        'Purgatory'
                    },
                    speakers={
                        {
                            name='Cerene',
                            bust='Bust_FH_017_01',
                            face='Face_FH_017_01'
                        }, {
                            name='Nova',
                            bust='Bust_FH_018_01',
                            face='Face_FH_018_01'
                        }, {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=6
                                }, {
                                    bust=3,
                                    frame=5,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Done and done!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I\'m so sorry everyone. The location, the monsters... The party, it\'s ruined...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Huh? Guild leader, what are you saying?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='He\'s right you know. We\'ve been in worse situations before. Everyone lost, all on their own. That\'s why you told us to stay close right? So we\'d still be together so matter what happens.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=3,
                                dialogue='And monsters? That\'s just another day for me. The guild leader? He probably finished another quest before coming here, what\'s one more to todays count.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Guild leader? You say you already know romantic. A party in purgatory is much more interesting?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='But if I keep making these mistakes I might injure someone, or worse. When that happens, I\'m afraid you might leave. Just like...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='We\'re your friends, we wouldn\'t do that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='We\'ll always be by your side. If you make a mistake, we\'ll be there to help.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='You too guild leader?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Wahhh! My friends. I love you. I love you all! Wahhhh!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='A party in purgatory. Can\'t say I\'ve heard of that before. Just another story to tell my silbings.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Ah! Don\'t tell my sister, otherwise I\'ll get in trouble.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Hehe.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Well, this place wasn\'t what I had in mind, but if you forgive me, I should be glad to have such good friends.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='May we stick together in all disasters that may come. Caused by me or otherwise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Of course!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='You can count on me!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Well. That takes care of that. All that\'s left is to...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Start the tea party!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            }
        }
    },
    event={ --this should be isolated from the main data
        { --story
            { --Floor 1
                { --prebattle
                    backgrounds={
                        'Room',
                        'City'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }, {
                            name='Clara?',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        },
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Huh? Where am I? A room, a bed? This isn\'t the guild...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Nu! Come on, get up!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Who\'s that? That voice, it sounds like...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=3,
                                    frame=5,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Hurry up Nu! Let\'s go, we\'re going to be late!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Clara? You\'re here as well. Where are we?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Clara? What, did you fall asleep for too long you forgot my name?'
                            }
                        }, {
                            event='bust',
                            type='swap',
                            time=0,
                            values={ 
                                {
                                    oldBust=3,
                                    newBust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='It\'s me, you\'re childhood friend Bella!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Bella? What? What\'s going on here...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='What\'s going on is that we\'re going to be late if you don\'t hurry up.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Late? For what?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='For school. So hurry up!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='School?'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=5
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Am I really going to school? No, it can\'t be, I\'ve accepted it already. I won\'t ever be able to do such a thing, only in my...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, I get it, this is a dream. Someone must be attacking my mind, taking advantage of my old desires.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Heh, too bad for them, I\'m a super soldier. I won\'t be tempted by such obvious brainwashing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Nu, quit mumbling to yourself, we\'re going to be late for the bus!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Clara, she now refers to herself as Bella. I recall hearing that name somewhere before. Was it a name she assumed in one of her previous lives?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='If that\'s true, then this dream has some knowledge of the real world. That would make sense, seeing it knew of my wish I had long ago.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='We\'ll I\'m here now. Maybe it wouldn\'t be so bad to see how a school life would be like, so long as I don\'t get carried away.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=7,
                                dialogue='Heh, this uniform will have a use after all...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Nu! I\'m going to leave you behind if you don\'t hurry up!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'m coming Clara... I mean Bella.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Good you\'ve finally come to your senses but at this rate we\'ll miss the bus. Look at the line...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='A bus. A mode of transport that will take us to our destination. Due to the limited capacity of a bus, only a certain number of people can enter. So society has created the concept of a line, rewarding those who come early.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='If we are too far behind in the line, the bus may fill before we are able to enter, thus comprising our chance to enter school on time. What\'s our plan for victory?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='We\'ve got no choice, we have to cut in line.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Cut in line? Is that something school students do? That is a foreign concept to me, can you explain.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='We don\'t have time to explain. Follow me!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'City'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=2,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='What? Does cut in line mean a battle? There\'s no chance school students do this...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Alright! If we cut a few more people we\'ll make it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='But Bella wants to keep going...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Well, this is a dream anyway, there\'s no harm in incapacitating other school students.'
                            }
                        },  {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='I\'ll do whatever it takes to win this, even if it\'s only a dream. That\'s what I\'ve been trained to do.'
                            }
                        }, 
                        {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 2
                { --prebattle
                },
                { --postbattle
                    backgrounds={
                        'City'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=8,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Yes, we made it to the front. Good work Nu.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Of course, I must always attain victory.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Let\'s get on the bus. It\'s time to go to school!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 3
                { --prebattle
                    backgrounds={
                        'School',
                        'Classroom'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_03',
                            face='Face_FH_053_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }, {
                            name='????',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Come on Nu. We got to get to the classroom. Hurry'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=3
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='The classroom. A setting where students gather and the teacher imparts their knowledge to them.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'ll really get to see what life would be like as a school student.'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }
                            },
                        }, {
                            event='background',
                            type='show',
                            value=2
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='You two. Class is about to start!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Sorry miss...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='It\'s you...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=4,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='What are you waiting for, hurry to your seats!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Umm right!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Alright, let\'s begin! Open your textbook to page 53.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Textbook?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='You didn\'t bring your textbook?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='How was I suppose to know? Students carry around with them a textbook, I\'ll remember for next time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Don\'t worry Nu, you can share with me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Woah. That\'s a big book.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Well what do you expect. I\'ve lived through everything. My notes are much better than what you can find in a textbook.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='No sharing, she needs to learn these things herself.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Here take this, it\'s a spare. I keep some around just in case some slackers forget.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Right.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Now open to page 53. Nu, please recite the first question and give us your thoughts.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ok, page 53...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Huh? What the!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Classroom'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_03',
                            face='Face_FH_053_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='What was that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Hmm? Nu, what\'s wrong, you stopped midway. Keep on reading.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Reading? But that was a battle...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Wait, I don\'t know how to read. These pages they\'re all blank.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, I get it. Since this is a dream targeting my fantasies, my super cells are fighting against it to make sure I\'m still sane and in control, that I don\'t get tempted by the dream.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Instead of giving me the chance to live as a normal student, it\'s been replaced my the only thing I know how to do, fight. That also explains the cut in line business as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I can\'t believe I thought I could have a chance at this life...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Well, whoever put me in this dream, it\'s their loss. I still have all my senses of being a super soldier. I\'ll end this dream with my victory!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 4
                { --prebattle
                },
                { --postbattle
                }
            },
            { --Floor 5
                { --prebattle
                    backgrounds={
                        'Classroom'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_03',
                            face='Face_FH_053_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Good work everyone. We\'ve covered everything for today\'s lesson. There\'s just one last thing we need to do before the end of class.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=6,
                                dialogue='Please not a test, please not a test...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='A test!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Dammit...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='A test, a way to establish one\'s current knowledge by giving them a set of questions they are expected to know.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='I hope everyone\'s ready, this one will be tricky!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Classroom'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_03',
                            face='Face_FH_053_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=5
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='And that\'s time. Good job everyone, you made it to the end.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Just barely...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='How did you go Nu?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I was victorious.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Well you don\'t have to brag about it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='That\'s the end of class. You can head to your next lesson.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Next lesson? What\'s that?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Did you forget your timetable? It\'s P.E. We\'re off to the gym!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='P.E.'
                            }
                        },  {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 6
                { --prebattle
                    backgrounds={
                        'Gym'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_03',
                            face='Face_FH_043_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='P.E. or physical education. A subject which teaches health and wellbeing, often accompanied with physical exercise to maintain such health.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Wait, that person. It\'s...'
                            }
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Hey Nu, Bella. How\'s it going?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='Not good, teach Penelope gave us a test...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Right, haha. How unfortunate.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So Shino is in this dream as well. I wonder if there is some reason the guild members are here.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well, we\'re just about to start warm up. Do you want to join?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Sure, let\'s join Nu.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ok. What physical exercise are we doing?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'re playing basketball today. Let\'s start with some dribbles and free throws. We can have a match afterwards.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Basketball, a sport to throw a ball into a circluar target, referred to as a hoop. I don\'t know the rules of the game, but I suspect this will turn into a battle as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Let\'s see what happens.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Gym'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_03',
                            face='Face_FH_043_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='It\'s as I thought. So this dream, whoever trapped me here, they really were trying to coerce me with fantasy.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Heh. Too bad for them, they chose the wrong person. They have no chance of winning against me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Alright, good job everyone. Let\'s take a break.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 7
                { --prebattle
                    backgrounds={
                        'Gym'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_03',
                            face='Face_FH_043_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Alright, you two ready for a real game?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Of course. I\'ll win this as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='Haha, you\'re on!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Gym'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_03',
                            face='Face_FH_043_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3
                                }, {
                                    bust=2,
                                    frame=3,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=8
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Wow, you actually won.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='As I expected.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Don\'t forget about my assists.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Well, that\'s the end of school. What do you two plan on doing now?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Nu and I are going to hit up the arcade!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='An arcade. A location where numerous games are held. A common location for students to ease their minds of anything worrisome.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Nice. Have fun, I\'ll see you tomorrow.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Later!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Will this dream still last to tomorrow...'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 8
                { --prebattle
                    backgrounds={
                        'Arcade'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='At an arcade, there are many different games of different categories. What game are we playing?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'re playing a fighting game, one on one. Me against you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='You always win, so this time it\'s my turn to beat you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I always win, huh. Of course, that\'s what I was trained for...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='There were times where I wished I could go back to an ordinary life. Go to school with friends...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I didn\'t have the youth that I wanted, but I\'ve gained another purpose because of that, one that\'s ingrained into my very soul.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I\'ve had fun in this dream, but I know what I need to do, even my subconsciousness agrees.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I was created to win, be victorious in any battle.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='So I\'ll beat you as well Bella, even if you do give me the chance to live out this fantasy world I once longed for.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }, 
                { --postbattle
                    backgrounds={
                        'Arcade'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Bella',
                            bust='Bust_FH_064_04',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=6,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='I lost again... I can never win.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='But it was fun, right? I always have fun playing with you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Yes, it was fun. Thank you Bella.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=7,
                                dialogue='Why so formal? You\'re embarrassing me...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=8,
                                dialogue='Well, it\'s getting late, we should head home. I\'ll see you later.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=2
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='The sun is setting and you\'ve had your fun with friends. It\'s time to go home, rest and get ready for the next day.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='So this is what a school life would be like.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='This was a good dream, but I think it\'s time for me to go home as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='There\'s still another battle I have to win in the real world.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }
            },
            { --Floor 9
                { --prebattle
                    backgrounds={
                        'Guild'
                    },
                    speakers={
                        {
                            name='Nu',
                            bust='Bust_FH_024_01',
                            face='Face_FH_024_01'
                        }, {
                            name='Shino',
                            bust='Bust_FH_043_01',
                            face='Face_FH_043_01'
                        }, {
                            name='Penelope',
                            bust='Bust_FH_053_01',
                            face='Face_FH_053_01'
                        }, {
                            name='Clara',
                            bust='Bust_FH_064_01',
                            face='Face_FH_064_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'m back at the guild.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Oh, guild leader. Perfect timing, let me tell you about the dream I just had.'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='A strange dream, is it not?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hmm. So you think the one that created the dream was Infinity? So they can invade dreams as well? How dangerous.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Fortunate for us, I\'m immune to brainwashing. Whatever they wanted to do won\'t work on me.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Though the events that transpired, the people I saw, they do make me curious. I\'ll speak with the others and gather info. It may be useful in our fight against Infinity.'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Shino, I have a question for you. Are you familiar with the sport basketball?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Basketball? I know it, I used to play it all the time when I was younger. We didn\'t allow ninjutsu so everyone could play on even footing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=5,
                                dialogue='And since everyone trains their ninjutsu, they were no match against me. I\'m undefeated.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I see. Perhaps that is why you were in my dream.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Your dream?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes, this is what happened...'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='I see. So you\'re trying to figure out why some of us guild members were in your dream. For me, it\'s most likely because I know basketball.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes, that could be the case. But if that is true, then it raises another question.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='If the one that created that dream was indeed Infinity, as per guild leader\'s words, how did they know you to be knowledgeable at basketball?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='I don\'t know...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Don\'t tell me Infinity is someone from my village.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='That may be the case. The guild leader doesn\'t speak of who the enemy is, only that they were consumed by Infinity. I wonder why he keeps it a secret.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='How can we help if we don\'t know who it is. It might be someone I know...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Maybe that is the reason why. Perhaps us knowing who our enemy is may change our desire to help the guild leader.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='You might be right...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ll continue analysing my dream. I\'ll inform you if I learn anything more.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Ok, thanks.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, and I\'d suggest you not to tell this to the others from your village, at least until we have more info. We don\'t know how they would react.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Right, Got it, I won\'t say a word.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Good. I\'ll inform you if anymore info comes to light.'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=2
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=3,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Penelope, have you ever been a teacher before?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='A teacher? Well not by title, but I have taught people many different things. There are countless that have come to me seeking wisdom and advise. It\'s only natural I impart my knowledge to those curious.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Do you want me to teach you? I recall you skipped your school life. If we start now I\'m sure we could catch up.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='No, it\'s ok. I\'m investigating something else. You see, I had this dream...'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=3
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=3,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='My, how fascinating. To learn that Infinity is capable of invading one\'s dream.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='I suspect you are wondering why I was designated the teacher in your dream.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Assuming it indeed is fueled by the person who has taken Infinity, my observation would be that the person must know I have taught to others before, enough to be considered a teacher.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Yes, that\'s my conclusion as well.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=2,
                                dialogue='So with that knowledge, what is it you intend to do with it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='If I know who the enemy is, then I may be able to find a weakness, thus assuring my victory.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=5,
                                dialogue='Hmm, I see. It must be that training that\'s ingrained into you, it has made you think like that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Huh? Well, maybe...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='Interesting. I have never thought to investigate an enemy for such a reason. I have knowledge in what the guild leader did and how the enemy attained that power, but not the who as I had deemed it irrelevant.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='With that line of thinking it may be worth researching. And now that I think about it, the guild leader has never brought up who the enemy is. Perhaps there is a reason why he has never spoke of that matter.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=8,
                                dialogue='Well you\'ve now got me invested in this. More secrets to uncover, more knowledge to gain, how exciting.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Oh, I was warned about this. Don\'t let Penelope get carried away or else she won\'t stop...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='The word was yapping I believe.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='But in this case, it would be beneficial for us to allow her to pursue such research.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Ok Penelope, I\'m counting on you.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='I won\'t let you down. Now let\'s see, where to begin... How about this...'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=3
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }, {
                                    bust=4,
                                    frame=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Bella. Ah, I mean Clara. Do you have a moment?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Nu? I have all the time in the world, what is it?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='You\'ve lived since the beginning of life, right? I wanted to ask, do you have a book on what you\'ve done?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='You refer to my diary? I do record the events that have transpired in writing. It gives me something to wonder about, as I\'ve seen a lot during my time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Do you mind if I take a look?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='I don\'t mind, but I thought you don\'t know how to read this era\'s language.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'m not going to read it, I just want to see it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Hmm. Ok, here it is.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Oh, it\'s big as well. It\'s exactly the same.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='The same?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Let me explain.'
                            }
                        }, {
                            event='background',
                            type='hide',
                            value=1
                        }, {
                            event='bust',
                            type='hide',
                            time=CONSTANTS.timeBustFade*0.5,
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1
                                }, {
                                    bust=4
                                }
                            },
                        },{
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=4,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='I see. That makes sense. No wonder you also knew my name during age twelve.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Age twelve?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Essabella, or Bella as you called me. That was how I referred to myself in that age.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='What do you mean by age?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Ah, that\'s my own concept. I delegate an age to an eventful moment, and thus a new moniker. It helps me identify what occured during that specific time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So what age are we in now?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Age sixteen, the battle between Infinity and the guild leader. I have named myself Claravaya, or Clara.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Right, so what was age twelve.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Age twelve was the end of the demon lord, when peace began to rebuild. That was around three to four centuries ago.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Then you might have met Infinity during that time.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='From what you have told me, that seems plausible.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='It\'s unlikely you remember everyone you\'ve met, but if you\'ve written it in your book, we may be able to find out who the enemy is.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Perhaps, but reading through my diary will take a long time. I have no interest in finding out who I met with in the past. You can read it, though I assume you will struggle.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Right. A book that size, it would probably be difficult to read. Plus we can\'t be sure who Infinity is just by knowing the people you met.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Yes, it would be impossible to know just from that.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Well, we can\'t do that, but we can do something else.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=8,
                                dialogue='Seeing I was your childhood friend, why don\'t I help you out in something?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Would you be interested in learning how to read?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Reading... No it\'s ok, it doesn\'t have any use in battle. That\'s why I was never taught it.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Right now, my only objective is to win the upcoming battle. If I\'m spending time learning to read, it hinders our chance at victory.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=2,
                                dialogue='I see. I guess for you, you value your time. That\'s not something I can understand...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ve told myself, with this being my hardest challenge yet, once I win there will be nothing that can surpass the victory of that battle. I plan to seek victory outside of combat once that happens.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='With that, I\'ll start something anew. You, who has seen much more than me, maybe you can help me find a new path. You\'ll still be around, right?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=4,
                                frame=1,
                                dialogue='Of course. My time here won\'t come to an end anytime soon. I would be glad to help when that time comes.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Right. So let\'s win this battle so I can move on to my next challenge....'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='To become victorious in everything else that exists in this world!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                composer.setVariable('battleResult', 2)
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                            end
                        }
                    }
                }, 
                { --postbattle
                }
            }
        }

    },
    other={
        { --1 Tower
            { --Sofie,Annie
                { --prebattle
                    backgrounds={
                        'Tower'
                    },
                    speakers={
                        {
                            name='Sofie',
                            bust='Bust_FH_003_01',
                            face='Face_FH_003_01'
                        },
                        {
                            name='Annie',
                            bust='Bust_FH_008_01',
                            face='Face_FH_008_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1
                                }, {
                                    bust=2,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='A tower, huh? I heard this place used to be a tourist trap. If we\'re lucky, we might be able to find some souvenirs for everyone.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Come Sofie, let\'s reach the top!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='I\'m not going.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='What? Why not?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='It\'s too high. Plus its in ruins, what if it falls while we\'re inside.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='It\'s not going to fall. Here, look.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Ha!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='Ah, don\'t punch it!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='See! Nothing happened. You don\'t have to worry about it falling.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Well, its still too high.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Oh right. Your fear of heights or something.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=2,
                                dialogue='Well we\'re going inside. You\'ll just have to stay here then. Alone.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='I won\'t be alone.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=6,
                                dialogue='Argh, that doll won\'t help if you\'re surrounded by monsters. I can\'t leave you by yourself. Just come with us, please.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='No.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Even the guild leader faces his fear sometimes, he doesn\'t stand around and wait for us when we go inside a cave. We all go in together.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Together?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='We\'re all here for you. The guild, the orphanage. Whenever you\'re in danger or if your scared, we\'ll face them together.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Promise?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Of course. It\'s a promise.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='... Alright.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Yay. If you\'re already feeling scared, you can hold my hand.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='Ok.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=3,
                                dialogue='Let\'s not keep the others waiting. Into the tower!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }
            },
            { --Raya (Wolf)
                { --prebattle
                    backgrounds={
                        'Tower'
                    },
                    speakers={
                        {
                            name='Raya',
                            bust='Bust_FH_048_01',
                            face='Face_FH_048_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='A tower full of monster, no casualties to worry about...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='I\'ll let my wolf run rampant, full power. It\'s the only way I\'ll be able to control it. To grow stronger.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='In case the situation gets out of my control, I trust you to do whatever it may take to stop it. Even if its fatal...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Alright, I\'m ready. Wolf, I\'m letting you free. Follow my command!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }
            },
            { --Sun-Ni
                { --prebattle
                    backgrounds={
                        'Tower'
                    },
                    speakers={
                        {
                            name='Sun-Ni',
                            bust='Bust_FH_060_01',
                            face='Face_FH_060_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=3,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='This tower\'s pretty tall. Reminds me of the tower back in my world.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='At the top is God\'s Lookout. It\'s where the god of my world lounges around and watches over us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=5,
                                dialogue='It\'s a pretty boring place, but I heard it\'s the entrance to another dimension where time moves different to this dimension. Someone could get good training in there.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Anyway, I reached the top by climbing with my bare hands, so a tower this tall is no problem for me, it\'s just more training.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='Upwards we go!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }
            }
        },
        { --2 Arena
            { --Melaine
                { --prebattle
                    backgrounds={
                        'Arena'
                    },
                    speakers={
                        {
                            name='Melaine',
                            bust='Bust_FH_001_01',
                            face='Face_FH_001_01'
                        },
                        {
                            name='Commentator',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='They\'re looking for a show? I\'ll give them one to remember.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=3,
                                dialogue='The spotlight is on me. I\'ll show them what it means to battle with grace.'
                            }
                        }, {
                            event='bust',
                            type='hide',
                            values={ 
                                {
                                    bust=1
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Melaine rushes in towards the enemy. Wait, thats...'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='A double, triple... It\'s a quadruple pirouette! The monster is down!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Such grace. How can a battle be this beautiful?.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                face=true,
                                dialogue='Ha! I\'ve only just begun.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }
            },
            { --Saki (Butterfly), Narita (Fox)
                { --prebattle
                    backgrounds={
                        'Arena'
                    },
                    speakers={
                        {
                            name='Saki',
                            bust='Bust_FH_057_01',
                            face='Face_FH_057_01'
                        },
                        {
                            name='Narita',
                            bust='Bust_FH_059_01',
                            face='Face_FH_059_01'
                        },
                        {
                            name='Audience',
                            bust=nil,
                            face=nil
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=4,
                                    focus=true
                                }, {
                                    bust=2,
                                    frame=4
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Haaaa!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='YEEAAHH!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Haaaa!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='YEEAAHH!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=1,
                                dialogue='Ha! My cheer was louder.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='What! I didn\'t know it was a competition. And yours wasn\'t lounder. Let\'s do it again!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=2,
                                frame=4,
                                dialogue='Fine with me. Haaaa!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=4,
                                dialogue='Haaaa!'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=3,
                                frame=1,
                                dialogue='YEEEEAAAAAHHH!'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.battle.battle')
                            end
                        }
                    }
                }
            }
        },
        { --3 Labyrinth
            { --Opal
                { --prebattle
                    backgrounds={
                        'Cave'
                    },
                    speakers={
                        {
                            name='Opal',
                            bust='Bust_FH_011_01',
                            face='Face_FH_011_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Hmm... So this is the state of gemstones in this era.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='The era I lived in, a bit over a millennium past, gemstones are used to amplify one\'s magic. How they are now, they\'re only capable of enhancing inanimate objects.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='An attempt to use my magic with such tiny gemstomes would certainly crumble them. It\'s no wonder my type of magic has been lost.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='I\'ve researched into the world\'s history, but never once does it mention gemstone magic. Interestingly the oldest sources I\'ve found only date back 700 years ago.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='There must be something that happened within those missing years, something that caused all gemstomes to reduce to nothing.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Not that I have much clues as of now. The only thing I can think of stronger than gemstones is Infinity. Of course this was before your time, so I doubt it has any relation with what you\'re struggling with now.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=2,
                                dialogue='Without gemstones I don\'t see a way for me to return home. What else can give the same amount of power as gemstones?'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='Though this is my predicament, you should focus on your troubles. I\'ll continue to help you just as you helped me when I first arrived.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.labyrinth.labyrinth')
                            end
                        }
                    }
                }
            },
            { --Penelope
                { --prebattle
                    backgrounds={
                        'Cave'
                    },
                    speakers={
                        {
                            name='Penelope',
                            bust='Bust_FH_053_01',
                            face='Face_FH_053_01'
                        }
                    },
                    events={
                        {
                            event='background',
                            type='show',
                            value=1
                        }, {
                            event='bust',
                            type='show',
                            values={ 
                                {
                                    bust=0
                                }, {
                                    bust=1,
                                    frame=1,
                                    focus=true
                                }
                            },
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='So these are gemstones, small earth shards that naturally contain remnants of magic. Apparently in ancient times, its magic was self sustaining, thus capable of granting limitless power.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=6,
                                dialogue='Unfortunately that was lost and we are left with what we have today. Such a shame, I would have loved to see such an occurrence with my own eyes.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='But researching gemstones has made me wonder what other uses they could have, and how its power could benefit us.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=1,
                                dialogue='For example if we forge gemstones directly into our equipment, we can use its natural magic to grant it additional parameters, thus boosting our stats.'
                            }
                        }, {
                            event='dialogue',
                            value={
                                speaker=1,
                                frame=8,
                                dialogue='I\'m keen to try it out. I know you have a phobia, but think if the benefits. Let\'s dive down into the labyrinth and mine those gemstones.'
                            }
                        }, {
                            event='end',
                            sceneFadeOutOnComplete=function()
                                MAIN.UTILITY.gotoScene('scene.labyrinth.labyrinth')
                            end
                        }
                    }
                }
            }
        }
    }
}

M.getDialogue = function(quest, stage, floor, battle)
    if dialogue[quest] then
        return dialogue[quest][stage][floor][battle]
    end
end

return M