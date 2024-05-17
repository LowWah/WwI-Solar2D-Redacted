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

     --1 overlay layer
     MAIN.UI.LAYER.createOverlayLayer(sceneGroup)

     --2 Back
     MAIN.UI.COMMON.createRectangleWithText({
         parent=sceneGroup,
         x=display.contentWidth * 0.8,
         y=display.contentHeight-CONSTANTS.lineHeight*3-CONSTANTS.rectanglePadding*2-CONSTANTS.rectangleSpacing,
         width=display.contentWidth*0.2-CONSTANTS.iconWidth-CONSTANTS.rectanglePadding,
         height=CONSTANTS.lineHeight+CONSTANTS.rectanglePadding*2,
         text='Back',
         touch=function()
             composer.hideOverlay()
         end
     })

     --3 Turnorder group
     sceneGroup:insert(event.params.turnOrderGroup)

     local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
     local skillsWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
     --create a rectangle for base
     local rectX = 0
     local rectY = CONSTANTS.lineHeight * 2
     local rectWidth = display.contentWidth - skillsWidth + CONSTANTS.rectanglePadding
     local rectHeight = display.contentHeight - CONSTANTS.lineHeight * 2 - CONSTANTS.rectanglePadding - rectY

     local battler = event.params.battler
     --4 stats rect
     MAIN.UI.CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=rectX,
        y=rectY,
        width=rectWidth,
        height=rectHeight,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local halfWidth = input.width * 0.5
            local quarterWidth = halfWidth * 0.5

            local x = input.x
            local y = input.y

            local battlerName = battler.name
            if battler.letter then
                battlerName = battlerName .. ' ' .. battler.letter
            end
            --name
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth-TEXT.textWidth(' Lv 100'),
                height=CONSTANTS.lineHeight,
                text=battlerName,
                alignY='centre'
            })

            --LVL text
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth-TEXT.textWidth(' 100'),
                height=CONSTANTS.lineHeight,
                text='Lv',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --LVL
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth,
                height=CONSTANTS.lineHeight,
                text=battler.level,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight

            --HP text
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=quarterWidth,
                text='HP',
                fontColour=CONSTANTS.textColourPink
            })

            local currentHpText = '/' .. battler:maxHp()
            --HP Current
            TEXT.drawText({
                parent=input.parent,
                x=x+TEXT.textWidth('HP'),
                y=y,
                width=quarterWidth-TEXT.textWidth(currentHpText .. 'HP'),
                text=battler:hp(),
                alignX='right'
            })
            
            --HP Max
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=quarterWidth,
                text=currentHpText,
                alignX='right'
            })

            if battler.isActor then
                --MP text
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+quarterWidth,
                    y=y,
                    width=quarterWidth,
                    text='MP',
                    fontColour=CONSTANTS.textColourPink
                })

                --MP current and max
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x+quarterWidth,
                    y=y,
                    width=quarterWidth,
                    text=(battler:mp() .. '/' .. battler:maxMp()),
                    alignX='right'
                })

                --TP text
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y+CONSTANTS.textHeight,
                    width=quarterWidth,
                    text='TP',
                    fontColour=CONSTANTS.textColourPink
                })

                --TP current
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y+CONSTANTS.textHeight,
                    width=quarterWidth-TEXT.textWidth('/100'),
                    text=battler.tp,
                    fontColour=(battler.hyper and CONSTANTS.textColourPink or CONSTANTS.textColour),
                    alignX='right'
                })

                --TP max
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y+CONSTANTS.textHeight,
                    width=quarterWidth,
                    text=('/' .. battler:maxTp()),
                    alignX='right'
                })
            end

            y = y + CONSTANTS.textHeight * 2.5

            local function paramFontColour(new, old)
                if new > old then
                    return CONSTANTS.textColourGreen
                elseif new < old then
                    return CONSTANTS.textColourRed
                else
                    return CONSTANTS.textColour
                end
            end

            local floor = math.floor

            local stats = CONSTANTS.paramStats
            for i = 3, #stats do
                local statX = x + ((i - 3) % 2 * quarterWidth)
                local statY = y + floor((i - 3) / 2) * CONSTANTS.textHeight

                --stat text
                TEXT.drawText({
                    parent=input.parent,
                    x=statX,
                    y=statY,
                    width=quarterWidth,
                    text=stats[i],
                    fontColour=CONSTANTS.textColourPink
                })

                
                local currentStat = battler:statsTotal(i)
                TEXT.drawText({
                    parent=input.parent,
                    x=statX,
                    y=statY,
                    width=quarterWidth,
                    text=currentStat,
                    fontColour=paramFontColour(currentStat, battler:statsBase(i)),
                    alignX='right'
                })
            end

            y = y + CONSTANTS.textHeight * 3.5

            local round = math.round
            local additional = CONSTANTS.paramAdditional
            for i = 1, #additional do
                local additionalX = x + ((i - 1) % 2 * quarterWidth)
                local additionalY = y + floor((i - 1) / 2) * CONSTANTS.textHeight

                --stat text
                TEXT.drawText({
                    parent=input.parent,
                    x=additionalX,
                    y=additionalY,
                    width=quarterWidth,
                    text=additional[i],
                    fontColour=CONSTANTS.textColourPink
                })

                local additional = battler:additionalTotal(i)
                TEXT.drawText({
                    parent=input.parent,
                    x=additionalX,
                    y=additionalY,
                    width=quarterWidth,
                    text=(round(additional * 100) .. '%'),
                    fontColour=paramFontColour(additional, battler:additionalBase(i)),
                    alignX='right'
                })
            end

            local iconX = x + TEXT.textWidth('Resist ')
            local loadIconFrame = MAIN.IMAGE.loadIconFrame

            y = y + CONSTANTS.textHeight * 3.5
            --WEAK
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Weak',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            local weakX = iconX
            local weakY = y

            y = y + CONSTANTS.lineHeight
            --RESIST
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Resist',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            local resistX = iconX
            local resistY = y

            local elementIcons = CONSTANTS.elementIcons
            for i = 1, #elementIcons do
                local rate = battler:elementsTotal(i)
                if rate > 1 then
                    local icon = loadIconFrame(elementIcons[i])
                    icon.x = weakX
                    icon.y = weakY
                    input.parent:insert(icon)

                    weakX = weakX + CONSTANTS.iconPadding + CONSTANTS.iconWidth

                elseif rate < 1 then
                    local icon = loadIconFrame(elementIcons[i])
                    icon.x = resistX
                    icon.y = resistY
                    input.parent:insert(icon)

                    resistX = resistX + CONSTANTS.iconPadding + CONSTANTS.iconWidth
                end
            end

            y = y + CONSTANTS.lineHeight + CONSTANTS.textHeight * 0.5
            --BUFF
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Buff',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            local buffX = iconX
            local buffY = y + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
            local getBuff = MAIN.DATA.BUFF.getBuff
            for k, v in pairs(battler.buffs) do
                local iconId = getBuff(v.id).icon
                if iconId > 1 then
                    local icon = loadIconFrame(iconId)
                    icon.x = buffX
                    icon.y = buffY
                    input.parent:insert(icon)

                    TEXT.drawText({
                        parent=input.parent,
                        x=buffX,
                        y=buffY,
                        width=CONSTANTS.iconWidth,
                        height=CONSTANTS.iconHeight,
                        text=(v.turn or 0),
                        fontSize=CONSTANTS.fontSizeSmall,
                        paddingX=0,
                        paddingY=0,
                        alignX='right'
                    })

                    buffX = buffX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                end
            end

            y = y + CONSTANTS.lineHeight
            --DEBUFF
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='Debuff',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            local debuffX = iconX
            local debuffY = y + (CONSTANTS.lineHeight - CONSTANTS.iconHeight) * 0.5
            local getDebuff = MAIN.DATA.DEBUFF.getDebuff
            for k, v in pairs(battler.debuffs) do
                --icon
                local iconId = getDebuff(v.id).icon
                if iconId > 1 then
                    local icon = loadIconFrame(iconId)
                    icon.x = debuffX
                    icon.y = debuffY
                    input.parent:insert(icon)

                    TEXT.drawText({
                        parent=input.parent,
                        x=debuffX,
                        y=debuffY,
                        width=CONSTANTS.iconWidth,
                        height=CONSTANTS.iconHeight,
                        text=(v.turn or 0),
                        fontSize=CONSTANTS.fontSizeSmall,
                        paddingX=0,
                        paddingY=0,
                        alignX='right'
                    })

                    debuffX = debuffX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                end
            end

            --statbuffs
            local statBuffsIcons = CONSTANTS.statBuffsIcons
            for i = 1, #battler.statBuffs do
                local statBuff = battler.statBuffs[i]

                if statBuff.value ~= 0 then
                    local icon = loadIconFrame(statBuffsIcons(i, statBuff.value).icon)
                    input.parent:insert(icon)

                    if statBuff.value > 0 then
                        icon.x = buffX
                        icon.y = buffY

                        TEXT.drawText({
                            parent=input.parent,
                            x=buffX,
                            y=buffY,
                            width=CONSTANTS.iconWidth,
                            height=CONSTANTS.iconHeight,
                            text=statBuff.turn,
                            fontSize=CONSTANTS.fontSizeSmall,
                            paddingX=0,
                            paddingY=0,
                            alignX='right'
                        })

                        buffX = buffX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                        
                    elseif statBuff.value < 0 then
                        icon.x = debuffX
                        icon.y = debuffY

                        TEXT.drawText({
                            parent=input.parent,
                            x=debuffX,
                            y=debuffY,
                            width=CONSTANTS.iconWidth,
                            height=CONSTANTS.iconHeight,
                            text=statBuff.turn,
                            fontSize=CONSTANTS.fontSizeSmall,
                            paddingX=0,
                            paddingY=0,
                            alignX='right'
                        })

                        debuffX = debuffX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    end
                end
            end

            x = x + halfWidth
            y = input.y
            --ACTION
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                height=CONSTANTS.lineHeight,
                text='Action',
                fontColour=CONSTANTS.textColourPink,
                alignY='centre'
            })

            --TURN SPEED TEXT
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth-TEXT.textWidth(' 999'),
                height=CONSTANTS.lineHeight,
                text='Speed',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --Speed
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth,
                height=CONSTANTS.lineHeight,
                text=battler.speed,
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            local skill = battler:inputSkillObj()
            --Action name
            TEXT.drawItemName({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth-TEXT.textWidth('lv 9'),
                height=CONSTANTS.lineHeight,
                item={
                    icon=skill:icon(),
                    name=skill:name()
                }
            })

            --skill level text
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth-TEXT.textWidth(' 9'),
                height=CONSTANTS.lineHeight,
                text='Lv',
                fontColour=CONSTANTS.textColourPink,
                alignX='right',
                alignY='centre'
            })

            --skill level
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth,
                height=CONSTANTS.lineHeight,
                text=skill:level(),
                alignX='right',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --skill desc
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth,
                text=skill:description()
            })

            y = y + CONSTANTS.textHeight * 4 + 4

            local skillGroup = TEXT.drawSkillDetails({
                parent=input.parent,
                x=x,
                y=y,
                width=halfWidth
            })
            skillGroup:setSkill(skill)

        end,
        refresh=function(input)

        end
     })
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        event.parent.view:insert(5, sceneGroup[3])
 
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