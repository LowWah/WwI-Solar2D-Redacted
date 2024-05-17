--local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
function scene:getCategories()
    --Getting this dynamically has daily fontColour needs to change, probably inefficient cause i need to keep reruning setitems
    local TERMS = MAIN.TERMS
    return {
        {
            category='Featured',
            key='featured'
        }, {
            category='Daily',
            key='daily',
            fontColour=(MAIN.PLAYER.GACHA.hasDailyRecruit() and CONSTANTS.textColour or CONSTANTS.textColourInvalid)
        }, {
            category='Normal',
            key='normal'
        }
    }
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local COMMON = MAIN.UI.COMMON
    local CONTAINER = MAIN.UI.CONTAINER
    --1 Category
    local categoryScrollView = COMMON.createCategoryScrollView({
        parent=sceneGroup,
        touch=function(input)
            local refreshInput = { category=input.item.key }
            
            sceneGroup[2]:refresh(refreshInput)
            sceneGroup[3]:refresh(refreshInput)
            sceneGroup[4]:refresh(refreshInput)
        end
    })

    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --2 Recruit panel
    local recruitRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=CONSTANTS.backWidth,
        y=y,
        width=display.contentWidth-CONSTANTS.backWidth,
        height=display.contentHeight-y*2,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local TERMS = MAIN.TERMS

            --2 Category
            local x = input.x
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourPink
            })

            x = x + TEXT.textWidth(' Featured')
            --3 Featured chance
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourGreen
            })

            x = x + TEXT.textWidth(' 100%')
            local guarenteeTerm = 'Guarentee'
            --4
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=guarenteeTerm,
                fontColour=CONSTANTS.textColourPink
            })

            x = x + TEXT.textWidth(' ' .. guarenteeTerm)
            --5 Guarentee Count
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=''
            })

            x = x + TEXT.textWidth(' ' .. 10)
            local bonusTerm = 'Bonus'
            --6
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=bonusTerm,
                fontColour=CONSTANTS.textColourPink
            })

            x = x + TEXT.textWidth(' ' .. bonusTerm)
            --7 Bonus count
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=''
            })

            local timerX = input.x + input.width - TEXT.textWidth('99D24H60M60S') - CONSTANTS.textPadding * 3
            --8 Time
            local timeGroup = TEXT.drawTimer({
                parent=input.parent,
                x=timerX,
                y=input.y,
                onComplete=function(timer)
                    timer:setTime(timer:nextTime(timer.category))
                end
            })

            --9
            x = x + TEXT.textWidth(' 10.5%')
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=x,
                y=input.y+CONSTANTS.textHeight*2,
                width=input.width-x+input.x,
                height=input.height,
                text='',
                alignX='centre'
            })

            --10 Recruit actor
            local recruitActor = display.newGroup()
            input.parent:insert(recruitActor)
            local actorPicture = display.newRect(recruitActor, 0, 0, 0, 0)
            local xAdjust = ((x - input.x) - CONSTANTS.actorWidth) * 0.5
            recruitActor.pictureX = input.x + xAdjust
            recruitActor.pictureY = input.y + input.height - CONSTANTS.actorHeight
            actorPicture.isVisible = false
            local nameHeight = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
            local actorName = CONTAINER.createRectangleGroup({
                parent=recruitActor,
                x=input.x+xAdjust,
                y=input.y+input.height-nameHeight,
                width=CONSTANTS.actorWidth,
                height=nameHeight,
                create=function(input2)
                    local TEXT = MAIN.UI.TEXT
                    local IMAGE = MAIN.IMAGE

                    --2 Actor name
                    TEXT.drawText({
                        parent=input2.parent,
                        x=input2.x,
                        y=input2.y,
                        width=input2.width-(CONSTANTS.iconWidth+CONSTANTS.iconPadding)*2,
                        height=input2.height,
                        text='',
                        alignY='centre'
                    })

                    local iconX = input2.x + input2.width - (CONSTANTS.iconWidth + CONSTANTS.iconPadding) * 2
                    --3 Rank
                    local rank = IMAGE.loadIconFrame(1)
                    input2.parent:insert(rank)
                    rank.x = iconX
                    rank.y = input2.y + (input2.height - CONSTANTS.iconHeight) * 0.5

                    --4 Rating
                    local rating = IMAGE.loadIconFrame(1)
                    input2.parent:insert(rating)
                    rating.x = iconX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
                    rating.y = input2.y + (input2.height - CONSTANTS.iconHeight) * 0.5
                end,
                refresh=function(input2)
                    input2.parent[2]:setText(input2.name)
                    input2.parent[3].fill.frame = CONSTANTS.rankIcon[input2.rating]
                    input2.parent[4].fill.frame = CONSTANTS.ratingIcon[input2.rating]
                end,
                touch=function(input2)
                    composer.setVariable('recruit', categoryScrollView.currentIndex)

                    MAIN.UTILITY.gotoScene('scene.hub.members.profile.profile', { member=MAIN.PLAYER.MEMBERS.getActorForCollection(recruitActor.actor) })
                end
            })

            function recruitActor:setActor(actor)
                if self.actor ~= actor then
                    local data = MAIN.DATA.ACTOR.getActor(actor)
                    self[1]:removeSelf()
                    local picture = MAIN.IMAGE.loadActorPicture(data.skins[1].picture)
                    picture.x = self.pictureX
                    picture.y = self.pictureY
                    self:insert(1, picture)

                    self[2]:refresh({name=data.name, rating=data.rating})

                    self.actor = actor
                end
            end

            local countWidth = TEXT.textWidth('Flyer 9999') + CONSTANTS.iconWidth + CONSTANTS.iconPadding * 2
            local flyerY = input.y+input.height-CONSTANTS.lineHeight
            --11 Flyer
            TEXT.drawItemName({
                parent=input.parent,
                x=input.x+input.width-TEXT.textWidth('Flyer 9999')-CONSTANTS.iconWidth-CONSTANTS.iconPadding*2-CONSTANTS.textPadding,
                y=flyerY,
                width=TEXT.textWidth('Flyer')+CONSTANTS.iconWidth+CONSTANTS.iconPadding*2,
                height=CONSTANTS.lineHeight
            })

            --12 Flyer count
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=flyerY,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                alignX='right',
                alignY='centre'
            })

            --13 Desc 2
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=x,
                y=input.y+CONSTANTS.textHeight*8,
                width=input.width-x+input.x,
                height=input.height,
                text='10th recruit is guaranteed Rank 2 or higher\n\nIf no Rank 1 has been recruited after 20 recruits, chance of Rank 1 recruit increases by 0.5%. Bonus will reset when Rank 1 is recruited',
                alignX='centre'
            })

            --14
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=x,
                y=input.y+CONSTANTS.textHeight*17,
                width=input.width-x+input.x,
                height=input.height,
                text='Rank 1 - 2.5% (Base)\nRank 2 - 16%',
                alignX='centre'
            })

        end,
        refresh=function(input)
            local category = input.category
            local gachaStat, actor
            local description, timeCategory
            if category == 'featured' then
                gachaStat = MAIN.PLAYER.GACHA.getGachaStats('featured')
                actor = gachaStat.actor
                description = 'Recruit actors from the standard pool\n\nFirst featured actor chance is 100% then 50% thereafter'
                local TERMS = MAIN.TERMS
                --2 Category
                input.parent[2]:setText('Featured')

                --3 Chance
                local chanceText, chanceFontColour
                if gachaStat.first then
                    chanceText = '100%'
                    chanceFontColour = CONSTANTS.textColourGreen
                else
                    chanceText = '50%'
                    chanceFontColour = CONSTANTS.textColourInvalid
                end
                input.parent[3]:setText(chanceText, chanceFontColour)

                --8 time
                timeCategory = 'week'

            else
                gachaStat = MAIN.PLAYER.GACHA.getGachaStats('normal')
                actor = CONSTANTS.gachaActorsRank1[math.floor(math.random() * #CONSTANTS.gachaActorsRank1) + 1]
                description = 'Recruit actors from the standard pool'
                local categoryText
                if category == 'daily' then
                    categoryText = 'Daily'
                    description = description .. ' at a lower cost\n\nOnce per day'

                    --8 time
                    timeCategory = 'day'
                else
                    categoryText = 'Normal'
                    
                    --8 Time
                    --input.parent[8]:start()
                end
                --2 category
                input.parent[2]:setText(categoryText)

                --3 chance - hide
                input.parent[3]:setText('')
            end
            --COMMON

            --5 Guarentee
            local guarenteeCount = gachaStat.guarentee + 1
            local guarenteeFontColour = guarenteeCount >= 10 and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid
            input.parent[5]:setText(guarenteeCount, guarenteeFontColour)

            --7 Bonus
            local bonusRate = (gachaStat.bonus.rate * 100) .. '%'
            input.parent[7]:setText(bonusRate)

            --8 time
            input.parent[8].category = timeCategory
            --always need to stop time first so it doesnt run twice
            input.parent[8]:stopTime()
            if timeCategory then
                input.parent[8]:setTime(input.parent[8]:nextTime(timeCategory))
            end

            --9 Description
            input.parent[9]:setText(description)

            --10 Actor
            input.parent[10]:setActor(actor)

            --flyers
            local dataFlyer = MAIN.DATA.ITEM.getItem(1, 1)
            local ownedFlyer = MAIN.PLAYER.INVENTORY.getItem(1, 1)
            local ownedFontColour = CONSTANTS.textColourInvalid
            local ownedCount = 0
            if ownedFlyer then
                ownedFontColour = CONSTANTS.textColour
                ownedCount = ownedFlyer:count()
            end

            --11 flyer item name
            input.parent[11]:setItem({icon=dataFlyer.icon, name=dataFlyer.name}, ownedFontColour)

            --12 flyer count
            input.parent[12]:setText(ownedCount, ownedFontColour)

        end
    })

    local width = display.contentWidth * 0.2
    local recruitTouch = function(category, count, costPerSingle)
        local UTILITY = MAIN.UTILITY
        if costPerSingle == 0 then
            --Use flyers
            MAIN.PLAYER.INVENTORY.loseItem(1, 1, count)
        else
            MAIN.PLAYER.GOLD.gainGold(-1 * count * costPerSingle)
            UTILITY.updateLowerUiGold()
        end

        local rollCat = category == 'daily' and 'normal' or category
        composer.setVariable('recruit', categoryScrollView.currentIndex)

        --add mission here
        MAIN.PLAYER.MISSION.addMissionCount(1, 5, count)
        MAIN.PLAYER.MISSION.addMissionCount(2, 7, count)

        UTILITY.sceneFadeOut({
            onComplete=function()
                UTILITY.gotoScene('scene.gacha.gacha', { category=rollCat, value=count, nextScene='scene.hub.recruit.recruit' })
            end
        })
    end

    --3 Recruit 10
    local rightRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-width,
        y=display.contentHeight-y,
        width=width,
        height=y,
        create=function(input)
            --create two groups, one for 10, one for daily
            local TEXT = MAIN.UI.TEXT
            local TERMS = MAIN.TERMS

            --2 roll 10
            local group10 = display.newGroup()
            input.parent:insert(group10)

            local recruitText = TEXT.textWidth(' Recruit', CONSTANTS.fontSizeSmall)
            --2 1 Price
            TEXT.drawItemName({
                parent=group10,
                x=input.x,
                y=input.y,
                width=input.width-recruitText,
                height=input.height,
                item={
                    name=(CONSTANTS.gachaSingleCost * 10),
                    icon=CONSTANTS.goldIcon
                }
            })

            --2 2
            local r = TEXT.drawText({
                parent=group10,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Recruit',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --2 3
            TEXT.drawText({
                parent=group10,
                x=input.x,
                y=input.y+r[1].height,
                width=input.width,
                height=input.height,
                text='10',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --3 daily (roll 1)
            local groupDaily = display.newGroup()
            input.parent:insert(groupDaily)
            groupDaily.isVisible = false

            --3 1 Price
            TEXT.drawItemName({
                parent=groupDaily,
                x=input.x,
                y=input.y,
                width=input.width-recruitText,
                height=input.height,
                item={
                    name=CONSTANTS.gachaDailyCost,
                    icon=CONSTANTS.goldIcon
                }
            })

            --3 2
            TEXT.drawText({
                parent=groupDaily,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Recruit',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --3 3
            TEXT.drawText({
                parent=groupDaily,
                x=input.x,
                y=input.y+r[1].height,
                width=input.width,
                height=input.height,
                text='1',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --4 roll 10 flyers
            local flyerGroup = display.newGroup()
            input.parent:insert(flyerGroup)
            flyerGroup.isVisible = false

            local dataFlyer = MAIN.DATA.ITEM.getItem(1, 1)
            --4 1 Flyers
            TEXT.drawItemName({
                parent=flyerGroup,
                x=input.x,
                y=input.y,
                width=input.width-recruitText,
                height=input.height,
                item={
                    name='x10',
                    icon=dataFlyer.icon
                }
            })

            --4 2
            local r = TEXT.drawText({
                parent=flyerGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Recruit',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --4 3
            TEXT.drawText({
                parent=flyerGroup,
                x=input.x,
                y=input.y+r[1].height,
                width=input.width,
                height=input.height,
                text='10',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

        end,
        refresh=function(input)
            local gold, group
            local isEnabled = true
            if input.category == 'daily' then
                input.parent[2].isVisible = false
                input.parent[3].isVisible = true
                input.parent[4].isVisible = false
                input.parent.recruitCount = 1
                gold = CONSTANTS.gachaDailyCost
                group = 3
                isEnabled = MAIN.PLAYER.GACHA.hasDailyRecruit()
            else
                input.parent[3].isVisible = false
                input.parent.recruitCount = 10
                --If have 10 flyers show flyers, else check gold
                local flyer = MAIN.PLAYER.INVENTORY.getItem(1, 1)
                if flyer and flyer:count() >= 10 then
                    input.parent[2].isVisible = false
                    input.parent[4].isVisible = true
                    group = 4
                    gold = 0
                else
                    input.parent[2].isVisible = true
                    input.parent[4].isVisible = false
                    gold = 10 * CONSTANTS.gachaSingleCost
                    group = 2
                end

            end
            isEnabled = isEnabled and MAIN.PLAYER.GOLD.gold() >= gold
            input.parent:enableTouch(isEnabled)
            local alpha = isEnabled and 1 or 0.6
            for i = 1, input.parent[group].numChildren do
                input.parent[group][i].alpha = alpha
            end
        end,
        touch=function()
            local cat = categoryScrollView:currentItem().key
            local gold
            if cat == 'daily' then
                MAIN.PLAYER.GACHA.useDailyRecruit()
                gold = CONSTANTS.gachaDailyCost
            else
                local flyer = MAIN.PLAYER.INVENTORY.getItem(1, 1)
                if flyer and flyer:count() >= 10 then
                    --indicator to use flyers
                    gold = 0
                else
                    gold = CONSTANTS.gachaSingleCost
                end
            end

            recruitTouch(cat, sceneGroup[3].recruitCount, gold)
        end
    })

    --4 Recruit 1
    local leftRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=display.contentWidth-width*2,
        y=display.contentHeight-y,
        width=width,
        height=y,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            local TERMS = MAIN.TERMS

            local recruitText = TEXT.textWidth(' Recruit', CONSTANTS.fontSizeSmall)
            --2 Gold
            local goldGroup = display.newGroup()
            input.parent:insert(goldGroup)

            --2 1 Price
            TEXT.drawItemName({
                parent=goldGroup,
                x=input.x,
                y=input.y,
                width=input.width-recruitText,
                height=input.height,
                item={
                    name=CONSTANTS.gachaSingleCost,
                    icon=CONSTANTS.goldIcon
                },
                alignY='centre'
            })

            --2 2
            local r = TEXT.drawText({
                parent=goldGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Recruit',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --2 3
            TEXT.drawText({
                parent=goldGroup,
                x=input.x,
                y=input.y+r[1].height,
                width=input.width,
                height=input.height,
                text='1',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --3 Flyer
            local flyerGroup = display.newGroup()
            input.parent:insert(flyerGroup)

            local dataFlyer = MAIN.DATA.ITEM.getItem(1, 1)
            --3 1 Price
            TEXT.drawItemName({
                parent=flyerGroup,
                x=input.x,
                y=input.y,
                width=input.width-recruitText,
                height=input.height,
                item={
                    name='x1',
                    icon=dataFlyer.icon
                },
                alignY='centre'
            })

            --3 2
            local r = TEXT.drawText({
                parent=flyerGroup,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='Recruit',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            --3 3
            TEXT.drawText({
                parent=flyerGroup,
                x=input.x,
                y=input.y+r[1].height,
                width=input.width,
                height=input.height,
                text='1',
                fontSize=CONSTANTS.fontSizeSmall,
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

        end,
        refresh=function(input)
            if input.category == 'daily' then
                input.parent.isVisible = false
            else
                input.parent.isVisible = true
                local flyer = MAIN.PLAYER.INVENTORY.getItem(1, 1)
                local isEnabled
                local group
                if flyer and flyer:count() >= 1 then
                    input.parent[2].isVisible = false
                    input.parent[3].isVisible = true

                    group = 3
                    isEnabled = true
                else
                    input.parent[2].isVisible = true
                    input.parent[3].isVisible = false

                    group = 2
                    isEnabled = MAIN.PLAYER.GOLD.gold() >= CONSTANTS.gachaSingleCost
                end
                 
                input.parent:enableTouch(isEnabled)
                local alpha = isEnabled and 1 or 0.6
                for i = 1, input.parent[group].numChildren do
                    input.parent[group][i].alpha = alpha
                end

            end
        end,
        touch=function()
            local flyer = MAIN.PLAYER.INVENTORY.getItem(1, 1)
            if flyer and flyer:count() >= 1 then
                --indicator to use flyers
                gold = 0
            else
                gold = CONSTANTS.gachaSingleCost
            end
            
            recruitTouch(categoryScrollView:currentItem().key, 1, gold)
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

        local UTILITY = MAIN.UTILITY
        
        MAIN.UTILITY.updateLowerUiLayer({
            topGradient=true,
            middleGradient=true,
            sceneName='RECRUIT',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.hub')
            end,
            guild=true,
            gold=true,
            lives=true
        })
        
        local recruitIndex = composer.getVariable('recruit') or 1
        sceneGroup[1]:setItems(self:getCategories())
        sceneGroup[1]:selectAndCall(recruitIndex)
        UTILITY.removeComposerVariable('recruit')
        
        UTILITY.showLoadingLayer(false)

        --Need this as gacha has fadeout
        UTILITY.updateBackgroundImages({ MAIN.PLAYER.HUB.hubBackground() })
        UTILITY.sceneFadeIn({time=0})
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

        sceneGroup[2][8]:stopTime()
 
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