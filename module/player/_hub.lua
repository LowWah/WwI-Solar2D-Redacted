local M = {}

--Require save
M.hubActor = function()
    return MAIN.SYSTEM.SAVE.getSave().hub.profile
end

M.hubActorPicture = function()
    local hubActor = M.hubActor()
    return MAIN.DATA.ACTOR.getActor(hubActor.actorId).skins[hubActor.skin].picture
end

M.setHubActorPicture = function(actorId, skin)
    local hubActor = M.hubActor()
    hubActor.actorId = actorId
    hubActor.skin = skin
end

M.hubBackground = function()
    return MAIN.SYSTEM.SAVE.getSave().hub.background
end

return M