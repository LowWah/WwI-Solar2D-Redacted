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

    local TERMS = MAIN.TERMS

    --a container to store all groups
    local allGroups = {}

    local COMMON = MAIN.UI.COMMON
    local CONTAINER = MAIN.UI.CONTAINER

    --1 Categories
    local categoriesScrollView = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        --items=categories,
        touch=function(input)
            MAIN.UTILITY.updateLowerUiActor(sceneGroup[1].actor:skin().picture)

            for k, v in pairs(allGroups) do
                v:selectInital(k == input.item.key)
            end
        end
    })
    categoriesScrollView.actor = nil
    function categoriesScrollView:setActor(actor)
        self.actor = actor

        for k, v in pairs(allGroups) do
            v:setActor(actor)
        end
    end

    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --2 Profile
    local profileGroup = display.newGroup()
    sceneGroup:insert(profileGroup)
    allGroups.profile = profileGroup

    function profileGroup:setActor(actor)
        self[1]:refresh({profile=actor:profile()})
        self[2]:refresh({actor=actor})
    end
    
    function profileGroup:selectInital(isVisible)
        self.isVisible = isVisible
        if isVisible then
            self[2]:refresh({actor=categoriesScrollView.actor})
        end
        --Does nothing for this
    end

    local profileWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local profileHeight = display.contentHeight - y * 2
    
    --2 1 Profile text
    CONTAINER.createRectangleGroup({
        parent=profileGroup,
        x=display.contentWidth-profileWidth,
        y=y,
        width=profileWidth,
        height=profileHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            --2 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Profile',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --Use default text cause we want wrapping
            --3 profile
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=input.y+CONSTANTS.lineHeight,
                width=input.width,
                text='',
                fontSize=14
            })
        end,
        refresh=function(input)
            input.parent[3]:setText(input.profile)
        end
    })

    --2 2 Stats
    COMMON.createStatBigGroup({
        parent=profileGroup
    })

    --3 Skills
    local skillsGroup = display.newGroup()
    sceneGroup:insert(skillsGroup)
    allGroups.skills = skillsGroup

    function skillsGroup:setActor(actor)
        self.actor = actor

    end

    function skillsGroup:selectInital(isVisible)
        self.isVisible = isVisible
        if isVisible then
            self[2]:setItems(self.actor:allSkills())

            --construct an item list for passives
            local weak = {}
            local resist = {}
            for i = 1, #CONSTANTS.elementIcons do
                local element = self.actor:elements(i)
                if element > 1 then
                    weak[#weak + 1] = i
                elseif element < 1 then
                    resist[#resist + 1] = i
                end
            end
            local passives = {
                self.actor.data.unique,
                self.actor.data.hyper,
                CONSTANTS.modeActors[self.actor.data.mode],
                weak,
                resist
            }

            self[3]:setItems(passives)

            self[4]:refresh()
            self[5]:refresh()
            self[6].isVisible = false

        end
    end

    local skillsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local skillsHeight = (display.contentHeight - y * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5
    --3 1 Header
    CONTAINER.createRectangleGroup({
        parent=skillsGroup,
        x=display.contentWidth-skillsWidth*2+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        y=y,
        width=skillsWidth,
        height=y,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth(' ')-CONSTANTS.iconPadding,
                y=input.y,
                width=input.width,
                height=input.height,
                text='V Passive',
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
                text='Skills >',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })
        end
    })

    --3 2 Skills
    CONTAINER.createScrollViewWithRectangles({
        parent=skillsGroup,
        x=display.contentWidth-skillsWidth,
        y=y,
        width=skillsWidth,
        height=skillsHeight,
        columns=1,
        rows=6,
        numItems=6,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 skill name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' 999'),
                height=input.height
            })

            --3 cost
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
            local item = input.item
            if item then
                local textColour = item:isHyper() and CONSTANTS.textColourPink or CONSTANTS.textColour

                input.parent[2].isVisible = true
                input.parent[2]:setItem({icon=item:icon(), name=item:name()}, textColour)

                local cost = item:cost()
                input.parent[3].isVisible = true
                input.parent[3]:setText(cost == 0 and '' or cost)

                input.parent:enableTouch(true)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false

                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            local item = input.item
            skillsGroup[3]:select(0)
            skillsGroup[4]:refresh({item=item, category='skill'})
            skillsGroup[5]:refresh({item=item})
            skillsGroup[6].isVisible = not composer.getVariable('collection')
            skillsGroup[6]:enable(not item:isMaxLevel())
        end
    })

    --3 3 Passive
    CONTAINER.createScrollViewWithRectangles({
        parent=skillsGroup,
        x=display.contentWidth-skillsWidth*2+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        y=y+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
        width=skillsWidth,
        height=skillsHeight-CONSTANTS.lineHeight-CONSTANTS.rectangleSpacing,
        columns=1,
        rows=5,
        numItems=5,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --probably redo with list of icons + name

            if input.index < 4 then
                --2 passive name
                TEXT.drawItemName({
                    parent=input.parent,
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height
                })
            else
                --2 weak/ resist
                local text = input.index == 4 and 'Weak' or 'Resist'
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=input.y,
                    width=input.width,
                    height=input.height,
                    text=text,
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })

                --3 icons
                local iconGroup = display.newGroup()
                iconGroup.coords = {
                    x=input.x+TEXT.textWidth('Resist '),
                    y=input.y+(input.height-CONSTANTS.iconHeight)*0.5
                }

                input.parent:insert(iconGroup)
            end
        end,
        refresh=function(input)
            local item = input.item
            if input.index < 4 then
                if item then
                    input.parent[2].isVisible = true
    
                    input.parent[2]:setItem({icon=item.icon, name=item.name})
                    input.parent:enableTouch(true)
                else
                    input.parent[2].isVisible = false
                    input.parent:enableTouch(false)
                    
                end
            else
                if item then
                    input.parent[2].isVisible = true
                    input.parent[3].isVisible = true
                    while input.parent[3].numChildren > 0 do
                        input.parent[3][1]:removeSelf()
                    end
                    local IMAGE = MAIN.IMAGE
                    local x = input.parent[3].coords.x
                    local y = input.parent[3].coords.y
                    for i = 1, #item do
                        local icon = IMAGE.loadIconFrame(CONSTANTS.elementIcons[item[i]])
                        icon.x = x
                        icon.y = y
                        input.parent[3]:insert(icon)

                        x = x + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end
                    input.parent:enableTouch(true)
                else
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                    input.parent:enableTouch(false)
                    
                end
            end
        end,
        touch=function(input)
            local item = input.item
            local category
            if input.index == 4 then
                category = 'weak'
            elseif input.index == 5 then
                category = 'resist'
            end
            skillsGroup[2]:select(0)
            skillsGroup[4]:refresh({item=item,category=category})
            skillsGroup[5]:refresh()
            skillsGroup[6].isVisible = false
        end
    })

    --3 4 skill description
    COMMON.createDescriptionGroup({
        parent=skillsGroup,
        y=display.contentHeight-y-skillsHeight
    })

    --3 5 SKILL upgrade
    CONTAINER.createRectangleGroup({
        parent=skillsGroup,
        x=display.contentWidth-skillsWidth*2+CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
        y=(CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 6),
        width=fifthWidth+CONSTANTS.rectanglePadding*2,
        height=(CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 5 + CONSTANTS.rectanglePadding * 2),
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local y = input.y
            --2 next/ max
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 7/7'),
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 skill level
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth('/7'),
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            --4 skill max level
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
            local changeTextWidth = TEXT.textWidth('+100', CONSTANTS.fontSizeSmall)
            --draw eight lines of skill upgrade descriptions, so they can be individual colours etc
            for i = 1, 8 do
                --5 (+1) Group
                local descGroup = display.newGroup()
                input.parent:insert(descGroup)

                --5 (+1) 1 Effect
                TEXT.drawText({
                    parent=descGroup,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.textHeight,
                    text='',
                    fontColour=CONSTANTS.textColourPink
                })

                --5 (+1) 2 Value
                TEXT.drawText({
                    parent=descGroup,
                    x=input.x,
                    y=y,
                    width=input.width-changeTextWidth+CONSTANTS.textPadding,
                    height=CONSTANTS.textHeight,
                    text='',
                    alignX='right'
                })

                --5 (+1) 3 Change
                TEXT.drawText({
                    parent=descGroup,
                    x=input.x+input.width-changeTextWidth,
                    y=y,
                    width=changeTextWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    fontSize=CONSTANTS.fontSizeSmall,
                    alignX='right',
                    paddingX=0
                })

                y = y + CONSTANTS.textHeight
            end
        end,
        refresh=function(input)
            local item = input.item
            if item then
                local level = item:level()
                local maxLevel = item:maxLevel()
                local isMaxLevel = level >= maxLevel

                input.parent[4].isVisible = true
                input.parent[4]:setText('/' .. maxLevel)

                input.parent[2].isVisible = true
                input.parent[3].isVisible = true
                if isMaxLevel then
                    input.parent[2]:setText('Max')
                    input.parent[3]:setText(maxLevel, CONSTANTS.textColour)
                else
                    input.parent[2]:setText('Next')
                    input.parent[3]:setText(level + 1, CONSTANTS.textColourGreen)
                end

                local upgrades = {}
                local upgradesCounter = 1
                --Cost
                local cost = item:cost()
                if cost > 0 then
                    if isMaxLevel then
                        upgrades[upgradesCounter] = {
                            name='Cost',
                            value=cost,
                            change=nil,
                            fontColour=CONSTANTS.textColour
                        }
                    else
                        local nextItemCost = item:levelStats(item:level() + 1).cost
                        local change = nextItemCost - cost
                        local fontColour = CONSTANTS.textColour
                        if change > 0 then
                            change = '+' .. change
                            fontColour = CONSTANTS.textColourRed
                        elseif change < 0 then
                            fontColour = CONSTANTS.textColourGreen
                        else 
                            change = nil
                        end
                        upgrades[upgradesCounter] = {
                            name='Cost',
                            value=nextItemCost,
                            change=change,
                            fontColour=fontColour
                        }
                    end
                    upgradesCounter = upgradesCounter + 1
                end

                --Damage/ Heal
                local damage = item:damage()
                if damage then
                    if item:type() == 3 then
                        if isMaxLevel then
                            upgrades[upgradesCounter] = {
                                name='Heal',
                                value=damage,
                                change=nil,
                                fontColour=CONSTANTS.textColour
                            }
                        else
                            local nextItemDamage = item:levelStats(item:level() + 1).damage
                            local change = nextItemDamage - damage
                            local fontColour = CONSTANTS.textColour
                            if change > 0 then
                                change = '+' .. change
                                fontColour = CONSTANTS.textColourGreen
                            elseif change < 0 then
                                fontColour = CONSTANTS.textColourRed
                            else 
                                change = nil
                            end
                            upgrades[upgradesCounter] = {
                                name='Heal',
                                value=nextItemDamage,
                                change=change,
                                fontColour=fontColour
                            }
                        end
                        upgradesCounter = upgradesCounter + 1
                    elseif damage > 0 then
                        if isMaxLevel then
                            upgrades[upgradesCounter] = {
                                name='Damage',
                                value=damage,
                                change=nil,
                                fontColour=CONSTANTS.textColour
                            }
                        else
                            local nextItemDamage = item:levelStats(item:level() + 1).damage
                            local change = nextItemDamage - damage
                            local fontColour = CONSTANTS.textColour
                            if change > 0 then
                                change = '+' .. change
                                fontColour = CONSTANTS.textColourGreen
                            elseif change < 0 then
                                fontColour = CONSTANTS.textColourRed
                            else 
                                change = nil
                            end
                            upgrades[upgradesCounter] = {
                                name='Damage',
                                value=nextItemDamage,
                                change=change,
                                fontColour=fontColour
                            }
                        end
                        upgradesCounter = upgradesCounter + 1
                    end
                end

                --Speed
                local speed = item:speed()
                if speed and speed ~= 0 then
                    if isMaxLevel then
                        upgrades[upgradesCounter] = {
                            name='Speed',
                            value=speed,
                            change=nil,
                            fontColour=CONSTANTS.textColour
                        }
                    else
                        local nextItemSpeed = item:levelStats(item:level() + 1).speed
                        local change = nextItemSpeed - speed
                        local fontColour = CONSTANTS.textColour
                        if change > 0 then
                            change = '+' .. change
                            fontColour = CONSTANTS.textColourGreen
                        elseif change < 0 then
                            fontColour = CONSTANTS.textColourRed
                        else 
                            change = nil
                        end
                        upgrades[upgradesCounter] = {
                            name='Speed',
                            value=nextItemSpeed,
                            change=change,
                            fontColour=fontColour
                        }
                    end
                    upgradesCounter = upgradesCounter + 1
                end

                --Fail
                if item.data.fail then
                    upgrades[upgradesCounter] = {
                        name='Miss',
                        value=item.data.fail,
                        change=nil,
                        fontColour=CONSTANTS.textColour
                    }
                    upgradesCounter = upgradesCounter + 1
                end

                --effects
                local buffs = item:buffs()
                local debuffs = item:debuffs()
                local statBuffs = item:statBuffs()

                local effects, effectsKey
                if statBuffs then
                    effects = statBuffs
                    effectsKey = 'statBuffs'
                elseif buffs then
                    effects = buffs
                    effectsKey = 'buffs'
                elseif debuffs then
                    effects = debuffs
                    effectsKey = 'debuffs'
                end

                if effects then
                    --Only get the first one and assume it applies for everything
                    local effect = effects[1]

                    --Turn
                    local turn = effect.turn
                    if turn and turn > 0 then
                        if isMaxLevel then
                            upgrades[upgradesCounter] = {
                                name='Turns',
                                value=turn,
                                change=nil,
                                fontColour=CONSTANTS.textColour
                            }
                        else
                            local nextItemTurn = item:levelStats(item:level() + 1)[effectsKey][1].turn
                            local change = nextItemTurn - turn
                            local fontColour = CONSTANTS.textColour
                            if change > 0 then
                                change = '+' .. change
                                fontColour = CONSTANTS.textColourGreen
                            elseif change < 0 then
                                fontColour = CONSTANTS.textColourRed
                            else 
                                change = nil
                            end
                            upgrades[upgradesCounter] = {
                                name='Turns',
                                value=nextItemTurn,
                                change=change,
                                fontColour=fontColour
                            }
                        end
                        upgradesCounter = upgradesCounter + 1
                    end

                    --Chance
                    local chance = effect.chance
                    if chance and chance > 0 then
                        if isMaxLevel then
                            upgrades[upgradesCounter] = {
                                name='Chance',
                                value=chance,
                                change=nil,
                                fontColour=CONSTANTS.textColour
                            }
                        else
                            local nextItemChance = item:levelStats(item:level() + 1)[effectsKey][1].chance
                            local change = nextItemChance - chance
                            local fontColour = CONSTANTS.textColour
                            if change > 0 then
                                change = '+' .. change
                                fontColour = CONSTANTS.textColourGreen
                            elseif change < 0 then
                                fontColour = CONSTANTS.textColourRed
                            else 
                                change = nil
                            end
                            upgrades[upgradesCounter] = {
                                name='Chance',
                                value=nextItemChance,
                                change=change,
                                fontColour=fontColour
                            }
                        end
                        upgradesCounter = upgradesCounter + 1
                    end
                end

                for i = 5, 12 do
                    local upgrade = upgrades[i - 4]
                    if upgrade then
                        input.parent[i].isVisible = true

                        input.parent[i][1]:setText(upgrade.name)

                        input.parent[i][2]:setText(upgrade.value, upgrade.fontColour)

                        if upgrade.change then
                            input.parent[i][3].isVisible = true

                            input.parent[i][3]:setText(upgrade.change, upgrade.fontColour)
                        else
                            input.parent[i][3].isVisible = false
                        end
                    else
                        input.parent[i].isVisible = false
                    end
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
                input.parent[11].isVisible = false
            end
        end
    })

    --3 6
    COMMON.createSelectRectangle({
        parent=skillsGroup,
        text='Upgrade',
        touch=function()
            composer.showOverlay('overlay.profile.upgrade', {
                isModal = true,
                params = {
                    actor = skillsGroup.actor,
                    item = skillsGroup[2]:currentItem(),
                    index = skillsGroup[2].currentIndex
                }
            })
        end
    })

    
    --4 Level
    local levelGroup = display.newGroup()
    sceneGroup:insert(levelGroup)
    allGroups.level = levelGroup

    levelGroup.useCounts = { 0, 0, 0 }
    levelGroup.actor = 0
    function levelGroup:setActor(actor)
        self.actor = actor.actor

        self[2]:refresh({original={actor=actor}})
    end

    function levelGroup:addCount(index, count)
        local ownedItem = MAIN.PLAYER.INVENTORY.getItem(1, index + 5)
        local ownedCount = ownedItem and ownedItem:count() or 0

        --need to clamp if already past max level, not doing for now
        self.useCounts[index] = math.max(0, math.min(self.useCounts[index] + count, ownedCount))

        self:refresh()
    end

    function levelGroup:refresh()
        local actor = MAIN.PLAYER.MEMBERS.getActorClone(self.actor)
        local isEnabled = false
        for i = 1, #self.useCounts do
            local useCount = self.useCounts[i]
            if useCount > 0 then
                isEnabled = true
                actor:gainExp(CONSTANTS.expBookGain[i] * useCount)
            end
        end
        
        self[1]:refresh({actor=actor})
        self[2]:refresh({actor=actor})

        self[3]:enable(isEnabled, 'Level up')
    end
    
    function levelGroup:selectInital(isVisible)
        self.isVisible = isVisible
        if isVisible then
            self.useCounts = { 0, 0, 0 }
            self:refresh()
        end
    end

    --4 1 Level exp books
    CONTAINER.createRectangleGroup({
        parent=levelGroup,
        x=display.contentWidth-profileWidth,
        y=y,
        width=profileWidth,
        height=profileHeight,
        create=function(input)
            local y = input.y
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Level Up',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 100'),
                height=CONSTANTS.lineHeight,
                text='Max',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --4 Max level
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
            --5
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text='Use EXP boosters to level up'
            })

            y = y + CONSTANTS.lineHeight * 2

            --gonna loop this
            for i = 1, 3 do
                local expItem = MAIN.DATA.ITEM.getItem(1, i + 5)

                --6 (+ 7)
                TEXT.drawItemName({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width-TEXT.textWidth(' 9999'),
                    height=CONSTANTS.lineHeight,
                    item={
                        icon=expItem.icon,
                        name=expItem.name
                    }
                })

                --7 (+ 7) count
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.lineHeight,
                    text='',
                    fontColour=CONSTANTS.textColourInvalid,
                    alignX='right',
                    alignY='centre'
                })

                y = y + CONSTANTS.lineHeight

                --8,9,10,11 (+ 7)
                local buttonCounts = { -10, -1, 1, 10 }
                local buttonWidth = input.width * 0.2
                for j = 1, #buttonCounts do 
                    local countText = (buttonCounts[j] > 0 and '+' or '') .. tostring(buttonCounts[j])
                    local r = COMMON.createRectangleWithText({
                        parent=input.parent,
                        x=input.x+(j-1)*(buttonWidth+CONSTANTS.rectangleSpacing),
                        y=y,
                        width=buttonWidth,
                        height=CONSTANTS.lineHeight,
                        text=countText,
                        padding=0,
                        touch=function(input)
                            levelGroup:addCount(i, buttonCounts[j])
                        end
                    })
                end

                --12 (+ 7) use count
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

                y = y + CONSTANTS.lineHeight * 2
            end

            local halfWidth = input.width * 0.5
            --27
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=halfWidth,
                height=CONSTANTS.lineHeight,
                text='Total Gain',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --28
            TEXT.drawText({
                parent=input.parent,
                x=input.x+halfWidth,
                y=y,
                width=halfWidth,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

        end,
        refresh=function(input)
            local actor = input.actor

            --4 Max level
            input.parent[4]:setText(actor:maxLevel())

            --7, 12 (+7) owned and used count
            local totalGain = 0
            for i = 1, 3 do
                local index = (i - 1) * 7

                local item = MAIN.PLAYER.INVENTORY.getItem(1, i + 5)
                local ownedCount = item and item:count() or 0
                local ownedFontColour = ownedCount > 0 and CONSTANTS.textColour or CONSTANTS.textColourInvalid

                local dataItem = MAIN.DATA.ITEM.getItem(1, i + 5)
                input.parent[6 + index]:setItem({icon=dataItem.icon, name=dataItem.name}, ownedFontColour)

                local useCount = input.parent.parent.useCounts[i]
                input.parent[7 + index]:setText(ownedCount, ownedFontColour)
                input.parent[12 + index]:setText(useCount)

                totalGain = totalGain + useCount * CONSTANTS.expBookGain[i]
            end

            --28 Total gain
            input.parent[28]:setText(totalGain)

        end
    })

    --4 2 Stats
    COMMON.createStatBigGroup({
        parent=levelGroup,
        hasUpgrade=true
    })

    --4 3 Select
    COMMON.createSelectRectangle({
        parent=levelGroup,
        touch=function(input)
            local useCounts = levelGroup.useCounts
            local total = 0
            for i = 1, #useCounts do
                local useCount = useCounts[i]
                if useCount > 0 then
                    MAIN.PLAYER.INVENTORY.loseItem(1, i + 5, useCount)

                    total = total + CONSTANTS.expBookGain[i] * useCount
                end
            end

            local actor = MAIN.PLAYER.MEMBERS.getActor(levelGroup.actor)
            local actorCurrentLevel = actor:level()

            actor:gainExp(total)

            --add mission count here
            if actor:level() > actorCurrentLevel then
                MAIN.PLAYER.MISSION.addMissionCount(1, 6, 1)
            end

            MAIN.SYSTEM.SAVE.writeSave()

            levelGroup.useCounts = { 0, 0, 0 }            
            levelGroup:refresh()
        end
    })
    
    --5 Rating
    local ratingGroup = display.newGroup()
    sceneGroup:insert(ratingGroup)
    allGroups.rating = ratingGroup
    
    ratingGroup.actor = 0

    function ratingGroup:setActor(actor)
        self.actor = actor.actor

        self[2]:refresh({original={actor=actor}})
    end

    function ratingGroup:refresh()
        local actor = MAIN.PLAYER.MEMBERS.getActorClone(self.actor)
        local isMaxRating = actor:isMaxRating()

        local oldRank = actor:rank()
        self[1]:refresh({actor=actor})
        actor:increaseRating()
        self[2]:refresh({actor=actor})

        local isEnabled = false
        local INVENTORY = MAIN.PLAYER.INVENTORY
        if INVENTORY.getItem(2, 10 + self.actor) then
            isEnabled = true
        else
            local genericTokenItem = INVENTORY.getItem(2, 1)
            if genericTokenItem and genericTokenItem:count() >= CONSTANTS.tokensPerRank[oldRank] then
                isEnabled = true
            end
        end

        self[3]:enable(not isMaxRating and isEnabled, 'Rate up')
    end

    function ratingGroup:selectInital(isVisible)
        self.isVisible = isVisible
        if isVisible then
            self:refresh()
        end
    end

    --5 1 Tokens screen
    CONTAINER.createRectangleGroup({
        parent=ratingGroup,
        x=display.contentWidth-profileWidth,
        y=y,
        width=profileWidth,
        height=profileHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local y = input.y

            --2 Max Rating
            TEXT.drawText{
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=input.height,
                text='Rating max',
                fontColour=CONSTANTS.textColourInvalid,
                alignX='centre',
                alignY='centre'
            }

            --3 This is a group, we could instead just update 2, but then we need to hide everything below
            local group = display.newGroup()
            input.parent:insert(group)

            --3 1 
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Current rating',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3 2
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight*2,
                text='Use tokens to\nincrease rating',
                alignX='left',
                alignY='centre'
            })

            y = y + CONSTANTS.textHeight * 3
            --3 3
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight*2,
                text='Actor tokens will be\nused first',
                alignX='left',
                alignY='centre'
            })

            y = y + CONSTANTS.textHeight * 2 + CONSTANTS.lineHeight
            --3 4 actor token item name
            TEXT.drawItemName({
                parent=group,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth('9999/1'),
                height=CONSTANTS.lineHeight
            })

            --3 5 owned actor tokens
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth('/1'),
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            --3 6
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='/1',
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight * 1.5
            --3 7
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='OR',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight * 1.5
            local genericToken = MAIN.DATA.ITEM.getItem(2, 1)
            --3 8
            TEXT.drawItemName({
                parent=group,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth('9999/100'),
                height=CONSTANTS.lineHeight,
                item={
                    icon=genericToken.icon,
                    name=genericToken.name
                }
            })

            local requiredTextWidth = TEXT.textWidth('/100')
            --3 9 Owned generic token
            TEXT.drawText({
                parent=group,
                x=input.x,
                y=y,
                width=input.width-requiredTextWidth,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            --3 10 Required generic tokens
            TEXT.drawText({
                parent=group,
                x=input.x+input.width-requiredTextWidth-CONSTANTS.textPadding,
                y=y,
                width=requiredTextWidth,
                height=CONSTANTS.lineHeight,
                text='',
                alignY='centre',
                paddingX=0
            })

            --3 11 Current rating
            local ratingIcon = MAIN.IMAGE.loadIconFrame(1)
            group:insert(ratingIcon)
            ratingIcon.x = input.x + input.width - CONSTANTS.iconWidth - CONSTANTS.iconPadding 
            ratingIcon.y = input.y + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
            
        end,
        refresh=function(input)
            local actor = input.actor

            if actor:isMaxRating() then
                input.parent[2].isVisible = true
                input.parent[3].isVisible = false
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = true
                
                --11 current rating
                input.parent[3][11].fill.frame = CONSTANTS.ratingIcon[actor:rating()]

                local INVENTORY = MAIN.PLAYER.INVENTORY
                local actorTokenData = MAIN.DATA.ITEM.getItem(2, 10 + actor.actor)
                local actorTokenOwned = INVENTORY.getItem(2, 10 + actor.actor)
                local actorTokenCount = 0
                local actorTokenFontColour = CONSTANTS.textColourInvalid
                if actorTokenOwned then
                    actorTokenCount = actorTokenOwned:count()
                    actorTokenFontColour = CONSTANTS.textColour
                end
                --3 4 actor token name
                input.parent[3][4]:setItem({icon=actorTokenData.icon, name=actorTokenData.name}, actorTokenFontColour)

                --3 5 owned actor token
                input.parent[3][5]:setText(actorTokenCount, actorTokenFontColour)

                local genericTokenData = MAIN.DATA.ITEM.getItem(2, 1)
                local genericTokenOwned = INVENTORY.getItem(2, 1)
                local genericTokenCount = 0
                local genericTokenFontColour = CONSTANTS.textColourInvalid
                if genericTokenOwned then
                    genericTokenCount = genericTokenOwned:count()
                    genericTokenFontColour = CONSTANTS.textColour
                end

                --3 8 generic token item name, we still need still for font colour...
                input.parent[3][8]:setItem({icon=genericTokenData.icon, name=genericTokenData.name}, genericTokenFontColour)

                --3 9 owned generic token
                input.parent[3][9]:setText(genericTokenCount, genericTokenFontColour)

                --3 10 required generic token
                input.parent[3][10]:setText('/' .. CONSTANTS.tokensPerRank[actor:rank()])

            end

        end
    })

    --5 2 Stats
    COMMON.createStatBigGroup({
        parent=ratingGroup,
        hasUpgrade=true
    })

    --5 3 Select
    COMMON.createSelectRectangle({
        parent=ratingGroup,
        touch=function(input)
            local actor = MAIN.PLAYER.MEMBERS.getActor(ratingGroup.actor)

            --Determine use actor tokens or generic
            local INVENTORY = MAIN.PLAYER.INVENTORY
            if INVENTORY.getItem(2, 10 + ratingGroup.actor) then
                INVENTORY.loseItem(2, 10 + ratingGroup.actor, 1)
            else
                INVENTORY.loseItem(2, 1, CONSTANTS.tokensPerRank[actor:rank()])
            end

            actor:increaseRating()

            --add mission here
            MAIN.PLAYER.MISSION.addMissionCount(2, 8, 1)

            MAIN.SYSTEM.SAVE.writeSave()

            ratingGroup:refresh()
        end
    })
 
    
    --6 Attire
    local attireGroup = display.newGroup()
    sceneGroup:insert(attireGroup)
    allGroups.attire = attireGroup

    attireGroup.actor = 0
    
    function attireGroup:setActor(actor)
        self.actor = actor.actor

        self[1]:setItems(MAIN.DATA.ACTOR.getActor(actor.actor).skins)
    end

    function attireGroup:selectInital(isVisible)
        self.isVisible = isVisible
        if isVisible then
            self[1]:selectAndCall(categoriesScrollView.actor:currentSkinId(), true)

            self[2].isVisible = not (composer.getVariable('collection') or composer.getVariable('recruit'))
        end
    end

    --6 1 Scroll view
    local attireWidth = fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2 + CONSTANTS.rectanglePadding * 2
    local attireScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=attireGroup,
        x=display.contentWidth-attireWidth,
        y=y,
        width=attireWidth,
        height=display.contentHeight-y*2,
        rows=1,
        columns=3,
        numItems=3,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2 Container to crop image
            local container = display.newContainer(input.width, input.height)
            input.parent:insert(container, true)

            --2 1 image - this is a group so we can store coords
            local group = display.newGroup()
            container:insert(group)
            group.coords = {
                x=input.x+(input.width-CONSTANTS.actorWidth)*0.5,
                y=input.y+input.height-CONSTANTS.actorHeight,
                width=input.width,
                height=input.height
            }

            --2 2
            local blackBoxHeight = CONSTANTS.textHeight * 2 + CONSTANTS.textPadding * 2
            local blackBox = display.newRect(container, input.x, input.y+input.height, input.width, blackBoxHeight)
            blackBox.anchorX = 0
            blackBox.anchorY = 1
            blackBox:setFillColor(0.2, 0.2, 0.2, 0.6)

            --2 3 Name
            TEXT.drawText({
                parent=container,
                x=input.x,
                y=input.y+input.height-blackBoxHeight+CONSTANTS.textPadding,
                width=input.width,
                height=blackBoxHeight,
                text=''
            })

            --2 4 Current
            TEXT.drawText({
                parent=container,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Current',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            --2 5 Locked group
            local lockedGroup = display.newGroup()
            container:insert(lockedGroup)

            --2 5 1 Doing a black rect cause not bothered changing alpha for specifc childs
            local lockedRect = display.newRect(input.x, input.y, input.width, input.height)
            lockedGroup:insert(lockedRect)
            lockedRect.anchorX = 0
            lockedRect.anchorY = 0
            lockedRect:setFillColor(0, 0, 0, 0.3)

            --2 5 2
            TEXT.drawText({
                parent=lockedGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Locked',
                fontColour=CONSTANTS.textColourRed,
                alignX='right',
                alignY='centre'
            })

            local costWidth = TEXT.textWidth('1000') + CONSTANTS.iconWidth + CONSTANTS.iconPadding * 2
            --2 5 3 Locked price
            TEXT.drawItemName({
                parent=lockedGroup,
                x=input.x+input.width-costWidth-CONSTANTS.textPadding,
                y=input.y+CONSTANTS.lineHeight,
                width=costWidth
            })

        end,
        refresh=function(input)
            if input.item then
                local index = input.index
                local item = input.item

                local container = input.parent[2]
                container.isVisible = true
                --1 image
                local pictureGroup = container[1]
                while pictureGroup.numChildren > 0 do
                    pictureGroup[1]:removeSelf()
                end
                local picture = MAIN.IMAGE.loadActorPicture(item.picture)
                picture.x = pictureGroup.coords.x
                picture.y = pictureGroup.coords.y
                pictureGroup:insert(picture)

                --3 name
                container[3]:setText(item.name)

                --check if locked
                local actor = categoriesScrollView.actor --MAIN.PLAYER.MEMBERS.getActor(attireGroup.actor)
                local skinUnlocked = actor:isSkinUnlocked(index)
                if skinUnlocked then
                    --4 Current
                    if composer.getVariable('change') then
                        local hubActor = MAIN.PLAYER.HUB.hubActor()
                        container[4].isVisible = hubActor.actorId == attireGroup.actor and hubActor.skin == index
                    else
                        container[4].isVisible = actor:currentSkinId() == index
                    end
                    
                    --5 Locked
                    container[5].isVisible = false
                else
                    --4 Current 
                    container[4].isVisible = false

                    --5 Locked
                    container[5].isVisible = true

                    --5 3 Locked Cost
                    if item.cost > 0 then
                        container[5][3].isVisible = true
                        container[5][3]:setItem({icon=CONSTANTS.goldIcon, name=item.cost})
                    else
                        container[5][3].isVisible = false
                    end
                end

                input.parent:enableTouch(true)
            else
                input.parent[2].isVisible = false
                input.parent:enableTouch(false)
            end

        end,
        touch=function(input)
            local actor = categoriesScrollView.actor
            local isEnabled = actor:isSkinUnlocked(input.index)
            local selectText = 'Select'
            if not isEnabled then
                selectText = 'Purchase'
                isEnabled = MAIN.PLAYER.GOLD.gold() >= input.item.cost
            end
            attireGroup[2]:enable(isEnabled, selectText)

            MAIN.UTILITY.updateLowerUiActor(input.item.picture)
        end
    })

    --6 2 Select/ purchase
    COMMON.createSelectRectangle({
        parent=attireGroup,
        touch=function(input)
            local actor = MAIN.PLAYER.MEMBERS.getActor(attireGroup.actor)

            local index = attireScrollView.currentIndex
            if actor:isSkinUnlocked(index) then
                if composer.getVariable('change') then
                    MAIN.PLAYER.HUB.setHubActorPicture(actor.actor, index)

                    local UTILITY = MAIN.UTILITY
                    UTILITY.removeComposerVariable('change')
                    UTILITY.gotoScene('scene.hub.hub')
                else
                    actor:changeSkin(index)
                end
                
            else
                MAIN.PLAYER.GOLD.gainGold(-1 * actor:skin(index).cost)
                MAIN.UTILITY.updateLowerUiGold()
                actor:unlockSkin(index)
            end

            MAIN.SYSTEM.SAVE.writeSave()
            
            --we only need to update current and last current, this will refresh all, doing this for convience for now
            attireGroup:setActor(actor)
            attireScrollView:select(index)
        end
    })

end
 
function scene:reselect(index)
    --assume this is only for skills
    local sceneGroup = self.view

    sceneGroup[1]:select(2)

    sceneGroup[3]:selectInital(true)
    sceneGroup[3][2]:selectAndCall(index or 0, true)
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

        local sceneName = 'PROFILE'
        local categories = {
            {
                category='Profile',
                key='profile'
            }, {
                category='Skills',
                key='skills'
            }, {
                category='Level',
                key='level'
            }, {
                category='Rating',
                key='rating'
            }, {
                category='Attire',
                key='attire'
            }
        }

        if composer.getVariable('collection') or composer.getVariable('recruit') then
            sceneName = 'COLLECTION'
            categories = {
                {
                    category='Profile',
                    key='profile'
                }, {
                    category='Skills',
                    key='skills'
                }, {
                    category='Attire',
                    key='attire'
                }
            }
        elseif composer.getVariable('change') then
            sceneName = 'CHANGE'
            categories = {
                {
                    category='Attire',
                    key='attire'
                }
            }

        end
        
        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName=sceneName,
            back=function()
                MAIN.UTILITY.gotoScene(composer.getSceneName('previous'))
            end,
            guild=true,
            gold=true,
            lives=true
        })

        sceneGroup[1]:setItems(categories)
        sceneGroup[1]:setActor(event.params.member)
        sceneGroup[1]:selectAndCall(1, true)

        UTILITY.showLoadingLayer(false)

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