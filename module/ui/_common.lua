--Common containers, relies on container module

local M = {}

--Rectangles
M.createRectangleWithText = function(options)
    options.create = function(input)
        MAIN.UI.TEXT.drawText({
            parent=input.parent,
            x=input.x,
            y=input.y,
            width=input.width,
            height=input.height,
            text=(options.text or ''),
            fontColour=(options.fontColour or CONSTANTS.textColour),
            alignX='centre',
            alignY='centre'
        })
    end

    options.refresh = function(input)
        input.parent[2]:setText(input.text, input.fontColour)
    end

    return MAIN.UI.CONTAINER.createRectangleGroup(options)
end

M.createSelectRectangle = function(options)
    --set overrides
    options.width = display.contentWidth * 0.2
    options.height = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    options.x = display.contentWidth - options.width
    options.y = display.contentHeight - options.height
    options.text = options.text or 'Select'
    options.fontColour = options.fontColour or CONSTANTS.textColour
    options.fontColourDisabled = options.fontColourDisabled or CONSTANTS.textColourInvalid

    local rectGroup = M.createRectangleWithText(options)

    --this should be in createRectangleWithText
    function rectGroup:enable(isEnabled, text)
        local fontColour = isEnabled and options.fontColour or options.fontColourDisabled
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end
    
    return rectGroup
end

M.createStatSmallGroup = function(options)
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    
    --create two groups, one for stats, one for additional and one for the button
    local group = display.newGroup()
    options.parent:insert(group)

    local x = display.contentWidth - fifthWidth * 3 - CONSTANTS.rectangleSpacing * 2 - CONSTANTS.rectanglePadding * 2
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local width = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local height = (display.contentHeight - y * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5
    --1 Stats
    local statsGroup = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=group,
        x=x,
        y=y,
        width=width,
        height=height,
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
                text='Stats',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            local stats = CONSTANTS.paramStats
            local bonusWidth = TEXT.textWidth('+999', 12)
            y = y + CONSTANTS.lineHeight
            for i = 1, #stats do
                --3,6,9,12,15,18,21,24 Param name
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.textHeight,
                    text=stats[i],
                    fontColour=CONSTANTS.textColourPink,
                    alignX='left',
                    alignY='centre'
                })

                --4,7,10,13,16,19,22,25 Param value
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width-bonusWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    alignX='right',
                    alignY='centre'
                })

                --5,8,11,14,17,20,23,26 Param equip
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+input.width-bonusWidth-CONSTANTS.textPadding,
                    y=y,
                    width=bonusWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    fontColour=CONSTANTS.textColourPink,
                    fontSize=12,
                    alignX='left',
                    alignY='top',
                    paddingX=0
                })

                y = y + CONSTANTS.textHeight
            end
        end,
        refresh=function(input)
            if input.item then
                local actor = MAIN.PLAYER.MEMBERS.getActor(input.item.actor)
                
                local setCounts = {}
                local equips = {}
                for i = 1, #input.item.equipment do
                    equips[i] = MAIN.PLAYER.INVENTORY.getItem(i + 4, input.item.equipment[i])

                    if equips[i] and equips[i].data.set and equips[i].data.set ~= 0 then
                        local currentSetCount = setCounts[equips[i].data.set] or 0
                        setCounts[equips[i].data.set] = currentSetCount + 1
                    end
                end

                local statSetBonuses = {}
                for k, v in pairs(setCounts) do
                    local set = MAIN.DATA.ITEM.getEquipmentSet(k)
                    for i = 1, #set.effects do
                        if v >= i and set.effects[i] and set.effects[i].stats then
                            local stats = set.effects[i].stats
                            if stats.params then
                                for j = 1, #stats.params do
                                    local currentStatBonus = statSetBonuses[stats.params[j]] or 0
                                    statSetBonuses[stats.params[j]] = currentStatBonus + stats.value
                                end
                            elseif stats.param then
                                local currentStatBonus = statSetBonuses[stats.param] or 0
                                statSetBonuses[stats.param] = currentStatBonus + stats.value
                            end
                        end
                    end
                end

                local stats = CONSTANTS.paramStats
                for i = 1, #stats do
                    local index = i * 3 + 1
                    
                    local stat = actor:stats(i)
                    local equipStat = 0
                    
                    for j = 1, #input.item.equipment do
                        if equips[j] then
                            equipStat = equipStat + equips[j]:stats(i)
                        end
                    end

                    local finalStat = stat + equipStat
                    if statSetBonuses[i] then
                        local bonus = math.floor(finalStat * statSetBonuses[i])
                        finalStat = finalStat + bonus
                        equipStat = equipStat + bonus
                    end

                    input.parent[index]:setText(finalStat)
                    if equipStat > 0 then
                        input.parent[index + 1]:setText('+' .. equipStat)
                    else
                        input.parent[index + 1]:setText('')
                    end
                end
            end
        end
    })

    --2 Additional
    local additionalGroup = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=group,
        x=x,
        y=y,
        width=width,
        height=height,
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
                text='Additional',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            local additional = CONSTANTS.paramAdditional
            local bonusWidth = TEXT.textWidth('+999', 12)
            y = y + CONSTANTS.lineHeight
            for i = 1, #additional do
                --3,6,9,12,15 Param name
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.textHeight,
                    text=additional[i],
                    fontColour=CONSTANTS.textColourPink,
                    alignX='left',
                    alignY='centre'
                })

                --4,7,10,13,16 Param value
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width-bonusWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    alignX='right',
                    alignY='centre'
                })

                --5,8,11,14,17 Param equip
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+input.width-bonusWidth-CONSTANTS.textPadding,
                    y=y,
                    width=bonusWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    fontColour=CONSTANTS.textColourPink,
                    fontSize=12,
                    alignX='left',
                    alignY='top',
                    paddingX=0
                })

                y = y + CONSTANTS.textHeight
            end

            y = y + CONSTANTS.iconPadding -- CONSTANTS.textHeight -- + CONSTANTS.lineHeight

            --18
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Weak',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            local resistText = TEXT.textWidth('Resist') + CONSTANTS.iconPadding * 1.5
            --19 Weak group
            local weakGroup = display.newGroup()
            weakGroup.coords = {
                x=input.x+resistText,
                y=y
            }
            input.parent:insert(weakGroup)

            y = y + CONSTANTS.lineHeight
            --20 Resist
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Resist',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            --21 Resist group
            local resistGroup = display.newGroup()
            resistGroup.coords = {
                x=input.x+resistText,
                y=y
            }
            input.parent:insert(resistGroup)
        end,
        refresh=function(input)
            if input.item then

                local setCounts = {}
                local equips = {}
                local elementBonuses = {}
                for i = 1, #input.item.equipment do
                    equips[i] = MAIN.PLAYER.INVENTORY.getItem(i + 4, input.item.equipment[i])

                    if equips[i] and equips[i].data.elements then
                        for k, v in pairs(equips[i].data.elements) do
                            elementBonuses[k] = v
                        end
                    end

                    if equips[i] and equips[i].data.set and equips[i].data.set ~= 0 then
                        local currentSetCount = setCounts[equips[i].data.set] or 0
                        setCounts[equips[i].data.set] = currentSetCount + 1
                    end
                end
                
                local additionalSetBonuses = {}
                for k, v in pairs(setCounts) do
                    local set = MAIN.DATA.ITEM.getEquipmentSet(k)
                    for i = 1, #set.effects do
                        if v >= i and set.effects[i] and set.effects[i].additional then
                            local additional = set.effects[i].additional
                            if additional.params then
                                for j = 1, #additional.params do
                                    local currentAdditionalBonus = additionalSetBonuses[additional.params[j]] or 0
                                    additionalSetBonuses[additional.params[j]] = currentAdditionalBonus + additional.value
                                end
                            elseif additional.param then
                                local currentAdditionalBonus = additionalSetBonuses[additional.param] or 0
                                additionalSetBonuses[additional.param] = currentAdditionalBonus + additional.value
                            end
                        end
                    end
                end

                local additionalRate = CONSTANTS.paramAdditionalRate
                for i = 1, #additionalRate do
                    local index = i * 3 + 1
                    
                    local stat = additionalRate[i]
                    local equipStat = 0
                    
                    for j = 1, #input.item.equipment do
                        if equips[j] then
                            equipStat = equipStat + equips[j]:additional(i)
                        end
                    end

                    local finalAdditional = stat + equipStat
                    if additionalSetBonuses[i] then
                        finalAdditional = finalAdditional + additionalSetBonuses[i]
                        equipStat = equipStat + additionalSetBonuses[i]
                    end

                    input.parent[index]:setText(math.floor((finalAdditional) * 100) .. '%')
                    if equipStat > 0 then
                        input.parent[index + 1]:setText('+' .. math.floor(equipStat * 100) .. '%')
                    else
                        input.parent[index + 1]:setText('')
                    end
                end

                --clean
                while input.parent[19].numChildren > 0 do
                    input.parent[19][1]:removeSelf()
                end
                while input.parent[21].numChildren > 0 do
                    input.parent[21][1]:removeSelf()
                end

                local actor = MAIN.PLAYER.MEMBERS.getActor(input.item.actor)
                local loadIconFrame = MAIN.IMAGE.loadIconFrame
                local weakCoords = {
                    input.parent[19].coords.x,
                    input.parent[19].coords.y
                }
                local resistCoords = {
                    input.parent[21].coords.x,
                    input.parent[21].coords.y
                }
                for i = 1, #CONSTANTS.elementIcons do
                    local element = elementBonuses[i] or actor:elements(i)
                    if element > 1 then
                        local icon = loadIconFrame(CONSTANTS.elementIcons[i])
                        icon.x = weakCoords[1]
                        icon.y = weakCoords[2]
                        input.parent[19]:insert(icon)

                        weakCoords[1] = weakCoords[1] + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    elseif element < 1 then
                        local icon = loadIconFrame(CONSTANTS.elementIcons[i])
                        icon.x = resistCoords[1]
                        icon.y = resistCoords[2]
                        input.parent[21]:insert(icon)

                        resistCoords[1] = resistCoords[1] + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end
                end

            end
        end
    })
    additionalGroup.isVisible = false

    --3 More button
    local moreWidth = fifthWidth * 0.5 + CONSTANTS.rectanglePadding * 2
    local moreRectangle = M.createRectangleWithText({
        parent=group,
        x=x+width-moreWidth,
        y=y,
        width=moreWidth,
        height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
        text='More',
        alignX='centre',
        alignY='centre',
        touch=function()
            statsGroup.isVisible = not statsGroup.isVisible
            additionalGroup.isVisible = not additionalGroup.isVisible
        end
    })

    function group:setItem(item)
        local input = { item=item }
        self[1]:refresh(input)
        self[2]:refresh(input)
        
        statsGroup.isVisible = true
        additionalGroup.isVisible = false
    end

    return group
end

M.createStatBigGroup = function(options)
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    
    --set overrides if empty
    options.x = options.x or (display.contentWidth - fifthWidth * 3 - CONSTANTS.rectangleSpacing * 2 - CONSTANTS.rectanglePadding * 2)
    options.y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    options.width = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    options.height = display.contentHeight - options.y *2
    --if options has a hasUpgrade flag, it will consider a second actor

    local statGroup = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=options.parent,
        x=options.x,
        y=options.y,
        width=options.width,
        height=options.height,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2 Name
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-CONSTANTS.iconWidth*2-CONSTANTS.iconPadding,
                height=CONSTANTS.lineHeight,
                text='',
                alignY ='centre'
            })

            local IMAGE = MAIN.IMAGE
            --3 rank
            local rankIcon = IMAGE.loadIconFrame(1)
            input.parent:insert(rankIcon)
            rankIcon.x = input.x + input.width - CONSTANTS.iconWidth * 2 - CONSTANTS.iconPadding
            rankIcon.y = y + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5

            --4 rating
            local ratingIcon = IMAGE.loadIconFrame(1)
            input.parent:insert(ratingIcon)
            ratingIcon.x = rankIcon.x + CONSTANTS.iconWidth +CONSTANTS.iconPadding 
            ratingIcon.y = rankIcon.y

            local halfWidth = input.width * 0.5
            y = y + CONSTANTS.lineHeight
            --5 
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=halfWidth,
                height=CONSTANTS.textHeight,
                text='Level',
                fontColour=CONSTANTS.textColourPink
            })

            --6 Level
            TEXT.drawText({
                parent=input.parent,
                x=input.x+TEXT.textWidth('Level '),
                y=y,
                width=halfWidth,
                height=CONSTANTS.textHeight,
                text='',
                alignX='left'
            })

            --7
            TEXT.drawText({
                parent=input.parent,
                x=input.x+halfWidth,
                y=y,
                width=halfWidth,
                height=CONSTANTS.textHeight,
                text='Next',
                fontColour=CONSTANTS.textColourPink
            })

            --8 To Next
            TEXT.drawText({
                parent=input.parent,
                x=input.x+halfWidth,
                y=y,
                width=halfWidth,
                height=CONSTANTS.textHeight,
                text='',
                alignX='right'
            })

            --STATS
            local changeWidth = TEXT.textWidth('+999', 12)
            local valueWidth = input.width - (options.hasUpgrade and changeWidth or 0)
    
            y = y + CONSTANTS.textHeight * 1.5
            local stats = CONSTANTS.paramStats
            for i = 1, #stats do
                --9,12,15,18,21,24,27,30
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.textHeight,
                    text=stats[i],
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })

                --10,13,16,19,22,25,28,31 Param value
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=valueWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    alignX='right',
                    alignY='centre'
                })

                --11,14,17,20,23,26,29,32 Param equip
                local change = TEXT.drawText({
                    parent=input.parent,
                    x=input.x+input.width-changeWidth-CONSTANTS.textPadding,
                    y=y,
                    width=changeWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    fontColour=CONSTANTS.textColourGreen,
                    fontSize=12,
                    alignY='top',
                    paddingX=0
                })
                change.isVisible = options.hasUpgrade

                y = y + CONSTANTS.textHeight
            end

            --ADDITIONAL
            y = y + CONSTANTS.textHeight * 0.5
            local additional = CONSTANTS.paramAdditional
            for i = 1, #additional do
                --33,36,39,42,45
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.textHeight,
                    text=additional[i],
                    fontColour=CONSTANTS.textColourPink,
                    alignX='left',
                    alignY='centre'
                })

                --34,37,40,43,46 Param value
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=valueWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    alignX='right',
                    alignY='centre'
                })

                --35,38,41,44,47 Param equip
                local change = TEXT.drawText({
                    parent=input.parent,
                    x=input.x+input.width-changeWidth-CONSTANTS.textPadding,
                    y=y,
                    width=changeWidth,
                    height=CONSTANTS.textHeight,
                    text='',
                    fontColour=CONSTANTS.textColourGreen,
                    fontSize=12,
                    alignY='top',
                    paddingX=0
                })
                change.isVisible = options.hasUpgrade

                y = y + CONSTANTS.textHeight
            end

            y = y + CONSTANTS.textHeight * 0.5
            --48 Weak
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Weak',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })

            local resistText = TEXT.textWidth('Resist') + CONSTANTS.iconPadding * 1.5
            --49 Weak group
            local weakGroup = display.newGroup()
            weakGroup.coords = {
                x=input.x+resistText,
                y=y
            }
            input.parent:insert(weakGroup)
    
            y = y + CONSTANTS.lineHeight
            --50 Resist
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Resist',
                fontColour=CONSTANTS.textColourPink,
                alignX='left',
                alignY='centre'
            })
    
            --51 Resist group
            local resistGroup = display.newGroup()
            resistGroup.coords = {
                x=input.x+resistText,
                y=y
            }
            input.parent:insert(resistGroup)
            
        end,
        refresh=function(input)
            --Setup the hasUpgrade actor, this should be the actualy actor from allMembers
            if options.hasUpgrade then
                if input.original then
                    input.parent.original = input.original
                end
            else
                input.parent.original = {}
            end

            if input.actor then
                local actor = input.actor

                local originalActor = input.parent.original.actor
                local originalEquipment = input.parent.original.equipment
                
                --2 Name
                input.parent[2]:setText(actor:name())

                --3 Rank
                input.parent[3].fill.frame = CONSTANTS.rankIcon[actor:rank()]
                
                --4 Rank
                input.parent[4].fill.frame = CONSTANTS.ratingIcon[actor:rating()]

                --Setup colours for level and to next
                local levelFontColour = CONSTANTS.textColour
                local nextExpFontColour = CONSTANTS.textColour
                if originalActor then
                    local hasChangedLevel = actor:level() > originalActor:level()
                    local hasChangedExp = hasChangedLevel or (actor:requiredExpForNext() < originalActor:requiredExpForNext())
                    levelFontColour = hasChangedLevel and CONSTANTS.textColourGreen or CONSTANTS.textColour
                    nextExpFontColour = hasChangedExp and CONSTANTS.textColourGreen or CONSTANTS.textColour
                end
                --6 Level
                input.parent[6]:setText(actor:level(), levelFontColour)

                --8 To Next
                input.parent[8]:setText(actor:requiredExpForNext(), nextExpFontColour)

                local equipment = input.equipment

                --check sets
                local currentSetCounts, currentStatSetBonuses, currentAdditionalSetBonuses, currentElementSetBonuses
                local originalSetCounts, originalStatSetBonuses, originalAdditionalSetBonuses, originalElementSetBonuses
                if equipment then
                    currentSetCounts = {}
                    originalSetCounts = originalEquipment and {} or nil
                    for i = 1, #equipment do
                        local equipmentItem = MAIN.PLAYER.INVENTORY.getItem(i + 4, equipment[i])

                        --elements
                        if equipmentItem and equipmentItem.data.elements then
                            currentElementSetBonuses = currentElementSetBonuses or {}
                            for k, v in pairs(equipmentItem.data.elements) do
                                currentElementSetBonuses[k] = v
                            end
                        end

                        --sets
                        if equipmentItem and equipmentItem.data.set and equipmentItem.data.set ~= 0 then
                            local currentSetCount = currentSetCounts[equipmentItem.data.set] or 0
                            currentSetCounts[equipmentItem.data.set] = currentSetCount + 1
                        end

                        if originalSetCounts then
                            local originalEquipmentItem = MAIN.PLAYER.INVENTORY.getItem(i + 4, originalEquipment[i])
                            if originalEquipmentItem and originalEquipmentItem.data.set and originalEquipmentItem.data.set ~= 0 then
                                local originalSetCount = originalSetCounts[originalEquipmentItem.data.set] or 0
                                originalSetCounts[originalEquipmentItem.data.set] = originalSetCount + 1
                            end
                        end
                    end

                    --current
                    for k, v in pairs(currentSetCounts) do
                        local set = MAIN.DATA.ITEM.getEquipmentSet(k)
                        for i = 1, #set.effects do
                            if v >= i and set.effects[i] then
                                local effect = set.effects[i]
                                if effect.stats then
                                    local stats = effect.stats
                                    currentStatSetBonuses = currentStatSetBonuses or {}
                                    if stats.params then
                                        currentStatSetBonuses = currentStatSetBonuses or {}
                                        for j = 1, #stats.params do
                                            local currentStatBonus = currentStatSetBonuses[stats.params[j]] or 0
                                            currentStatSetBonuses[stats.params[j]] = currentStatBonus + stats.value
                                        end
                                    elseif stats.param then
                                        currentStatSetBonuses = currentStatSetBonuses or {}
                                        local currentStatBonus = currentStatSetBonuses[stats.param] or 0
                                        currentStatSetBonuses[stats.param] = currentStatBonus + stats.value
                                    end
                                elseif effect.additional then
                                    local additional = effect.additional
                                    if additional.params then
                                        currentAdditionalSetBonuses = currentAdditionalSetBonuses or {}
                                        for j = 1, #additional.params do
                                            local currentAdditionalBonus = currentAdditionalSetBonuses[additional.params[j]] or 0
                                            currentAdditionalSetBonuses[additional.params[j]] = currentAdditionalBonus + additional.value
                                        end
                                    elseif additional.param then
                                        currentAdditionalSetBonuses = currentAdditionalSetBonuses or {}
                                        local currentAdditionalBonus = currentAdditionalSetBonuses[additional.param] or 0
                                        currentAdditionalSetBonuses[additional.param] = currentAdditionalBonus + additional.value
                                    end
                                elseif effect.element then
                                    --TODO
                                end
                            end
                        end
                    end

                    --original
                    if originalSetCounts then
                        for k, v in pairs(originalSetCounts) do
                            local set = MAIN.DATA.ITEM.getEquipmentSet(k)
                            for i = 1, #set.effects do
                                if v >= i and set.effects[i] then
                                    local effect = set.effects[i]
                                    if effect.stats then
                                        local stats = effect.stats
                                        originalStatSetBonuses = originalStatSetBonuses or {}
                                        if stats.params then
                                            originalStatSetBonuses = originalStatSetBonuses or {}
                                            for j = 1, #stats.params do
                                                local originalStatBonus = originalStatSetBonuses[stats.params[j]] or 0
                                                originalStatSetBonuses[stats.params[j]] = originalStatBonus + stats.value
                                            end
                                        elseif stats.param then
                                            originalStatSetBonuses = originalStatSetBonuses or {}
                                            local originalStatBonus = originalStatSetBonuses[stats.param] or 0
                                            originalStatSetBonuses[stats.param] = originalStatBonus + stats.value
                                        end
                                    elseif effect.additional then
                                        local additional = effect.additional
                                        if additional.params then
                                            originalAdditionalSetBonuses = originalAdditionalSetBonuses or {}
                                            for j = 1, #additional.params do
                                                local originalAdditionalBonus = originalAdditionalSetBonuses[additional.params[j]] or 0
                                                originalAdditionalSetBonuses[additional.params[j]] = originalAdditionalBonus + additional.value
                                            end
                                        elseif additional.param then
                                            originalAdditionalSetBonuses = originalAdditionalSetBonuses or {}
                                            local originalAdditionalBonus = originalAdditionalSetBonuses[additional.param] or 0
                                            originalAdditionalSetBonuses[additional.param] = originalAdditionalBonus + additional.value
                                        end
                                    elseif effect.element then
                                        --TODO
                                    end
                                end
                            end
                        end
                    end
                end

                --STATS
                local stats = CONSTANTS.paramStats
                for i = 1, #stats do
                    local currentActorStat = actor:stats(i)
                    local currentFontColour = CONSTANTS.textColour
                    local changeStat = nil
                    local changeFontColour = CONSTANTS.textColour
                    if equipment then
                        changeStat = 0
                        
                        for j = 1, #equipment do
                            if equipment[j] > 0 then
                                changeStat = changeStat + MAIN.PLAYER.INVENTORY.getItem(j + 4, equipment[j]):stats(i)
                            end
                        end

                        currentActorStat = currentActorStat + changeStat
                        if currentStatSetBonuses and currentStatSetBonuses[i] then
                            local bonus = math.floor(currentActorStat * currentStatSetBonuses[i])
                            currentActorStat = currentActorStat + bonus
                            changeStat = changeStat + bonus
                        end
                    end

                    if originalActor then
                        local originalActorStat = originalActor:stats(i)
                        if originalEquipment then
                            local originalEquipStat = 0
                            
                            for j = 1, #originalEquipment do
                                if originalEquipment[j] > 0 then
                                    originalEquipStat = originalEquipStat + MAIN.PLAYER.INVENTORY.getItem(j + 4, originalEquipment[j]):stats(i)
                                end
                            end

                            originalActorStat = originalActorStat + originalEquipStat
                            
                            if originalStatSetBonuses and originalStatSetBonuses[i] then
                                local bonus = math.floor(originalActorStat * originalStatSetBonuses[i])
                                originalActorStat = originalActorStat + bonus
                                originalEquipStat = originalEquipStat + bonus
                            end

                            if changeStat > originalEquipStat then
                                changeFontColour = CONSTANTS.textColourGreen
                            elseif changeStat < originalEquipStat then
                                changeFontColour = CONSTANTS.textColourRed
                            else 
                                changeFontColour = CONSTANTS.textColourPink
                            end

                        end
                        local diff = currentActorStat - originalActorStat
                        if diff > 0 then
                            currentFontColour = CONSTANTS.textColourGreen
                        elseif diff < 0 then
                            currentFontColour = CONSTANTS.textColourRed
                        end
                        --If no equipment is set then assume its a change for level or rating 
                        if not changeStat then
                            changeStat = diff
                            changeFontColour = currentFontColour
                        end
                    end

                    local index = i * 3 + 7
                    input.parent[index]:setText(currentActorStat, currentFontColour)
                    if changeStat and changeStat > 0 then
                        input.parent[index + 1]:setText('+' .. changeStat, changeFontColour)
                    else
                        input.parent[index + 1]:setText('')
                    end
                end

                --ADDITIONAL
                local round = math.round
                local additional = CONSTANTS.paramAdditional
                for i = 1, #additional do
                    local currentAdditional = actor:additional(i)
                    local currentFontColour = CONSTANTS.textColour
                    local changeAdditional = nil
                    local changeFontColour = CONSTANTS.textColour
                    if equipment then
                        changeAdditional = 0
                        
                        for j = 1, #equipment do
                            if equipment[j] > 0 then
                                changeAdditional = changeAdditional + MAIN.PLAYER.INVENTORY.getItem(j + 4, equipment[j]):additional(i)
                            end
                        end

                        currentAdditional = currentAdditional + changeAdditional
                        if currentAdditionalSetBonuses and currentAdditionalSetBonuses[i] then
                            currentAdditional = currentAdditional + currentAdditionalSetBonuses[i]
                            changeAdditional = changeAdditional + currentAdditionalSetBonuses[i]
                        end
                    end

                    if originalActor then
                        local originalActorAdditional = originalActor:additional(i)
                        if originalEquipment then
                            local originalEquipAdditional = 0
                            
                            for j = 1, #originalEquipment do
                                if originalEquipment[j] > 0 then
                                    originalEquipAdditional = originalEquipAdditional + MAIN.PLAYER.INVENTORY.getItem(j + 4, originalEquipment[j]):additional(i)
                                end
                            end
                            
                            originalActorAdditional = originalActorAdditional + originalEquipAdditional
                            if originalAdditionalSetBonuses and originalAdditionalSetBonuses[i] then
                                originalActorAdditional = originalActorAdditional + originalAdditionalSetBonuses[i]
                                originalEquipAdditional = originalEquipAdditional + originalAdditionalSetBonuses[i]
                            end

                            if changeAdditional > originalEquipAdditional then
                                changeFontColour = CONSTANTS.textColourGreen
                            elseif changeAdditional < originalEquipAdditional then
                                changeFontColour = CONSTANTS.textColourRed
                            else 
                                changeFontColour = CONSTANTS.textColourPink
                            end

                            
                        end
                        local diff = currentAdditional - originalActorAdditional
                        if diff > 0 then
                            currentFontColour = CONSTANTS.textColourGreen
                        elseif diff < 0 then
                            currentFontColour = CONSTANTS.textColourRed
                        end
                        --If no equipment is set then assume its a change for level or rating 
                        if not changeAdditional then
                            changeAdditional = diff
                            changeFontColour = currentFontColour
                        end
                    end

                    local index = i * 3 + 31
                    input.parent[index]:setText(round(currentAdditional * 100) .. '%', currentFontColour)
                    if changeAdditional and changeAdditional > 0 then
                        input.parent[index + 1]:setText(round(changeAdditional * 100) .. '%', changeFontColour)
                    else
                        input.parent[index + 1]:setText('')
                    end
                end

                --clean
                while input.parent[49].numChildren > 0 do
                    input.parent[49][1]:removeSelf()
                end
                while input.parent[51].numChildren > 0 do
                    input.parent[51][1]:removeSelf()
                end

                local loadIconFrame = MAIN.IMAGE.loadIconFrame
                local weakCoords = {
                    input.parent[49].coords.x,
                    input.parent[49].coords.y
                }
                local resistCoords = {
                    input.parent[51].coords.x,
                    input.parent[51].coords.y
                }
                for i = 1, #CONSTANTS.elementIcons do
                    local element = currentElementSetBonuses and currentElementSetBonuses[i] or actor:elements(i)
                    if element > 1 then
                        local icon = loadIconFrame(CONSTANTS.elementIcons[i])
                        icon.x = weakCoords[1]
                        icon.y = weakCoords[2]
                        input.parent[49]:insert(icon)

                        weakCoords[1] = weakCoords[1] + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    elseif element < 1 then
                        local icon = loadIconFrame(CONSTANTS.elementIcons[i])
                        icon.x = resistCoords[1]
                        icon.y = resistCoords[2]
                        input.parent[51]:insert(icon)

                        resistCoords[1] = resistCoords[1] + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end
                end
            end

        end
    })

    return statGroup
end

M.createDescriptionGroup = function(options)
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    --set overrides
    options.x = options.x or display.contentWidth - descriptionWidth
    options.y = options.y or (CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2)
    options.width = options.width or descriptionWidth
    options.height = options.height or CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 5 + CONSTANTS.rectanglePadding * 2

    local group = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=options.parent,
        x=options.x,
        y=options.y,
        width=options.width,
        height=options.height,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            local levelWidth = TEXT.textWidth(' 10/10')
            --2 item name
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-levelWidth,
                height=CONSTANTS.lineHeight
            })

            --3 Level
            TEXT.drawText({
                parent=input.parent,
                x=input.x+input.width-levelWidth,
                y=y,
                width=levelWidth,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --4 description, this has wrapping so we need to be careful for stuff that goes past two lines for equip and skills
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text=''
            })

            y = y + CONSTANTS.textHeight + CONSTANTS.lineHeight
            --5 Equipment stuff
            local equipmentGroup = display.newGroup()
            input.parent:insert(equipmentGroup)

            equipmentGroup.isVisible = false

            --5 1 
            local p = TEXT.drawText({
                parent=equipmentGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='PARAMETERS',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink
            })

            --5 2 Params 1
            TEXT.drawTextWithWrapping({
                parent=equipmentGroup,
                x=input.x,
                y=y+p[1].height,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='',
                fontColour=CONSTANTS.textColourGreen
            })

            --5 3 Params 2
            TEXT.drawText({
                parent=equipmentGroup,
                x=input.x,
                y=y+p[1].height+CONSTANTS.textHeight,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='',
                fontColour=CONSTANTS.textColourRed
            })

            y = y + p[1].height + CONSTANTS.textHeight + CONSTANTS.lineHeight
            --5 4
            local s = TEXT.drawText({
                parent=equipmentGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='SLOTS',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
            })
            

            --5 5 Slots group
            local equipSlotsGroup = display.newGroup()
            equipmentGroup:insert(equipSlotsGroup)

            y = y + s[1].height
            local x = input.x
            local halfWidth = input.width * 0.5
            for i = 1, 2 do
                --5 5 1 (+3) item name
                TEXT.drawItemName({
                    parent=equipSlotsGroup,
                    x=x,
                    y=y,
                    width=halfWidth-TEXT.textWidth('Lv 5', CONSTANTS.fontSizeSmall)-CONSTANTS.textPadding,
                    height=CONSTANTS.lineHeight
                })

                --5 5 2 (+3)
                TEXT.drawText({
                    parent=equipSlotsGroup,
                    x=x,
                    y=y,
                    width=halfWidth,
                    height=CONSTANTS.lineHeight,
                    text='Lv  ',
                    fontSize=CONSTANTS.fontSizeSmall,
                    fontColour=CONSTANTS.textColourPink,
                    alignX='right'
                })

                --5 5 3 (+3) item level
                TEXT.drawText({
                    parent=equipSlotsGroup,
                    x=x,
                    y=y,
                    width=halfWidth,
                    height=CONSTANTS.lineHeight,
                    text='',
                    fontSize=CONSTANTS.fontSizeSmall,
                    alignX='right'
                })

                x = x + halfWidth
                --y = y + CONSTANTS.lineHeight
            end

            local skillY = input.y + input.height - CONSTANTS.lineHeight * 3 + 4
            --6 skills stuff
            local skillsGroup = TEXT.drawSkillDetails({
                parent=input.parent,
                x=input.x,
                y=skillY,
                width=input.width
            })

            --6 7 Upgrade group
            local upgradeGroup = display.newGroup()
            skillsGroup:insert(upgradeGroup)

            --6 7 1
            TEXT.drawText({
                parent=upgradeGroup,
                x=input.x,
                y=input.y+input.height-CONSTANTS.lineHeight+4,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Upgrade Type',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            local upgradeTypeWidth = TEXT.textWidth('UpgradeType ')
            --6 7 2 Upgrade type
            TEXT.drawText({
                parent=upgradeGroup,
                x=input.x+upgradeTypeWidth,
                y=input.y+input.height-CONSTANTS.lineHeight+4,
                width=input.width-upgradeTypeWidth,
                height=CONSTANTS.lineHeight,
                alignX='right',
                alignY='centre'
            })

            --6 8
            TEXT.drawText({
                parent=skillsGroup,
                x=input.x,
                y=input.y,
                width=input.width-TEXT.textWidth(' 7'),
                height=CONSTANTS.lineHeight,
                text='Lv',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --6 9 Skill level - should this be constant
            TEXT.drawText({
                parent=skillsGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            function skillsGroup:setItem(item)
                self:setSkill(item)
                
                if item:maxLevel() > 1 then
                    self[7].isVisible = true
                    self[7][2]:setText(CONSTANTS.skillUpgrade[item:upgrade()])
                else
                    self[7].isVisible = false
                end

                self[9]:setText(item:level())
            end

            --7 Weak group
            local weakGroup = display.newGroup()
            input.parent:insert(weakGroup)

            --7 1
            TEXT.drawText({
                parent=weakGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Weak',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --7 2
            TEXT.drawTextWithWrapping({
                parent=weakGroup,
                x=input.x,
                y=input.y+CONSTANTS.lineHeight,
                width=input.width,
                text='Receive increased damage and can apply stun',
                alignY='centre'
            })

            --7 3 Elements group
            local weakElementsGroup = display.newGroup()
            weakElementsGroup.coords = {
                x=input.x,
                y=input.y+CONSTANTS.lineHeight*2+CONSTANTS.textHeight-6,
                width=input.width
            }
            weakGroup:insert(weakElementsGroup)

            --8 Resist group
            local resistGroup = display.newGroup()
            input.parent:insert(resistGroup)

            --8 1
            TEXT.drawText({
                parent=resistGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Resist',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --8 2
            TEXT.drawTextWithWrapping({
                parent=resistGroup,
                x=input.x,
                y=input.y+CONSTANTS.lineHeight,
                width=input.width,
                text='Receive reduced damage and cannot apply stun',
                alignY='centre'
            })

            --8 3 Elements group
            local resistElementsGroup = display.newGroup()
            resistElementsGroup.coords = {
                x=input.x,
                y=input.y+CONSTANTS.lineHeight*2+CONSTANTS.textHeight-6,
                width=input.width
            }
            resistGroup:insert(resistElementsGroup)

            --9 bonus
            local bonusGroup = display.newGroup()
            input.parent:insert(bonusGroup)

            --9 1
            TEXT.drawTextWithWrapping({
                parent=bonusGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='The following characters receive 200% exp',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --9 2 actor groups
            local bonusActorGroups = display.newGroup()
            bonusActorGroups.coords = {
                x=input.x,
                y=input.y+CONSTANTS.lineHeight+CONSTANTS.textHeight-6,
                width=input.width
            }
            bonusGroup:insert(bonusActorGroups)

            --10 enemies
            local enemyGroup = display.newGroup()
            input.parent:insert(enemyGroup)

            --10 1 Image
            local enemyPicture = display.newContainer(input.width, input.height)
            enemyPicture.coords = {
                x=input.x+input.width*0.75-CONSTANTS.textPadding,
                y=input.y+input.height,
                width=input.width*0.5-CONSTANTS.textPadding*2, 
                height=input.height-CONSTANTS.textHeight*4-CONSTANTS.lineHeight
            }
            enemyGroup:insert(enemyPicture, true)

            --10 2 name
            TEXT.drawText({
                parent=enemyGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignY='centre'
            })

            local params = CONSTANTS.paramStats
            local halfWidth = input.width * 0.5
            local enemyY = input.y + CONSTANTS.lineHeight
            for i = 1, #params do
                --ignore mp
                if i ~= 2 then
                    --10 3 (+2) 
                    TEXT.drawText({
                        parent=enemyGroup,
                        x=input.x+((i-1) % 2)*halfWidth,
                        y=enemyY,
                        width=halfWidth,
                        height=CONSTANTS.textHeight,
                        text=params[i],
                        fontColour=CONSTANTS.textColourPink
                    })
                    
                    local paramNameWidth = TEXT.textWidth(params[i] .. ' ')
                    TEXT.drawText({
                        parent=enemyGroup,
                        x=input.x+((i-1) % 2)*halfWidth+paramNameWidth,
                        y=enemyY,
                        width=halfWidth-paramNameWidth,
                        height=CONSTANTS.textHeight,
                        text='',
                        alignX='right'
                    })
                end

                if i > 0 and i % 2 == 0 then
                    enemyY = enemyY + CONSTANTS.textHeight
                end
            end

            enemyY = enemyY + CONSTANTS.lineHeight * 0.5
            --10 17 
            TEXT.drawText({
                parent=enemyGroup,
                x=input.x,
                y=enemyY,
                height=CONSTANTS.lineHeight,
                text='Weak',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --10 18 weak group
            local weakGroup = display.newGroup()
            weakGroup.coords = {
                x=input.x+TEXT.textWidth('Resist')+CONSTANTS.iconPadding,
                y=enemyY
            }
            enemyGroup:insert(weakGroup)

            enemyY = enemyY + CONSTANTS.lineHeight
            --10 19
            TEXT.drawText({
                parent=enemyGroup,
                x=input.x,
                y=enemyY,
                height=CONSTANTS.lineHeight,
                text='Resist',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --10 20 resist group
            local resistGroup = display.newGroup()
            resistGroup.coords = {
                x=input.x+TEXT.textWidth('Resist')+CONSTANTS.iconPadding,
                y=enemyY
            }
            enemyGroup:insert(resistGroup)

            --11 arena
            local arenaGroup = display.newGroup()
            input.parent:insert(arenaGroup)

            --11 1
            TEXT.drawText({
                parent=arenaGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Arena Challenge',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            --11 2
            TEXT.drawTextWithWrapping({
                parent=arenaGroup,
                x=input.x,
                y=input.y+CONSTANTS.lineHeight,
                width=input.width,
                text=''
            })
        end,
        refresh=function(input)
            local item = input.item
            if item then
                local category = input.category

                if category == 'weak' then
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false
                    input.parent[5].isVisible = false
                    input.parent[6].isVisible = false
                    input.parent[8].isVisible = false
                    input.parent[9].isVisible = false
                    input.parent[10].isVisible = false
                    input.parent[11].isVisible = false

                    input.parent[7].isVisible = true
                    while input.parent[7][3].numChildren > 0 do
                        input.parent[7][3][1]:removeSelf()
                    end

                    local x = input.parent[7][3].coords.x
                    local y = input.parent[7][3].coords.y
                    local width = input.parent[7][3].coords.width
                    local drawItemName = MAIN.UI.TEXT.drawItemName
                    for i = 1, #item do
                        local icon = CONSTANTS.elementIcons[item[i]]
                        local name = CONSTANTS.elementNames[item[i]]

                        drawItemName({
                            parent=input.parent[7][3],
                            x=x,
                            y=y,
                            width=width,
                            height=CONSTANTS.lineHeight,
                            item={
                                icon=icon,
                                name=name
                            }
                        })

                        y = y + CONSTANTS.lineHeight
                    end
                elseif category == 'resist' then
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false
                    input.parent[5].isVisible = false
                    input.parent[6].isVisible = false
                    input.parent[7].isVisible = false
                    input.parent[9].isVisible = false
                    input.parent[10].isVisible = false
                    input.parent[11].isVisible = false

                    input.parent[8].isVisible = true
                    while input.parent[8][3].numChildren > 0 do
                        input.parent[8][3][1]:removeSelf()
                    end

                    local x = input.parent[8][3].coords.x
                    local y = input.parent[8][3].coords.y
                    local width = input.parent[8][3].coords.width
                    local drawItemName = MAIN.UI.TEXT.drawItemName
                    for i = 1, #item do
                        local icon = CONSTANTS.elementIcons[item[i]]
                        local name = CONSTANTS.elementNames[item[i]]

                        drawItemName({
                            parent=input.parent[8][3],
                            x=x,
                            y=y,
                            width=width,
                            height=CONSTANTS.lineHeight,
                            item={
                                icon=icon,
                                name=name
                            }
                        })

                        y = y + CONSTANTS.lineHeight
                    end
                elseif category == 'bonus' then
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false
                    input.parent[5].isVisible = false
                    input.parent[6].isVisible = false
                    input.parent[7].isVisible = false
                    input.parent[8].isVisible = false
                    input.parent[10].isVisible = false
                    input.parent[11].isVisible = false
                    
                    input.parent[9].isVisible = true
                    while input.parent[9][2].numChildren > 0 do
                        input.parent[9][2][1]:removeSelf()
                    end

                    local x = input.parent[9][2].coords.x
                    local y = input.parent[9][2].coords.y
                    local width = input.parent[9][2].coords.width
                    local drawItemName = MAIN.UI.TEXT.drawItemName
                    for i = 1, #item do
                        local icon = MAIN.DATA.ITEM.getItem(2, item[i] + 10).icon
                        local name = MAIN.DATA.ACTOR.getActor(item[i]).name
                        drawItemName({
                            parent=input.parent[9][2],
                            x=x,
                            y=y,
                            width=width,
                            height=CONSTANTS.lineHeight,
                            item={
                                icon=icon,
                                name=name
                            }
                        })

                        y = y + CONSTANTS.lineHeight
                    end
                elseif category == 'enemy' then
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false
                    input.parent[5].isVisible = false
                    input.parent[6].isVisible = false
                    input.parent[7].isVisible = false
                    input.parent[8].isVisible = false
                    input.parent[9].isVisible = false
                    input.parent[11].isVisible = false

                    input.parent[10].isVisible = true

                    local dataEnemy = MAIN.DATA.ENEMY.getEnemy(item.enemyId)

                    --image
                    while input.parent[10][1].numChildren > 0 do
                        input.parent[10][1][1]:removeSelf()
                    end
                    local picture = MAIN.IMAGE.loadEnemyPicture(dataEnemy.picture)
                    local scale = math.min(input.parent[10][1].coords.width / picture.width, input.parent[10][1].coords.height / picture.height)
                    picture:scale(scale, scale)

                    picture.anchorX = 0.5
                    picture.anchorY = 1

                    picture.x = input.parent[10][1].coords.x
                    picture.y = input.parent[10][1].coords.y
                    input.parent[10][1]:insert(picture)

                    --name
                    local level = item.level
                    input.parent[10][2]:setText(dataEnemy.name)

                    --hp, do it seperately then we adjust after ignoring mp
                    local hp = math.round(dataEnemy.stats[1] + dataEnemy.growth[1] * level)
                    input.parent[10][4]:setText(hp)

                    for i = 3, #dataEnemy.stats do
                        local stat = math.round(dataEnemy.stats[i] + dataEnemy.growth[i] * level)

                        input.parent[10][4 + (i - 2) * 2]:setText(stat)
                    end

                    --elements
                    while input.parent[10][18].numChildren > 0 do
                        input.parent[10][18][1]:removeSelf()
                    end
 
                    while input.parent[10][20].numChildren > 0 do
                        input.parent[10][20][1]:removeSelf()
                    end

                    local weakX = input.parent[10][18].coords.x
                    local resistX = input.parent[10][20].coords.x

                    local loadIconFrame = MAIN.IMAGE.loadIconFrame
                    for i = 1, #dataEnemy.elements do
                        local element = dataEnemy.elements[i] 
                        if element > 1 then
                            local icon = loadIconFrame(CONSTANTS.elementIcons[i])
                            icon.x = weakX
                            icon.y = input.parent[10][18].coords.y
                            input.parent[10][18]:insert(icon)

                            weakX = weakX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                        elseif element < 1 then
                            local icon = loadIconFrame(CONSTANTS.elementIcons[i])
                            icon.x = resistX
                            icon.y = input.parent[10][20].coords.y
                            input.parent[10][20]:insert(icon)

                            resistX = resistX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                        end
                    end
                
                elseif category == 'arena' then
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = false
                    input.parent[4].isVisible = false
                    input.parent[5].isVisible = false
                    input.parent[6].isVisible = false
                    input.parent[7].isVisible = false
                    input.parent[8].isVisible = false
                    input.parent[9].isVisible = false
                    input.parent[10].isVisible = false

                    input.parent[11].isVisible = true
                    input.parent[11][2]:setText(input.item.name)
                else
                    input.parent[7].isVisible = false
                    input.parent[8].isVisible = false
                    input.parent[9].isVisible = false
                    input.parent[10].isVisible = false
                    input.parent[11].isVisible = false

                    local itemIcon = 1
                    local itemName, itemDescription
                    local itemLevel = 0
                    local itemMaxLevel = 0
        
                    --let item be either the actual item or data, so need to resolve for either .name or :name()
                    if type(item.name) == 'function' then
                        itemIcon = item:icon()
                        itemName = item:name() or ''
                        itemDescription = item:description() or ''
        
                        --level only comes from items, not data
                        itemLevel = item:level()
                        itemMaxLevel = item:maxLevel()
                    else
                        itemIcon = item.icon
                        itemName = item.name or ''
                        itemDescription = item.description or ''
                    end
                    
                    --2 item name
                    input.parent[2]:setItem({icon=itemIcon, name=itemName})
                    input.parent[2].isVisible = true
        
                    --3 level
                    if itemLevel > 0 then
                        input.parent[3].isVisible = false
                        input.parent[3]:setText(itemLevel .. '/' .. itemMaxLevel)
                    else
                        input.parent[3].isVisible = false
                    end
        
                    --4 description
                    input.parent[4]:setText(itemDescription)
                    input.parent[4].isVisible = true
        
                    --additional groups
                    if category == 'equipment' then
                        input.parent[5].isVisible = true
                        input.parent[6].isVisible = false

                        --params
                        local text = ''
                        local textNegative = ''
                        for i = 1, #CONSTANTS.paramStatsShort do
                            local param = type(item.stats) == 'function' and item:stats(i) or item.stats[i]
                            if param > 0 then
                                text = text .. CONSTANTS.paramStatsShort[i] .. ' +' .. param .. ' '
                            elseif param < 0 then
                                textNegative = textNegative .. CONSTANTS.paramStatsShort[i] .. ' ' .. param .. ' '
                            end
                        end

                        for i = 1, #CONSTANTS.paramAdditionalShort do
                            local param = type(item.stats) == 'function' and item:additional(i) or item.additional[i]
                            if param > 0 then
                                text = text .. CONSTANTS.paramAdditionalShort[i] .. ' +' .. string.format('%.2f', param * 100) .. '% '
                            end
                        end
                        input.parent[5][2]:setText(text)
                        input.parent[5][3]:setText(textNegative)

                        --slots
                        input.parent[5][4].isVisible = true
                        input.parent[5][5].isVisible = true
                        for i = 1, 2 do
                            local icon, name, level
                            local fontColour = CONSTANTS.textColour
                            if item.slots then
                                if type(item.slots) == 'table' then
                                    if item.slots[i] then
                                        if item.slots[i].id ~= 0 then
                                            icon = item.slots[i].data.icon
                                            name = item.slots[i]:name()
                                            level = item.slots[i]:level()
                                        else
                                            icon = 192
                                            name = 'Empty'
                                            fontColour = CONSTANTS.textColourInvalid
                                        end
                                    end
                                elseif i <= item.slots then
                                    --for collection
                                    icon = 192
                                    name = 'Empty'
                                    fontColour = CONSTANTS.textColourInvalid
                                end
                            end
                            local itemName = input.parent[5][5][(i - 1) * 3 + 1]
                            if icon and name then
                                itemName.isVisible = true
                                itemName:setItem({icon=icon, name=name}, fontColour)
                            else
                                itemName.isVisible = false
                            end

                            local levelText = input.parent[5][5][(i - 1) * 3 + 2]
                            local currentLevelText = input.parent[5][5][(i - 1) * 3 + 3]
                            if level then
                                currentLevelText.isVisible = true
                                currentLevelText:setText(level)
                                levelText.isVisible = true
                            else
                                currentLevelText.isVisible = false
                                levelText.isVisible = false
                            end
                        end

                    elseif category == 'skill' then
                        input.parent[5].isVisible = false
                        input.parent[6].isVisible = true

                        input.parent[6]:setItem(item)
                    elseif category == 'gem' then
                        input.parent[5].isVisible = true
                        input.parent[6].isVisible = false

                        --params
                        local text = ''

                        --start with additional as they have higher rarity
                        for i = 1, 2 do
                            local param = item:stats(i)
                            if param > 0 then
                                text = text .. CONSTANTS.paramStatsShort[i] .. ' +' .. param .. ' '
                            end
                        end

                        for i = 1, #CONSTANTS.paramAdditionalShort do
                            local param = item:additional(i)
                            if param > 0 then
                                text = text .. CONSTANTS.paramAdditionalShort[i] .. ' +' .. string.format('%.2f', param * 100) .. '% '
                            end
                        end

                        for i = 3, #CONSTANTS.paramStatsShort do
                            local param = item:stats(i)
                            if param > 0 then
                                text = text .. CONSTANTS.paramStatsShort[i] .. ' +' .. param .. ' '
                            end
                        end
                        input.parent[5][2]:setText(text)
                        input.parent[5][3]:setText('')

                        input.parent[5][4].isVisible = false
                        input.parent[5][5].isVisible = false
                    else
                        input.parent[5].isVisible = false
                        input.parent[6].isVisible = false
                    end
                end
            else
                for i = 2, input.parent.numChildren do
                    input.parent[i].isVisible = false
                end
            end
        end
    })

    return group
end

M.createDescription2Group = function(options)
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local descriptionWidth = fifthWidth * 2 + CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2
    --set overrides
    options.x = options.x or display.contentWidth - descriptionWidth
    options.y = options.y or (CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 6)
    options.width = options.width or descriptionWidth
    options.height = options.height or CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 5 + CONSTANTS.rectanglePadding * 2

    local group = MAIN.UI.CONTAINER.createRectangleGroup({
        parent=options.parent,
        x=options.x,
        y=options.y,
        width=options.width,
        height=options.height,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local y = input.y
            --2 recycle group
            local recycleGroup = display.newGroup()
            input.parent:insert(recycleGroup)
            recycleGroup.isVisible = false
            
            --2 1 
            TEXT.drawText({
                parent=recycleGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Recycle',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --2 2 recycle item
            TEXT.drawItemName({
                parent=recycleGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight
            })

            y = y + CONSTANTS.lineHeight
            local buttonWidth = input.width * 0.25 + CONSTANTS.rectanglePadding * 2
            --2 3 Recycle button
            local recycleButton = M.createRectangleWithText({
                parent=recycleGroup,
                x=input.x+input.width-buttonWidth,
                y=y-CONSTANTS.rectanglePadding,
                width=buttonWidth,
                height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
                text='Recycle',
                touch=function()
                    composer.showOverlay('overlay.inventory.recycle', {
                        isModal = true,
                        params = {
                            item = input.parent.item
                        }
                    })
                end
            })
            function recycleButton:enable(isEnabled, text)
                local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
                self:refresh({ text=text, fontColour=fontColour })
        
                self:enableTouch(isEnabled)
            end

            --2 4 disable recycle text
            TEXT.drawText({
                parent=recycleGroup,
                x=input.x,
                y=y,
                width=input.width-buttonWidth,
                height=CONSTANTS.lineHeight,
                text='Cannot recycle with slots',
                fontColour=CONSTANTS.textColourInvalid,
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3 upgrade group
            local upgradeGroup = display.newGroup()
            input.parent:insert(upgradeGroup)
            upgradeGroup.isVisible = false

            --3 1
            TEXT.drawText({
                parent=upgradeGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Level',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --3 2 Level
            TEXT.drawText({
                parent=upgradeGroup,
                x=input.x+TEXT.textWidth('LEvel '),
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignY='centre'
            })

            --3 3 
            TEXT.drawText({
                parent=upgradeGroup,
                x=input.x,
                y=y,
                width=input.width-TEXT.textWidth(' 9999'),
                height=CONSTANTS.lineHeight,
                text='Next',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --3 4
            TEXT.drawText({
                parent=upgradeGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            local gaugeHeight = 12
            --3 5 exp gauge
            MAIN.UI.CONTAINER.createRectangleGauge({
                parent=upgradeGroup,
                x=input.x+CONSTANTS.textPadding,
                y=y+CONSTANTS.textHeight+(CONSTANTS.lineHeight-gaugeHeight),
                width=input.width-CONSTANTS.textPadding*2,
                height=gaugeHeight,
                colour1=CONSTANTS.textColourGreen,
                rate=0
            })

            --3 6 upgrade button
            M.createRectangleWithText({
                parent=upgradeGroup,
                x=input.x+input.width-buttonWidth,
                y=y+CONSTANTS.lineHeight*2,
                width=buttonWidth,
                height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
                text='Upgrade',
                touch=function()
                    composer.showOverlay('overlay.inventory.upgrade', {
                        isModal = true,
                        params = {
                            item = input.parent.item
                        }
                    })
                end
            })

        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent.item = item

                local recycleItem = item:recycleItem()
                if recycleItem then
                    input.parent[2].isVisible = true

                    input.parent[2][2]:setItem({
                        icon=recycleItem.item.icon,
                        name=(recycleItem.item.name .. ' x' .. recycleItem.count)
                    })

                    local isEnabled = true
                    if item.slots then
                        for i = 1, #item.slots do
                            if item.slots[i].id ~= 0 then
                                isEnabled = false
                                break
                            end
                        end
                    end
                    input.parent[2][3]:enable(isEnabled)
                    input.parent[2][4].isVisible = not isEnabled

                else
                    input.parent[2].isVisible = false
                end

                local level = item:level()
                if level > 0 then
                    input.parent[3].isVisible = true

                    input.parent[3][2]:setText(level)
                    input.parent[3][4]:setText(item:requiredExpForNext())
                    input.parent[3][5]:setRate(item:expRateForNext())

                    --hide upgrade button if already max
                    input.parent[3][6].isVisible = input.parent[3][6].canTouch and level < item:maxLevel()

                else
                    input.parent[3].isVisible = false
                end
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
            end
        end
    })

    function group:setTouch(canTouch)
        self[2][3].isVisible = canTouch
        self[3][6].canTouch = canTouch
        self[3][6].isVisible = canTouch
    end

    return group

end

M.createMessageGroup = function(options)
    --we wont reuse createRectangleGroup, just for convience

    local group = display.newGroup()
    options.parent:insert(group)

    --dimensions are slightly bigger than screen so only the top outline is visible
    local rectHeight = CONSTANTS.textHeight * 6
    local rectWidth = display.contentWidth + CONSTANTS.rectangleStrokeWidth
    --1 Message rect
    local messageRect = display.newRect(group, display.contentCenterX, display.contentHeight - rectHeight / 2 + CONSTANTS.rectangleStrokeWidth, rectWidth, rectHeight)
    
    local fillColour = CONSTANTS.rectangleFillColour
    messageRect:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
    
    messageRect.strokeWidth = CONSTANTS.rectangleStrokeWidth
    local strokeColour = CONSTANTS.rectangleStrokeColourActive
    messageRect:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])

    --Always start invisible
    messageRect.alpha = 0

    local TEXT = MAIN.UI.TEXT
    
    local nameX = CONSTANTS.faceWidth + CONSTANTS.textPadding * 2
    local nameY = display.contentHeight - rectHeight + CONSTANTS.textHeight / 2
    local nameColour = CONSTANTS.textColourPink
    local nameWidth = display.contentWidth - nameX * 2
    --2 Name
    local nameText = TEXT.drawText({
        parent=group,
        text='',
        x=nameX,
        y=nameY,
        width=nameWidth,
        fontColour=CONSTANTS.textColourPink
    })
    
    --3 Dialogue
    local dialogueText = TEXT.drawText({
        parent=group,
        text='',
        x=nameX,
        y=nameY+CONSTANTS.textHeight,
        width=nameWidth
    })

    --4 An invisible touch layer which handles text progression
    local touchRect = display.newRect(group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    touchRect.isVisible = false
    touchRect.isHitTestable = false
    touchRect.isFocus = false
    --Add touch event
    function touchRect:touch(event)
        if event.phase == 'began' then
            --Set stage to focus touch events for this object only
            local stage = display.getCurrentStage()
            stage:setFocus( self )
            self.isFocus = true
        elseif self.isFocus and event.phase == 'ended' then
            --shoud allow longpress fastforward
            if self.parent:isFinishedProcessing() then
                options.touch()
            else
                self.parent:processDialogueFull()
            end
            self.isFocus = false
            local stage = display.getCurrentStage()
            stage:setFocus( nil )
        end
    end
    touchRect:addEventListener('touch', touchRect)

    --SHOW/HIDE
    function group:showMessageBox(onComplete, time)
        transition.fadeIn(self[1], {time=(time or CONSTANTS.timeBustFade), onComplete=onComplete})
    end

    function group:hideMessageBox(onComplete, time)
        transition.fadeOut(self[1], {time=(time or CONSTANTS.timeBustFade), onComplete=onComplete})
    end

    --DIALOGUE
    function group:setName(name)
        self[2]:setText(name)
    end

    --DIALOGUE
    function group:setupDialogue(name, dialogue)
        touchRect.isHitTestable = false

        --Clean dialogue to automatically add new lines, this might be costly
        local width = display.contentWidth - nameX * 2
        local line = ''
        local lineFinal = ''
        for i in string.gmatch(dialogue, "%S+") do
            if line == '' then
                line = i
            elseif TEXT.textWidth(line .. ' ' .. i) > width then
                lineFinal = lineFinal .. line .. '\n'
                line = i
            else
                line = line .. ' ' .. i
            end
        end

        if line ~= '' then
            lineFinal = lineFinal .. line
        end

        --store this to be able to increment
        self.dialogue = lineFinal

        self[2]:setText(name)
        self[3]:setText('')
    end

    function group:clearDialogue()
        self:setupDialogue('', '')
    end

    function group:processDialogue(add)
        local textToAdd = self.dialogue:sub(1, add)
        --Cheat to get current text
        local currentText = self[3][1].text
        self[3]:setText(currentText .. textToAdd)
        self.dialogue = self.dialogue:sub(add+1)
    end

    function group:processDialogueFull()
        self:processDialogue(string.len(self.dialogue))
        --THIS ISNT WORKING FOR SOME REASON
        --timer.cancel('dialogue')
    end

    function group:startDialogue()
        local dialogueLength = string.len(self.dialogue)
        if dialogueLength > 0 then
            --Message speed, 1/2 show that many characters (Normal/Fast), 3 is instant
            local delaySettings = MAIN.SYSTEM.OPTIONS.getMessageSpeed()
            if delaySettings == 3 then
                self:processDialogueFull()
            else
                timer.performWithDelay(1, function(event)
                    self:processDialogue(delaySettings)
                    if string.len(self.dialogue) == 0 then
                        timer.cancel(event.source)
                    end
                end, 0, 'dialogue')
            end
            self[4].isHitTestable = true
        end
    end

    function group:isFinishedProcessing()
        return self.dialogue == ''
    end

    --Function to execute when touched
    function group:onTouch(f)
        local t = self[4]
        function t:touch(event)
            if event.phase == 'began' then
                --should allow longpress fastforward
                if self.parent:isFinishedProcessing() then
                    f()
                else
                    self.parent:processDialogueFull()
                end
            end
            return true
        end
    
        --t:addEventListener( "touch", t )
    end

    group:clearDialogue()
    
    return group
end

--Scrollview
M.createCategoryScrollView = function(options)
    --[[
        items format
        {
            category - name
            key - some identifier
            fontColour - optional - default to CONSTANTS.textColour
        }
    ]]--

    --set overrides
    options.x = 0
    options.y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    options.width = CONSTANTS.backWidth
    options.height = display.contentHeight - options.y
    options.rows = 9
    options.columns = 1
    options.numItems = options.rows
    options.create = function(input)
        MAIN.UI.TEXT.drawText({
            parent=input.parent,
            x=input.x,
            y=input.y,
            width=input.width,
            height=input.height,
            text='',
            alignX='centre',
            alignY='centre'
        })
    end
    options.refresh = function(input)
        local isTouchEnabled = false
        if input.item then
            isTouchEnabled = true
            input.parent[2]:setText(input.item.category, input.item.fontColour)
        end
        input.parent[2].isVisible = isTouchEnabled
        input.parent:enableTouch(isTouchEnabled)
    end

    return MAIN.UI.CONTAINER.createScrollViewWithRectangles(options)
end

M.createStagesScrollView = function(options)
    --set overrides
    options.create = function(input)
        --create a container to crop the busts
        local container = display.newContainer(input.width, input.height)
        input.parent:insert(container, true)

        local blackBoxHeight = CONSTANTS.textHeight * 2 + CONSTANTS.textPadding * 2
        --1 Picture - this is a group so we can store coords
        local group = display.newGroup()
        container:insert(group)
        group.coords = {
            x=input.x,
            y=input.y,
            width=input.width,
            height=input.height-blackBoxHeight
        }

        --2 A black rect
        local r = display.newRect(container, input.x, input.y+input.height, input.width, blackBoxHeight)
        --Using anchor to adjust
        r.anchorX = 0
        r.anchorY = 1
        r:setFillColor(0.2, 0.2, 0.2, 1)

        local TEXT = MAIN.UI.TEXT
        local y = input.y + input.height - blackBoxHeight + CONSTANTS.textPadding
        --3 Name
        TEXT.drawText({
            parent=container,
            x=input.x,
            y=y,
            width=input.width-TEXT.textWidth(' 100%'),
            height=blackBoxHeight,
            text='',
            alignX='left'
        })

        --4 Percent
        TEXT.drawText({
            parent=container,
            x=input.x,
            y=y,
            width=input.width,
            height=blackBoxHeight,
            text='',
            alignX='right'
        })

        y = y + CONSTANTS.textHeight
        --5
        TEXT.drawText({
            parent=container,
            x=input.x,
            y=y,
            width=input.width-TEXT.textWidth(' 10-10'),
            height=input.height,
            text='Recomm. Lv',
            fontColour=CONSTANTS.textColourPink,
            alignX='left'
        })

        --6 Recommended level
        TEXT.drawText({
            parent=container,
            x=input.x,
            y=y,
            width=input.width,
            height=blackBoxHeight,
            text='',
            alignX='right'
        })

        --7 Locked
        --Create a group for this to disable it easier
        local lockedGroup = display.newGroup()
        container:insert(lockedGroup)

        --7 1 
        local lockedRect = display.newRect(input.x, input.y, input.width, input.height)
        lockedGroup:insert(lockedRect)
        lockedRect.anchorX = 0
        lockedRect.anchorY = 0
        lockedRect:setFillColor(0, 0, 0, 0.3)

        --7 2
        TEXT.drawText({
            parent=lockedGroup,
            x=input.x,
            y=input.y,
            width=input.width,
            height=input.height,
            text='Locked',
            fontColour=CONSTANTS.textColourRed,
            alignX='right'
        })

        --7 3 Locked requirements
        TEXT.drawText({
            parent=lockedGroup,
            x=input.x,
            y=input.y+CONSTANTS.textHeight,
            width=input.width,
            height=input.height,
            text='',
            alignX='right'
        })
    end

    options.refresh = function(input)
        local container = input.parent[2]
        local hasItem = false
        local isLocked = true
        if input.item then
            hasItem = true

            local item = input.item

            --1 picture
            local picture
            local pictureGroup = container[1]
            while pictureGroup.numChildren > 0 do
                pictureGroup[1]:removeSelf()
            end
            local pictureCoords = pictureGroup.coords
            if item.picture.type == 'bust' then
                picture = MAIN.IMAGE.loadBustPicture(item.picture.imageName, item.picture.frame)
                picture.x = pictureCoords.x + (pictureCoords.width - CONSTANTS.bustWidth) * 0.5
                picture.y = pictureCoords.y + pictureCoords.height - CONSTANTS.bustHeight
            else
                picture = MAIN.IMAGE.loadStagePicture(item.picture.imageName)
                picture.x = pictureCoords.x
                picture.y = pictureCoords.y
            end
            pictureGroup:insert(picture)

            --3 Name
            container[3]:setText(item.name)

            --4 Percent
            container[4]:setText(item.percent, item.percentFontColour)

            if item.level then
                container[5].isVisible = true
                --6 Recommended Lv
                container[6].isVisible = true
                container[6]:setText(item.level)
            else
                container[5].isVisible = false
                container[6].isVisible = false
            end

            --7 Locked
            local requirements = item.requirements
            isLocked = not not requirements
            if isLocked then
                container[7][3]:setText(requirements)
            end
            container[7].isVisible = isLocked
        end
        container.isVisible = hasItem
        input.parent:enableTouch(options.isTouchEnabled and not isLocked)
    end

    return MAIN.UI.CONTAINER.createScrollViewWithRectangles(options)
end

M.createFloorsScrollView = function(options)
    --set overrides
    options.rows = 4
    options.columns = 1
    options.numItems = 4
    options.create = function(input)
        local y = input.y

        local TERMS = MAIN.TERMS
        local TEXT = MAIN.UI.TEXT

        --2 Terrain pic
        local terrainPic = display.newGroup()
        input.parent:insert(terrainPic)
        terrainPic.coords = {
            x=input.x,
            y=input.y,
            width=input.width,
            height=input.height
        }

        local TEXT = MAIN.UI.TEXT

        --3 Floor rect
        local floorGroup = MAIN.UI.CONTAINER.createRectangleGroup({
            parent=input.parent,
            x=input.x-CONSTANTS.rectangleStrokeWidth,
            y=input.y-CONSTANTS.rectangleStrokeWidth,
            width=input.width*0.25+CONSTANTS.rectangleStrokeWidth*2,
            height=CONSTANTS.lineHeight+CONSTANTS.rectangleStrokeWidth*2,
            padding=0,
            create=function(input2)
                local floorText = 'Floor ' .. input.index

                --2
                TEXT.drawText({
                    parent=input2.parent,
                    x=input2.x,
                    y=input2.y,
                    width=input.width,
                    height=input2.height,
                    text=floorText,
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })

                local smallTextX = input2.x + TEXT.textWidth(floorText) + 6
                local smallTextY = input2.y + (CONSTANTS.lineHeight - CONSTANTS.textHeight) * 0.5 - 3
                --3
                TEXT.drawText({
                    parent=input2.parent,
                    x=smallTextX,
                    y=smallTextY,
                    width=input2.width,
                    height=CONSTANTS.lineHeight,
                    text='Clear',
                    fontSize=CONSTANTS.fontSizeSmall,
                    fontColour=CONSTANTS.textColourGreen
                })

                --4 
                TEXT.drawText({
                    parent=input2.parent,
                    x=smallTextX,
                    y=smallTextY,
                    width=input2.width,
                    height=CONSTANTS.lineHeight,
                    text='Locked',
                    fontSize=CONSTANTS.fontSizeSmall,
                    fontColour=CONSTANTS.textColourRed
                })

                --5
                TEXT.drawText({
                    parent=input2.parent,
                    x=smallTextX,
                    y=smallTextY+12,
                    width=input2.width,
                    height=CONSTANTS.lineHeight,
                    text='Quick Clear',
                    fontSize=CONSTANTS.fontSizeSmall,
                    fontColour=CONSTANTS.textColourInvalid
                })
            end,
            refresh=function(input2)
                input2.parent[3].isVisible = input2.isFloorCleared
                input2.parent[4].isVisible = not input2.isEnabled

                if input2.canAuto then
                    input2.parent[5].isVisible = true
                    input2.parent[5]:setText(nil, input2.isFloorCleared and CONSTANTS.textColourYellow or CONSTANTS.textColourInvalid)
                else
                    input2.parent[5].isVisible = false
                end
            end
        })

        --4 Rewards
        local rewardsGroup = MAIN.UI.CONTAINER.createRectangleGroup({
            parent=input.parent,
            x=input.x-CONSTANTS.rectangleStrokeWidth,
            y=input.y+input.height-CONSTANTS.lineHeight*2-CONSTANTS.rectangleStrokeWidth*2,
            width=input.width*0.37+CONSTANTS.rectangleStrokeWidth*2,
            height=CONSTANTS.lineHeight*2+CONSTANTS.rectangleStrokeWidth*3,
            padding=0,
            create=function(input2)
                --2
                TEXT.drawText({
                    parent=input2.parent,
                    x=input2.x,
                    y=input2.y,
                    width=input2.width,
                    height=CONSTANTS.lineHeight,
                    text='Rewards',
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })

                --3 rewards group
                local rewardsGroup = display.newGroup()
                rewardsGroup.coords = {
                    x=input2.x+TEXT.textWidth('Rewards')+CONSTANTS.iconPadding,
                    y=input2.y+(CONSTANTS.lineHeight-CONSTANTS.iconHeight)*0.5
                }
                input2.parent:insert(rewardsGroup)

                local loadIconFrame = MAIN.IMAGE.loadIconFrame
                local battleX = input2.x + CONSTANTS.textPadding --+ TEXT.textWidth('Rewards') + CONSTANTS.iconPadding
                local secondY = input2.y + CONSTANTS.lineHeight
                --4 guild exp
                local guildIcon = loadIconFrame(4)
                guildIcon.x = battleX
                guildIcon.y = secondY + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
                input2.parent:insert(guildIcon)

                battleX = battleX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                --5 party exp
                local partyIcon = loadIconFrame(160)
                partyIcon.x = battleX
                partyIcon.y = secondY + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
                input2.parent:insert(partyIcon)

                --6 Bonus group
                local bonusGroup = display.newGroup()
                input2.parent:insert(bonusGroup)

                battleX = battleX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                --6 1
                TEXT.drawText({
                    parent=bonusGroup,
                    x=battleX,
                    y=secondY,
                    height=CONSTANTS.lineHeight,
                    text='Bonus',
                    fontColour=CONSTANTS.textColourPink,
                    alignY='centre'
                })

                --6 2 bonus characters group
                local bonusCharactersGroup = display.newGroup()
                bonusGroup:insert(bonusCharactersGroup)

                bonusCharactersGroup.coords = {
                    x=battleX+CONSTANTS.iconPadding+TEXT.textWidth('Bonus'),
                    y=secondY+(CONSTANTS.lineHeight-CONSTANTS.iconHeight)*0.5
                }
            end,
            refresh=function(input2)
                if input2.rewards then
                    input2.parent[3].isVisible = true
                    while input2.parent[3].numChildren > 0 do
                        input2.parent[3][1]:removeSelf()
                    end

                    local rewardsX = input2.parent[3].coords.x
                    local rewardsY = input2.parent[3].coords.y

                    local loadIconFrame = MAIN.IMAGE.loadIconFrame

                    --first
                    for i = 1, #input2.rewards.first do
                        local reward = input2.rewards.first[i]
                        local icon = loadIconFrame(reward.icon or MAIN.DATA.ITEM.getItem(reward.category, reward.id).icon)
                        icon.x = rewardsX
                        icon.y = rewardsY
                        input2.parent[3]:insert(icon)

                        --add first clear
                        local firstClearIcon = loadIconFrame(input2.isFloorCleared and 182 or 168)
                        firstClearIcon.x = rewardsX
                        firstClearIcon.y = rewardsY
                        input2.parent[3]:insert(firstClearIcon)

                        rewardsX = rewardsX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end

                    --general
                    for i = 1, #input2.rewards.general do
                        local reward = input2.rewards.general[i]
                        local icon = loadIconFrame(reward.icon or MAIN.DATA.ITEM.getItem(reward.category, reward.id).icon)
                        icon.x = rewardsX
                        icon.y = rewardsY
                        input2.parent[3]:insert(icon)

                        rewardsX = rewardsX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end

                    --battle
                    input2.parent[4].isVisible = input2.rewards.battle.guild and input2.rewards.battle.guild > 0 or false
                    input2.parent[5].isVisible = input2.rewards.battle.party and input2.rewards.battle.party > 0 or false

                    if input2.rewards.battle.bonus then
                        input2.parent[6].isVisible = true
                        while input2.parent[6][2].numChildren > 0 do
                            input2.parent[6][2][1]:removeSelf()
                        end

                        local bonusX = input2.parent[6][2].coords.x
                        local bonusY = input2.parent[6][2].coords.y
                        for i = 1, #input2.rewards.battle.bonus do
                            local icon = loadIconFrame(MAIN.DATA.ITEM.getItem(2, 10 + input2.rewards.battle.bonus[i]).icon)
                            icon.x = bonusX
                            icon.y = bonusY

                            input2.parent[6][2]:insert(icon)

                            bonusX = bonusX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                        end
                    else
                        input2.parent[6].isVisible = false
                    end
                else
                    input2.parent[3].isVisible = false
                    input2.parent[4].isVisible = false
                    input2.parent[5].isVisible = false
                    input2.parent[6].isVisible = false
                end
            end
        })

        --5 enemies type
        local enemiesText = MAIN.UI.CONTAINER.createRectangleGroup({
            parent=input.parent,
            x=input.x+input.width*0.37,
            y=input.y-CONSTANTS.rectangleStrokeWidth,
            width=input.width*0.25+CONSTANTS.rectangleStrokeWidth*2,
            height=CONSTANTS.lineHeight+CONSTANTS.rectangleStrokeWidth*2,
            padding=0,
            create=function(input2)
                --2 no. waves
                TEXT.drawText({
                    parent=input2.parent,
                    x=input2.x,
                    y=input2.y,
                    width=input2.width-TEXT.textWidth(' Lv 100'),
                    height=input2.height,
                    text='4 Waves',
                    alignY='centre'
                })

                --3
                TEXT.drawText({
                    parent=input2.parent,
                    x=input2.x,
                    y=input2.y,
                    width=input2.width-TEXT.textWidth(' 100'),
                    height=input2.height,
                    text='Lv',
                    fontColour=CONSTANTS.textColourPink,
                    alignX='right',
                    alignY='centre'
                })
                
                --4 enemy level
                TEXT.drawText({
                    parent=input2.parent,
                    x=input2.x,
                    y=input2.y,
                    width=input2.width,
                    height=input2.height,
                    text='',
                    alignX='right',
                    alignY='centre'
                })

            end
        })

        --6 enemy icons
        local enemiesGroup = display.newGroup()
        enemiesGroup.coords = {
            x=(input.x+input.width*0.37),
            y=input.y+input.height-CONSTANTS.lineHeight*2-CONSTANTS.rectangleStrokeWidth*2,
            height=CONSTANTS.lineHeight*2+CONSTANTS.rectangleStrokeWidth*3,
        }
        input.parent:insert(enemiesGroup)

        local buttonWidth = TEXT.textWidth('Details') + CONSTANTS.textPadding * 2
        --7 details
        MAIN.UI.COMMON.createRectangleWithText({
            parent=input.parent,
            x=input.x+input.width-buttonWidth+CONSTANTS.rectangleStrokeWidth,
            y=input.y-CONSTANTS.rectangleStrokeWidth,
            width=buttonWidth,
            height=CONSTANTS.lineHeight+CONSTANTS.rectangleStrokeWidth*2,
            text='Details',
            touch=function()
                if input.parent.item then
                    composer.showOverlay('overlay.floor.details', {
                        isModal=true,
                        params={
                            item=input.parent.item,
                            isEnabled=input.parent.isEnabled,
                            isFloorCleared=input.parent.isFloorCleared,
                            floorIndex=input.parent.floorIndex
                        }
                    })
                end
            end,
            padding=0
        })
    end
    options.refresh = function(input)
        local item = input.item
        if item then
            local isFloorClearedFunc = MAIN.PLAYER.QUEST.isFloorCleared
            local isFloorCleared = isFloorClearedFunc(composer.getVariable('quest'), composer.getVariable('stage'), input.index)

            local isEnabled = true
            if input.item.requirePrevious and not isFloorCleared then
                isEnabled = isFloorClearedFunc(composer.getVariable('quest'), composer.getVariable('stage'), input.index - 1, true)
            end

            --2 terrain
            input.parent[2].isVisible = true

            while input.parent[2].numChildren > 0 do
                input.parent[2][1]:removeSelf()
            end

            local terrain = CONSTANTS.terrain[item.terrain]
            local terrainImage = MAIN.IMAGE.loadFloorPicture(terrain.imageName)
            terrainImage.x = input.parent[2].coords.x
            terrainImage.y = input.parent[2].coords.y
            input.parent[2]:insert(terrainImage)

            local strokeColour
            input.parent:enableTouch(isEnabled)
            if isEnabled then
                strokeColour = CONSTANTS.rectangleStrokeColourActive
            else
                strokeColour = CONSTANTS.rectangleStrokeColourInactive
                terrainImage:setFillColor(1, 1, 1, 0.4)
            end

            --3 floor
            input.parent[3].isVisible = true
            input.parent[3]:refresh({isFloorCleared=isFloorCleared, isEnabled=isEnabled, canAuto=item.canAuto})

            --4 rewards
            input.parent[4].isVisible = true
            input.parent[4]:refresh({rewards=item.rewards, isFloorCleared=isFloorCleared})

            --5 enemy types
            input.parent[5].isVisible = true
            if item.enemies then
                local wavesCount = item.enemies.waves and #item.enemies.waves or 3
                input.parent[5][2]:setText(wavesCount .. ' waves', CONSTANTS.textColour)
                input.parent[5][3].isVisible = true
                input.parent[5][4].isVisible = true
                input.parent[5][4]:setText(item.enemies.level)

                --enemy icons
                input.parent[6].isVisible = true
                while input.parent[6].numChildren > 0 do
                    input.parent[6][1]:removeSelf()
                end
                if item.enemies.type == 'standard' then
                    local getTroop = MAIN.DATA.TROOP.getTroop
                    local getEnemy = MAIN.DATA.ENEMY.getEnemy
                    local createRectangleGroup = MAIN.UI.CONTAINER.createRectangleGroup
                    local loadEnemyPicture = MAIN.IMAGE.loadEnemyPicture
                    local uniqueEnemies = {}
                    local enemyX = input.parent[6].coords.x
                    local enemyY = input.parent[6].coords.y
                    local enemyWidth = CONSTANTS.rectangleStrokeWidth * 2 + 160 / 3 --this is same width as turn order
                    local enemyHeight = input.parent[6].coords.height
                    for i = 1, #item.enemies.waves do
                        local troop = getTroop(item.enemies.waves[i])
                        for j = 1, #troop do
                            if not uniqueEnemies[troop[j].enemyId] then
                                uniqueEnemies[troop[j].enemyId] = true

                                local enemy = getEnemy(troop[j].enemyId)
                                local enemyImage = enemy.picture
                                local enemyBoss = enemy.boss
                                enemy = nil

                                --max num icons is 9 and the last gets cut off
                                --immediately create it, only issue is the order
                                createRectangleGroup({
                                    parent=input.parent[6],
                                    x=enemyX,
                                    y=enemyY,
                                    width=enemyWidth,
                                    height=enemyHeight,
                                    padding=0,
                                    strokeColourDisabled=strokeColour,
                                    create=function(input2)
                                        --2 container
                                        local container = display.newContainer(input2.width, input2.height)
                                        input2.parent:insert(container, true)

                                        --2 1 image
                                        local image = loadEnemyPicture(enemyImage)
                                        image.anchorX = 0.5
                                        image.anchorY = 0.5

                                        local scale = input2.height / image.height
                                        image:scale(scale, scale)

                                        container:insert(image)

                                        --2 2
                                        if enemyBoss then
                                            MAIN.UI.TEXT.drawText({
                                                parent=container,
                                                x=input2.x,
                                                y=input2.y,
                                                width=input2.width,
                                                height=CONSTANTS.textHeight,
                                                text='Boss',
                                                fontSize=CONSTANTS.fontSizeSmall+2,
                                                fontColour=CONSTANTS.textColourPink,
                                                alignX='right',
                                                alignY='centre'
                                            })
                                        end
                                    end,
                                    refresh=function(input2)

                                    end
                                })

                                enemyX = enemyX + enemyWidth - CONSTANTS.rectangleStrokeWidth
                            end
                        end
                    end
                else
                    local enemyX = input.parent[6].coords.x
                    local enemyY = input.parent[6].coords.y
                    local enemyWidth = CONSTANTS.rectangleStrokeWidth * 2 + 160 / 3 --this is same width as turn order
                    local enemyHeight = input.parent[6].coords.height

                    MAIN.UI.CONTAINER.createRectangleGroup({
                        parent=input.parent[6],
                        x=enemyX,
                        y=enemyY,
                        width=enemyWidth,
                        height=enemyHeight,
                        padding=0,
                        strokeColourDisabled=strokeColour,
                        create=function(input2)
                            MAIN.UI.TEXT.drawText({
                                parent=input2.parent,
                                x=input2.x,
                                y=input2.y+14,
                                width=input2.width,
                                height=input2.height,
                                text='Random',
                                fontSize=CONSTANTS.fontSizeSmall+2,
                                alignX='centre'
                            })

                            if item.enemies.terrains then
                                MAIN.UI.TEXT.drawText({
                                    parent=input2.parent,
                                    x=input2.x,
                                    y=input2.y+28,
                                    width=input2.width,
                                    height=input2.height,
                                    text='Set',
                                    fontSize=CONSTANTS.fontSizeSmall+2,
                                    alignX='centre'
                                })
                            end
                        end,
                        refresh=function(input2)

                        end
                    })
                end
            else
                input.parent[5][2]:setText('No enemies', CONSTANTS.textColourInvalid)
                input.parent[5][3].isVisible = false
                input.parent[5][4].isVisible = false
                input.parent[6].isVisible = false
            end

            --7
            input.parent[7].isVisible = true
            
            input.parent[3][1]:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])
            input.parent[4][1]:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])
            input.parent[5][1]:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])

            input.parent.item = item
            input.parent.isEnabled = isEnabled
            input.parent.isFloorCleared = isFloorCleared
            input.parent.floorIndex = input.index
        else
            input.parent[2].isVisible = false
            input.parent[3].isVisible = false
            input.parent[4].isVisible = false
            input.parent[5].isVisible = false
            input.parent[6].isVisible = false
            input.parent[7].isVisible = false

            input.parent.item = nil
            input.parent.isEnabled = nil
            input.parent.isFloorCleared = nil
            input.parent.floorIndex = nil
            input.parent:enableTouch(false)
        end
    end

    return MAIN.UI.CONTAINER.createScrollViewWithRectangles(options)
end

return M