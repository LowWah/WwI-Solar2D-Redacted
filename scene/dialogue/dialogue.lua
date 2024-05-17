--local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
function scene:repositionBusts()
    local busts = self.view[1].index

    --Count how many busts are visible and reposition
    local count = 0
    local visibleBusts = {}
    for i = 1, #busts do
        if busts[i] and busts[i].isVisible then
            count = count + 1
            visibleBusts[count] = busts[i]
        end
    end

    local positions = CONSTANTS.bustPositions(count)
    for i = 1, count do
        visibleBusts[i].x = positions[i].x
        visibleBusts[i].y = positions[i].y
    end
end

function scene:startProcessing()
    --BUG - you can click too fast and it will fail, need to disable click events when fading out
    --Core function to process through events
    --will go through data.events per step
    local event = self.data.events[self.step]
    local sceneGroup = self.view
    if event.event == 'background' then
        sceneGroup[2]:clearDialogue()
        sceneGroup[3]:showFace(0)

        --Reuse scene fade
        local UTILITY = MAIN.UTILITY
        if event.type == 'show' then
            UTILITY.focusBackgroundImage(event.value)
            UTILITY.sceneFadeIn({
                onComplete=function()
                    scene.step = scene.step + 1
                    scene:startProcessing()
                end
            })
        elseif event.type == 'hide' then
            UTILITY.sceneFadeOut({
                onComplete=function()
                    scene.step = scene.step + 1
                    scene:startProcessing()
                end
            })
        end
    elseif event.event == 'bust' then
        for i = 1, #event.values do
            local value = event.values[i]
            if value.bust == 0 then
                --if zero then do message layer
                sceneGroup[2]:clearDialogue()
                sceneGroup[3]:showFace(0)
                if event.type == 'show' then
                    sceneGroup[2]:showMessageBox()
                else
                    sceneGroup[2]:hideMessageBox(nil, event.time)
                end
            else
                local busts = sceneGroup[1].index
                local bust = busts[value.bust]
                if event.type == 'show' then
                    local alpha = 0.5
                    if value.focus then
                        alpha = 1
                        bust:toFront()

                        --Need to set transparent for all other visible busts
                        for i = 1, #busts do
                            if busts[i].isVisible then
                                busts[i].alpha = 0.5
                            end
                        end
                    end
                    bust.fill.frame = value.frame or bust.fill.frame
                    --main 8 f10 prebattle, it doesnt work for some reason, so adding this here
                    --TODO this breaks Side 2 f1
                    bust.alpha = 0
                    bust.isVisible = true
                    transition.to(bust, { time=(event.time or CONSTANTS.timeBustFade), alpha=alpha })
                elseif event.type == 'hide' then
                    transition.fadeOut(bust, { time=(event.time or CONSTANTS.timeBustFade), onComplete=function() 
                        bust.isVisible = false
                        scene:repositionBusts()
                    end})
                elseif event.type == 'swap' then

                    local toHide = busts[event.values[i].oldBust]
                    local toShow = busts[event.values[i].newBust]

                    toShow.alpha = 1
                    toShow.x = toHide.x
                    toShow.y = toHide.y
                    toShow.isVisible = true

                    toHide.isVisible = false
                    toHide.alpha = 0
                end
            end
        end

        self:repositionBusts()

        --Start when busts have fade in/ fade out
        timer.performWithDelay((event.time or CONSTANTS.timeBustFade), function()
            scene.step = scene.step + 1
            scene:startProcessing()
        end)

    elseif event.event == 'dialogue' then
        --Update bust for speaker
        local busts = sceneGroup[1].index
        local bust = busts[event.value.speaker]
        local lastBust = busts[self.lastSpeaker]

        if bust then
            bust.fill.frame = event.value.frame or bust.fill.frame
        end

        --Update previous speaker if new speaker
        if bust ~= lastBust then
            if lastBust then 
                lastBust.alpha = 0.5
            end
            if bust then
                bust.alpha = 1
                bust:toFront()
            end

            self.lastSpeaker = event.value.speaker
        end
        
        --Update face
        local face = event.value.face and event.value.speaker or 0
        sceneGroup[3]:showFace(face, event.value.frame)

        local name = self.data.speakers[event.value.speaker].name
        sceneGroup[2]:setupDialogue(name, event.value.dialogue)
        sceneGroup[2]:startDialogue()
    elseif event.event == 'end' then
        MAIN.UTILITY.sceneFadeOut({
            onComplete=function()
                if composer.getVariable('collectionStage') then
                    local UTILITY = MAIN.UTILITY
                    UTILITY.removeComposerVariable('quest')
                    UTILITY.removeComposerVariable('stage')
                    UTILITY.removeComposerVariable('floor')
                    UTILITY.removeComposerVariable('battleResult')

                    UTILITY.gotoScene('scene.hub.collection.story.floor.floor')
                else
                    event.sceneFadeOutOnComplete()
                end
                
            end
        })
    end
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local data = event.params and event.params.data or MAIN.DATA.DIALOGUE.getDialogue(composer.getVariable('quest'), composer.getVariable('stage'), composer.getVariable('floor'), composer.getVariable('battleResult'))
 
    --Create display layers

    --BACKGROUND LAYER - we reuse the existing background layer
    MAIN.UTILITY.updateBackgroundImages(data.backgrounds)
    
    --1 Busts
    local bustLayer = display.newGroup()
    sceneGroup:insert(bustLayer)
    bustLayer.index = {}
    

    local COMMON = MAIN.UI.COMMON
    --2 Message
    local messageLayer = COMMON.createMessageGroup({
        parent=sceneGroup,
        touch=function()
            scene.step = scene.step + 1
            scene:startProcessing()
        end
    })

    --3 Face
    local faceLayer = display.newGroup()
    sceneGroup:insert(faceLayer)
    function faceLayer:showFace(index, frame)
        for i = 1, self.numChildren do
            self[i].isVisible = index == i
            self[i].fill.frame = frame or 1
        end
    end

    --Insert busts and faces here after its been created
    local IMAGE = MAIN.IMAGE
    for i = 1, #data.speakers do
        local speaker = data.speakers[i]
        --Create a dummy if blank, we dont care about position as we reposition dynamically
        local bust = speaker.bust and IMAGE.loadBustPicture(speaker.bust) or display.newRect(0, 0, 0, 0)
        bust.alpha = 0
        bust.isVisible = false
        bustLayer:insert(bust)
        --Save index so that reposition is tracked based on index
        bustLayer.index[i] = bust

        local face = speaker.face and IMAGE.loadFacePicture(speaker.face) or display.newRect(0, 0, 0, 0)
        faceLayer:insert(face)
        face.x = CONSTANTS.textPadding
        face.y = display.contentHeight - CONSTANTS.faceHeight + CONSTANTS.rectangleStrokeWidth * 0.5
        face.isVisible = false
    end

    faceLayer:showFace(0)

    local width = display.contentWidth * 0.2
    local height = CONSTANTS.lineHeight + CONSTANTS.rectanglePadding * 2
    local TERMS = MAIN.TERMS
    --4 Log
    local logRect
    logRect = COMMON.createRectangleWithText({
        parent=sceneGroup,
        x=0,
        y=0,
        width=width,
        height=height,
        text='Log',
        touch=function()
            --cancel all transitions and hide message layer
            transition.cancelAll()
            timer.cancelAll()
            messageLayer:clearDialogue()
            faceLayer:showFace(0)

            --need to unscale for some reason
            transition.to(logRect, {time=0, xScale=1, yScale=1})

            --goto log
            composer.showOverlay('overlay.dialogue.log', {
                isModal = true,
                params = {
                    data = data,
                    step = scene.step
                }
            })
        end
    })

    --5 Skip
    local skipRect = COMMON.createRectangleWithText({
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
            scene.step = #data.events
            scene:startProcessing()
        end
    })

    self.data = data

    self.step = 1

    self.lastSpeaker = 0
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

        UTILITY.updateLowerUiLayer()
        
        --We want to start on a black screen so fade out first
        UTILITY.sceneFadeOut({
            time=0,
            onComplete=function()
                UTILITY.showLoadingLayer(false)

                --Start processing
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

        composer.removeScene('scene.dialogue.dialogue')
 
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