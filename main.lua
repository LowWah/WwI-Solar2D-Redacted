-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--[[
local group = display.newGroup()

local r = display.newRect(group, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
r:setFillColor(1, 0, 0, 1)

local t = display.newText({
    parent=group,
    text='This is a sentence, with a long line',
    font='fonts/AnonymousPro-Bold.ttf',
    --font='font/DroidSansMono.ttf',
    x=display.contentCenterX,
    y=display.contentCenterY,
    fontSize=20
})
print(t.height)

t:setFillColor(0,0,0,1)
*/]]--

composer = require('composer')

--Initalize modules
--Need to isolate constants as it will be used in main
CONSTANTS = require('module.constants')
MAIN = require('module.main')

--Initalize inital stuff
MAIN.IMAGE.initializeImages()
MAIN.AUDIO.initializeAudio()
MAIN.SYSTEM.OPTIONS.initializeOptions()

--Create interface layers
local LAYER = MAIN.UI.LAYER

local backgroundLayer = LAYER.createBackgroundLayer()
local lowerUiLayer = LAYER.createLowerUiLayer()
local composerLayer = composer.stage
local transitionLayer = LAYER.createTransitionLayer()
local loadingLayer = LAYER.createLoadingLayer()
local touchLayer = LAYER.createTouchLayer()

local stage = display.getCurrentStage()
stage:insert(backgroundLayer) --1
stage:insert(lowerUiLayer) --2
stage:insert(composerLayer) --3
stage:insert(transitionLayer) --4
stage:insert(loadingLayer) --5
stage:insert(touchLayer) --6

MAIN.UTILITY.updateClickLayer()

--To title
loadingLayer.isVisible = true


--[[
--CHECKS FOR SKILLS
for i = 1, 550 do
    local skill = MAIN.DATA.SKILLS.getSkill(i, 1)
    if skill then
        --check id
        if i ~= skill.data.id then
            print(skill.data.name .. ' Skill id incorrect')
        end

        local icon = skill.data.icon

        --check animation
        local checkAnimation
        if icon == 26 then
            checkAnimation = 12
        elseif icon == 27 then
            checkAnimation = 13
        elseif icon == 28 then
            checkAnimation = 14
        else
            checkAnimation = icon - 14
        end

        if checkAnimation ~= skill.data.animation then
            print(skill.data.name .. ' Skill animation incorrect')
        end

        --check element
        local checkElement
        if icon == 26 or icon == 27 or icon == 28 then
            checkElement = 0
        else
            checkElement = icon - 14
        end
        if checkElement ~= skill.data.element then
            print(skill.data.name .. ' Skill element incorrect')
        end

        --check upgrade
        if skill.data.upgrade then
            local checkUpgrade
            if skill.data.hyper or skill:maxLevel() == 1 then
                checkUpgrade = 0
            elseif icon == 15 or icon == 16 or icon == 17 then
                checkUpgrade = 1
            elseif icon == 18 or icon == 19 then
                checkUpgrade = 2
            elseif icon == 20 or icon == 21 then
                checkUpgrade = 3
            elseif icon == 22 or icon == 23 then
                checkUpgrade = 4
            elseif icon == 24 or icon == 25 then
                checkUpgrade = 5
            elseif icon == 26 or icon == 27 or icon == 28 then
                checkUpgrade = 6
            end
            if checkUpgrade ~= skill.data.upgrade then
                print(skill.data.name .. ' Skill upgrade incorrect')
            end
        end
    end
end

--MAKE SURE ENEMY SKILLS WORK, need to disable party
local bm = MAIN.BATTLE.initializeBattleManagerForLabyrinth()
for i = 1, 285 do
    local troop = MAIN.DATA.TROOP.getTroop(i)
    if troop then
        local waves = { 
            level=100,
            type='standard',
            waves={ i } 
        }
        bm:setupEnemies(waves)

        --SIMULATE 15 turns
        for j = 1, 15 do
            bm.turn = bm.turn + 1

            for k = 1, #bm.currentEnemies do
                if j == 10 then
                    for s = 1, #bm.currentEnemies[k].statBuffs do
                        bm.currentEnemies[k].statBuffs[s].value = 1
                        bm.currentEnemies[k].statBuffs[s].turn = 1
                    end
    
                    bm.currentEnemies[k].buffs[4] = {
                        id=4,
                        turn=1
                    }
                    
                    bm.currentEnemies[k].buffs[6] = {
                        id=6,
                        turn=1
                    }
                    
                    bm.currentEnemies[k].buffs[7] = {
                        id=6,
                        turn=1
                    }
    
                    bm.currentEnemies[k]:gainHp(-1 * bm.currentEnemies[k]:maxHp() + 1)
                end

                bm.currentEnemies[k]:startInput(bm)

                if not bm.currentEnemies[k]:inputSkillObj() then
                    print(bm.currentEnemies[k].name, 'has invalid skill id', bm.currentEnemies[k].inputSkill)
                end
            end
        end
    end
end

--TEST IMAGE ENCRYPTION, need to change decrypt to global
local imgFolders = { CONSTANTS.pathImageActor, CONSTANTS.pathImageBackground, CONSTANTS.pathImageBust, CONSTANTS.pathImageFace, CONSTANTS.pathImageSystem, CONSTANTS.pathImageAnimation, CONSTANTS.pathImageEnemy, CONSTANTS.pathImageCharacter, CONSTANTS.pathImageStage, CONSTANTS.pathImageFloor }
local lfs = require( "lfs" )
for i = 1, #imgFolders do
    local doc_path = system.pathForFile(imgFolders[i], system.ResourceDirectory )
    for file in lfs.dir( doc_path ) do
        if string.sub(file, -4) == '.enc' then
            local filename = (imgFolders[i] .. file)
            local encFile = io.open(system.pathForFile(filename, system.ResourceDirectory), 'rb')
            local encBytes = encFile:read('*a')
            io.close(encFile)

            filename = filename:gsub('/', '_') .. '.png'

            local imageBytes = MAIN.ENCRYPTION.decrypt(encBytes)
            while string.byte(imageBytes, -1) == string.byte('0') do
                imageBytes = string.sub(imageBytes, 1, -2)
            end

            local newFile = io.open(system.pathForFile(filename, system.TemporaryDirectory), 'wb')
            newFile:write(imageBytes)
            io.close(newFile)
            
            --attempt to load image
            local image = display.newImage(filename, system.TemporaryDirectory)
            if image.width == 0 then
                print(filename, 'has invalid image')
            end

            image:removeSelf()
            os.remove(system.pathForFile(filename, system.TemporaryDirectory))
        end
    end
end
]]

composer.gotoScene('scene.title.title')