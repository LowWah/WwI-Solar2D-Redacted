local M = {}

M.getStageList = function(quest)
    local dataStorycollection = MAIN.DATA.STORYCOLLECTION.getStoryCollection(quest)
    local stages = {}

    for i = 1, #dataStorycollection do
        local dataStage = dataStorycollection[i]

        --name - define inline
        --picture - define inline

        --level is ignored

        local storyCount = 0
        local completeCount = 0
        for j = 1, #dataStage.story do
            storyCount = storyCount + 1
            local quest = dataStage.story[j].quest
            if quest then
                if MAIN.PLAYER.QUEST.isFloorCleared(quest.quest, quest.stage, quest.floor) then
                    completeCount =  completeCount + 1
                end
            else
                --for intro
                completeCount =  completeCount + 1
            end
        end

        local percent = math.round(completeCount / storyCount * 100)
        local isStageComplete = percent == 100
        local percentFontColour = isStageComplete and CONSTANTS.textColourGreen or CONSTANTS.textColourInvalid

        stages[i] = {
            name=dataStage.name,
            picture=dataStage.picture,
            level=nil,
            requirements=nil,
            percent=percent..'%',
            percentFontColour=percentFontColour
        }
    end

    return stages
end

M.getOtherDialogue = function(quest, party)
    local stage
    if quest == 'tower' then
        stage = 1
    elseif quest == 'arena' then
        stage = 2
    else 
        stage = 3
    end

    --iterate through storycollection
    local storyCollection = MAIN.DATA.STORYCOLLECTION.getStoryCollection(4)[stage].story
    local save = MAIN.SYSTEM.SAVE.getSave().quests.other[stage]
    for i = 1, #storyCollection do
        --has not been viewed
        if not save[i] then
            --check if all characters exist in party
            local characterCount = 0
            local totalCharacterCount = #storyCollection[i].characters
            for j = 1, totalCharacterCount do
                local characterToCheck = storyCollection[i].characters[j]
                for k = 1, #party do
                    if party[k].actor == characterToCheck then
                        characterCount = characterCount + 1
                        break
                    end
                end
            end

            if characterCount == totalCharacterCount then
                save[i] = true

                return MAIN.DATA.DIALOGUE.getDialogue('other', stage, i, 1)
            end
        end
    end

end

return M