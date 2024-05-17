--Module for constant values
local M = {}

--PATH
M.pathImageActor = 'img/actor/'
M.pathImageBackground = 'img/background/'
M.pathImageBust = 'img/bust/'
M.pathImageFace = 'img/face/'
M.pathImageSystem = 'img/system/'
M.pathImageAnimation = 'img/animation/'
M.pathImageEnemy = 'img/enemy/'
M.pathImageCharacter = 'img/character/'
M.pathImageStage = 'img/stage/'
M.pathImageFloor = 'img/floor/'

--FILENAME
M.fileSettings = '.set'
M.fileSave = '.sav'
M.fileImage = '.png'
M.fileEncryption = '.enc'


--PICTURE
M.pictureTitle = 'OGA-Background-1'
M.pictureGacha = 'OGA-Background-1'
M.pictureRewards = 'OGA-Background-1'
M.pictureLabyrinth = 'Cave'


--RECTANGLE
M.rectanglePadding = 8
M.rectangleSpacing = 4
M.rectangleFillColour = { 0.2, 0.2, 0.2, 0.8 }
M.rectangleSelectedCOlour = { 230/255, 143/255, 172/255, 0.7 }
M.rectangleFormationSelectedColour = { 0, 0, 1, 0.7 }
M.rectangleStrokeWidth = 2
M.rectangleStrokeColourInactive = { 0.2, 0.2, 0.2, 0.6 }
M.rectangleStrokeColourActive = { 252/255, 15/255, 192/255, 1 }


--LABYRNTH
M.hexagonStrokeColourInactive = { 1, 1, 1, 1 }
M.hexagonFillColourActive = { 0, 0, 1, 0.8 }
M.hexagonStrokeColourFlashlight = { 1, 1, 0, 1 }

--CHARACTER
M.characterWidth = 48
M.characterHeight = 48
M.characterAnimation = 1000
M.characterWalk = 300

--LINE
M.lineHeight = 32


--TEXT
M.textPadding = 4
M.textHeight = 21
M.textColour = { 1, 1, 1, 1 }
M.textColourInvalid = { 1, 1, 1, 0.6 }
M.textColourPink = { 255/255, 20/255, 147/255, 1 }
M.textColourGreen = { 0, 1, 0, 1 }
M.textColourRed = { 1, 0, 0, 1 }
M.textColourYellow = { 1, 1, 0, 1 }

M.textShadowColour = { 0, 0, 0, 1 }
M.textShadowDisplace = 1


--TOUCH
M.touchScale = 0.8


--FONT
M.font = 'fonts/AnonymousPro-Bold.ttf'
M.fontSize = 20
M.fontSizeSmall = 12
M.fontSizeDamage = 28


--OVERLAY
M.overlayColour = { 207/255, 47/255, 116/255, 0.6 }


--LIVES
M.livesMaxLower = 99
M.livesMaxUpper = 999
M.livesTimeForOne = 3600


--BACK
M.backWidth = 144


--GUILD
M.guildMaxLevel = 10
--(n-1)*1.5
M.guildExpRequired = { 1000, 1500, 2250, 3375, 5063, 7595, 11393, 17090, 25635, 38453 }


--GOLD
M.goldMax = 9999999
M.goldIcon = 5

--ACTOR
M.actorWidth = 300
M.actorHeight = 400
--50+4*l^2
M.actorExp = { 54, 66, 86, 114, 150, 194, 246, 306, 374, 450, 534, 626, 726, 834, 950, 1074, 1206, 1346, 1494, 1650, 1814, 1986, 2166, 2354, 2550, 2754, 2966, 3186, 3414, 3650, 3894, 4146, 4406, 4674, 4950, 5234, 5526, 5826, 6134, 6450, 6774, 7106, 7446, 7794, 8150, 8514, 8886, 9266, 9654, 10050, 10454, 10866, 11286, 11714, 12150, 12594, 13046, 13506, 13974, 14450, 14934, 15426, 15926, 16434, 16950, 17474, 18006, 18546, 19094, 19650, 20214, 20786, 21366, 21954, 22550, 23154, 23766, 24386, 25014, 25650, 26294, 26946, 27606, 28274, 28950, 29634, 30326, 31026, 31734, 32450, 33174, 33906, 34646, 35394, 36150, 36914, 37686, 38466, 39254, 40050 }
M.actorList = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66 }

--BUST
M.bustWidth = 410
M.bustHeight = 369
M.bustFrames = 8
M.bustPositions = function(count)
    --A mapping for x/y positions based on number of busts shown
    if count == 1 then
        return {
            {
                x= 275,
                y= 45
            }
        }
    elseif count == 2 then
        return {
            {
                x= 35,
                y= 45
            }, {
                x= 515,
                y= 45
            }
        }
    elseif count == 3 then
        return {
            {
                x= -45,
                y= 45
            }, 
            {
                x= 275,
                y= 45
            }, {
                x= 595,
                y= 45
            }
        }
    else
        return {
            {
                x= -85,
                y= 45
            }, {
                x= 155,
                y= 45
            }, {
                x= 395,
                y= 45
            }, {
                x= 635,
                y= 45
            }
        }
    end
end

--FACE
M.faceWidth = 124
M.faceHeight = 124
M.faceFrames = 8

--PARTY
M.partyCount = 20
M.partyMembersCount = 5


--BATTLE
M.battleActiveMembers = 3
M.battleHpColour = { 0, 1, 0, 1 }
M.battleMpColour =  { 0/255, 128/255, 255/255, 1 }
M.battleHyperColour = M.textColourPink
M.battleTurnOrderAlly = { 0, 0, 1, 1 }
M.battleTurnOrderEnemy = { 1, 0, 0, 1 }
M.battleEnemyHpGaugeWidth = { 128, 192, 288 }

M.battleIconLog = 8
M.battleIconSpeed = { 9, 10 }
M.battleIconTurn = 13
M.battleIconAuto = { 11, 12 }
M.battleIconEscape = 14
M.battleIconAttackAll = 7

M.autoCost = 1

--TIME
M.timeBustFade = 500
M.timeGachaFade = 500
M.timeBattleMessage = 1200
M.timeBattleActionDelay = 150
M.timeBattleAnimationDelay = 200
M.timeBattlePopup = 300
M.timeBattleGaugeMove = 150

--GACHA
M.gachaRank1 = 0.025
M.gachaRank2 = 0.16
M.gachaDailyCost = 600
M.gachaSingleCost = 1000
M.gachaBonusRate = 0.005

M.gachaActorsRank1 = { 16, 42, 48, 54, 57, 59, 61, 66 }
M.gachaActorsRank2 = { 2, 4, 10, 11, 12, 13, 19, 24, 44, 47, 50, 52, 55, 56, 63, 64, 65 }
M.gachaActorsRank3 = { 1, 3, 5, 6, 7, 8, 9, 14, 15, 17, 18, 20, 21, 22, 23, 41, 43, 45, 46, 49, 51, 53, 58, 60, 62 }

--ICON
M.iconWidth = 28
M.iconHeight = 28
M.iconFrames = 224
M.iconPadding = 4

--PARAM
M.paramStats = { 'Max HP', 'Max MP', 'Attack', 'Defence', 'Magic', 'Resist', 'Agility', 'Luck'}
M.paramStatsShort = { 'MHP', 'MMP', 'ATK', 'DEF', 'MAG', 'RES', 'AGI', 'LUK'}
M.paramAdditional = { 'HP Regen', 'MP Regen', 'Critical', 'Evasion', 'Stun' }
M.paramAdditionalShort = { 'HPR', 'MPR', 'CRI', 'EVA', 'STN' }
--Additional rates are static
M.paramAdditionalRate = { 0, 0.05, 0.08, 0, 0.4 }

--ELEMENTS
M.elementIcons = { 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
M.elementNames = { 'Slash', 'Bash', 'Pierce', 'Fire', 'Thunder', 'Ice', 'Water', 'Earth', 'Wind', 'Light', 'Dark' }

--STATBUFFS
M.statBuffsIcons = function(id, value)
    if id == 0 then
        return { icon=74 } --TODO stat rand icon
    end
    return { icon=(value > 0 and 29 or 43) + (id - 3) * 2 + math.abs(value) - 1 }
end

--RANK
M.rankIcon = { 71, 72, 73 }

--RATING
M.ratingIcon = { 64, 65, 66, 67, 68, 69, 70 }
M.ratingMax = 7

--EXP
M.expBookGain = { 1000, 2000, 4000 }

--TOKEN
M.tokensPerRank = { 10, 20, 100 }

--SKILL
M.skillType = { 'Physical', 'Magical', 'Certain' }
M.skillTarget = { '1 Enemy', '1 Random', '2 Random', '3 Random', '4 Random', 'All Enemies', '1 Ally', 'All Allies', 'Self' }
M.skillUpgrade = { 'Physical', 'Energy', 'Cold', 'Nature', 'Elemental', 'Support' }

--TERRAIN
M.terrain = {
    {
        id=1,
        imageName='Grassland'
    },
    {
        id=2,
        imageName='Wasteland'
    },
    {
        id=3,
        imageName='Volcanic'
    },
    {
        id=4,
        imageName='Galvanic'
    },
    {
        id=5,
        imageName='IceCave'
    },
    {
        id=6,
        imageName='Sea'
    },
    {
        id=7,
        imageName='Cave'
    },
    {
        id=8,
        imageName='Cliff'
    },
    {
        id=9,
        imageName='Heaven'
    },
    {
        id=10,
        imageName='Purgatory'
    },
    {
        id=11,
        imageName='Forest'
    },
    {
        id=12,
        imageName='Jungle'
    },
    {
        id=13,
        imageName='Cafe'
    },
    {
        id=14,
        imageName='Fort'
    },
    {
        id=15,
        imageName='Ruins'
    },
    {
        id=16,
        imageName='Void'
    },
    {
        id=17,
        imageName='Shrine'
    },
    {
        id=18,
        imageName='City'
    },
    {
        id=19,
        imageName='Classroom'
    },
    {
        id=20,
        imageName='Gym'
    },
    {
        id=21,
        imageName='Arcade'
    },
    {
        id=22,
        imageName='TowerInside'
    },
    {
        id=23,
        imageName='Castle'
    },
    {
        id=24,
        imageName='Guild'
    },
    {
        id=25,
        imageName='GrasslandWasteland'
    },
    {
        id=26,
        imageName='VolcanicGalvanic'
    },
    {
        id=27,
        imageName='IceCaveSea'
    },
    {
        id=28,
        imageName='CaveCliff'
    },
    {
        id=29,
        imageName='HeavenPurgatory'
    },
    {
        id=30,
        imageName='ForestJungle'
    }
}

--OPTIONS
M.iconOptions = 3

--MODE
M.modeActors = {
    { 
        icon=59,
        name='Allrounder',
        description='Increased tp gain for all actions'
    },
    {
        icon=60,
        name='Attacker',
        description='Increased tp gain when using offensive skills'
    },
    {
        icon=61,
        name='Defender',
        description='Increased tp gain when receiving damage or evading'
    },
    {
        icon=62,
        name='Supporter',
        description='Increased tp gain when using healing skills or applying buffs'
    },
    {
        icon=63,
        name='Debuffer',
        description='Increased tp gain when applying debuffs'
    }
}

M.labyrinthLivesCost = 15

return M