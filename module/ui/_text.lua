local M = {}

--text defaults
local text_options = {
    --parent=nil,
    --x=nil,
    --y=nil,
    --width=nil,
    --height=nill,
    text='',
    font=CONSTANTS.font,
    fontSize=CONSTANTS.fontSize,
    fontColour=CONSTANTS.textColour,
    alignX='left',
    alignY='top',
    paddingX=CONSTANTS.textPadding,
    paddingY=0,
    ignoreShadow=false
}

function text_options:inheritDefaults(options)
    --setup default options
    setmetatable(options, self)
    self.__index = self
end

M.drawText = function(options)
    text_options:inheritDefaults(options)

    local group = display.newGroup()
    options.parent:insert(group)

    --setup text
    local text = display.newText({
        text=options.text,
        font=options.font,
        fontSize=options.fontSize
    })
    group:insert(text)
    text:setFillColor(options.fontColour[1], options.fontColour[2], options.fontColour[3], options.fontColour[4])

    --Move to positions, adjust so default aligns left
    text.x = options.x + options.paddingX
    text.y = options.y + options.paddingY
    text.anchorX = 0
    text.anchorY = 0

    --Create shadow
    local shadow = display.newText({
        text=options.text,
        font=options.font,
        fontSize=options.fontSize
    })
    local shadowColour = CONSTANTS.textShadowColour
    shadow:setFillColor(shadowColour[1], shadowColour[2], shadowColour[3], shadowColour[4])
    
    local shadowDisplace = CONSTANTS.textShadowDisplace * (options.fontSize <= CONSTANTS.fontSizeSmall and 0.5 or 1)
    shadow.x = text.x + shadowDisplace
    shadow.y = text.y + shadowDisplace
    shadow.anchorX = 0
    shadow.anchorY = 0
    
    group:insert(1, shadow)

    shadow.isVisible = not options.ignoreShadow

    --align text, width and height must be specifed if want to align
    if options.width then
        --default is left so only need to check for centre and right
        if options.alignX == 'centre' then
            local xAdjust = (options.width - options.paddingX * 2) * 0.5
            text.x = text.x + xAdjust
            text.anchorX = 0.5
            shadow.x = shadow.x + xAdjust
            shadow.anchorX = 0.5
        elseif options.alignX == 'right' then
            local xAdjust = (options.width - options.paddingX * 2)
            text.x = text.x + xAdjust
            text.anchorX = 1
            shadow.x = shadow.x + xAdjust
            shadow.anchorX = 1
        end
    end

    if options.height then
        --default is top so only need to check for centre and bottom
        if options.alignY == 'centre' then
            local yAdjust = (options.height - options.paddingY) * 0.5
            text.y = text.y + yAdjust
            text.anchorY = 0.5
            shadow.y = shadow.y + yAdjust
            shadow.anchorY = 0.5
        elseif options.alignY == 'bottom' then
            local yAdjust = (options.height - options.paddingY)
            text.y = text.y + yAdjust
            text.anchorY = 1
            shadow.y = shadow.y + yAdjust
            shadow.anchorY = 1
        end
    end

    --create scale function 
    function group:scaleText()
        --Only scale on x
        local text = self[1]
        local shadow = self[2]
        
        text.xScale = 1
        shadow.xScale = 1

        if options.width then
            local width = options.width - options.paddingX * 2

            if width and text.width > width then
                local scale = width / text.width
                text.xScale = scale
                shadow.xScale = scale
            end
        end
    end
    --immediately run it
    group:scaleText()

    --create set text function
    function group:setText(text, fontColour)
        if text then
            self[1].text = text
            self[2].text = text

            self:scaleText()
        end

        if fontColour then
            self[2]:setFillColor(fontColour[1], fontColour[2], fontColour[3], fontColour[4])
        end
    end

    return group
end

M.drawTextWithWrapping = function(options)
    text_options:inheritDefaults(options)

    local group = display.newGroup()
    options.parent:insert(group)

    --setup text
    local text = display.newText({
        text=options.text,
        font=options.font,
        fontSize=options.fontSize,
        width=options.width-options.paddingX*2

    })
    group:insert(text)
    text:setFillColor(options.fontColour[1], options.fontColour[2], options.fontColour[3], options.fontColour[4])

    --Move to positions, adjust so default aligns left
    text.x = options.x + options.paddingX
    text.y = options.y + options.paddingY
    text.anchorX = 0
    text.anchorY = 0

    --Create shadow
    local shadow = display.newText({
        text=options.text,
        font=options.font,
        fontSize=options.fontSize,
        width=options.width-options.paddingX*2
    })
    local shadowColour = CONSTANTS.textShadowColour
    shadow:setFillColor(shadowColour[1], shadowColour[2], shadowColour[3], shadowColour[4])
    
    local shadowDisplace = CONSTANTS.textShadowDisplace
    shadow.x = text.x + shadowDisplace
    shadow.y = text.y + shadowDisplace
    shadow.anchorX = 0
    shadow.anchorY = 0
    
    group:insert(1, shadow)

    shadow.isVisible = not options.ignoreShadow

    function group:setText(text, fontColour)
        if text then
            self[1].text = text
            self[2].text = text
        end

        if fontColour then
            self[2]:setFillColor(fontColour[1], fontColour[2], fontColour[3], fontColour[4])
        end
    end

    return group
end

M.textWidth = function(text, fontSize)
    local textObj = display.newText({
        text=text or '',
        font=CONSTANTS.font,
        fontSize=fontSize or CONSTANTS.fontSize
    })

    local textWidth = textObj.width

    textObj:removeSelf()
    textObj = nil

    return textWidth
end

--item name defaults
local item_name_options = {
    --parent=nil,
    --x=nil,
    --y=nil,
    --width=nil,
    --height=nill,
    item={
        icon=1,
        name=''
    },
    font=CONSTANTS.font,
    fontSize=CONSTANTS.fontSize,
    fontColour=CONSTANTS.textColour,
    alignX='left',
    alignY='top',
    paddingX=CONSTANTS.textPadding,
    paddingY=0,
    ignoreShadow=false
}

function item_name_options:inheritDefaults(options)
    --setup default options
    setmetatable(options, self)
    self.__index = self
end

M.drawItemName = function(options)
    local group = display.newGroup()
    options.parent:insert(group)

    --1 Icon
    local iconImage = MAIN.IMAGE.loadIconFrame(options.item and options.item.icon or 1)
    group:insert(iconImage)

    iconImage.x = options.x + CONSTANTS.iconPadding
    iconImage.y = options.y + ((options.height or CONSTANTS.iconHeight) - CONSTANTS.iconHeight) * 0.5

    --2 Text
    local text = M.drawText({
        parent=group,
        x=options.x+CONSTANTS.iconWidth+CONSTANTS.iconPadding*2,
        y=options.y,
        width=options.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding*2,
        height=(options.height or CONSTANTS.iconHeight),
        text=(options.item and options.item.name or ''),
        fontSize=options.fontSize,
        fontColour=options.fontColour,
        alignY='centre',
        paddingX=0
    })

    function group:setItem(item, fontColour)
        --defaults to current if item doesnt exist
        item = item or { icon=self[1].fill.frame, name=nil }
        self[1].fill.frame = item.icon
        self[2]:setText(item.name, fontColour)
    end

    return group
end

M.drawMember = function(options)
    --There arent any defaults so dont need inheritance stuff

    local container = display.newContainer(options.width, options.height)
    options.parent:insert(container, true)

    --1 face - place holder, need to store coords
    local face = display.newRect(container, 0, 0, 0, 0)
    face.isVisible = false
    container.coords = {
        x=options.x,
        y=options.y+(options.height-CONSTANTS.faceHeight)*0.5
    }

    --2 black box
    local blackBorder = display.newRect(container, options.x, options.y+options.height-CONSTANTS.textHeight, options.width, CONSTANTS.textHeight)
    blackBorder.anchorX = 0
    blackBorder.anchorY = 0
    blackBorder:setFillColor(0.2, 0.2, 0.2, 0.4)

    local paramWidth = M.textWidth('999 ', 10)
    --3 Name
    M.drawText({
        parent=container,
        x=options.x,
        y=options.y+options.height-CONSTANTS.textHeight,
        width=CONSTANTS.faceWidth,
        height=CONSTANTS.textHeight,
        alignX='left',
        alignY='centre',
        text=''
    })

    --4
    M.drawText({
        parent=container,
        x=options.x+CONSTANTS.faceWidth+CONSTANTS.iconWidth-paramWidth,
        y=options.y+options.height-CONSTANTS.textHeight,
        width=paramWidth,
        height=CONSTANTS.textHeight,
        alignX='right',
        alignY='top',
        text='LVL ',
        fontSize=10,
        fontColour=CONSTANTS.textColourPink,
        paddingX=0
    })

    --5 stat
    M.drawText({
        parent=container,
        x=options.x+CONSTANTS.faceWidth+CONSTANTS.iconWidth-paramWidth,
        y=options.y+options.height-CONSTANTS.textHeight,
        width=paramWidth,
        height=CONSTANTS.textHeight,
        alignX='right',
        alignY='bottom',
        text='',
        fontSize=10,
        paddingX=0
    })

    local IMAGE = MAIN.IMAGE
    --6 rank
    local rank = IMAGE.loadIconFrame(1)
    container:insert(rank)
    rank.x = options.x + CONSTANTS.faceWidth
    rank.y = options.y

    --7 rating
    local rating = IMAGE.loadIconFrame(1)
    container:insert(rating)
    rating.x = options.x + CONSTANTS.faceWidth
    rating.y = options.y + CONSTANTS.iconHeight

    container.isVisible = false

    function container:setActor(actor)
        if actor then
            self.isVisible = true
            if self.actor ~= actor then
                --1 face
                self[1]:removeSelf()
                local face = MAIN.IMAGE.loadFacePicture(actor:skin().face)
                self:insert(1, face)
                face.x = self.coords.x
                face.y = self.coords.y

                --3 name
                self[3]:setText(actor:name())
            end
            --These always need to refresh

            --5 stat
            self[5]:setText(actor:level())

            --6 rank
            self[6].fill.frame = CONSTANTS.rankIcon[actor:rank()]

            --7 rating
            self[7].fill.frame = CONSTANTS.ratingIcon[actor:rating()]

        else 
            self.isVisible = false
        end
    end

    container:setActor(options.actor)

    return container
end

M.drawSkillDetails = function(options)
    local skillsGroup = display.newGroup()
    options.parent:insert(skillsGroup)

    local thirdWidth = options.width / 3
    local skillX = options.x
    local skillY = options.y

    --1 skill type (physical/ magical/ certain)
    M.drawText({
        parent=skillsGroup,
        x=skillX,
        y=skillY,
        width=thirdWidth,
        height=CONSTANTS.lineHeight,
        text='',
        alignY='centre'
    })

    --2 Effect (damage/heal/buff/debuff)
    M.drawText({
        parent=skillsGroup,
        x=skillX+thirdWidth,
        y=skillY,
        width=thirdWidth,
        height=CONSTANTS.lineHeight,
        text='',
        alignY='centre'
    })

    --3 Target
    M.drawText({
        parent=skillsGroup,
        x=skillX+thirdWidth*2,
        y=skillY,
        width=thirdWidth,
        height=CONSTANTS.lineHeight,
        text='',
        alignY='centre'
    })

    --4
    M.drawText({
        parent=skillsGroup,
        x=skillX,
        y=skillY+CONSTANTS.lineHeight,
        width=thirdWidth-M.textWidth(' 100'),
        height=CONSTANTS.lineHeight,
        text='Speed',
        fontColour=CONSTANTS.textColourPink,
        alignY='centre'
    })

    --5 Speed
    M.drawText({
        parent=skillsGroup,
        x=skillX,
        y=skillY+CONSTANTS.lineHeight,
        width=thirdWidth,
        height=CONSTANTS.lineHeight,
        text='',
        alignX='right',
        alignY='centre'
    })

    --6 Group for additional effects
    local additionalGroup = display.newGroup()
    skillsGroup:insert(additionalGroup)

    --6 1 effect (apply/ chance/ grant)
    M.drawText({
        parent=additionalGroup,
        x=skillX+thirdWidth,
        y=skillY+CONSTANTS.lineHeight,
        width=thirdWidth*2,
        height=CONSTANTS.lineHeight,
        text='',
        fontColour=CONSTANTS.textColourPink,
        alignY='centre'
    })

    --6 2 effect icons
    local additionalIconsGroup = display.newGroup()
    additionalGroup:insert(additionalIconsGroup)

    additionalIconsGroup.coords = {
        x=skillX+CONSTANTS.textPadding+thirdWidth+M.textWidth('Chance')+CONSTANTS.iconPadding,
        y=skillY+CONSTANTS.lineHeight+(CONSTANTS.lineHeight-CONSTANTS.iconHeight)*0.5
    }

    function skillsGroup:setSkill(skill)
        if skill then
            self.isVisible = true

            self[1]:setText(CONSTANTS.skillType[skill:type()])
            self[2]:setText(skill:effect())
            self[3]:setText(CONSTANTS.skillTarget[skill:target()])
            local speed = skill:speed()
            local speedFontColour
            if speed > 0 then
                speed = '+' .. speed
                speedFontColour = CONSTANTS.textColourGreen
            elseif speed < 0 then
                speedFontColour = CONSTANTS.textColourRed
            else
                speedFontColour = CONSTANTS.textColour
            end
            self[5]:setText(speed, speedFontColour)

            --effects, assume it cannot have more than one type
            local buffs = skill:buffs()
            local debuffs = skill:debuffs()
            local statBuffs = skill:statBuffs()

            local effects, text, getEffect
            if statBuffs then
                effects = statBuffs
                --get text from first value
                text = effects[1].chance and 'Chance' or 'Apply'
                getEffect = CONSTANTS.statBuffsIcons
            elseif buffs then
                effects = buffs
                text = 'Apply'
                getEffect = MAIN.DATA.BUFF.getBuff
            elseif debuffs then
                effects = debuffs
                text = 'Chance'
                getEffect = MAIN.DATA.DEBUFF.getDebuff
            end

            if effects then
                self[6].isVisible = true
                self[6][1]:setText(text)
                while self[6][2].numChildren > 0 do
                    self[6][2][1]:removeSelf()
                end

                local iconX = self[6][2].coords.x
                local iconY = self[6][2].coords.y

                local loadIconFrame = MAIN.IMAGE.loadIconFrame
                for i = 1, #effects do
                    local icon = loadIconFrame(getEffect(effects[i].id, effects[i].value).icon)
                    icon.x = iconX --self[6][2].coords.x + (i - 1) * (CONSTANTS.iconWidth + CONSTANTS.iconPadding)
                    icon.y = iconY --self[6][2].coords.y
                    self[6][2]:insert(icon)

                    --it goes over the description rect
                    if i == 4 then
                        iconX = self[6][2].coords.x
                        iconY = self[6][2].coords.y + CONSTANTS.iconHeight + CONSTANTS.iconPadding
                    else
                        iconX = iconX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end
                end
            else
                self[6].isVisible = false
            end
        else
            self.isVisible = false
        end
    end

    return skillsGroup
end

--timer
M.drawTimer = function(options)
    local group = display.newGroup()
    options.parent:insert(group)

    local x = options.x
    local y = options.y

    --Create a group for each precision
    local letters = { 'D', 'H', 'M', 'S' }

    local letterWidth = M.textWidth('D')
    local numberWidth = M.textWidth('99')

    for i = 1, #letters do
        --1 (+1) group
        local letterGroup = display.newGroup()
        group:insert(letterGroup)

        --1 (+1) 1 number
        M.drawText({
            parent=letterGroup,
            x=x,
            y=y,
            width=numberWidth,
            text='',
            paddingX=0,
            alignX='right'
        })

        x = x + numberWidth
        --1 (+1) 2 letter
        M.drawText({
            parent=letterGroup,
            x=x,
            y=y,
            width=letterWidth,
            text=letters[i],
            fontColour=CONSTANTS.textColourPink,
            paddingX=0
        })

        x = x + letterWidth
    end
    
    group.time = 0
    group.remainingTime = -1
    group.isComplete = true

    function group:nextTime(category)
        if category == 'day' then
            local oldDate = os.date('*t', MAIN.SYSTEM.TIME.time())
            --get next day
            return os.time({ year=oldDate.year, month=oldDate.month, day=oldDate.day+1, hour=0 })
        elseif category == 'week' then
            local oldDate = os.date('*t', MAIN.SYSTEM.TIME.time())
            --get next sunday, iterate through all days until its sunday
            for i = 1, 7 do
                local newDate = os.time({ year=oldDate.year, month=oldDate.month, day=oldDate.day+i, hour=0 })

                local nextWDay = os.date('%w', newDate)
                if nextWDay == '0' then
                    return newDate
                end
            end
        elseif category == 'month' then
            local oldDate = os.date('*t', MAIN.SYSTEM.TIME.time())
            --get next month first day
            return os.time({ year=oldDate.year, month=oldDate.month+1, day=1, hour=0 })
        end
    end

    function group:updateRemainingTime()
        local remainingTime = self.time - MAIN.SYSTEM.TIME.time()
        if remainingTime > 0 then
            --dont need to redraw if no seconds changed
            if self.remainingTime ~= remainingTime then
                --print('update time')
                self.remainingTime = remainingTime

                --Check days
                local floor = math.floor
                local daysRemaining = floor(remainingTime / (60 * 60 * 24))
                local hasDays, hasHours
                if daysRemaining > 0 then
                    self[1].isVisible = true
                    self[1][1]:setText(daysRemaining)

                    remainingTime = remainingTime - (daysRemaining * 60 * 60 * 24)
                    hasDays = true
                else 
                    self[1].isVisible = false
                end

                local hoursRemaining = floor(remainingTime / (60 * 60))
                if hasDays or hoursRemaining > 0 then
                    self[2].isVisible = true
                    self[2][1]:setText(hoursRemaining)

                    remainingTime = remainingTime - (hoursRemaining * 60 * 60)
                    hasHours = true
                else
                    self[2].isVisible = false
                end

                local minutesRemaining = floor(remainingTime / 60)
                if hasHours or minutesRemaining > 0 then
                    self[3].isVisible = true
                    self[3][1]:setText(minutesRemaining)

                    remainingTime = remainingTime - (minutesRemaining * 60)
                else
                    self[3].isVisible = false
                end

                self[4][1]:setText(remainingTime)
            end
            
            return false
        else
            self[1].isVisible = false
            self[2].isVisible = false
            self[3].isVisible = false
            self[4].isVisible = true
            self[4][1]:setText('0')

            self.isComplete = true
        end
    end

    local updateTime
    updateTime = function()
        --THERE IS A BUG SOMEWHERE
        if not pcall(function() group:updateRemainingTime() end) then
            Runtime:removeEventListener('enterFrame', updateTime)
            return
        end

        if group.isComplete then
            Runtime:removeEventListener('enterFrame', updateTime)
            options.onComplete(group)
        end
    end

    function group:setTime(time)
        self.isVisible = true

        self.time = time or 0
        self.remainingTime = -1
        self.isComplete = false
        self:updateRemainingTime()

        Runtime:addEventListener('enterFrame', updateTime)
    end

    function group:stopTime()
        Runtime:removeEventListener('enterFrame', updateTime)
        self.isVisible = false
    end

    return group
end

return M