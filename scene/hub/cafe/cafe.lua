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
    local y = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local x = 0
    --1 Dispatch parties
    local dispatchScrollView = CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=x,
        y=y,
        width=CONSTANTS.backWidth,
        height=display.contentHeight-y,
        rows=9,
        columns=1,
        numItems=9,
        create=function(input)
            local TEXT = MAIN.UI.TEXT
            --2
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=('Dispatch ' .. input.index),
                fontColour=CONSTANTS.textColourPink
            })

            --3 Status
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y+CONSTANTS.textHeight,
                width=input.width,
                height=input.height,
                text='',
                alignX='right'
            })

        end,
        refresh=function(input)
            local item = input.item
            if item then
                input.parent[2].isVisible = true
                
                input.parent[3].isVisible = true
                input.parent[3]:setText(item.status, item.fontColour)

                input.parent:enableTouch(item.isEnabled)
            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false

                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            local dispatch = MAIN.PLAYER.CAFE.getDispatchAtIndex(input.index)
            local list, selectIndex, canChange

            --job list
            if dispatch.jobId == 0 then
                --not running, should display all job lists
                list = MAIN.PLAYER.CAFE.getCafeFromSave().list
                selectIndex = 0
                sceneGroup[9].isVisible = true
                canChange = true
            else
                --only show current job
                list = { dispatch }
                selectIndex = 1
                sceneGroup[9].isVisible = false
                canChange = false
            end

            sceneGroup[3]:setItems(list)

            --party
            sceneGroup[5]:setItems(dispatch.party)
            for i = 1, sceneGroup[5]._collectorGroup.numChildren do
                sceneGroup[5]._collectorGroup[i]:enableTouch(canChange)
            end
            sceneGroup[6]:refresh()

            --job desc
            sceneGroup[7]:refresh()

            --recommended
            sceneGroup[9]:enable(false)

            --dispatch/retrieve
            sceneGroup[8]:refreshDispatchOrRetrive()

            sceneGroup[3]:selectAndCall(selectIndex, true)

            sceneGroup[3]:scrollToIndex(0)
        end
    })

    local updateCategoriesTime = function()
        if dispatchScrollView.minTime then
            if MAIN.SYSTEM.TIME.time() >= dispatchScrollView.minTime then
                --refresh, 
                --BUG - if another dispatch and job is selected and it gets refresh, the job gets unselected
                dispatchScrollView:stopCagetories()
                scene:reselect()
            end
        else
            dispatchScrollView:stopCagetories()
        end
    end

    function dispatchScrollView:setupCategories()
        self:stopCagetories()

        sceneGroup[1]:setItems(MAIN.PLAYER.CAFE.getDispatchCategory())

        self.minTime = nil
        --check if there is a dispatch on ongoing, we need to be able to refresh once time hits
        local currentTime = MAIN.SYSTEM.TIME.time()
        local dispatch = MAIN.PLAYER.CAFE.getCafeFromSave().dispatch
        for i = 1, #dispatch do
            if dispatch[i].jobId ~= 0 and dispatch[i].time ~= 0 then
                local currentMinTime = self.minTime or dispatch[i].time
                self.minTime = math.min(dispatch[i].time, currentMinTime)
            end
        end

        if self.minTime and currentTime < self.minTime then
            Runtime:addEventListener('enterFrame', updateCategoriesTime)
        end
    end

    function dispatchScrollView:stopCagetories()
        Runtime:removeEventListener('enterFrame', updateCategoriesTime)
    end


    local fifthWidth = (display.contentWidth - CONSTANTS.backWidth - CONSTANTS.rectanglePadding * 2 - CONSTANTS.rectangleSpacing * 4) * 0.2
    local itemWidth = ((fifthWidth * 3 + CONSTANTS.rectangleSpacing * 2) - CONSTANTS.rectangleSpacing) * 0.5 + CONSTANTS.rectanglePadding * 2
    local itemHeight = (display.contentHeight - y * 2 - CONSTANTS.rectangleSpacing + CONSTANTS.rectanglePadding * 2) * 0.5 
    x = x + CONSTANTS.backWidth
    local COMMON = MAIN.UI.COMMON

    --2
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=itemWidth,
        height=y,
        text='Jobs',
        fontColour=CONSTANTS.textColourPink
    })

    --3 Jobs list
    CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=x,
        y=y+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
        width=itemWidth,
        height=display.contentHeight-y*2-CONSTANTS.lineHeight-CONSTANTS.rectangleSpacing,
        rows=11,
        columns=1,
        numItems=11,
        create=function(input)
            --2 Job name
            MAIN.UI.TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=input.y,
                width=input.width,
                height=input.height,
                text='',
                alignY='centre'
            })
        end,
        refresh=function(input)
            local item = input.item
            if item then
                local job = MAIN.DATA.CAFE.getJob(item.jobId)

                local fontColour
                if item.time then
                    fontColour = CONSTANTS.textColourPink
                else
                    fontColour = CONSTANTS.textColour
                    if job.requirements and job.requirements.guildLevel and job.requirements.guildLevel > MAIN.PLAYER.GUILD.level() then
                        fontColour = CONSTANTS.textColourInvalid
                    end
                end

                input.parent[2].isVisible = true
                input.parent[2]:setText(job.name, fontColour)
                input.parent:enableTouch(true)
            else
                input.parent[2].isVisible = false
                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            local item = input.item

            sceneGroup[6]:refresh({bonusId=item.bonusId})
            sceneGroup[7]:refresh({item=item})
            sceneGroup[8]:refreshDispatchOrRetrive()

            --check requirements
            local job = MAIN.DATA.CAFE.getJob(item.jobId)
            if job.requirements and job.requirements.guildLevel and  job.requirements.guildLevel > MAIN.PLAYER.GUILD.level() then
                sceneGroup[8]:enable(false)
            end

            if item.time then
                sceneGroup[9].isVisible = false
            else
                sceneGroup[9].isVisible = true
                sceneGroup[9]:enable(true)
            end

        end
    })
    
    x = x + itemWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    --4
    COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=x,
        y=y,
        width=itemWidth,
        height=y,
        text='Party',
        fontColour=CONSTANTS.textColourPink
    })

    --5 Party list
    CONTAINER.createScrollViewWithRectangles({
        parent=sceneGroup,
        x=x,
        y=y+CONSTANTS.lineHeight+CONSTANTS.rectangleSpacing,
        width=itemWidth,
        height=itemHeight-CONSTANTS.lineHeight-CONSTANTS.rectangleSpacing,
        rows=5,
        columns=1,
        numItems=5,
        create=function(input)
            --2 Item name
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
                if item > 0 then
                    local actor = MAIN.PLAYER.MEMBERS.getActor(item)
                    local dataItem = MAIN.DATA.ITEM.getItem(2, item + 10)
                    input.parent[2]:setItem({icon=dataItem.icon, name=actor:name()}, CONSTANTS.textColour)
                else
                    input.parent[2]:setItem({icon=1, name='Empty'}, CONSTANTS.textColourInvalid)
                end
            else
                input.parent[2].isVisible = false
                input.parent:enableTouch(false)
            end
        end,
        touch=function(input)
            composer.setVariable('cafeDispatch', dispatchScrollView.currentIndex)
            composer.setVariable('cafeJob', sceneGroup[3].currentIndex)
            composer.setVariable('cafeActor', sceneGroup[5].currentIndex)

            MAIN.UTILITY.gotoScene('scene.hub.party.members.members')
        end
    })

    --6 party bonus
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=x,
        y=(CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2 + CONSTANTS.lineHeight * 6 + CONSTANTS.rectangleSpacing * 6),
        width=itemWidth,
        height=itemHeight,
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
                text='Current Party Bonus',
                fontColour=CONSTANTS.textColourPink
            })

            local bonusText = {
                '1 - No bonus',
                '2 - No bonus',
                '3 - +50% rewards',
                '4 - +50% rewards',
                '5 - +100% rewards'
            }
            y = y + CONSTANTS.lineHeight
            --3,4,5,6,7
            for i = 1, #bonusText do
                TEXT.drawText({
                    parent=input.parent,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.textHeight,
                    text=bonusText[i]
                })

                y = y + CONSTANTS.textHeight
            end
        end,
        refresh=function(input)
            local bonusId = input.bonusId
            if bonusId then
                input.parent[2].isVisible = true

                local bonus = MAIN.DATA.CAFE.getBonus(bonusId)
                local bonusCount = 0
                for i = 1, #sceneGroup[5].items do
                    if sceneGroup[5].items[i] ~= 0 then
                        local actor = MAIN.PLAYER.MEMBERS.getActor(sceneGroup[5].items[i])
                        if bonus.condition(actor) then
                            bonusCount = bonusCount + 1
                        end
                    end
                end

                for i = 3, 7 do
                    local partyIndex = i - 2

                    input.parent[i].isVisible = true
                    local fontColour
                    if partyIndex == bonusCount then
                        fontColour = CONSTANTS.textColourPink
                    elseif partyIndex < bonusCount then
                        fontColour = CONSTANTS.textColour
                    else
                        fontColour = CONSTANTS.textColourInvalid
                    end

                    input.parent[i]:setText(nil, fontColour)
                end

            else
                input.parent[2].isVisible = false
                input.parent[3].isVisible = false
                input.parent[4].isVisible = false
                input.parent[5].isVisible = false
                input.parent[6].isVisible = false
                input.parent[7].isVisible = false
            end

        end
    })

    x = x + itemWidth - CONSTANTS.rectanglePadding * 2 + CONSTANTS.rectangleSpacing
    --7 jobs descriptions
    CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=x,
        y=y,
        width=fifthWidth*2+CONSTANTS.rectangleSpacing+CONSTANTS.rectanglePadding*2,
        height=display.contentHeight-y*2,
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local y = input.y
            --2 Job name
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.lineHeight,
                text='',
                fontColour=CONSTANTS.textColourPink,
                alignX='centre',
                alignY='centre'
            })

            y = y + CONSTANTS.lineHeight
            --3 Job desc
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text=''
            })

            y = y + CONSTANTS.textHeight * 5

            --4
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='Rewards',
                fontColour=CONSTANTS.textColourPink
            })

            --5 rewards group
            local rewardsGroup = display.newGroup()
            input.parent:insert(rewardsGroup)

            --5 1 one reward
            TEXT.drawItemName({
                parent=rewardsGroup,
                x=input.x,
                y=y+CONSTANTS.textHeight,
                width=input.width,
                height=CONSTANTS.lineHeight
            })

            --5 2 random reward group
            local randomRewardsGroup = display.newGroup()
            rewardsGroup:insert(randomRewardsGroup)

            --5 1 Random Count
            TEXT.drawText({
                parent=randomRewardsGroup,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='',
                fontColour=CONSTANTS.textColourPink,
                alignX='right'
            })

            y = y + CONSTANTS.textHeight
            --5 2,3,4 Random Item
            for i = 1, 3 do
                TEXT.drawItemName({
                    parent=randomRewardsGroup,
                    x=input.x,
                    y=y,
                    width=input.width,
                    height=CONSTANTS.lineHeight
                })

                y = y + CONSTANTS.lineHeight
            end

            y = y + CONSTANTS.lineHeight
            --6
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                height=CONSTANTS.textHeight,
                text='Bonus',
                fontColour=CONSTANTS.textColourPink
            })

            y = y + CONSTANTS.textHeight
            --7 Bonus text
            TEXT.drawTextWithWrapping({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width,
                text=''
            })

            local timeWidth = TEXT.textWidth('31D24H60M60S')
            y = y + CONSTANTS.textHeight * 4
            --8 Duration or Remaining
            TEXT.drawText({
                parent=input.parent,
                x=input.x,
                y=y,
                width=input.width-timeWidth,
                height=CONSTANTS.textHeight,
                text='',
                fontColour=CONSTANTS.textColourPink
            })

            --9 Time
            local timerX = input.x + input.width - timeWidth - CONSTANTS.textPadding * 3
            TEXT.drawTimer({
                parent=input.parent,
                x=timerX,
                y=y,
                onComplete=function()
                    scene:reselect()
                end
            })

            --10 requirements group
            local requirementsGroup = display.newGroup()
            input.parent:insert(requirementsGroup)

            local a = TEXT.drawText({
                parent=requirementsGroup,
                x=input.x,
                y=input.y+2,
                width=input.width+4,
                height=input.height,
                text='Required',
                fontColour=CONSTANTS.textColourRed,
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right'
            })

            TEXT.drawText({
                parent=requirementsGroup,
                x=input.x,
                y=input.y+2+a[1].height,
                width=input.width+4,
                height=input.height,
                text='',
                fontColour=CONSTANTS.textColourRed,
                fontSize=CONSTANTS.fontSizeSmall,
                alignX='right'
            })

        end,
        refresh=function(input)
            local item = input.item
            if item then
                local job = MAIN.DATA.CAFE.getJob(item.jobId)
                local bonus = MAIN.DATA.CAFE.getBonus(item.bonusId)

                input.parent[2].isVisible = true
                input.parent[2]:setText(job.name)
                input.parent[3].isVisible = true
                input.parent[3]:setText(job.description)
                input.parent[4].isVisible = true
                input.parent[5].isVisible = true
                if job.reward.ids then
                    input.parent[5][1].isVisible = false
                    input.parent[5][2].isVisible = true
                    input.parent[5][2][1]:setText(job.reward.count .. ' random items')
                    for i = 1, #job.reward.ids do
                        local dataItem = MAIN.DATA.ITEM.getItem(job.reward.category, job.reward.ids[i])
                        input.parent[5][2][i + 1]:setItem({icon=dataItem.icon, name=dataItem.name})
                    end
                else
                    local rewardDataItem = MAIN.DATA.ITEM.getItem(job.reward.category, job.reward.id)
                    input.parent[5][1].isVisible = true
                    input.parent[5][1]:setItem({icon=rewardDataItem.icon, name=(rewardDataItem.name .. ' x' .. job.reward.count)})
                    input.parent[5][2].isVisible = false
                end
                input.parent[6].isVisible = true
                input.parent[7].isVisible = true
                input.parent[7]:setText(bonus.description)
                input.parent[8].isVisible = true
                if item.time then
                    input.parent[8]:setText('Remaining')
                    input.parent[9]:setTime(item.time)
                    input.parent[10].isVisible = false
                else
                    input.parent[8]:setText('Duration')
                    --Manually update the time
                    local duration = job.duration
                    input.parent[9]:stopTime()
                    input.parent[9].isVisible = true
                    input.parent[9][1].isVisible = false
                    input.parent[9][2].isVisible = true
                    input.parent[9][2][1]:setText(math.floor(job.duration / 3600))
                    input.parent[9][3].isVisible = true
                    input.parent[9][3][1]:setText('0')
                    input.parent[9][4].isVisible = true
                    input.parent[9][4][1]:setText('0')

                    if job.requirements then
                        local requiredGuildLvl = job.requirements.guildLevel
                        if job.requirements.guildLevel > MAIN.PLAYER.GUILD.level() then
                            input.parent[10].isVisible = true
                            input.parent[10][2]:setText('Guild Lv ' .. requiredGuildLvl)
                        else
                            input.parent[10].isVisible = false
                        end
                    else
                        input.parent[10].isVisible = false
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
                input.parent[9]:stopTime()
                input.parent[10].isVisible = false
            end
        end
    })

    --8 Dispatch
    local selectRectangle = MAIN.UI.COMMON.createSelectRectangle({
        parent=sceneGroup,
        touch=function(input)
            local job = sceneGroup[3]:currentItem()
            if job.time then
                --retrieve, this resets the lower scene most likely due to setupCategories, would prefer to not refresh
                composer.showOverlay('overlay.rewards.rewards', {
                    isModal = true,
                    params = {
                        rewards=MAIN.PLAYER.CAFE.retrieveDispatch(dispatchScrollView.currentIndex)
                    }
                })
            else
                --start dispatch
                MAIN.PLAYER.CAFE.startDispatch(dispatchScrollView.currentIndex, sceneGroup[3].currentIndex)
                MAIN.SYSTEM.SAVE.writeSave()
                scene:reselect()
            end
        end
    })

    function selectRectangle:refreshDispatchOrRetrive()
        local job = sceneGroup[3]:currentItem()

        local text = 'Dispatch'
        local isEnabled = false
        if job then
            if job.time then
                text = 'Retrieve'
                isEnabled = MAIN.SYSTEM.TIME.time() >= job.time
            else
                --check party at least one is there
                local jobData = MAIN.DATA.CAFE.getJob(job.jobId)
                if not jobData.requirements or (jobData.requirements.guildLevel < MAIN.PLAYER.GUILD.level()) then
                    for i = 1, #sceneGroup[5].items do
                        if sceneGroup[5].items[i] ~= 0 then
                            isEnabled = true
                            break
                        end
                    end
                end
            end
        end

        self:enable(isEnabled, text)
        self.isVisible = true
    end

    --9 Recommended
    local recommendedRectangle = MAIN.UI.COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth*0.6,
        y=display.contentHeight-y,
        width=display.contentWidth*0.2,
        height=y,
        text='Recommended',
        touch=function()
            local bonusId = sceneGroup[3]:currentItem().bonusId
            local party = MAIN.PLAYER.CAFE.fillRecommendedParty(dispatchScrollView.currentIndex, bonusId)
            sceneGroup[5]:setItems(party)
            sceneGroup[6]:refresh({bonusId=bonusId})

            selectRectangle:refreshDispatchOrRetrive()
        end
    })

    function recommendedRectangle:enable(isEnabled, text)
        local fontColour = isEnabled and CONSTANTS.textColour or CONSTANTS.textColourInvalid
        self:refresh({ text=text, fontColour=fontColour })

        self:enableTouch(isEnabled)
    end
 
end

function scene:reselect()
    local sceneGroup = self.view

    local dispatchScrollView = sceneGroup[1]
    local jobIndex = sceneGroup[3].currentIndex
    local dispatchIndex = dispatchScrollView.currentIndex
    dispatchScrollView:setupCategories()
    dispatchScrollView:selectAndCall(dispatchIndex, true)

    if self.view[3].currentIndex ~= 0 and sceneGroup[3]:itemAtIndex(jobIndex) then
        self.view[3]:selectAndCall(jobIndex, true)
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
            sceneName='CAFE',
            back=function()
                MAIN.UTILITY.gotoScene('scene.hub.hub')
            end,
            guild=true,
            gold=true,
            lives=true
        })

        sceneGroup[1]:setupCategories()

        if composer.getVariable('cafeDispatch') then
            sceneGroup[1]:selectAndCall(composer.getVariable('cafeDispatch'), true)
            sceneGroup[3]:selectAndCall(composer.getVariable('cafeJob'), true)
            sceneGroup[5]:select(0)

            UTILITY.removeComposerVariable('cafeDispatch')
            UTILITY.removeComposerVariable('cafeJob')
            UTILITY.removeComposerVariable('cafeActor')
        else
            sceneGroup[1]:select(0)
            sceneGroup[3]:setItems({})
            sceneGroup[5]:setItems({})
            sceneGroup[6]:refresh()
            sceneGroup[7]:refresh()
            sceneGroup[8].isVisible = false
            sceneGroup[9].isVisible = false
        end
        
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

        sceneGroup[1]:stopCagetories()
        sceneGroup[7][9]:stopTime()
 
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