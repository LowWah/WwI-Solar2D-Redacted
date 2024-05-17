local M = {}

--Load data files
M.ACTOR = require('module.data._actor')

M.ENEMY = require('module.data._enemy')

M.TROOP = require('module.data._troop')

M.ITEM = require('module.data._item')

M.DIALOGUE = require('module.data._dialogue')

M.QUEST = require('module.data._quest')

M.MISSION = require('module.data._mission')

M.SKILLS = require('module.data._skills')

M.EVENT = require('module.data._event')

M.ANIMATION = require('module.data._animation')

M.BUFF = require('module.data._buff')

M.DEBUFF = require('module.data._debuff')

M.STORYCOLLECTION = require('module.data._storycollection')

M.OPTIONS = require('module.data._options')

M.SHOP = require('module.data._shop')

M.CAFE = require('module.data._cafe')

return M