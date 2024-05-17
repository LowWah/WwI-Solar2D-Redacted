--local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
function scene:startProcessing()
    local sceneGroup = self.view
    local messageLayer = sceneGroup[2]
    messageLayer:clearDialogue()
    if self.step == 0 then
        messageLayer:setupDialogue('????', 'Hello, I would like to join your guild.')
        messageLayer:startDialogue()
    elseif self.step > self.actorResultsCount then
        MAIN.UTILITY.sceneFadeOut({
            onComplete=function()
                --Get them out first cause one we remove it might adjust the order
                local pictureLayer = sceneGroup[1]
                local messageLayer = sceneGroup[2]
                local counterRect = sceneGroup[3]
                local skipRect = sceneGroup[4]
                local summaryLayer = sceneGroup[5]

                pictureLayer:removeSelf()
                pictureLayer = nil

                messageLayer:removeSelf()
                messageLayer = nil
                
                counterRect:removeSelf()
                counterRect = nil

                skipRect:removeSelf()
                skipRect = nil

                MAIN.UTILITY.sceneFadeIn({
                    time=0,
                    onComplete=function()
                        summaryLayer.isVisible = true
                        summaryLayer:enableTouch(true)
                    end
                })
            end
        })

    else
        sceneGroup[3]:refresh({step=self.step})
        local lastActorGroup = sceneGroup[1][self.step - 1]
        if lastActorGroup then
            lastActorGroup.isVisible = false
            lastActorGroup.alpha = 0
        end
        local actorGroup = sceneGroup[1][self.step]
        actorGroup.isVisible = true
        transition.fadeIn(actorGroup, {
            time=CONSTANTS.timeGachaFade,
            onComplete=function()
                messageLayer:setupDialogue(actorGroup.name, actorGroup.recruit)
                messageLayer:startDialogue()
            end
        })

    end
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --[[
        event input
        {
            category - force|normal|featuerd
            value - if force then its actorId else its count
            nextScene - next scene, if blank go to hub
        }
    ]]--
    --Do gacha
    local actorResults = MAIN.PLAYER.GACHA.executeGacha(event.params.category, event.params.value)
    local actorResultsCount = #actorResults
    scene.actorResultsCount = actorResultsCount

    --1 Picture layer
    local pictureLayer = display.newGroup()
    sceneGroup:insert(pictureLayer)

    local COMMON = MAIN.UI.COMMON
    --2 Message layer
    local messageLayer = COMMON.createMessageGroup({
        parent=sceneGroup,
        touch=function()
            scene.step = scene.step + 1
            scene:startProcessing()
        end
    })

    local CONTAINER = MAIN.UI.CONTAINER
    local width = display.contentWidth * 0.2
    local height = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    --3 Counter
    local counterRect = CONTAINER.createRectangleGroup({
        parent=sceneGroup,
        x=0,
        y=0,
        width=width,
        height=height,
        fillColour={ 0, 0, 0, 0 },
        strokeColourDisabled={ 0, 0, 0, 0 },
        create=function(input)
            local TEXT = MAIN.UI.TEXT

            local x = input.x + CONSTANTS.textPadding
            local count = event.params.category == 'force' and 1 or event.params.value
            local textWidth = TEXT.textWidth(count)
            --2 Current
            TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=textWidth,
                height=input.height,
                text='',
                paddingX=0,
                alignX='right',
                alignY='centre'
            })

            x = x + textWidth
            --3 
            local total = TEXT.drawText({
                parent=input.parent,
                x=x,
                y=input.y,
                width=input.width,
                height=input.height,
                text=('/' .. count),
                paddingX=0,
                alignY='centre'
            })
            total.isVisible = false
        end,
        refresh=function(input)
            input.parent[2]:setText(input.step)

            input.parent[3].isVisible = true
        end
    })
    

    --4 Skip
    local skipRectangle = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=display.contentWidth-width,
        y=0,
        width=width,
        height=height,
        text='Skip',
        touch=function()
            --cancel all transitions
            transition.cancelAll()
            timer.cancelAll()

            --set step to last
            scene.step = actorResultsCount + 1
            scene:startProcessing()
        end
    })

    --5 Summary layer
    local summaryLayer = display.newGroup()
    sceneGroup:insert(summaryLayer)

    summaryLayer.isVisible = false

    local ACTOR = MAIN.DATA.ACTOR
    local IMAGE = MAIN.IMAGE
    local TEXT = MAIN.UI.TEXT
    local TERMS = MAIN.TERMS

    --Add actors to picture + summary
    local faceX, faceY
    local summaryFaceWidth = CONSTANTS.faceWidth + CONSTANTS.rectangleStrokeWidth * 2
    local summaryFaceHeight = CONSTANTS.faceHeight + CONSTANTS.rectangleStrokeWidth * 2
    if actorResultsCount == 1 then
        faceX = (display.contentWidth - summaryFaceWidth) * 0.5
        faceY = (display.contentHeight - summaryFaceHeight) * 0.5
    else
        faceX = (display.contentWidth - summaryFaceWidth * 5) * 0.5
        faceY = (display.contentHeight - summaryFaceHeight * 2) * 0.5
    end
    local actorX = (display.contentWidth - CONSTANTS.actorWidth) * 0.5
    local actorY = (display.contentHeight - CONSTANTS.actorHeight) * 0.5

    local newTextWidth = TEXT.textWidth('New', CONSTANTS.fontSizeSmall)
    local actorNameX = display.contentCenterX + CONSTANTS.actorWidth * 0.5
    local actorNameWidth = display.contentWidth - actorNameX - newTextWidth
    local actorNameY = display.contentHeight * 0.25

    for i = 1, actorResultsCount do
        local actorGroup = display.newGroup()
        pictureLayer:insert(actorGroup)

        local actor = MAIN.DATA.ACTOR.getActor(actorResults[i].actor)
        local skin = actor.skins[1]

        local actorName = actor.name
        --Store name and recruit as we want to use message layer
        actorGroup.name = actorName
        actorGroup.recruit = actor.recruit
        
        local actorPicture = IMAGE.loadActorPicture(skin.picture)
        actorGroup:insert(actorPicture)
        actorPicture.x = actorX
        actorPicture.y = actorY

        TEXT.drawText({
            parent=actorGroup,
            x=actorNameX,
            y=actorNameY,
            width=actorNameWidth,
            text=actor.name
        })

        local isNew = actorResults[i].isNew
        if isNew then
            TEXT.drawText({
                parent=actorGroup,
                x=actorNameX+TEXT.textWidth(actorName)+CONSTANTS.textPadding,
                y=actorNameY,
                width=newTextWidth,
                text='New',
                fontColour=CONSTANTS.textColourPink,
                fontSize=CONSTANTS.fontSizeSmall,
                paddingX=0
            })
        end

        local iconX = actorNameX + CONSTANTS.textPadding
        local iconY = actorNameY + CONSTANTS.textHeight + CONSTANTS.iconPadding

        local rankIcon = CONSTANTS.rankIcon[actor.rating]
        local rankImage = IMAGE.loadIconFrame(rankIcon)
        actorGroup:insert(rankImage)
        rankImage.x = iconX
        rankImage.y = iconY

        local ratingIcon = CONSTANTS.ratingIcon[actor.rating]
        local ratingImage = IMAGE.loadIconFrame(ratingIcon)
        actorGroup:insert(ratingImage)
        ratingImage.x = iconX + CONSTANTS.iconWidth + CONSTANTS.iconPadding
        ratingImage.y = iconY

        actorGroup.isVisible = false
        actorGroup.alpha = 0

        local faceXAdjust = ((i - 1) % 5) * summaryFaceWidth
        local faceYAdjust = math.floor((i - 1) / 5) * summaryFaceHeight
        local faceRect = CONTAINER.createRectangleGroup({
            parent=summaryLayer,
            x=faceX+faceXAdjust,
            y=faceY+faceYAdjust,
            width=summaryFaceWidth,
            height=summaryFaceHeight,
            padding=0,
            strokeColourDisabled=(isNew and CONSTANTS.rectangleStrokeColourActive or CONSTANTS.rectangleStrokeColourInactive),
            create=function(input)
                local container = display.newContainer(input.width, input.height)
                input.parent:insert(container)
                
                --1 Face
                local face = IMAGE.loadFacePicture(skin.face)
                face.x = input.x
                face.y = input.y
                container:insert(face)
                
                local iconX = input.x + input.width - CONSTANTS.iconWidth - CONSTANTS.iconPadding
                local iconY = input.y + CONSTANTS.iconPadding

                --2 Rank
                local rank = IMAGE.loadIconFrame(rankIcon)
                input.parent:insert(rank)
                rank.x = iconX
                rank.y = iconY

                --3 Rating
                local rating = IMAGE.loadIconFrame(ratingIcon)
                input.parent:insert(rating)
                rating.x = iconX
                rating.y = iconY + CONSTANTS.iconHeight + CONSTANTS.iconPadding

                --4 New/ tokens
                local text, fontColour
                if isNew then
                    text = 'New'
                    fontColour = CONSTANTS.textColourPink
                else
                    text = '1 Token'
                    fontColour = CONSTANTS.textColourGreen

                    face.alpha = 0.6
                    rank.alpha = 0.6
                    rating.alpha = 0.6
                end
                TEXT.drawText({
                    parent=container,
                    x=input.x,
                    y=input.y+input.height-CONSTANTS.lineHeight,
                    width=input.width,
                    height=CONSTANTS.lineHeight,
                    text=text,
                    fontColour=fontColour,
                    alignX='right',
                    alignY='centre'
                })
            end
        })
    end

    --Touch to continue
    TEXT.drawText({
        parent=summaryLayer,
        x=0,
        y=display.contentHeight-CONSTANTS.textHeight*4,
        width=display.contentWidth,
        height=CONSTANTS.textHeight,
        text='Touch to continue',
        alignX='centre'
    })

    --Add an invisible touch layer for summary
    local touchRect = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    touchRect.isVisible = false
    touchRect.isHitTestable = false
    summaryLayer:insert(touchRect)
    --Add touch event
    local nextScene = event.params.nextScene or 'scene.hub.hub'
    function touchRect:touch(event)
        if event.phase == 'began' then
            --Set stage to focus touch events for this object only
            local stage = display.getCurrentStage()
            stage:setFocus( self )
            self.isFocus = true
        elseif self.isFocus and event.phase == 'ended' then
            local UTILITY = MAIN.UTILITY
            UTILITY.sceneFadeOut({
                onComplete=function()
                    UTILITY.gotoScene(nextScene)
                end
            })
            self.isFocus = false
            local stage = display.getCurrentStage()
            stage:setFocus( nil )
        end
    end
    touchRect:addEventListener('touch', touchRect)

    function summaryLayer:enableTouch(enableTouch)
        self[self.numChildren].isHitTestable = enableTouch
    end

    self.step = 0
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

        UTILITY.updateBackgroundImages({CONSTANTS.pictureGacha})
        UTILITY.updateLowerUiLayer()

        UTILITY.showLoadingLayer(false)

        sceneGroup[2]:showMessageBox()
        UTILITY.sceneFadeIn({
            onComplete=function()
                scene:startProcessing()
            end
        })
 
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

        composer.removeScene('scene.gacha.gacha')
 
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