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

    --1 dialogue
    local dialogueGroup = display.newGroup()
    dialogueGroup.step = 0
    sceneGroup:insert(dialogueGroup)

    dialogueGroup.dialogue = {
        {
            frame=5,
            text='Here\'s the test, hope you\'re prepared.'
        },
        {
            frame=1,
            text='Time starts...'
        },
        {
            frame=8,
            text='Now!'
        }
    }

    function dialogueGroup:startProcessing()
        self[2]:clearDialogue()
        if self.step == 0 then
            self[2]:showMessageBox()
            transition.fadeIn(self[1], { time=CONSTANTS.timeBustFade, onComplete=function()
                dialogueGroup.step = dialogueGroup.step + 1
                dialogueGroup:startProcessing()
            end})
        elseif self.dialogue[self.step] then
            self[1].fill.frame = self.dialogue[self.step].frame

            self[2]:setupDialogue('Penelope', self.dialogue[self.step].text)
            self[2]:startDialogue()
        else
            self[2]:hideMessageBox()
            transition.fadeOut(self[1], { time=CONSTANTS.timeBustFade, onComplete=function()
                local examGroup = sceneGroup[2]
                dialogueGroup:removeSelf()
                examGroup:startExam()
            end})

        end
    end

    --1 1 Bust
    local bust = MAIN.IMAGE.loadBustPicture('Bust_FH_053_03', 5)
    bust.alpha = 0
    bust.x= 275
    bust.y= 45
    dialogueGroup:insert(bust)

    local COMMON = MAIN.UI.COMMON
    --1 2 message
    local messageLayer = COMMON.createMessageGroup({
        parent=dialogueGroup,
        touch=function()
            dialogueGroup.step = dialogueGroup.step + 1
            dialogueGroup:startProcessing()
        end
    })
    
    --2 exam group
    local examGroup = display.newGroup()
    sceneGroup:insert(examGroup)
    examGroup.isVisible = false
    
    examGroup.currentQuestion = 0
    examGroup.answers = {}
    examGroup.hint = 3
    examGroup.cheat = 0
    examGroup.cheatCount = 0
    examGroup.cheatFailed = false
    examGroup.cheatLastUsed = false

    local chooseRandomQuestionType = function()
        return math.floor(math.random() * 4) + 1
    end

    local getRandomActorId = function()
        return CONSTANTS.actorList[math.floor(math.random() * #CONSTANTS.actorList) + 1]
    end

    local allPossibleSkills = {5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25,26,27,28,29,30,31,32,33,34,35,40,41,42,43,44,45,46,47,48,49,50,51,52,53,60,61,62,63,64,65,66,67,68,69,75,76,77,78,79,80,85,86,87,88,95,96,97,98,99,100,101,102,103,110,111,112,113,114,120,121,122,123,124,125,126,127,128,135,136,137,138,139,140,141,142,150,151,152,153,154,155,156,157,158,159,160,165,166,167,168,169,170,171,172,173,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212}
    local allPossibleSkillsLength = #allPossibleSkills

    --generate questions
    for i = 1, 10 do
        --choose type of question
        local randomQuestion = chooseRandomQuestionType()
        local question, choices, correct
        if randomQuestion <= 2 then
            --element
            while true do
                local randomActorId = getRandomActorId()
                local actor = MAIN.DATA.ACTOR.getActor(randomActorId)

                local targetElements = {}
                local otherElements = {}

                local text

                if randomQuestion == 1 then
                    --check weak
                    for i = 1, #actor.elements do
                        if actor.elements[i] > 1 then
                            targetElements[#targetElements + 1] = i
                        else
                            otherElements[#otherElements + 1] = i
                        end
                    end

                    text = 'weak'
                else
                    --check resist
                    for i = 1, #actor.elements do
                        if actor.elements[i] < 1 then
                            targetElements[#targetElements + 1] = i
                        else
                            otherElements[#otherElements + 1] = i
                        end
                    end

                    text = 'resist'
                end

                --need this filter to ignore actors with no weak/resist
                if #targetElements > 0 then
                    local tokenItem = MAIN.DATA.ITEM.getItem(2, 10 + randomActorId)
                    question = {
                        actorIcon=tokenItem.icon,
                        question=(actor.name .. ' is ' .. text .. ' to what element?')
                    }

                    choices = {
                        nil, nil, nil, nil, nil
                    }

                    --get random target element and insert it at random index
                    local randomTargetElement = targetElements[math.floor(math.random() * #targetElements) + 1]
                    correct = math.floor(math.random() * 5) + 1
                    choices[correct] = {
                        icon=CONSTANTS.elementIcons[randomTargetElement],
                        name=CONSTANTS.elementNames[randomTargetElement],
                        isEnabled=true
                    }

                    --fill in other choices with random elements
                    for i = 1, 5 do
                        if i ~= correct then
                            local randomOtherElement = table.remove(otherElements, math.floor(math.random() * #otherElements) + 1)
                            choices[i] = {
                                icon=CONSTANTS.elementIcons[randomOtherElement],
                                name=CONSTANTS.elementNames[randomOtherElement],
                                isEnabled=true
                            }
                        end
                    end

                    break
                end
            end

        elseif randomQuestion == 3 then
            --class
            local randomActorId = getRandomActorId()
            local actor = MAIN.DATA.ACTOR.getActor(randomActorId)

            local tokenItem = MAIN.DATA.ITEM.getItem(2, 10 + randomActorId)
            question = {
                actorIcon=tokenItem.icon,
                question=(actor.name .. ' is of what class?')
            }

            correct = actor.mode

            choices = {}
            for i = 1, #CONSTANTS.modeActors do
                local mode = CONSTANTS.modeActors[i]
                choices[i] = {
                    icon=mode.icon,
                    name=mode.name,
                    isEnabled=true
                }
            end

        else
            --skill
            local randomActorId = getRandomActorId()
            local actor = MAIN.DATA.ACTOR.getActor(randomActorId)

            local tokenItem = MAIN.DATA.ITEM.getItem(2, 10 + randomActorId)
            question = {
                actorIcon=tokenItem.icon,
                question=(actor.name .. ' knows what skill?')
            }

            --get random skill, ignore attack and ulti
            local randomSkillId = actor.skills[math.floor(math.random() * 4) + 2]
            local randomSkill = MAIN.DATA.SKILLS.getSkill(randomSkillId, 1)

            correct = math.floor(math.random() * 5) + 1

            choices = {}
            choices[correct] = {
                icon=randomSkill:icon(),
                name=randomSkill:name(),
                isEnabled=true
            }

            local ownedSkills = {}
            for i = 1, #actor.skills do
                ownedSkills[actor.skills[i]] = true
            end
            
            for i = 1, 5 do
                if i ~= correct then
                    while true do
                        local randomSkill = allPossibleSkills[math.floor(math.random() * allPossibleSkillsLength) + 1]
                        if not ownedSkills[randomSkill] then
                            local skill = MAIN.DATA.SKILLS.getSkill(randomSkill, 1)
                            choices[i] = {
                                icon=skill:icon(),
                                name=skill:name(),
                                isEnabled=true
                            }
                            break
                        end
                    end
                end
            end
        end

        local answer = {
            question=question,
            choices=choices,
            correct=correct,
            cheat=false,
            cheatFailed=false,
            selection=0
        }

        examGroup.answers[i] = answer
    end

    local CONTAINER = MAIN.UI.CONTAINER
    --2 1 question number
    CONTAINER.createRectangleGroup({
        parent=examGroup,
        x=0,
        y=0,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                height=input.height,
                text='Question',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 number
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth('/10'),
                height=input.height,
                text='1',
                alignX='right',
                alignY='centre'
            })

            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='/10',
                alignX='right',
                alignY='centre'
            })
        end,
        refresh=function(input)
            input.parent[3]:setText(input.item)
        end
    })

    local selectHeight = (CONSTANTS.lineHeight + CONSTANTS.rectanglePadding) * 2
    --2 2 Hint desc
    CONTAINER.createRectangleGroup({
        parent=examGroup,
        x=0,
        y=display.contentHeight-selectHeight,
        width=display.contentWidth*0.4,
        height=selectHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Hint',
                fontColour=CONSTANTS.textColourPink
            })

            --3
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=input.y+CONSTANTS.textHeight,
                width=input.width,
                text='Get a hint to eliminate two incorrect choices.\nLimited number of chances.',
                fontSize=CONSTANTS.fontSizeSmall
            })
        end,
        refresh=function(input)

        end
    })

    --2 3 Cheat desc
    CONTAINER.createRectangleGroup({
        parent=examGroup,
        x=display.contentWidth*0.4,
        y=display.contentHeight-selectHeight,
        width=display.contentWidth*0.4,
        height=selectHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Cheat',
                fontColour=CONSTANTS.textColourPink
            })

            --3
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=input.y+CONSTANTS.textHeight,
                width=input.width,
                text='Cheat to get the correct answer. Cheating more often increases chance of getting caught. If caught, question is incorrect and can\'t cheat or hint.',
                fontSize=CONSTANTS.fontSizeSmall
            })
        end,
        refresh=function(input)

        end
    })

    local questionWidth = display.contentWidth * 0.5
    local questionHeight = CONSTANTS.textHeight * 6 + CONSTANTS.rectanglePadding * 2
    --2 4 question
    CONTAINER.createRectangleGroup({
        parent=examGroup,
        x=(display.contentWidth-questionWidth)*0.5,
        y=(display.contentHeight-questionHeight)*0.5,
        width=questionWidth,
        height=questionHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            --3 Actor Icon
            local icon = MAIN.IMAGE.loadIconFrame(1)
            icon.x = input.x + CONSTANTS.textPadding
            icon.y = input.y + CONSTANTS.lineHeight + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
            input.parent:insert(icon)

            --4 Question
            TEXT.drawText({
                parent=input.parent,
                x=input.x+CONSTANTS.iconWidth + CONSTANTS.iconPadding,
                y=input.y+CONSTANTS.lineHeight,
                width=input.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding,
                height=CONSTANTS.lineHeight,
                text='',
                alignY='centre'
            })

        end,
        refresh=function(input)
            input.parent[2]:setText('Question ' .. examGroup.currentQuestion)

            local currentQuestion = examGroup.answers[examGroup.currentQuestion].question
            input.parent[3].fill.frame = currentQuestion.actorIcon
            input.parent[4]:setText(currentQuestion.question)
        end
    })

    local examGroupX = display.contentWidth * 0.8
    local examGroupY = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding * 2
    --2 5 select
    local selectRect = COMMON.createRectangleWithText({
        parent=examGroup,
        x=examGroupX,
        y=examGroupY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding*2,
        text='Select',
        touch=function()
            examGroup.answers[examGroup.currentQuestion].selection = examGroup[8].currentIndex

            examGroup:goToNextQuestion()
        end
    })
    function selectRect:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end

    examGroupY = examGroupY - CONSTANTS.rectangleSpacing - CONSTANTS.lineHeight
    --2 6 hint
    local hintRect = CONTAINER.createRectangleGroup({
        parent=examGroup,
        x=examGroupX,
        y=examGroupY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                height=input.height,
                text='Hint',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=examGroup.hint,
                alignX='right',
                alignY='centre'
            })
        end,
        refresh=function(input)
            local hint = input.hint
            local cheatFailed = input.cheatFailed

            local hasHint = hint > 0 and not cheatFailed
            input.parent[3]:setText(hint, hasHint and CONSTANTS.textColour or CONSTANTS.textColourInvalid)
            input.parent:enableTouch(hasHint)
        end,
        touch=function()
            examGroup:doHint()
        end
    })

    examGroupY = examGroupY - CONSTANTS.rectangleSpacing - CONSTANTS.lineHeight
    --2 7 cheat
    local hintRect = CONTAINER.createRectangleGroup({
        parent=examGroup,
        x=examGroupX,
        y=examGroupY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                height=input.height,
                text='Cheat',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='0%',
                alignX='right',
                alignY='centre'
            })
        end,
        refresh=function(input)
            local hasCheat =  not input.cheatFailed
            if hasCheat then
                input.parent[3]:setText((input.cheat * 100 .. '%'), CONSTANTS.textColour)
            else
                input.parent[3]:setText('CAUGHT!', CONSTANTS.textColourInvalid)
            end
            input.parent:enableTouch(hasCheat)
        end,
        touch=function()
            examGroup:doCheat()
        end
    })

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local answersWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local answersHeight = (display.contentHeight - (CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2) * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5 - CONSTANTS.lineHeight - CONSTANTS.rectangleSpacing
    examGroupY = examGroupY - answersHeight + CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing
    --2 8 answers
    CONTAINER.createScrollViewWithRectangles({
        parent=examGroup,
        x=display.contentWidth-answersWidth,
        y=examGroupY,
        width=answersWidth,
        height=answersHeight,
        rows=5,
        columns=1,
        numItems=5,
        create=function(input)
            --2
            MAIN.UI.TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height
            })
        end,    
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                input.parent:enableTouch(true)

                local fontColour = item.isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                input.parent[2]:setItem(item, fontColour)
            else
                input.parent[2].isVisible = false
                input.parent:enableTouch(false)
            end

        end,
        touch=function(input)
            selectRect:enable(input.item.isEnabled)
        end
    })

    function examGroup:startExam()


        self.isVisible = true

        examGroup:goToNextQuestion()
    end

    function examGroup:goToNextQuestion()
        self.currentQuestion = self.currentQuestion + 1
        if self.currentQuestion <= 10 then
            if not self.cheatLastUsed then
                self.cheat = math.max(0, self.cheat - 0.05)
            else
                self.cheatLastUsed = false
            end

            self[1]:refresh({item=self.currentQuestion})
            self[4]:refresh(self.answers[self.currentQuestion].question)
            self[8]:setItems(self.answers[self.currentQuestion].choices)

            self[5]:enable(false)
            self[6]:refresh({hint=self.hint,cheatFailed=self.cheatFailed})
            self[7]:refresh({cheat=self.cheat,cheatFailed=self.cheatFailed})
        else

            self.isVisible = false
            --this is two because we removed dialogue group
            sceneGroup[2]:showResults()

        end
    end

    function examGroup:doHint()
        self.hint = self.hint - 1
        local currentAnswer = self.answers[self.currentQuestion]
        for i = 1, 2 do
            while true do
                local random = math.floor(math.random() * 5) + 1
                if random ~= currentAnswer.correct and currentAnswer.choices[random].isEnabled then
                    currentAnswer.choices[random].isEnabled = false
                    break
                end
            end
        end

        self[8]:setItems(currentAnswer.choices)

        self[5]:enable(false)
        self[6]:refresh({hint=self.hint,cheatFailed=self.cheatFailed})
        self[6]:enableTouch(false)
    end

    function examGroup:doCheat()
        self.cheatCount = self.cheatCount + 1
        local currentAnswer = self.answers[self.currentQuestion]

        self.cheatLastUsed = true

        --do chance
        local chance = math.random()
        if chance < self.cheat then
            --fail
            self.cheat = 0
            self.cheatFailed = true
            currentAnswer.cheatFailed = true
            currentAnswer.selection = 0

        else
            --do cheat
            currentAnswer.cheat = true
            currentAnswer.selection = currentAnswer.correct

            self.cheat = self.cheat + self.cheatCount * 0.15
        end

        self:goToNextQuestion()
    end

    --3 results group
    local resultsGroup = display.newGroup()
    sceneGroup:insert(resultsGroup)

    resultsGroup.isVisible = false

    --3 1 
    COMMON.createRectangleWithText({
        parent=resultsGroup,
        x=0,
        y=0,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='Results',
        fontColour=CONSTANTS.textColourPink
    })

    --3 2 border
    CONTAINER.createRectangleGroup({
        parent=resultsGroup,
        x=0,
        y=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        width=display.contentWidth-answersWidth,
        height=display.contentHeight-CONSTANTS.lineHeight-CONSTANTS.rectanglePadding*2,
        create=function(input)

        end,
        refresh=function(input)

        end
    })

    --3 3 Answers list
    CONTAINER.createScrollViewWithRectangles({
        parent=resultsGroup,
        x=0,
        y=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        width=display.contentWidth-answersWidth,
        height=display.contentHeight-CONSTANTS.lineHeight-CONSTANTS.rectanglePadding*2,
        spacing=CONSTANTS.lineHeight,
        rows=2.5,
        columns=1,
        numItems=10,
        create=function(input)
            --1 hide rect
            input.parent[1].isVisible = false
            
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text=('Question ' .. input.index),
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3 Actor icon
            local icon = MAIN.IMAGE.loadIconFrame(1)
            icon.x = input.x + CONSTANTS.textPadding
            icon.y = y + (CONSTANTS.lineHeight-CONSTANTS.iconHeight) * 0.5
            input.parent:insert(icon)

            local choicesWidth = answersWidth - CONSTANTS.rectanglePadding * 2

            --4 question
            TEXT.drawText({
                parent=input.parent,
                x=input.x+CONSTANTS.iconWidth+CONSTANTS.iconPadding,
                y=y,
                width=input.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding-choicesWidth,
                height=CONSTANTS.lineHeight,
                text=''
            })

            y = input.y
            for i = 1, 5 do
                --5,6,7,8,9
                TEXT.drawItemName({
                    parent=input.parent,
                    x=input.x+input.width-choicesWidth,
                    y=y,
                    width=choicesWidth,
                    height=CONSTANTS.lineHeight
                })

                y = y + CONSTANTS.lineHeight
            end

        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[3].fill.frame = item.question.actorIcon
                input.parent[4]:setText(item.question.question)

                for i = 1, #item.choices do
                    local fontColour
                    if i == item.correct then
                        if item.cheatFailed then
                            fontColour = { CONSTANTS.textColourYellow[1], CONSTANTS.textColourYellow[2], CONSTANTS.textColourYellow[3], 0.6  }
                        elseif item.cheat then
                            fontColour = CONSTANTS.textColourYellow
                        else
                            fontColour = CONSTANTS.textColourGreen
                        end
                    else
                        if i == item.selection then
                            fontColour = CONSTANTS.textColourRed
                        else
                            fontColour = item.choices[i].isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                        end
                    end

                    input.parent[4 + i]:setItem({ icon=item.choices[i].icon, name=item.choices[i].name }, fontColour)

                end
            end
        end
    })

    --3 4 Legend
    local legendHeight = CONSTANTS.lineHeight * 8 + CONSTANTS.rectanglePadding * 2
    CONTAINER.createRectangleGroup({
        parent=resultsGroup,
        x=display.contentWidth-answersWidth,
        y=(display.contentHeight-legendHeight)*0.5,
        width=answersWidth,
        height=legendHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Score',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 Score
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

            local eventItem = MAIN.DATA.ITEM.getItem(1, 20)
            --4 
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 1000'),
                height=CONSTANTS.lineHeight,
                item=eventItem
            })

            --5 Gain
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
            --6
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Legend',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --7
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='CORRECT',
                fontColour=CONSTANTS.textColourGreen,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --8
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='INCORRECT',
                fontColour=CONSTANTS.textColourRed,
                alignY='centre'
            })
            
            y = y + CONSTANTS.lineHeight
            --9
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='CHEAT',
                fontColour=CONSTANTS.textColourYellow,
                alignY='centre'
            })
            
            y = y + CONSTANTS.lineHeight
            --10
            local failedCheat = TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='FAILED CHEAT',
                fontColour=CONSTANTS.textColourYellow,
                alignY='centre'
            })
            failedCheat.alpha = 0.6

            
            y = y + CONSTANTS.lineHeight
            --11
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='HINT',
                fontColour=CONSTANTS.textColourInvalid,
                alignY='centre'
            })
        end,
        refresh=function(input)
            --refresh score
            local percentFontColour = input.totalpercent == 100 and CONSTANTS.textColourGreen or CONSTANTS.textColour
            input.parent[3]:setText(input.totalpercent .. '%', percentFontColour)
            input.parent[5]:setText(input.totalGain, input.totalpercent == 0 and CONSTANTS.textColourInvalid or CONSTANTS.textColour)
        end
    })

    local examGroupX = display.contentWidth * 0.8
    local examGroupY = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding * 2
    --3 5 COntine
    local selectRect = COMMON.createRectangleWithText({
        parent=resultsGroup,
        x=examGroupX,
        y=examGroupY,
        width=display.contentWidth*0.2,
        height=CONSTANTS.lineHeight*2+CONSTANTS.rectanglePadding*2,
        text='Continue',
        touch=function()
            MAIN.UTILITY.sceneFadeOut({
                onComplete=function()
                    MAIN.UTILITY.gotoScene('scene.hub.quest.stages.event')
                end
            })

        end
    })

    function resultsGroup:showResults()
        local totalCount = #examGroup.answers
        local totalCorrect = 0

        --write to save
        local eventSave = MAIN.SYSTEM.SAVE.getSave().quests.event[3]
        for i = 1, totalCount do
            local isCorrect = false
            if examGroup.answers[i].selection == examGroup.answers[i].correct then
                totalCorrect = totalCorrect + 1
                isCorrect = true
            end
            
            eventSave[i] = isCorrect
        end

        local totalGain = totalCorrect * 50
        if totalCorrect == totalCount then
            totalGain = totalGain * 2
        end

        MAIN.PLAYER.INVENTORY.gainItem(1, 20, totalGain)

        MAIN.SYSTEM.SAVE.writeSave()

        self[3]:setItems(examGroup.answers)
        self[4]:refresh({totalpercent=math.round(totalCorrect * 100 / totalCount), totalGain=totalGain})
        self.isVisible = true
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

        --Delete all hidden scenes
        composer.removeHidden()

        local UTILITY = MAIN.UTILITY


        UTILITY.updateBackgroundImages({ 'Classroom' })
        UTILITY.updateLowerUiLayer()
    

        UTILITY.sceneFadeIn()
        UTILITY.showLoadingLayer(false)

        sceneGroup[1]:startProcessing()
 
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
 
        composer.removeScene('scene.event.exam')
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