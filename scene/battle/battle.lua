--local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
--
local battleManager
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
function scene:battleSpeed()
    return MAIN.SYSTEM.OPTIONS.getBattleSpeed()
end

function scene:autoBattle()
    return MAIN.SYSTEM.OPTIONS.getAutoBattle()
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --sceneGroup probably isnt needed
    battleManager = event.params and event.params.battleManager or MAIN.BATTLE.initializeBattleManager(sceneGroup)

    --BACKGROUND
    MAIN.UTILITY.updateBackgroundImages({battleManager.background})
    MAIN.UTILITY.focusBackgroundImage(1)
    battleManager.background = nil

    --create an obj to store effect (buff/debuff) icons to make is easier accessable
    local effectIcons = {
        {}, --enemies
        {} --allies
    }

    --Create all the display groups

    --1 actor battlers (this should have been over enemies, its too late now)
    local actorBattlers = display.newGroup()
    sceneGroup:insert(actorBattlers)

    local IMAGE = MAIN.IMAGE
    for i = 1, #battleManager.party do
        local actor = battleManager.party[i]
        local actorImage = IMAGE.loadActorPicture(actor.picture)
        actorImage.actor = actor
        actorImage.x = actor.pictureX
        actorImage.y = actor.pictureY
        actorBattlers:insert(actorImage)

        actorImage.isVisible = false
    end

    function actorBattlers:realignActors()
        --we need this for the dead reserve swap
        local realign = {}
        local isAnyOutOfPlace = false
        for i = 1, #battleManager.party do
            local actor = battleManager.party[i]
            local image = self[i]
            if actor ~= image.actor then
                isAnyOutOfPlace = true
                --find the correct image
                for j = 1, self.numChildren do
                    if self[j].actor == actor then
                        image = self[j]
                        break
                    end
                end
            end
            
            realign[i] = image
        end

        if isAnyOutOfPlace then
            --we just reinsert in the correct order
            for i = 1, #realign do
                self:insert(realign[i])
            end
        end
    end

    --create the target group here during the enemy setup, but itll be added to ui turn group
    local targetGroup = display.newGroup()
    
    local enemyTargetGroup = display.newGroup()
    targetGroup:insert(enemyTargetGroup)

    function createTargetRectangle(options)
        local targetGroup = display.newGroup()
        options.parent:insert(targetGroup)

        local rectWidth = CONSTANTS.lineHeight * 2
        local diagonal = 0.5 * (2 * rectWidth^2)^0.5
        --1 Rectangle
        local rectGroup = MAIN.UI.CONTAINER.createRectangleGroup({
            parent=targetGroup,
            x=options.x-rectWidth*0.5,
            y=options.y-rectWidth*0.5,
            width=rectWidth,
            height=rectWidth,
            create=function(input)
                input.parent[1].rotation = 45

                --2 Target
                MAIN.UI.TEXT.drawText({
                    parent=input.parent,
                    x=input.x-diagonal*0.5,
                    y=input.y,
                    width=diagonal*2,
                    height=diagonal,
                    text='TARGET',
                    fontColour=CONSTANTS.textColourPink,
                    fontSize=14,
                    paddingX=0,
                    alignX='centre',
                    alignY='centre'
                })
            end,
            refresh=function(input)
                local text = input.text
                if text then
                    input.parent[2].isVisible = true
                    input.parent[2]:setText(text, input.fontColour or CONSTANTS.textColourPink)
                else 
                    input.parent[2].isVisible = false
                end
            end,
            touch=options.touch
        })

        local TEXT = MAIN.UI.TEXT
        --2 Resist
        local resist = TEXT.drawText({
            parent=targetGroup,
            x=options.x-diagonal*1.5,
            y=options.y-diagonal,
            width=diagonal,
            height=diagonal,
            text='Resist',
            fontColour=CONSTANTS.textColourRed,
            fontSize=14,
            paddingX=0,
            alignX='right',
            alignY='centre'
        })
        resist.isVisible = false

        --3 Weak
        local weak = TEXT.drawText({
            parent=targetGroup,
            x=options.x+diagonal*0.5,
            y=options.y-diagonal,
            height=diagonal,
            text='Weak',
            fontColour=CONSTANTS.textColourGreen,
            fontSize=14,
            paddingX=0,
            alignY='centre'
        })
        weak.isVisible = false

        function targetGroup:refreshTarget(target)
            if target then
                self.isVisible = true

                self[1]:refresh({text=(target.text or ''), fontColour=target.fontColour})
                self[1]:enableTouch(target.canTouch)
                self[2].isVisible = target.isResist
                self[3].isVisible = target.isWeak
            else
                self.isVisible = false
            end
        end

        return targetGroup

    end

    --2 enemy battlers
    local enemyBattlers = display.newGroup()
    sceneGroup:insert(enemyBattlers)

    --2 1 (+1) group per wave
    local allEnemies = battleManager.allEnemies
    for i = 1, #allEnemies do
        local waveGroup = display.newGroup()
        enemyBattlers:insert(waveGroup)

        local waveTargetGroup = display.newGroup()
        enemyTargetGroup:insert(waveTargetGroup)

        effectIcons[1][i] = {}

        local wave = allEnemies[i]
        for j = 1, #wave do
            local enemy = wave[j]
            local enemyGroup = display.newGroup()
            waveGroup:insert(enemyGroup)

            --1 enemy pic
            local enemyImage = IMAGE.loadEnemyPicture(enemy.picture)
            enemyImage.anchorX = 0.5
            enemyImage.anchorY = 0.5
            enemyImage.x = enemy.pictureX
            enemyImage.y = enemy.pictureY
            enemyGroup:insert(enemyImage)

            --2 enemy hp
            local gaugeWidth = CONSTANTS.battleEnemyHpGaugeWidth[enemy.hpGauge]
            local gaugeHeight = 12
            local enemyGauge = MAIN.UI.CONTAINER.createRectangleGauge({
                parent=enemyGroup,
                x=enemy.pictureX-gaugeWidth*0.5,
                y=enemy.pictureY+CONSTANTS.lineHeight-gaugeHeight*0.5,
                width=gaugeWidth,
                height=gaugeHeight,
                colour1={ 1, 0, 0, 1 },
                rate=1
            })

            --3 letter
            if enemy.letter then
                MAIN.UI.TEXT.drawText({
                    parent=enemyGroup,
                    x=enemy.pictureX-gaugeWidth*0.5,
                    y=enemy.pictureY+CONSTANTS.lineHeight-gaugeHeight*0.5-CONSTANTS.textHeight,
                    text=enemy.letter
                })
            end

            --4 effect group
            local effectGroup = display.newGroup()
            enemyGroup:insert(effectGroup)

            --4 1 icon
            local effectIcon = MAIN.IMAGE.loadIconFrame(1)
            effectIcon.x = enemy.pictureX - CONSTANTS.iconWidth * 0.5
            effectIcon.y = enemy.pictureY + CONSTANTS.lineHeight + gaugeHeight * 0.5 + CONSTANTS.iconPadding
            effectGroup:insert(effectIcon)

            --4 2 turn
            MAIN.UI.TEXT.drawText({
                parent=effectGroup,
                x=effectIcon.x,
                y=effectIcon.y,
                width=CONSTANTS.iconWidth,
                height=CONSTANTS.iconHeight,
                text='',
                fontSize=CONSTANTS.fontSizeSmall,
                paddingX=0,
                paddingY=0,
                alignX='right'
            })

            effectIcons[1][i][j] = {
                current=1,
                group=effectGroup
            }

            --1 target
            local enemyTarget = createTargetRectangle({
                parent=waveTargetGroup,
                isActor=false,
                x=enemy.pictureX,
                y=enemy.pictureY,
                touch=function()
                    battleManager.party[battleManager.inputActor].target = j
                    
                    targetGroup:refresh()
                end
            })
            enemyTarget.isVisible = false
        end

        waveGroup.isVisible = false
    end

    local CONTAINER = MAIN.UI.CONTAINER
    --3 Wave + Turn
    local waveTurnGroup = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=0,
        y=0,
        width=display.contentWidth*0.1,
        height=CONSTANTS.lineHeight,
        padding=0,
        fillColour={ 0, 0, 0, 0 },
        strokeColourDisabled={ 0, 0, 0, 0 },
        strokeWidth=0,
        create=function(input)
            input.parent[1].isVisible = false

            local TEXT = MAIN.UI.TEXT
            local y = input.y + 2
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Wave',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='top'
            })

            --3 Wave
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Wave ', CONSTANTS.fontSizeSmall),
                y=y,
                width=input.width,
                height=input.height,
                text=('1/' .. battleManager.waves),
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='left',
                alignY='top'
            })

            y = y + CONSTANTS.fontSizeSmall
            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Turn',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='top'
            })

            --5 Turn
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Turn ', CONSTANTS.fontSizeSmall),
                y=y,
                width=input.width,
                height=input.height,
                text='1',
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='left',
                alignY='top'
            })

        end,
        refresh=function(input)
            if input.currentWave then
                input.parent[3]:setText(input.currentWave .. '/' .. input.waves)
            end
            if input.turn then
                input.parent[5]:setText(input.turn)
            end
        end
    })

    --4 Battle log
    local battleLogGroup = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=0,
        y=CONSTANTS.lineHeight,
        width=display.contentCenterX,
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding,
        padding=0,
        fillColour={ 0, 0, 0, 0 },
        strokeColourInactive={ 0, 0, 0, 0 },
        strokeWidth=0,
        create=function(input)
            input.parent[1].isVisible = false

            local y = input.y
            --2 log button - this is a rect group cause there is touch functionailty already
            CONTAINER.createRectangleGroup({
                parent=input.parent,
                x=input.x+CONSTANTS.textPadding,
                y=y,
                width=CONSTANTS.iconWidth+CONSTANTS.rectangleStrokeWidth*2,
                height=CONSTANTS.iconHeight+CONSTANTS.rectangleStrokeWidth*2,
                padding=0,
                create=function(input)
                    --2
                    local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.battleIconLog)
                    icon.x=input.x
                    icon.y=input.y
                    input.parent:insert(icon)
                end,
                touch=function()
                    composer.showOverlay('overlay.battle.log', {
                        isModal = true,
                        params = {
                            log=battleManager.log
                        }
                    })
                end
            })

            y = y + CONSTANTS.lineHeight + CONSTANTS.rectanglePadding
            --3 
            CONTAINER.createGradientRect({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                colour1={ 0, 0, 0, 0 },
                colour2=CONSTANTS.rectangleFillColour,
                padding=0
            })

            --4 Log line
            MAIN.UI.TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Turn 1',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

        end,
        refresh=function(input)
            input.parent[4]:setText((input.text or ''), (input.fontColour or CONSTANTS.textColour))
        end
    })

    function battleLogGroup:addLog(log)
        self:refresh(log)
        if log then
            battleManager:addLog(log)
        end
    end
    
    function battleLogGroup:clearLog()
        self:refresh()
        battleManager:clearLog()
    end

    --5 Turn order
    local turnOrderGroup = display.newGroup()
    sceneGroup:insert(turnOrderGroup)

    --5 1 Back gradient
    CONTAINER.createGradientRect({
        parent=turnOrderGroup,
        x=display.contentWidth*0.1,
        y=0,
        width=display.contentWidth*0.5,
        height=CONSTANTS.lineHeight*2,
        colour1=CONSTANTS.rectangleFillColour,
        colour2={ 0, 0, 0, 0},
    })

    --5 2 (+1) Turn order squares
    --MAYBE SHOULD LOAD ALL BATTLERS INSTEAD OF UPDATING PER TURN FACE IMAGES
    local turnOrderWidth = display.contentWidth / 18
    for i = 1, 7 do
        local initalX = display.contentWidth * 0.1 + (8 - i) * turnOrderWidth
        local turnOrder = CONTAINER.createRectangleGroup({
            parent=turnOrderGroup,
            x=initalX,
            y=0,
            width=turnOrderWidth,
            height=CONSTANTS.lineHeight*2,
            fillColour={ 0, 0, 0, 0 },
            strokeColour={ 0, 0, 0, 0 },
            padding=0,
            create=function(input)
                --2 container
                local container = display.newContainer(input.width, input.height)
                input.parent:insert(container, true)

                --2 1 face
                local face = display.newGroup()
                container:insert(face)
                face.coords = {
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height
                }

                local TEXT = MAIN.UI.TEXT
                --2 2 speed
                TEXT.drawText({
                    parent=container,
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height,
                    text='',
                    fontSize=CONSTANTS.fontSizeSmall,
                    alignX='right'
                })

                --2 3 action icon
                local actionIcon = MAIN.IMAGE.loadIconFrame(1)
                container:insert(actionIcon)
                local actionScale = 0.75
                actionIcon.x = input.x + input.width - CONSTANTS.iconWidth * actionScale
                actionIcon.y = input.y + input.height - CONSTANTS.iconHeight * actionScale
                actionIcon.alpha = 0.9
                actionIcon:scale(actionScale, actionScale)

                --2 4 Letter
                TEXT.drawText({
                    parent=container,
                    x=input.x,
                    y=input.y+input.height-CONSTANTS.iconHeight,
                    width=input.width-CONSTANTS.iconWidth,
                    height=CONSTANTS.iconHeight,
                    text='',
                    fontSize=CONSTANTS.fontSizeSmall,
                    alignY='centre'
                })

                --2 5 black rect
                local rect = display.newRect(input.x, input.y, input.width, input.height)
                rect.anchorX = 0
                rect.anchorY = 0
                rect:setFillColor(0.2, 0.2, 0.2, 0.6)
                container:insert(rect)
                rect.isVisible = false

            end,
            refresh=function(input)
                local container = input.parent[2]
                local battler = input.battler
                container.battler = battler
                if battler then
                    local rect = input.parent[1]
                    local colour = battler.isActor and CONSTANTS.battleTurnOrderAlly or CONSTANTS.battleTurnOrderEnemy

                    rect:setFillColor(colour[1], colour[2], colour[3], colour[4])
                    rect:setStrokeColor(colour[1], colour[2], colour[3], colour[4])

                    --1 face
                    while container[1].numChildren > 0 do
                        container[1][1]:removeSelf()
                    end
                    local face
                    if battler.face then
                        face = MAIN.IMAGE.loadFacePicture(battler.face)
                    else
                        face = MAIN.IMAGE.loadEnemyPicture(battler.picture)
                    end
                    
                    local scale = container[1].coords.height / face.height
                    face:scale(scale, scale)

                    container[1]:insert(face)
                    face.x = container[1].coords.x - (face.width * scale - container[1].coords.width) * 0.5
                    face.y = container[1].coords.y

                    --2 speed
                    local speedBase = battler.speed
                    local speedTotal = battler:speedTotal()
                    local speedFontColour = CONSTANTS.textColour
                    if speedTotal > speedBase then
                        speedFontColour = CONSTANTS.textColourGreen
                    elseif speedTotal < speedBase then
                        speedFontColour = CONSTANTS.textColourRed
                    end
                    container[2]:setText(speedTotal, speedFontColour)

                    --3 action
                    container[3].fill.frame = battler:inputSkillIcon()

                    --4 letter
                    if battler.letter then
                        container[4].isVisible = true
                        container[4]:setText(battler.letter)
                    else
                        container[4].isVisible = false
                    end

                    container[5].isVisible = false
                end
            end,
            touch=function()
                local battler = battleManager.order[i]
                composer.showOverlay('overlay.battle.stats', {
                    isModal = true,
                    params = {
                        turnOrderGroup=turnOrderGroup,
                        battler=battler
                    }
                })
            end
        })
        turnOrder.initalX = turnOrder.x
        turnOrder.initalY = turnOrder.y

        turnOrder.isVisible = false
    end

    --5 9 Current actor border
    CONTAINER.createRectangleGroup({
        parent=turnOrderGroup,
        x=display.contentWidth*0.6-turnOrderWidth,
        y=0,
        width=turnOrderWidth,
        height=CONSTANTS.lineHeight*2,
        fillColour={ 0, 0, 0, 0 },
        strokeColourDisabled=CONSTANTS.textColourYellow,
        padding=0,
        create=function(input)
           

        end,
        refresh=function(input)

        end
    })
    
    function turnOrderGroup:refresh()
        battleManager:sortTurnOrder()

        for i = 2, self.numChildren - 1 do
            local battler = battleManager.order[i - 1]
            if battler then
                self[i].isVisible = true
                self[i]:refresh({battler=battler})
                self[i].x = self[i].initalX
                local inputActor = battleManager.party[battleManager.inputActor]
                self[i].y = self[i].initalY + (battler == inputActor and CONSTANTS.rectanglePadding or 0)
                self[i]:enableTouch(true)
            else
                self[i].isVisible = false
            end
        end
    end

    function turnOrderGroup:clear()
        for i = 2, self.numChildren - 1 do
            self[i].isVisible = false
            self[i][2].battler = nil
            self[i][2][5].isVisible = false
        end
    end

    function turnOrderGroup:shift()
        for i = 2, self.numChildren - 1 do
            local rect = self[i]
            if rect[2].battler then
                rect:enableTouch(false)
                local colour = rect[2].battler.isActor and CONSTANTS.battleTurnOrderAlly or CONSTANTS.battleTurnOrderEnemy
                rect[1]:setStrokeColor(colour[1], colour[2], colour[3], colour[4])
                
                rect.y = rect.initalY
                rect.x = rect.x + turnOrderWidth
                if rect.x < (display.contentWidth * 0.1 + 9 * turnOrderWidth) then
                    rect.isVisible = true
                else
                    rect.isVisible = false
                    rect[2].battle = nil
                end
            end
        end
    end

    local iconRectangleWidth = CONSTANTS.iconWidth + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
    local iconRectangleHeight = CONSTANTS.iconHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleStrokeWidth * 2
    --6 Speed icon
    --Since animations are setup based on battle speed at execution time, if its toggled during an animation it will still be the previous speed
    local speedIcon = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-iconRectangleWidth*3,
        y=0,
        width=iconRectangleWidth,
        height=iconRectangleHeight,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(1)
            input.parent:insert(icon)
            icon.x=input.x
            icon.y=input.y
        end,
        refresh=function(input)
            input.parent[2].fill.frame = CONSTANTS.battleIconSpeed[input.speed or 1]
        end,
        touch=function()
            local speed = scene:battleSpeed()
            speed = (speed % 2) + 1
            MAIN.SYSTEM.OPTIONS.setBattleSpeed(speed)

            sceneGroup[6]:refresh({speed=speed})
        end
    })
    speedIcon:refresh({speed=scene:battleSpeed()})

    --7 Auto icon
    local autoIcon = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-iconRectangleWidth*2,
        y=0,
        width=iconRectangleWidth,
        height=iconRectangleHeight,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(10)
            input.parent:insert(icon)
            icon.x=input.x
            icon.y=input.y
        end,
        refresh=function(input)
            input.parent[2].fill.frame = CONSTANTS.battleIconAuto[input.autoBattle or 1]
        end,
        touch=function()
            local autoBattle = scene:autoBattle()
            autoBattle = (autoBattle % 2) + 1
            MAIN.SYSTEM.OPTIONS.setAutoBattle(autoBattle)

            sceneGroup[7]:refresh({autoBattle=autoBattle})

            if scene:autoBattle() == 2 and battleManager.phase == 'input' then 
                battleManager:doAutoBattle()
                self:startTurn()
            end
        end
    })
    autoIcon:refresh({autoBattle=scene:autoBattle()})

    --8 Run icon
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-iconRectangleWidth,
        y=0,
        width=iconRectangleWidth,
        height=iconRectangleHeight,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.battleIconEscape)
            input.parent:insert(icon)
            icon.x=input.x
            icon.y=input.y
        end,
        refresh=function(input)

        end,
        touch=function()
            composer.showOverlay('overlay.battle.escape', {
                isModal = true,
                params = {
                    arenaChallenges=battleManager.arenaChallenges
                }
            })
        end
    })

    sceneGroup[8]:enableTouch(false)

    local partyWidth = display.contentWidth * 0.6 + CONSTANTS.rectanglePadding * 2
    local partyHeight = CONSTANTS.lineHeight * 2 + CONSTANTS.rectanglePadding * 2
    --9 party status
    local statusScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=(display.contentWidth-partyWidth)*0.5,
        y=display.contentHeight-partyHeight,
        width=partyWidth,
        height=partyHeight,
        rows=1,
        columns=3,
        numItems=3,
        isTouchEnabled=false,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            --2 name
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding,
                height=CONSTANTS.lineHeight,
                text='',
                alignY='centre'
            })

            --3 effect group
            local effectGroup = display.newGroup()
            input.parent:insert(effectGroup)

            --3 1 icon
            local effectIcon = MAIN.IMAGE.loadIconFrame(1)
            effectIcon.x = input.x + input.width - CONSTANTS.iconWidth - CONSTANTS.iconPadding
            effectIcon.y = input.y + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
            effectGroup:insert(effectIcon)

            --3 2 turn
            MAIN.UI.TEXT.drawText({
                parent=effectGroup,
                x=effectIcon.x,
                y=effectIcon.y,
                width=CONSTANTS.iconWidth,
                height=CONSTANTS.iconHeight,
                text='',
                fontSize=CONSTANTS.fontSizeSmall,
                paddingX=0,
                paddingY=0,
                alignX='right'
            })


            effectIcons[2][input.index] = {
                current=1,
                group=effectGroup
            }

            local gaugeY = input.y + CONSTANTS.lineHeight + 8
            local textY = gaugeY - 8
            local halfWidth = input.width * 0.5

            --4 Hp gauge
            CONTAINER.createRectangleGauge({
                parent=input.parent,
                x=input.x+CONSTANTS.textPadding,
                y=gaugeY,
                width=halfWidth-CONSTANTS.textPadding,
                height=8,
                colour1=CONSTANTS.battleHpColour,
                rate=1
            }) 

            --5
            TEXT.drawText({
                parent=input.parent,
                x=input.x+CONSTANTS.rectangleStrokeWidth,
                y=textY-CONSTANTS.rectangleStrokeWidth,
                width=input.width,
                height=input.height,
                text='HP',
                fontColour=CONSTANTS.textColourPink,
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='left'
            })

            --6 Hp number
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=textY-CONSTANTS.rectangleStrokeWidth,
                width=halfWidth+CONSTANTS.rectanglePadding-CONSTANTS.rectangleStrokeWidth,
                height=input.height,
                text='',
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right'
            })

            --7 Mp gauge
            CONTAINER.createRectangleGauge({
                parent=input.parent,
                x=input.x+halfWidth,
                y=gaugeY,
                width=halfWidth-CONSTANTS.textPadding,
                height=8,
                colour1=CONSTANTS.battleMpColour,
                rate=1
            })

            --8
            TEXT.drawText({
                parent=input.parent,
                x=input.x+halfWidth,
                y=textY-CONSTANTS.rectangleStrokeWidth,
                width=input.width,
                height=input.height,
                text='MP',
                fontColour=CONSTANTS.textColourPink,
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='left'
            })

            --9 Mp number
            TEXT.drawText({
                parent=input.parent,
                x=input.x+halfWidth,
                y=textY-CONSTANTS.rectangleStrokeWidth,
                width=halfWidth,
                height=input.height,
                text='',
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right'
            })

            local gaugeWidth = input.width - CONSTANTS.textPadding * 2
            local gaugeX = input.x + CONSTANTS.textPadding
            --10 TP
            local tpGauge = CONTAINER.createRectangleGauge({
                parent=input.parent,
                x=gaugeX,
                y=gaugeY+8,
                width=gaugeWidth,
                height=8,
                colour1=CONSTANTS.battleHyperColour,
                rate=0
            })

            --11 Hyper Tp
            local hyperGauge = CONTAINER.createRectangleGauge({
                parent=input.parent,
                x=gaugeX,
                y=gaugeY+8,
                width=gaugeWidth,
                height=8,
                colour1={ 0.2, 0.2, 0.2, 1 },
                colour2=CONSTANTS.battleHyperColour,
                rate=0,
                direction='right'
            })
            hyperGauge.isVisible = false

        end,
        refresh=function(input)
            local actor = input.item

            if actor then
                input.parent[2].isVisible = true
                input.parent[2]:setText(actor.name)

                --BUFF?DEBUFFS WILL BE ROTATED ELSE WHERE
                input.parent[3].isVisible = true

                input.parent[4].isVisible = true
                input.parent[4]:setRate(actor:hpRate(), 0)
                input.parent[5].isVisible = true
                input.parent[6].isVisible = true
                input.parent[6]:setText(actor:hp())

                input.parent[7].isVisible = true
                input.parent[7]:setRate(actor:mpRate(), 0)
                input.parent[8].isVisible = true
                input.parent[9].isVisible = true
                input.parent[9]:setText(actor:mp())

                if actor.hyper then
                    input.parent[10].isVisible = false

                    input.parent[11].isVisible = true
                    input.parent[11]:setRate(1 - actor:tpRate(), 0)
                else
                    input.parent[10].isVisible = true
                    input.parent[10]:setRate(actor:tpRate(), 0)

                    input.parent[11].isVisible = false
                end
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false
                input.parent[6].isVisible = false
                input.parent[7].isVisible = false
                input.parent[8].isVisible = false
                input.parent[9].isVisible = false
                input.parent[10].isVisible = false
            end

        end
    })
    
    function statusScrollView:refreshNumbers(input, a)
        for i = 1, #self.items do
            local actor = self:itemAtIndex(i)
            if a == actor then
                local speed = scene:battleSpeed()
                local rectangle = self._collectorGroup[i]
                if input.hp then
                    rectangle[4]:setRate(actor:hpRate(), speed * CONSTANTS.timeBattleGaugeMove)
                    rectangle[6]:setText(actor:hp())
                end

                if input.mp then
                    rectangle[7]:setRate(actor:mpRate(), speed * CONSTANTS.timeBattleGaugeMove)
                    rectangle[9]:setText(actor:mp())
                end

                if input.tp then
                    if actor.hyper then
                        rectangle[10].isVisible = false
                        rectangle[10]:setRate(actor:tpRate(), 0)
    
                        rectangle[11].isVisible = true
                        rectangle[11]:setRate(1 - actor:tpRate(), 0)
                    else
                        rectangle[11].isVisible = false
                        rectangle[11]:setRate(1 - actor:tpRate(), 0)

                        rectangle[10].isVisible = true
                        rectangle[10]:setRate(actor:tpRate(), speed * CONSTANTS.timeBattleGaugeMove)
                    end
                end
            end
        end
    end

    function statusScrollView:refreshParty()
        self:setItems({ battleManager.party[1], battleManager.party[2], battleManager.party[3] })
    end
    statusScrollView:refreshParty()

    --10 UI Turn
    --This will be a group to hide easier
    local uiInputGroup = display.newGroup()
    sceneGroup:insert(uiInputGroup)
    uiInputGroup.isVisible = false

    local COMMON = MAIN.UI.COMMON
    local uiInputX = display.contentWidth * 0.8
    local uiInputY = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding * 2
    --10 1 Next
    local nextRect = COMMON.createRectangleWithText({
        parent=uiInputGroup,
        x=uiInputX,
        y=uiInputY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding*2,
        text='Next',
        touch=function()
            battleManager:getNextInputActor()
            self:selectInputActor()
        end
    })

    uiInputY = uiInputY - CONSTANTS.rectangleSpacing - CONSTANTS.lineHeight
    --10 2 Back
    local backRect = COMMON.createRectangleWithText({
        parent=uiInputGroup,
        x=uiInputX,
        y=uiInputY,
        width=display.contentWidth*0.2-CONSTANTS.iconWidth-CONSTANTS.rectanglePadding,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Back',
        touch=function()
            battleManager:getPreviousInputActor()
            self:selectInputActor()
        end
    })

    --10 3 Atk all
    local attackAllRect = CONTAINER.createRectangleGroup({
        parent=uiInputGroup,
        x=display.contentWidth-iconRectangleWidth,
        y=uiInputY,
        width=iconRectangleWidth,
        height=iconRectangleHeight,
        create=function(input)
            --2
            local icon = MAIN.IMAGE.loadIconFrame(CONSTANTS.battleIconAttackAll)
            input.parent:insert(icon)
            icon.x=input.x
            icon.y=input.y
        end,
        refresh=function(input)

        end,
        touch=function()
            targetGroup.isVisible = false

            composer.showOverlay('overlay.battle.attack', {
                isModal = true,
                params = {
                    enemies=battleManager.currentEnemies,
                    pictureGroup=enemyBattlers
                }
            })
        end
    })

    uiInputY = uiInputY - CONSTANTS.rectangleSpacing - CONSTANTS.lineHeight
    --10 4 Formation
    local formationRect = COMMON.createRectangleWithText({
        parent=uiInputGroup,
        x=display.contentWidth*0.8,
        y=uiInputY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Formation',
        touch=function()
            scene:onFormation()
        end
    })
    
    if #battleManager.party <= 3 then
        formationRect:refresh({fontColour=CONSTANTS.textColourInvalid})
        formationRect:enableTouch(false)
    end

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local skillsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local skillsHeight = (display.contentHeight - (CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2) * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5
    uiInputY = uiInputY - skillsHeight + CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing
    --10 5 skills
    CONTAINER.createScrollViewWithRectangles({
        parent=uiInputGroup,
        x=display.contentWidth-skillsWidth,
        y=uiInputY,
        width=skillsWidth,
        height=skillsHeight,
        rows=6,
        columns=1,
        numItems=6,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 skill
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' 999'),
                height=input.height
            })

            --3 Cost
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontColour=CONSTANTS.battleMpColour,
                alignX='right',
                alignY='centre'
            })
        end,
        refresh=function(input)
            local actor = input.parent.scrollView.actor
            if actor then
                local item = input.item
                if item then
                    local fontColour
                    if actor:canUseSkill(input.index) then
                        fontColour = item:isHyper() and CONSTANTS.textColourPink or CONSTANTS.textColour
                    else
                        fontColour = CONSTANTS.textColourInvalid
                    end
                    input.parent[2].isVisible = true
                    input.parent[2]:setItem({icon=item:icon(), name=item:name()}, fontColour)
                    local cost = item:cost()
                    if cost > 0 then
                        input.parent[3].isVisible = true
                        input.parent[3]:setText(cost)
                    else
                        input.parent[3].isVisible = false
                    end
                else
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                end

            end
        end,
        touch=function(input)
            local actor = uiInputGroup[5].actor

            actor:setInputSkill(input.index)
            
            --update target
            battleManager:checkInputSkillTarget()
            uiInputGroup[8]:refresh()

            --skill desc
            uiInputGroup[6]:refresh({ item=input.item })

            --turn order
            turnOrderGroup:refresh()

            --next
            local hasNextInputActor = battleManager:hasNextInputActor()
            local text = hasNextInputActor and 'Next' or 'Fight'
            local canUseSkill = actor:canUseSkill(input.index)
            local fontColour = canUseSkill and CONSTANTS.textColour or CONSTANTS.textColourInvalid

            nextRect:refresh({text=text, fontColour=fontColour})
            nextRect:enableTouch(canUseSkill)
        end
    })

    local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    local descriptionHeight = CONSTANTS.lineHeight * 4 + CONSTANTS.rectanglePadding * 2
    --10 6 skill description
    local descriptionGroup = CONTAINER.createRectangleGroup({
        parent=uiInputGroup,
        x=display.contentWidth-descriptionWidth,
        y=uiInputY-descriptionHeight+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        width=descriptionWidth,
        height=descriptionHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            
            local y =input.y
            --2 item name   
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' lv 7'),
                height=CONSTANTS.lineHeight
            })

            --3 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 7'),
                height=CONSTANTS.lineHeight,
                text='Lv',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --4 skill level
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --5 skill group
            TEXT.drawSkillDetails({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width
            })
        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent[2]:setItem({icon=item:icon(), name=item:name()})

                input.parent[3].isVisible = true
                input.parent[4].isVisible = true
                input.parent[4]:setText(item:level())

                input.parent[5]:setSkill(item)
                
                --we have dynamic targets and effect (vampire drain only), i will manually override the text
                local drain = item.data.drain
                local actorEffect = uiInputGroup[5].actor:skillDrain(item)
                local fontColour = actorEffect == drain and CONSTANTS.textColour or CONSTANTS.textColourGreen
                local text = actorEffect and 'Drain' or item:effect()
                input.parent[5][2]:setText(text, fontColour)

                local target = item:target()
                local actorSkillTarget = uiInputGroup[5].actor:skillTarget(item)
                local fontColour = actorSkillTarget == target and CONSTANTS.textColour or CONSTANTS.textColourGreen
                input.parent[5][3]:setText(CONSTANTS.skillTarget[actorSkillTarget], fontColour)


            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false
            end

        end
    })

    --10 7 turn icon
    local turnIcon = MAIN.IMAGE.loadIconFrame(CONSTANTS.battleIconTurn)
    turnIcon.y = display.contentHeight - CONSTANTS.rectanglePadding - CONSTANTS.lineHeight * 2 - CONSTANTS.iconHeight - CONSTANTS.rectangleSpacing
    uiInputGroup:insert(turnIcon)

    turnIcon.xPositions = {
        display.contentWidth * 0.2 + CONSTANTS.rectanglePadding,
        display.contentWidth * 0.2 + CONSTANTS.rectanglePadding + statusScrollView.width / 3,
        display.contentWidth * 0.2 + CONSTANTS.rectanglePadding + statusScrollView.width * 2 / 3,
    }

    function turnIcon:refresh(inputActor)
        self.x = self.xPositions[inputActor]
    end

    --10 8 targets
    uiInputGroup:insert(targetGroup)

    --10 8 1 enemy group 1 (wave group) 1 (enemy)

    --10 8 2 actor targets
    local actorTargetGroup = display.newGroup()
    targetGroup:insert(actorTargetGroup)

    for i = 1, battleManager:numActivePartyMembers() do
        local actorTarget = createTargetRectangle({
            parent=actorTargetGroup,
            isActor=true,
            x=(display.contentWidth * 0.1 + display.contentWidth * 0.2 * i),
            y=display.contentHeight-CONSTANTS.lineHeight*2.5-CONSTANTS.rectanglePadding*2,
            touch=function()
                battleManager.party[battleManager.inputActor].target = i

                targetGroup:refresh()
            end
        })
    end

    function targetGroup:refresh()
        local actor = battleManager.party[battleManager.inputActor]

        local actorTarget = actor:inputSkillTarget()
        local currentWaveGroup = self[1][battleManager.currentWave]
        if actorTarget <= 6 then
            --hide ally
            self[2].isVisible = false

            --target enemy
            self[1].isVisible = true
            local enemyProvoke
            for i = 1, currentWaveGroup.numChildren do
                local targetGroup = currentWaveGroup[i]
                local enemy = battleManager.currentEnemies[i]
                if not enemy:isDead() then
                    targetGroup.isVisible = true

                    local elementRate = actor:elementRateToTarget(actor:inputSkillObj(), enemy)
                    local isWeak = elementRate > 1
                    local isResist = elementRate < 1

                    if actorTarget == 1 then
                        local canTouch = true
                        local hasStealth = enemy:hasStealth()
                        if enemy:hasProvoke() then
                            enemyProvoke = i
                        end
                        local fontColour = CONSTANTS.textColourPink
                        local text
                        if actor.target == i then
                            text = 'TARGET'
                        elseif hasStealth then
                            text='STEALTH'
                            fontColour=CONSTANTS.textColourInvalid
                            canTouch = false
                        end

                        targetGroup:refreshTarget({
                            text=text,
                            fontColour=fontColour,
                            canTouch=canTouch,
                            isResist=isResist,
                            isWeak=isWeak
                        })
                    elseif actorTarget == 6 then
                        targetGroup:refreshTarget({
                            text='ALL',
                            canTouch=false,
                            isResist=isResist,
                            isWeak=isWeak
                        })
                    else
                        targetGroup:refreshTarget({
                            text='RANDOM',
                            canTouch=false,
                            isResist=isResist,
                            isWeak=isWeak
                        })
                    end

                else
                    targetGroup.isVisible = false
                end
            end

            if enemyProvoke then
                for i = 1, currentWaveGroup.numChildren do
                    local targetGroup = currentWaveGroup[i]
                    local enemy = battleManager.currentEnemies[i]
                    if not enemy:isDead() then
                        local elementRate = actor:elementRateToTarget(actor:inputSkillObj(), enemy)
                        local isWeak = elementRate > 1
                        local isResist = elementRate < 1
                        
                        targetGroup:refreshTarget({
                            text=(enemyProvoke == i and 'PROVOKE' or nil),
                            fontColour=CONSTANTS.textColourPink,
                            canTouch=false,
                            isResist=isResist,
                            isWeak=isWeak
                        })
                    end
                end
            end

        else
            --target ally
            self[2].isVisible = true
            for i = 1, self[2].numChildren do
                local targetGroup = self[2][i]
                if not battleManager.party[i]:isDead() then
                    targetGroup.isVisible = true
                    if actorTarget == 7 then
                        targetGroup:refreshTarget({
                            text=(actor.target == i and 'TARGET' or nil),
                            canTouch=true,
                            isResist=false,
                            isWeak=false
                        })
                    elseif actorTarget == 8 then
                        targetGroup:refreshTarget({
                            text='ALL',
                            canTouch=false,
                            isResist=false,
                            isWeak=false
                        })
                    else
                        local isSelf = actor == battleManager.party[i]
                        if isSelf then
                            targetGroup:refreshTarget({
                                text='SELF',
                                canTouch=false,
                                isResist=false,
                                isWeak=false
                            })
                        else
                            targetGroup.isVisible = false
                        end
                    end
                else
                    targetGroup.isVisible = false
                end
            end

            --hide enemy
            self[1].isVisible = false
            for i = 1, currentWaveGroup.numChildren do
                currentWaveGroup[i][2].isVisible = false
            end

        end
    end

    --11 formation group
    local formationGroup = display.newGroup()
    sceneGroup:insert(formationGroup)

    formationGroup.select = 0
    function formationGroup:onSelect()
        if self.select == 0 then
            self.select = self[4].currentIndex
            self[4]:refreshAtIndex(self.select)
            self[1]:enable(true, 'Swap')
            self[2]:enable(true)
        else
            local currentIndex = self[4].currentIndex - 1
            local selectIndex = self.select - 1

            if selectIndex ~= currentIndex then
                local selectActor = battleManager.party[selectIndex]
                local currentActor = battleManager.party[currentIndex]

                battleManager.party[selectIndex] = currentActor
                battleManager.party[currentIndex] = selectActor

                self[4].items[selectIndex + 1] = currentActor
                self[4].items[currentIndex + 1] = selectActor

                self[4]:refreshAtIndex(selectIndex + 1)
                self[4]:refreshAtIndex(currentIndex + 1)

                local actorPictures = sceneGroup[1]
                local backupIndex
                for i = 1, actorPictures.numChildren do
                    if i == selectIndex or i == currentIndex then
                        if backupIndex then
                            local backupPicture = actorPictures[backupIndex]
                            local currentPicture = actorPictures[i]
                            
                            actorPictures:insert(backupIndex, currentPicture)
                            actorPictures:insert(i+1, backupPicture)
                            break
                        else
                            backupIndex = i
                        end
                    end
                end

                statusScrollView:refreshParty()
                battleManager:refreshTurnOrder()
                turnOrderGroup:refresh()
            end

            self:onBack()
        end

    end

    function formationGroup:onBack()
        if self.select == 0 then
            scene:formationCancel()
        else
            sceneGroup[1][self[4].currentIndex - 1].isVisible = false

            local currentSelect = self.select
            self.select = 0
            self[4]:refreshAtIndex(currentSelect)
            self[4]:select(0)
            self[5]:refresh()
            self[1]:enable(false, 'Select')
            self[2]:enable(false)
            for i = 1, sceneGroup[1].numChildren do
                sceneGroup[1][i].isVisible = false
            end

        end
    end

    function formationGroup:onCancel()
        scene:formationCancel()
    end

    local formationX = display.contentWidth * 0.8
    local formationY = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding * 2
    --11 1 Select
    local formationSelectRect = COMMON.createRectangleWithText({
        parent=formationGroup,
        x=formationX,
        y=formationY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding*2,
        text='Select',
        touch=function()
            formationGroup:onSelect()
        end
    })

    function formationSelectRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end

    formationY = formationY - CONSTANTS.rectangleSpacing - CONSTANTS.lineHeight
    --11 2 Back
    local formationBackRect = COMMON.createRectangleWithText({
        parent=formationGroup,
        x=formationX,
        y=formationY,
        width=display.contentWidth*0.2-CONSTANTS.iconWidth-CONSTANTS.rectanglePadding,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Back',
        touch=function()
            formationGroup:onBack()
        end
    })

    function formationBackRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end

    formationY = formationY - CONSTANTS.rectangleSpacing - CONSTANTS.lineHeight
    --11 3 Cancel Formation
    local formationCancelRect = COMMON.createRectangleWithText({
        parent=formationGroup,
        x=display.contentWidth*0.8,
        y=formationY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Return',
        touch=function()
            formationGroup:onCancel()
        end
    })

    formationY = formationY - skillsHeight + CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing
    --11 4 members
    local formationPartyScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=formationGroup,
        x=display.contentWidth-skillsWidth,
        y=formationY,
        width=skillsWidth,
        height=skillsHeight,
        rows=6,
        columns=1,
        numItems=6,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            if input.index == 1 then
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height,
                    text='Party',
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })
            else
                --2 actor name
                TEXT.drawItemName({
                    parent=input.parent,
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height
                })
            end


        end,
        refresh=function(input)
            if input.index > 1 then
                local item = input.item
                if item then
                    local isAlive = not item:isDead()
                    local fontColour
                    if isAlive then
                        fontColour = input.index == formationGroup.select and CONSTANTS.textColourPink or CONSTANTS.textColour
                    else
                        fontColour = CONSTANTS.textColourInvalid
                    end

                    input.parent[2].isVisible = true
                    input.parent[2]:setItem({icon=MAIN.DATA.ITEM.getItem(2, 10 + item.id).icon,name=item.name}, fontColour)
                    input.parent:enableTouch(isAlive)
                else
                    input.parent[2].isVisible = false
                    input.parent:enableTouch(false)
                end
            else
                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            for i = 1, sceneGroup[1].numChildren do
                sceneGroup[1][i].isVisible = i == input.index - 1
            end
            
            formationGroup[5]:refresh({ item=input.item })
            formationGroup[1]:enable(true, formationGroup.select == 0 and 'Select' or 'Swap')
        end
    })


    --11 5 formation actor description
    local formationDescriptionGroup = CONTAINER.createRectangleGroup({
        parent=formationGroup,
        x=display.contentWidth-descriptionWidth,
        y=uiInputY-descriptionHeight+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        width=descriptionWidth,
        height=descriptionHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local x = input.x
            local y = input.y
            local width = input.width - CONSTANTS.faceWidth
            --2 face
            local faceGroup = display.newGroup()
            input.parent:insert(faceGroup)
            faceGroup.coords = {
                x=x,
                y=y
            }
                
            x = x + CONSTANTS.faceWidth
            --3 name
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=CONSTANTS.lineHeight,
                text='',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --4
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='HP',
                fontColour=CONSTANTS.textColourPink
            })

            --5 current hp
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width-TEXT.textWidth('/999'),
                height=input.height,
                text='',
                alignX='right'
            })

            --6 max hp
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='',
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            --7
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='MP',
                fontColour=CONSTANTS.textColourPink
            })

            --8 current mp
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width-TEXT.textWidth('/999'),
                height=input.height,
                text='',
                alignX='right'
            })

            --9 max mp
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='',
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            --10
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='TP',
                fontColour=CONSTANTS.textColourPink
            })

            --11 current tp
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width-TEXT.textWidth('/100'),
                height=input.height,
                text='',
                alignX='right'
            })

            --12 max tp
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='',
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            --13
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='Speed',
                fontColour=CONSTANTS.textColourPink
            })

            --14 speed
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=width,
                height=input.height,
                text='',
                alignX='right'
            })


            --[[
            local iconX = input.x + CONSTANTS.faceWidth - CONSTANTS.iconWidth - CONSTANTS.iconPadding
            local iconY = input.y
            local loadIconFrame = MAIN.IMAGE.loadIconFrame
            --15 rank icon
            local rank = loadIconFrame(1)
            container:insert(rank)
            rank.x = iconX
            rank.y = iconY

            --16 rating icon
            local rating = loadIconFrame(1)
            container:insert(rating)
            rating.x = iconX
            rating.y = iconY + CONSTANTS.iconHeight + CONSTANTS.iconPadding
            ]]

        end,
        refresh=function(input)
            local item = input.item
            if item then
                --2 face
                input.parent[2].isVisible = true
                while input.parent[2].numChildren > 0 do
                    input.parent[2][1]:removeSelf()
                end
                local faceImage = MAIN.IMAGE.loadFacePicture(item.face)
                faceImage.x = input.parent[2].coords.x
                faceImage.y = input.parent[2].coords.y
                input.parent[2]:insert(faceImage)
                
                --3 name
                input.parent[3].isVisible = true
                input.parent[3]:setText(item.name)

                input.parent[4].isVisible = true
                --5 current hp
                input.parent[5].isVisible = true
                input.parent[5]:setText(item:hp())

                --6 max hp
                input.parent[6].isVisible = true
                input.parent[6]:setText('/' .. item:maxHp())

                input.parent[7].isVisible = true
                --8 current mp
                input.parent[8].isVisible = true
                input.parent[8]:setText(item:mp())

                --9 max mp
                input.parent[9].isVisible = true
                input.parent[9]:setText('/' .. item:maxMp())

                input.parent[10].isVisible = true
                --11 current tp
                input.parent[11].isVisible = true
                input.parent[11]:setText(item.tp)

                --12 max tp
                input.parent[12].isVisible = true
                input.parent[12]:setText('/' .. item:maxTp())

                input.parent[13].isVisible = true
                --14 speed
                input.parent[14].isVisible = true
                input.parent[14]:setText(item.speed)

                --[[
                --15 rank
                input.parent[15].isVisible = true
                input.parent[15].fill.frame = CONSTANTS.rankIcon[item:rank()]
                
                --16 rating
                input.parent[16].isVisible = true
                input.parent[16].fill.frame = CONSTANTS.ratingIcon[item:rating()]
                ]]

            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false
                input.parent[6].isVisible = false
                input.parent[7].isVisible = false
                input.parent[8].isVisible = false
                input.parent[9].isVisible = false
                input.parent[10].isVisible = false
                input.parent[11].isVisible = false
                input.parent[12].isVisible = false
                input.parent[13].isVisible = false
                input.parent[14].isVisible = false
                --[[
                input.parent[15].isVisible = false
                input.parent[16].isVisible = false
                ]]
            end
        end
    })

    formationGroup.isVisible = false

    --12 message
    local messageGroup = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth*0.4,
        y=(display.contentHeight-(CONSTANTS.lineHeight*1.5+CONSTANTS.rectanglePadding*2))*0.5,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight*1.5+CONSTANTS.rectanglePadding*2,
        text='',
        fontColour=CONSTANTS.textColour
    })

    function messageGroup:startMessage(message, onComplete)
        self:refresh(message)
        self.alpha = 1
        self.isVisible = true

        local speed = scene:battleSpeed()
        local time = CONSTANTS.timeBattleMessage * (1 / speed)

        transition.fadeOut(messageGroup, { time=time, transition=easing.inExpo, onComplete=function()
            self.isVisible = false
            onComplete()
        end})
    
        --[[
        transition.to(messageGroup, { alpha=1, time=CONSTANTS.timeBattleMessage*0.5, onComplete=function()
            transition.fadeOut(messageGroup, { time=CONSTANTS.timeBattleMessage, onComplete=function()
                messageGroup.isVisible = false
                scene:startInput()
            end})
        end})]]

    end

    messageGroup.isVisible = false

    local rotateEffectIcons = function()
        --enemies
        for i = 1, #battleManager.currentEnemies do
            local enemy = battleManager.currentEnemies[i]
            if not enemy:isDead() then
                local effectIconObj = effectIcons[1][battleManager.currentWave][i]
                local allIcons = enemy.effectIcons
                if #allIcons > 0 then
                    effectIconObj.current = (effectIconObj.current % #allIcons) + 1
                    local currentEffect = allIcons[effectIconObj.current]
                    effectIconObj.group[1].fill.frame = currentEffect.icon
                    effectIconObj.group[2]:setText(currentEffect.turn)
                else
                    effectIconObj.current = 1
                    effectIconObj.group[1].fill.frame = 1
                    effectIconObj.group[2]:setText('')
                end
            end
        end

        --allies
        for i = 1, 3 do
            local actor = statusScrollView:itemAtIndex(i)
            local effectIconObj = effectIcons[2][i]
            if actor then
                if not actor:isDead() then
                    local allIcons = actor.effectIcons
                    if #allIcons > 0 then
                        effectIconObj.current = (effectIconObj.current % #allIcons) + 1
                        local currentEffect = allIcons[effectIconObj.current]
                        effectIconObj.group[1].fill.frame = currentEffect.icon
                        effectIconObj.group[2]:setText(currentEffect.turn)
                    else
                        effectIconObj.current = 1
                        effectIconObj.group[1].fill.frame = 1
                        effectIconObj.group[2]:setText('')
                    end
                end
            else
                effectIconObj.current = 1
                effectIconObj.group[1].fill.frame = 1
                effectIconObj.group[2]:setText('')
            end
        end
    end

    --This isnt affected by battle speed unfortunatnely
    timer.performWithDelay(1000, function(event)
        if scene.view then
            rotateEffectIcons()
        else 
            timer.cancel(event.source)
        end
    end, -1, 'effectIcons')
end
 
function scene:returnFromAllAttack(target)
    local sceneGroup = self.view

    sceneGroup[10][8].isVisible = true

    if target > 0 then
        local numActivePartyMembers = battleManager:numActivePartyMembers()
        for i = 1, numActivePartyMembers do
            --assume attack is always on slot one
            battleManager.party[i].inputSkill = 1
            battleManager.party[i].target = target
            battleManager:checkInputSkillTarget()
        end

        --turn order group
        sceneGroup[5]:refresh()

        battleManager.inputActor = numActivePartyMembers
        self:startTurn()
    end
end

--scene functions to call battle manager

function scene:setupBattle()
    local sceneGroup = self.view
    
    local currentWave = battleManager.currentWave
    --show enemies
    for i = 1, currentWave do
        sceneGroup[2][i].isVisible = i == currentWave
    end

    --need to refresh this
    sceneGroup[3]:refresh({currentWave=currentWave, waves=battleManager.waves, turn=1})

    sceneGroup[4]:refresh({text='Turn 1', fontColour=CONSTANTS.textColourPink})

    sceneGroup[9]:select(0)
    
    --hide ui input
    sceneGroup[10].isVisible = false
    --clear turn order
    sceneGroup[5]:clear()

    --close overlay if in
    composer.hideOverlay()
    
    --Start fade in
    MAIN.UTILITY.sceneFadeIn({
        onComplete=function()
            scene:startBattle() 
        end
    })

end

function scene:startBattle()
    local sceneGroup = self.view

    local messageGroup = sceneGroup[12]
    messageGroup:startMessage({text='Wave ' .. battleManager.currentWave, fontColour=CONSTANTS.textColour}, function()
        self:startInput()
    end)

    battleManager:startBattle()
end

function scene:startInput()
    battleManager:startInput()

    local sceneGroup = self.view
    --refresh turn window
    local turn = battleManager.turn
    sceneGroup[3]:refresh({turn=turn})

    --refresh party window
    sceneGroup[9]:refreshParty()

    --add turn line
    sceneGroup[4]:addLog({text='Turn ' .. turn, fontColour=CONSTANTS.textColourPink })

    --refresh turn order window - dont need this as it will select a skill and refresh
    --sceneGroup[5]:refresh()

    --realign actor pictures incase of reserve swap
    sceneGroup[1]:realignActors()

    --enable exit
    sceneGroup[8]:enableTouch(true)

    --refresh auto as options may update auto
    local autoBattle = self:autoBattle()
    sceneGroup[7]:refresh({autoBattle=autoBattle}) 

    if autoBattle == 2 then
        battleManager:doAutoBattle()
        self:startTurn()
    else
        self:getNextInputActor()
    end
end

function scene:getNextInputActor()
    battleManager:getNextInputActor()
    self.view[10].isVisible = true
    self:selectInputActor()
end

function scene:selectInputActor()
    local inputActor = battleManager.inputActor
    if inputActor <= battleManager:numActivePartyMembers() then
        local sceneGroup = self.view

        --show actor
        sceneGroup[1].isVisible = true
        for i = 1, sceneGroup[1].numChildren do
            sceneGroup[1][i].isVisible = i == inputActor
        end

        local uiInputGroup = sceneGroup[10]
        uiInputGroup.isVisible = true

        --2 back
        local canGoBack = battleManager:hasPreviousInputActor()
        local backFontColour = canGoBack and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        uiInputGroup[2]:refresh({text='Back', fontColour=backFontColour})
        uiInputGroup[2]:enableTouch(canGoBack)

        --7 turn icon
        uiInputGroup[7]:refresh(inputActor)

        --5 skills
        local actor = battleManager.party[inputActor]
        uiInputGroup[5].actor = actor
        uiInputGroup[5]:setItems(actor.skills)
        local inputSkill = actor.inputSkill
        uiInputGroup[5]:selectAndCall(inputSkill > 0 and inputSkill or 1)

    else
        self:startTurn()
    end
end

function scene:onFormation()
    local sceneGroup = self.view

    --reset turn order icon
    battleManager.inputActor = 0
    sceneGroup[5]:refresh()

    --hide ui
    sceneGroup[10].isVisible = false

    --show formation ui
    sceneGroup[11].isVisible = true
    sceneGroup[11].select = 0
    --create a dummy to start party at items
    local items = { -1 }
    local counter = 2

    for i = 1, #battleManager.party do
        items[counter] = battleManager.party[i]
        counter = counter + 1
    end

    for i = 1, sceneGroup[1].numChildren do
        sceneGroup[1][i].isVisible = false
    end
    
    sceneGroup[11][1]:enable(false, 'Select')
    sceneGroup[11][2]:enable(false)
    sceneGroup[11][4]:setItems(items)
    sceneGroup[11][4]:select(0)
    sceneGroup[11][5]:refresh()
end

function scene:formationCancel()
    local sceneGroup = self.view

    sceneGroup[11].isVisible = false

    self:getNextInputActor()
end

function scene:startTurn()
    local sceneGroup = self.view

    --Actors
    sceneGroup[1].isVisible = false

    --Ui input
    sceneGroup[10].isVisible = false

    --log
    sceneGroup[4]:addLog()

    --turn order
    sceneGroup[5]:refresh()

    --disable escape as there is bug to escape when results are playing
    sceneGroup[8]:enableTouch(false)

    battleManager:startTurn()

    scene:processTurn()
end

function scene:performAction(actingBattler, skill, targets, isFollowup)
    --arenaChallenges
    if battleManager.arenaChallenges and actingBattler.isActor and not isFollowup then
        for i = 1, #battleManager.arenaChallenges do
            if battleManager.arenaChallenges[i].type == 'skill' then
                battleManager.arenaChallenges[i]:checkCondition(actingBattler, skill, targets[1], battleManager)
            end
        end
    end

    local sceneGroup = self.view

    --edit targets
    if actingBattler.isActor and actingBattler.editTargetsSelf then
        targets = actingBattler:editTargetsSelf(actingBattler, skill, targets, battleManager)
    end

    if not actingBattler.isActor and skill:target() <= 6 then 
        local aliveMembers = battleManager:aliveMembers(true)
        for i = 1, #aliveMembers do 
            if aliveMembers[i].editTargetsParty then
                targets = aliveMembers[i]:editTargetsParty(actingBattler, skill, targets, battleManager)
            end
        end
    end

    if #targets > 0 then
        --1 - normal, 2 - fast
        local speed = self:battleSpeed()
        --perform action
        local actionDelay = CONSTANTS.timeBattleActionDelay * (1 / speed)

        --if actor select status, else flash white enemy
        --maybe save index so can identify better
        local statusScrollView = sceneGroup[9]
        if actingBattler.isActor then
            for i = 1, #statusScrollView.items do
                if statusScrollView:itemAtIndex(i) == actingBattler then
                    statusScrollView:select(i)
                    break
                end
            end
        else
            local enemyImage
            for i = 1, #battleManager.currentEnemies do
                if battleManager.currentEnemies[i] == actingBattler then
                    enemyImage = sceneGroup[2][battleManager.currentWave][i][1]
                    break
                end
            end

            --enemyImage.blendMode = 'multiply'
            enemyImage:setFillColor(0.7, 0.7, 0.7, 1)
            timer.performWithDelay(actionDelay, function()
                enemyImage:setFillColor(1, 1, 1, 1)
                --enemyImage.blendMode = 'normal'
            end)
        end

        timer.performWithDelay(actionDelay, function()
            local currentAction = skill
            --local targets = battleManager:actingBattlerActionTarget()

            --START ACTION
            local log = actingBattler.name
            if actingBattler.letter then
                log = log .. ' ' .. actingBattler.letter
            end
            if skill:log() then
                log = log .. ' ' .. skill:log()
            else
                log = log .. ' uses ' .. currentAction:name() .. '!'
            end

            sceneGroup[4]:addLog({ text=log, fontColour=CONSTANTS.textColour })
            if actingBattler.isActor then
                --dont pay cost for followup actions
                if not isFollowup then
                    actingBattler:payCost(currentAction)
                end
                sceneGroup[9]:refreshNumbers({ mp=true, tp=true }, actingBattler)
            end

            --PLAY ANIMATION
            local animationData = MAIN.DATA.ANIMATION.getAnimation(currentAction:animation())
            local animationCount = animationData.position == 'screen' and 1 or #targets

            local animationSheet = MAIN.IMAGE.loadAnimationSheet(animationData.name, animationData.sheet)
            local totalAnimationTime = animationData.sequence.time * (1 / speed) + CONSTANTS.timeBattleAnimationDelay * animationCount
            timer.performWithDelay(CONSTANTS.timeBattleAnimationDelay, function(event)
                local animation = display.newSprite(sceneGroup, animationSheet, animationData.sequence)
                if event.count == 1 and animationData.position == 'screen' then
                    --center of screen
                    animation.x = display.contentCenterX
                    animation.y = display.contentCenterY
                else
                    local target = targets[event.count]
                    
                    if target.isActor then
                        --find index of actor, maybe should be a function somewhere
                        animation.y = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding * 2
                        local actors = battleManager:activePartyMembers(true)
                        for i = 1, #actors do
                            if target == actors[i] then
                                animation.x = display.contentWidth * 0.1 + display.contentWidth * 0.2 * i
                                break
                            end
                        end
                    else
                        animation.x = target.pictureX
                        animation.y = target.pictureY
                    end
                end

                animation.timeScale = speed

                local animationEnd = function(event)
                    if event.phase == 'ended' then
                        event.target:removeSelf()
                        animation = nil
                    end
                end
                animation:addEventListener('sprite', animationEnd)

                animation:play()

            end, animationCount)

            --ON ANIMATION END
            timer.performWithDelay(totalAnimationTime, function()
                --APPLY DAMAGE PER TARGET
                local timePerPopup = CONSTANTS.timeBattlePopup * (1 / speed)
                local totalDamageTime = 0 --CONSTANTS.timeBattlePopup * (1 / speed) * #targets

                --gain tp when using skill, do this here as we only want it one per action
                --local actingBattler = battleManager:actingBattler()
                if actingBattler.isActor then
                    local skillDamage = skill:damage()
                    local t = skill:type()
                    if t == 3 then
                        if skillDamage then
                            actingBattler:gainTpForHeal()
                        end
                    else
                        if skillDamage then
                            actingBattler:gainTpForAttack()
                        end
                    end
                end

                for i = 1, #targets do 
                    local target = targets[i]

                    local result = battleManager:performAction(actingBattler, skill, target, isFollowup)

                    --arenaChallenges
                    if battleManager.arenaChallenges and actingBattler.isActor and not isFollowup then
                        for i = 1, #battleManager.arenaChallenges do
                            if battleManager.arenaChallenges[i].type == 'result' then
                                battleManager.arenaChallenges[i]:checkCondition(actingBattler, skill, target, battleManager)
                            end
                        end
                    end

                    if result then
                        timer.performWithDelay(totalDamageTime, function()
                            scene:showResult(target, result.target)

                            --need this for drain
                            scene:showResult(actingBattler, result.acting)
                        end)

                        totalDamageTime = totalDamageTime + timePerPopup 
                    end
                end

                --there seems to be an issue of tp not moving after attacks
                if actingBattler.isActor then
                    sceneGroup[9]:refreshNumbers({ tp=true }, actingBattler)
                end

                totalDamageTime = totalDamageTime + timePerPopup 

                timer.performWithDelay(totalDamageTime, function()
                    battleManager:completeAction(actingBattler, skill, targets, isFollowup)

                    scene:checkEndBattle()
                end)
            end)
        end)
    else
        battleManager:completeAction(actingBattler, skill, targets, isFollowup)

        scene:checkEndBattle()
    end
end

function scene:processTurn()
    local sceneGroup = self.view
    
    sceneGroup[9]:select(0)

    local actingBattler = battleManager:getNextActingBattler()
    if actingBattler then
        sceneGroup[5]:shift()

        if actingBattler:canMove() then
            local skill = actingBattler:inputSkillObj()
            local targets = battleManager:actingBattlerActionTarget()
            self:performAction(actingBattler, skill, targets)
        else
            self:processTurn()
        end
    else
        self:endTurn()
    end
end

function scene:processFollowUps()
    local followup = table.remove(battleManager.followUps, 1)

    if followup.actingBattler:canMove() then
        local targets = {}
        local counter = 1
        --ignore dead targets 
        for i = 1, #followup.targets do
            if not followup.targets[i]:isDead() then
                targets[counter] = followup.targets[i]
                counter = counter + 1
            end
        end

        if targets[1] then
            self:showResult(followup.actingBattler, { followup=true })
    
            self:performAction(followup.actingBattler, followup.skill, targets, true)
        else
            self:checkEndBattle()
        end
    else
        self:checkEndBattle()
    end
end

function scene:newDamagePopup(damage, x, y)
    local sceneGroup = self.view

    local damageGroup = display.newGroup()
    sceneGroup:insert(damageGroup)

    local TEXT = MAIN.UI.TEXT
    local fontSize = CONSTANTS.fontSizeDamage

    if damage.followup then
        local followWidth = TEXT.textWidth('FOLLOWUP', fontSize)
        TEXT.drawText({
            parent=damageGroup,
            x=-followWidth*0.5,
            y=0,
            width=followWidth,
            height=CONSTANTS.textHeight,
            text='FOLLOWUP',
            fontSize=fontSize,
            fontColour=CONSTANTS.textColourYellow,
            alignX='centre',
            paddingX=0
        })
    elseif damage.value then
        local damageFontColour = damage.isCrit and CONSTANTS.textColourPink or CONSTANTS.textColour
        if damage.isHeal then
            damageFontColour = CONSTANTS.textColourGreen
        elseif damage.isMp then
            damageFontColour = CONSTANTS.battleMpColour
        end
        
        --1 damage
        local damageWidth = TEXT.textWidth(damage.value, fontSize)
        local damageText = TEXT.drawText({
            parent=damageGroup,
            x=-damageWidth*0.5,
            y=0,
            width=damageWidth,
            height=CONSTANTS.textHeight,
            text=damage.value,
            fontSize=fontSize,
            fontColour=damageFontColour,
            alignX='centre',
            paddingX=0
        })

        --2 weak/ resist
        local text, fontColour
        if damage.isWeak then
            text = 'WEAK'
            fontColour = CONSTANTS.textColourGreen
        elseif damage.isResist then
            text = 'RESIST'
            fontColour = CONSTANTS.textColourRed
        end

        if text then
            local textWidth = TEXT.textWidth(text, fontSize)
            TEXT.drawText({
                parent=damageGroup,
                x=-textWidth*0.5,
                y=-damageText[1].height,
                width=weakWidth,
                text=text,
                fontSize=fontSize,
                fontColour=fontColour,
                alignX='centre',
                paddingX=0
            })
        end
    elseif damage.isEvade then
        --1 Evade
        local evadeWidth = TEXT.textWidth('EVADE', fontSize)
        TEXT.drawText({
            parent=damageGroup,
            x=-evadeWidth*0.5,
            y=0,
            width=evadeWidth,
            height=CONSTANTS.textHeight,
            text='EVADE',
            fontSize=fontSize,
            fontColour=CONSTANTS.textColourYellow,
            alignX='centre',
            paddingX=0
        })
    end

    return damageGroup
end

function scene:showResult(target, result)
    if result then
        local sceneGroup = self.view

        local speed = scene:battleSpeed()

        local delayTime = 0

        local x, y
        local displace = CONSTANTS.lineHeight

        --setup location
        if target.isActor then
            y = display.contentHeight - CONSTANTS.rectanglePadding - CONSTANTS.lineHeight * 2 - CONSTANTS.iconHeight - CONSTANTS.rectangleSpacing - displace
            for i = 1, #sceneGroup[9].items do
                if sceneGroup[9]:itemAtIndex(i) == target then
                    x = display.contentWidth * 0.1 + display.contentWidth * 0.2 * i
                    break
                end
            end
            sceneGroup[9]:refreshNumbers({ hp=true, mp=true, tp=true }, target)
        else
            x = target.pictureX
            y = target.pictureY - displace

            for i = 1, #battleManager.currentEnemies do
                if target == battleManager.currentEnemies[i] then
                    sceneGroup[2][battleManager.currentWave][i][2]:setRate(target:hpRate(), speed * CONSTANTS.timeBattleGaugeMove)
                    break
                end
            end
        end
        local time = CONSTANTS.timeBattlePopup * (1 / speed)

        if result.followup then
            local damagePopup = self:newDamagePopup({ followup=true })
            damagePopup.x = x
            damagePopup.y = y

            transition.to(damagePopup, { time=time*0.5, y=y+displace, transition=easing.outInBack, onComplete=function()
                transition.fadeOut(damagePopup, { time=time, transition=easing.inExpo, onComplete=function()
                    damagePopup:removeSelf()
                    damagePopup = nil
                end})
            end})

            return
        end

        --show damage
        if result.damage then
            --show popup
            local damagePopup = self:newDamagePopup(result.damage)
            damagePopup.x = x
            damagePopup.y = y

            timer.performWithDelay(delayTime, function()
                transition.to(damagePopup, { time=time*0.5, y=y+displace, transition=easing.outInBack, onComplete=function()
                    transition.fadeOut(damagePopup, { time=time, transition=easing.inExpo, onComplete=function()
                        damagePopup:removeSelf()
                        damagePopup = nil
                    end})
                end})
            end)

            delayTime = delayTime + time * 1.5

            --show log
            local message = target.name
            if target.letter then
                message = message .. ' ' .. target.letter
            end
            if result.damage.isHeal then
                message = message .. ' recovers ' .. result.damage.value .. ' hp!'
            elseif result.damage.isEvade then
                message = message .. ' evaded the attack!'
            elseif result.damage.value then
                message = message .. ' takes ' .. result.damage.value .. ' damage!'
                if result.damage.isCrit then
                    message = 'It\'s a critical! ' .. message
                end
            else
                message = nil
            end
            if message then
                sceneGroup[4]:addLog({ text=message })
            end

            --Darken turn order icon if cant move
            if not target:canMove() then
                for i = 2, sceneGroup[5].numChildren - 1 do
                    if sceneGroup[5][i][2].battler == target then
                        sceneGroup[5][i][2][5].isVisible = true
                        break
                    end
                end
            end
        end

        if not target:isDead() then
            if result.effects then
                local effectCount = #result.effects
                local time = CONSTANTS.timeBattlePopup * (1 / speed) * 1.5 / effectCount
                for i = 1, effectCount do
                    timer.performWithDelay((i - 1) * time, function()
                        sceneGroup[4]:addLog({ text=result.effects[i] })
                    end)
                end
            end

            --show regenerate, its for heals after taking damage, maybe it should be under drain
            if result.regenerate then
                if result.regenerate.hp then
                    delayTime = time * 1.5
        
                    local damagePopup = self:newDamagePopup({
                            value=result.regenerate.hp,
                            isHeal=true
                    })
                    damagePopup.x = x
                    damagePopup.y = y
        
                    timer.performWithDelay(delayTime, function()
                        transition.to(damagePopup, { time=time*0.5, y=y+displace, transition=easing.outInBack, onComplete=function()
                            transition.fadeOut(damagePopup, { time=time, transition=easing.inExpo, onComplete=function()
                                damagePopup:removeSelf()
                                damagePopup = nil
                            end})
                        end})
                    end)

                    delayTime = delayTime + time * 1.5
            
                    sceneGroup[4]:addLog({ text=target.name .. ' regenerates ' .. result.regenerate.hp .. ' hp!' })
                end
        
                if result.regenerate.mp then
                    local damagePopup = self:newDamagePopup({
                            value=result.regenerate.mp,
                            isMp=true
                    })
                    damagePopup.x = x
                    damagePopup.y = y
        
                    timer.performWithDelay(delayTime, function()
                        transition.to(damagePopup, { time=time*0.5, y=y+displace, transition=easing.outInBack, onComplete=function()
                            transition.fadeOut(damagePopup, { time=time, transition=easing.inExpo, onComplete=function()
                                damagePopup:removeSelf()
                                damagePopup = nil
                            end})
                        end})
                    end)
            
                    sceneGroup[4]:addLog({ text=target.name .. ' regenerates ' .. result.regenerate.mp .. ' mp!' })
                end
            end

        else
            target:clearBuffsDebuffs()
            --DIE
            if not target.isActor then
                local speed = scene:battleSpeed()
                local time = CONSTANTS.timeBattlePopup * (1 / speed)

                --Fade out enemy
                for i = 1, #battleManager.currentEnemies do
                    if target == battleManager.currentEnemies[i] then
                        timer.performWithDelay(time*0.5, function()
                            transition.fadeOut(sceneGroup[2][battleManager.currentWave][i], { time=time, onComplete=function()
                                sceneGroup[2][battleManager.currentWave][i].isVisible = false
                            end})
                        end)
                        break
                    end
                end
            end

            sceneGroup[4]:addLog({text=(target.name .. ' is defeated!')})
        end
    end
end

function scene:checkEndBattle()
    local sceneGroup = self.view
    
    if #battleManager:aliveMembers() == 0 then
        --All enemies defeated
        if battleManager.currentWave == battleManager.waves then
            sceneGroup[4]:enableTouch(false)
            sceneGroup[8]:enableTouch(false)

            composer.setVariable('battleResult', 2)
            composer.hideOverlay()

            local messageGroup = sceneGroup[12]
            messageGroup:startMessage({text='VICTORY', fontColour=CONSTANTS.textColourGreen}, function()
                MAIN.UTILITY.sceneFadeOut({
                    onComplete=function()
                        local quest = composer.getVariable('quest')
                        if quest == 'labyrinth' then
                            MAIN.UTILITY.gotoScene('scene.labyrinth.labyrinth')
                        else
                            local floor = MAIN.PLAYER.QUEST.getStageFloors(composer.getVariable('quest'), composer.getVariable('stage'))[composer.getVariable('floor')]
                            if floor.postBattle then
                                MAIN.UTILITY.gotoScene('scene.dialogue.dialogue')
                            else
                                MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards', {
                                    arenaChallenges=battleManager.arenaChallenges
                                })
                            end
                        end
                    end
                })
            end)
        else
            MAIN.UTILITY.sceneFadeOut({
                onComplete=function()
                    sceneGroup[10][8][1][battleManager.currentWave].isVisible = false

                    sceneGroup[4]:clearLog()

                    battleManager:setNextWave()
                    self:setupBattle()
                end
            })
        end
    elseif #battleManager:aliveMembers(true) == 0 then
        --lazy way to check some reserve members alive
        if (battleManager.party[4] and not battleManager.party[4]:isDead()) or (battleManager.party[5] and not battleManager.party[5]:isDead()) then
            --just end turn and the start input should resolve the reserve swap
            self:endTurn()
        else
            --All members defeated
            sceneGroup[4][2]:enableTouch(false)
            sceneGroup[8]:enableTouch(false)
    
            composer.hideOverlay()
    
            local messageGroup = sceneGroup[12]
            messageGroup:startMessage({text='DEFEAT', fontColour=CONSTANTS.textColourRed}, function()
                MAIN.UTILITY.sceneFadeOut({
                    onComplete=function()
                        if composer.getVariable('quest') == 'labyrinth' then
                            MAIN.UTILITY.gotoScene('scene.labyrinth.labyrinth')
                        else
                            MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
                        end
                    end
                })
            end)

        end

    elseif #battleManager.followUps > 0 then
        self:processFollowUps()
    else
        self:processTurn()
    end
end

function scene:endTurn()
    --resolve regen, buffs, debuffs counters + end of turn stuff
    local results = battleManager:endTurn()
    for i = 1, #results do
        self:showResult(results[i].target, results[i].regenerate)
    end

    scene:startInput()
end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

        if composer.getVariable('quest') ~= 'labyrinth' then
            --Delete all hidden scenes
            composer.removeHidden()
        end

        local UTILITY = MAIN.UTILITY

        UTILITY.updateLowerUiLayer()

        self:setupBattle()
        
        UTILITY.showLoadingLayer(false)
        
       


        --MAIN.UTILITY.gotoScene('scene.battle.rewards.rewards')
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        timer.cancel('effectIcons')
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

        composer.removeScene('scene.battle.battle')
 
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