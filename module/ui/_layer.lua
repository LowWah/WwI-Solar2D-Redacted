--Create common display groups

local M = {}

M.createBackgroundLayer = function()
    local group = display.newGroup()

    --There is no parent because it will be inserted later

    group.imageName = nil

    --make this a list so we can load more than one backgrounds, mainly for dialogue, why do i need this
    group.images = {}
    function group:updateBackgroundImages(images)
        local update = false
        if #self.images ~= #images then
            update = true
        else
            for i = 1, #self.images do
                if self.images[i] ~= images[i] then
                    update = true
                    break
                end
            end
        end

        if update then
            --remove all children in group
            while self.numChildren > 0 do
                self[1]:removeSelf()
            end

            self.images = images

            for i = 1, #images do
                local backgroundImage = MAIN.IMAGE.loadBackgroundPicture(images[i])
                self:insert(backgroundImage)
                backgroundImage.x = 0
                backgroundImage.y = 0
            end
        end
    end

    function group:focusBackgroundImage(index)
        for i = 1, self.numChildren do
            self[i].isVisible = i == index
        end
    end

    return group
end

M.createTransitionLayer = function()
    local group = display.newGroup()

    --There is no parent because it will be inserted later

    local rect = display.newRect(group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect:setFillColor(0, 0, 0, 1)
    rect.alpha = 0
    rect.isVisible = false

    --attach a touch event to block lower level touch events while visible
    function rect:touch(event)
        return true
    end
    rect:addEventListener('touch', rect)

    function group:startFadeOut(options)
        options = options or {}
        local r = group[1]

        r.alpha = 0
        r.isVisible = true

        transition.fadeIn(r, {
            time=(options.time or 500),
            onComplete=function()
                if options.onComplete then
                    options.onComplete()
                end
            end
        })
    end

    function group:startFadeIn(options)
        options = options or {}
        local r = group[1]

        r.alpha = 1
        r.isVisible = true

        transition.fadeOut(r, {
            time=(options.time or 500),
            onComplete=function()
                if options.onComplete then
                    options.onComplete()
                end
                r.isVisible = false
            end
        })
    end

    return group
end

M.createLoadingLayer = function()
    local group = display.newGroup()

    local rect = display.newRect(group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect:setFillColor(0, 0, 0, 1)

    local text = display.newText({
        parent=group,
        x=display.contentCenterX,
        y=display.contentCenterY,
        width=display.contentWidth,
        font=CONSTANTS.font,
        text='LOADING',
        fontSize=72,
        align='center'
    })

    group.isVisible = false

    return group
end

M.createTouchLayer = function()
    --An invisible touch layer which adds animations on touch

    local group = display.newGroup()

    local rect = display.newRect(group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect.isVisible = false
    --Required so hits can be processed even if not visible
    rect.isHitTestable = true

    rect.animationSheet = MAIN.IMAGE.loadAnimationSheet('Click', { 
        width=32,
        height=32,
        numFrames=6,
        frame=0
    })

    function rect:touch(event)
        if event.phase == 'began' then
            local animation = display.newSprite(group, self.animationSheet, {
                name='animation',
                start=1,
                count=6,
                time=480,
                loopCount=1
            })
            animation.x = event.x
            animation.y = event.y

            animation:addEventListener('sprite', function(e)
                if e.phase == 'ended' then
                    animation:removeSelf()
                    animation = nil
                end
            end)

            animation:play()
        end
        --We dont return anything so lower layer touches can be processed
    end

    rect:addEventListener('touch', rect)

    function group:enableTouchAnimation(isTrue)
        self[1].isHitTestable = isTrue
    end

    return group
end

M.createLowerUiLayer = function()
    local group = display.newGroup()

    --Gradients
    local colour1 = CONSTANTS.overlayColour
    local colour2 = { 0, 0, 0, 0 }

    local CONTAINER = MAIN.UI.CONTAINER

    local topGradientWidth = display.contentWidth * 0.5
    --1
    local topLeftGradient = CONTAINER.createGradientRect({
        parent=group,
        x=0,
        y=CONSTANTS.rectanglePadding,
        width=topGradientWidth,
        height=CONSTANTS.lineHeight,
        colour1=colour1,
        colour2=colour2
    })
    topLeftGradient.isVisible = false
    
    --2
    local topRightGradient = CONTAINER.createGradientRect({
        parent=group,
        x=topGradientWidth,
        y=CONSTANTS.rectanglePadding,
        width=topGradientWidth,
        height=CONSTANTS.lineHeight,
        colour1=colour2,
        colour2=colour1
    })
    topRightGradient.isVisible = false

    function group:showTopGradient(isTrue)
        self[1].isVisible = isTrue
        self[2].isVisible = isTrue
    end

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local middleGradientWidth = display.contentWidth / 3

    --3
    local middleLeftGradient = CONTAINER.createGradientRect({
        parent=group,
        x=0,
        y=y,
        width=middleGradientWidth,
        height=display.contentHeight-y,
        colour1=colour2,
        colour2=colour1
    })
    middleLeftGradient.isVisible = false
    
    --4
    local middleRightGradient = CONTAINER.createGradientRect({
        parent=group,
        x=middleGradientWidth,
        y=y,
        width=display.contentWidth-middleGradientWidth,
        height=display.contentHeight-y*2,
        colour1=colour1,
        colour2=colour2
    })
    middleRightGradient.isVisible = false

    function group:showMiddleGradient(isTrue)
        self[3].isVisible = isTrue
        self[4].isVisible = isTrue
    end

    --5 Actor picture
    --Create a dummy for now
    local actorPicture = display.newRect(group, 0, 0, 0, 0)
    actorPicture.isVisible = false
    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2

    local x = (display.contentWidth - fifthWidth * 3 - CONSTANTS.rectangleSpacing * 2 - CONSTANTS.rectanglePadding * 2) - CONSTANTS.backWidth
    
    group.actorPictureX = CONSTANTS.backWidth + (x - CONSTANTS.actorWidth) * 0.5 -- display.contentWidth / 3 - CONSTANTS.actorWidth * 0.5
    group.actorPictureY = display.contentHeight - CONSTANTS.actorHeight

    
    function group:updateActorPicture(imageName)
        if imageName then
            if self[5].imageName ~= imageName then

                self[5]:removeSelf()

                local actorImage = MAIN.IMAGE.loadActorPicture(imageName)
                actorImage.imageName = imageName

                self:insert(5, actorImage)

                actorImage.x = self.actorPictureX
                actorImage.y = self.actorPictureY
            end
            self[5].isVisible = true
        else
            self[5].isVisible = false
        end
    end
    
    local COMMON = MAIN.UI.COMMON
    local x = 0
    local height = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --6 Back
    local back = COMMON.createRectangleWithText({
        parent=group,
        x=x,
        y=0,
        width=CONSTANTS.backWidth,
        height=height,
        text='Back',
        touch=function()
            print('This is a dummy to enable touch')
        end
    })
    back.isVisible = false

    function group:updateBack(onTouch)
        if onTouch then
            self[6]._touch = onTouch
            self[6].isVisible = true
        else
            self[6].isVisible = false
        end
    end

    local width = display.contentWidth * 0.2
    x = x + CONSTANTS.backWidth
    --7 Scene name
    local sceneName = COMMON.createRectangleWithText({
        parent=group,
        x=x,
        y=0,
        width=width,
        height=height,
        text='',
        fontColour=CONSTANTS.textColourPink,
        fillColour={0,0,0,0},
        strokeColourDisabled={0,0,0,0}
    })
    sceneName.isVisible = false

    function group:updateSceneName(sceneName)
        self[7]:refresh({text=sceneName})
        self[7].isVisible = sceneName ~= ''
    end

    x = x + width
    --8 Guild
    local guild = CONTAINER.createRectangleGroup({
        parent=group,
        x=x,
        y=0,
        width=width,
        height=height,
        fillColour={0,0,0,0},
        strokeColourDisabled={0,0,0,0},
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local TERMS = MAIN.TERMS
            local GUILD = MAIN.PLAYER.GUILD
    
            --2
            local guildIcon = MAIN.IMAGE.loadIconFrame(4)
            guildIcon.x = input.x + CONSTANTS.iconPadding
            guildIcon.y = input.y + (input.height - CONSTANTS.iconHeight) * 0.5
            input.parent:insert(guildIcon)
    
            local smallFontSize = CONSTANTS.fontSizeSmall
            --3
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width-TEXT.textWidth(' ' .. GUILD.maxLevel(), smallFontSize)),
                height=input.height,
                text='Level',
                fontSize=smallFontSize,
                fontColour=CONSTANTS.textColourPink,
                paddingX=CONSTANTS.textPadding,
                alignX='right'
            })
    
            --4 Guild level
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontSize=smallFontSize,
                paddingX=CONSTANTS.textPadding,
                alignX='right'
            })
    
            --5
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width-TEXT.textWidth(' ' .. GUILD.maxNext(), smallFontSize)),
                height=input.height,
                text='To Next',
                fontSize=smallFontSize,
                fontColour=CONSTANTS.textColourPink,
                paddingX=CONSTANTS.textPadding,
                alignX='right',
                alignY='bottom'
            })
    
            --6 Guild to next
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontSize=smallFontSize,
                paddingX=CONSTANTS.textPadding,
                alignX='right',
                alignY='bottom'
            })
        end,
        refresh=function(input)
            local group = input.parent
    
            local GUILD = MAIN.PLAYER.GUILD
    
            group[4]:setText(GUILD.level())
            
            group[6]:setText(GUILD.expForNext())
        end
    })
    guild.isVisible = false

    function group:showGuild(isTrue)
        self[8].isVisible = isTrue
        if isTrue then
            self[8]:refresh()
        end
    end

    x = x + width
    --9 Gold
    local gold = CONTAINER.createRectangleGroup({
        parent=group,
        x=x,
        y=0,
        width=width,
        height=height,
        fillColour={0,0,0,0},
        strokeColourDisabled={0,0,0,0},
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            --2
            local goldIcon = MAIN.IMAGE.loadIconFrame(CONSTANTS.goldIcon)
            goldIcon.x = input.x + CONSTANTS.iconPadding
            goldIcon.y = input.y + (input.height - CONSTANTS.iconHeight) * 0.5
            input.parent:insert(goldIcon)

            --3 Gold
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                paddingX=CONSTANTS.textPadding,
                alignX='right',
                alignY='centre'
            })
        end,
        refresh=function(input)
            input.parent[3]:setText(MAIN.PLAYER.GOLD.gold())
        end
    })
    gold.isVisible = false

    function group:showGold(isTrue)
        self[9].isVisible = isTrue
        if isTrue then
            self:updateGold()
        end
    end

    function group:updateGold()
        self[9]:refresh()
    end

    --10 Lives
    x = x + width
    local lives = CONTAINER.createRectangleGroup({
        parent=group,
        x=x,
        y=0,
        width=width,
        height=height,
        fillColour={0,0,0,0},
        strokeColourDisabled={0,0,0,0},
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local LIVES = MAIN.PLAYER.LIVES

            --This is refernce to CONSTANTS since lives should not be uploaded yet
            local maxLives = LIVES.lowerMaxLives()

            --2
            local livesIcon = MAIN.IMAGE.loadIconFrame(6)
            livesIcon.x = input.x + CONSTANTS.iconPadding
            livesIcon.y = input.y + (input.height - CONSTANTS.iconHeight) * 0.5
            input.parent:insert(livesIcon)

            --3 Current Lives
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=(input.width - TEXT.textWidth('/' .. maxLives)),
                height=input.height,
                text='',
                paddingX=CONSTANTS.textPadding,
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
                text=('/' .. maxLives),
                paddingX=CONSTANTS.textPadding,
                alignX='right',
                alignY='centre'
            })

            --5 timer
            TEXT.drawText({
                parent=input.parent,
                x=input.x+CONSTANTS.iconWidth+CONSTANTS.iconPadding,
                y=input.y,
                width=input.width-CONSTANTS.iconWidth-CONSTANTS.iconPadding-TEXT.textWidth('999/20'),
                height=input.height,
                text='',
                fontSize=CONSTANTS.fontSizeSmall
            })
        end,
        refresh=function(input)
            local LIVES = MAIN.PLAYER.LIVES
        
            local currentLives = input.parent.currentLives
            local maxLives = input.parent.maxLives
    
            local livesFillColour
            if currentLives == 0 then
                livesFillColour = CONSTANTS.textColourInvalid
            elseif currentLives >= maxLives then
                livesFillColour = CONSTANTS.textColourGreen
            else
                livesFillColour = CONSTANTS.textColour
            end
    
            local text = input.parent[3]
            text:setText(currentLives, livesFillColour)
    
            input.parent[4]:setText('/' .. maxLives)
        end
    })
    lives.isVisible = false
    
    function group:updateLives()
        local LIVES = MAIN.PLAYER.LIVES
        local refresh = false
        --Check max, if need to refresh then will always refresh current
        local maxLives = LIVES.maxLives()
        if self[10].maxLives ~= maxLives then
            self[10].maxLives = maxLives

            refresh = true
        end

        local currentLives = LIVES.currentLives()
        if self[10].currentLives ~= currentLives then
            self[10].currentLives = currentLives

            refresh = true
        end

        if refresh then
            self[10]:refresh()
        end

        --update live recover timer
        local timeToNext
        if currentLives < maxLives then
            timeToNext = MAIN.SYSTEM.SAVE.getSave().lives.time + CONSTANTS.livesTimeForOne - MAIN.SYSTEM.TIME.time()
        end

        if self[10][5].timeToNext ~= timeToNext then
            self[10][5].timeToNext = timeToNext

            local text = ''
            if timeToNext then
                local minutes = math.floor(timeToNext / 60)
                local seconds = timeToNext - minutes * 60

                --ty chatgpt for this format
                text = string.format("%02d:%02d", minutes, seconds)
            end
            self[10][5]:setText(text)
        end
    end

    local updateLives = function()
        --need to wrap this in a function to be added to enter frame
        group:updateLives()
    end

    --Main functions used to show/ hide elements
    function group:show(options)
        --[[
            {
                topGradient - true/false,
                middleGradient - true/false,
                actorPicture - actor image name, if null then will hide actorPicture
                back - touch function, if null then will hide back
                sceneName - scene name, (defaults to '' so invisible)
                guild - true/false,
                gold - true/false,
                lives - true/false
            }
        ]]--

        self.isVisible = not not options
        options = options or {}

        self:showTopGradient(options.topGradient or false)

        self:showMiddleGradient(options.middleGradient or false)

        self:updateActorPicture(options.actorPicture)

        self:updateBack(options.back)

        self:updateSceneName(options.sceneName or '')

        self:showGuild(options.guild or false)
        
        self:showGold(options.gold or false)

        --if lives is shown then start the increment lives
        local optionsLives = options.lives or false
        local lives = self[10]

        if lives.isVisible ~= optionsLives then
            lives.isVisible = optionsLives

            if optionsLives then
                --Run it the first time
                updateLives()

                Runtime:addEventListener('enterFrame', updateLives)
            else
                Runtime:removeEventListener('enterFrame', updateLives)
            end
        end
    end

    group.isVisible = false

    return group
end

M.createOverlayLayer = function(parent)
    local rect = display.newRect(parent, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    rect:setFillColor(0, 0, 0, 0.35)

    return rect
end

return M