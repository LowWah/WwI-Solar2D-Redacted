--local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local CONTAINER = MAIN.UI.CONTAINER
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2

    local questWidth = (fifthWidth * 2 + CONSTANTS.rectangleSpacing) + CONSTANTS.rectanglePadding * 2
    local height = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2

    local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
    local isGearUnlocked = isFloorClearedFunc('main', 1, 6)
    local isChapter1Complete = isGearUnlocked and isFloorClearedFunc('main', 1, 12)
    local isTowerUnlocked = isChapter1Complete and isFloorClearedFunc('main', 2, 12)
    local isArenaUnlocked = MAIN.PLAYER.GUILD.level() >= 4
    local isLabyrinthUnlocked = isArenaUnlocked and MAIN.PLAYER.GUILD.level() >= 6

    --1 Current Quests
    local currentQuestsRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=height,
        width=questWidth,
        height=display.contentHeight-height*2,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local TERMS = MAIN.TERMS

            local y = input.y
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Current Quests',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Main',
                fontColour=CONSTANTS.textColourPink
            })

            --4 Current Main
            local count = 0
            local total = 0
            local main = MAIN.DATA.QUEST.getStagesForQuest('main')
            local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
            for i = 1, #main do
                for j = 1, #main[i].floors do
                    if isFloorClearedFunc('main', i, j) then
                        count = count + 1
                    end
                    total = total + 1
                end
            end
            local percent = math.round(count / total * 100)
            local percentFontColour = percent == 100 and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text=(percent .. '%'),
                fontColour=percentFontColour,
                alignX='right'
            })

            y = y + CONSTANTS.lineHeight
            --5
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Event (Story)',
                fontColour=CONSTANTS.textColourPink
            })
            
            --6 Event status
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Event (Story) '),
                y=y,
                width=input.width-TEXT.textWidth('Event (Story) '),
                height=input.height,
                text='',
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            --7 Event time remaining
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Time indefinite',
                alignX='right'
            })

            y = y + CONSTANTS.lineHeight
            --8
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Tower',
                fontColour=CONSTANTS.textColourPink
            })

            --9 Tower floors complete
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='',
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            local timerX = input.x + input.width - TEXT.textWidth('99D24H60M60S') - CONSTANTS.textPadding * 3
            --10 Tower time remaining
            TEXT.drawTimer({
                parent=input.parent,
                x=timerX,
                y=y,
                onComplete=function(timer)
                    timer:setTime(timer:nextTime('month'))
                end
            })

            y = y + CONSTANTS.lineHeight
            --11
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Arena',
                fontColour=CONSTANTS.textColourPink
            })

            --12 No. challenges complete
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='',
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            --13 Arena time remaining
            TEXT.drawTimer({
                parent=input.parent,
                x=timerX,
                y=y,
                onComplete=function(timer)
                    timer:setTime(timer:nextTime('day'))
                    --only run it once here
                    sceneGroup[1]:refresh()
                end
            })
        end,
        refresh=function(input)
            --event
            if isChapter1Complete then
                
                local count = 0
                local total = 0
                --event will only be at story
                local event = MAIN.DATA.QUEST.getStagesForQuest('event')[1]
                local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
                for i = 1, #event.floors do
                    if isFloorClearedFunc('event', 1, i) then
                        count = count + 1
                    end
                    total = total + 1
                end
                local percent = math.round(count / total * 100)
                local percentFontColour = percent == 100 and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid
                input.parent[6]:setText(percent .. '%', percentFontColour)
                input.parent[7].isVisible = true
            else
                input.parent[6]:setText('Complete Chapter 1', CONSTANTS.textColourInvalid)
                input.parent[7].isVisible = false
            end
            
            --tower
            if isTowerUnlocked then
                local count = 0
                local total = 0
                local tower = MAIN.DATA.QUEST.getStagesForQuest('tower')
                local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
                for i = 1, #tower do
                    for j = 1, #tower[i].floors do
                        if isFloorClearedFunc('tower', i, j) then
                            count = count + 1
                        end
                        total = total + 1
                    end
                end
                local percent = math.round(count / total * 100)
                local percentFontColour = percent == 100 and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid

                input.parent[9]:setText(percent .. '%', percentFontColour)
                input.parent[10]:setTime(input.parent[10]:nextTime('month'))
            else
                input.parent[9]:setText('Clear Chapter 2 F12', CONSTANTS.textColourInvalid)
                input.parent[10]:stopTime()
            end

            --arena
            if isArenaUnlocked then
                local arenaChallenges = MAIN.PLAYER.QUEST.getArenaChallenges()
                local count = 0
                local total = #arenaChallenges
                for i = 1, total do
                    if arenaChallenges[i].isChallengeComplete then
                        count = count + 1
                    end
                end
                local percentFontColour = count == total and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid

                input.parent[12]:setText(count .. '/' .. total, percentFontColour)
                input.parent[13]:setTime(input.parent[10]:nextTime('day'))
            else
                input.parent[12]:setText('Require Guild Level 4', CONSTANTS.textColourInvalid)
                input.parent[13]:stopTime()
            end
        end
    })

    function currentQuestsRect:stopTimers()
        self[10]:stopTime()
        self[13]:stopTime()
    end
    
    local COMMON = MAIN.UI.COMMON
    local TERMS = MAIN.TERMS

    local touchQuest = function(name)
        composer.setVariable('quest', name)

        MAIN.UTILITY.gotoScene('scene.hub.quest.stages.' .. name)
    end
    --STORY

    local rectX = CONSTANTS.backWidth + questWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    local rectWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local y = display.contentHeight - height * 6.5 - CONSTANTS.lineHeight

    --2 Main
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=rectX+(display.contentWidth-rectX-rectWidth)*0.5,
        y=y,
        width=rectWidth,
        height=height+CONSTANTS.lineHeight,
        text='Main',
        touch=function()
            touchQuest('main')
        end
    })

    y = y + height + CONSTANTS.lineHeight
    --3 Side
    if isChapter1Complete then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Side',
            touch=function()
                touchQuest('side')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Complete Chapter 1',
            fontColour=CONSTANTS.textColourInvalid
        })
    end
    

    rectX = rectX + rectWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    --4 Event
    if isChapter1Complete then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Event',
            touch=function()
                touchQuest('event')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Complete Chapter 1',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    --RESOURCE
    rectX = CONSTANTS.backWidth + questWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    y = y + height * 1.5
    --5 Gear
    if isGearUnlocked then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Gear',
            touch=function()
                touchQuest('gear')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Clear Chapter 1 F6',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    y = y + height
    --5 Tome
    if isChapter1Complete then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Tome',
            touch=function()
                touchQuest('tome')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Complete Chapter 1',
            fontColour=CONSTANTS.textColourInvalid
        })
    end
    
    y = y + height
    --6 Onslaught
    if isChapter1Complete then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Onslaught',
            touch=function()
                touchQuest('onslaught')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Complete Chapter 1',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    --CHALLENGE
    rectX = rectX + rectWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    y = y - height * 2
    --7 Tower
    if isTowerUnlocked then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Tower',
            touch=function()
                touchQuest('tower')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Clear Chapter 2 F12',
            fontColour=CONSTANTS.textColourInvalid
        })
    end
    
    y = y + height
    --8 Arena
    if isArenaUnlocked then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Arena',
            touch=function()
                touchQuest('arena')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Require Guild Level 4',
            fontColour=CONSTANTS.textColourInvalid
        })
    end

    y = y + height
    --9 Labyrinth
    if isLabyrinthUnlocked then
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Labyrinth',
            touch=function()
                touchQuest('labyrinth')
            end
        })
    else
        COMMON.createRectangleWithText({
            parent=sceneGroup,
            x=rectX,
            y=y,
            width=rectWidth,
            height=height,
            text='Require Guild Level 6',
            fontColour=CONSTANTS.textColourInvalid
        })
    end
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        
        local UTILITY = MAIN.UTILITY
        
        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName='QUEST',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.hub')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        --refresh existing windows
        sceneGroup[1]:refresh()

        UTILITY.showLoadingLayer(false)

        UTILITY.removeComposerVariable('quest')

        if composer.getSceneName('previous') == 'scene.battle.rewards.rewards' then
            UTILITY.updateBackgroundImages({ MAIN.PLAYER.HUB.hubBackground() })
            UTILITY.sceneFadeIn({time=0})
        end
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

        sceneGroup[1]:stopTimers()
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene