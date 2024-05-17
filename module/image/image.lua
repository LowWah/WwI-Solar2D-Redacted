local M = {}

local iconImageSheet

local loadImage = function(filename, directory, frames)
    local image
    if frames then
        local imageSheet
        pcall(function()
            imageSheet = graphics.newImageSheet(filename, directory, frames)
        end)

        --if frame is zero then we return the graphics sheet
        if not imageSheet or frames.frame == 0 then
            return imageSheet
        end
        --Return first frame
        image = display.newImage(imageSheet, frames.frame)
    else
        image = display.newImage(filename, directory)
    end

    image.anchorX = 0
    image.anchorY = 0

    return image
end

local loadPicture
loadPicture = function(filename, frames) 
    --[[
        frames = {
            width = width,
            height = height,
            numFrames = numFrames
        }
    ]]--

    local finalFilename, directory = MAIN.ENCRYPTION.decryptImage(filename)

    local image = loadImage(finalFilename, directory, frames)

    local isImageSheet = frames and frames.frame == 0

    if not image or (not isImageSheet and image.width == 0) then
        MAIN.ENCRYPTION.incrementImageCache(filename)
        image = loadPicture(filename, frames)
    end
    
    MAIN.ENCRYPTION.finaliseDecryptImage(filename)

    return image
end

M.initializeImages = function()
    --Load common images, e.g icons
    iconImageSheet = M.loadSystemPicture('IconSet', {
        width = CONSTANTS.iconWidth,
        height = CONSTANTS.iconHeight,
        numFrames = CONSTANTS.iconFrames,
        frame=0
    })
end

M.loadSystemPicture = function(imageName, frames)
    return loadPicture(CONSTANTS.pathImageSystem .. imageName, frames)
end

M.loadBackgroundPicture = function(imageName)
    return loadPicture(CONSTANTS.pathImageBackground .. imageName)
end

M.loadActorPicture = function(imageName)
    return loadPicture(CONSTANTS.pathImageActor .. imageName)
end

M.loadBustPicture = function(imageName, frame)
    return loadPicture(CONSTANTS.pathImageBust .. imageName, {
        width=CONSTANTS.bustWidth,
        height=CONSTANTS.bustHeight,
        numFrames=CONSTANTS.bustFrames,
        frame=(frame or 1)
    })
end

M.loadFacePicture = function(imageName, frame)
    return loadPicture(CONSTANTS.pathImageFace .. imageName, {
        width=CONSTANTS.faceWidth,
        height=CONSTANTS.faceHeight,
        numFrames=CONSTANTS.faceFrames,
        frame=(frame or 1)
    })
end

M.loadEnemyPicture = function(imageName)
    return loadPicture(CONSTANTS.pathImageEnemy .. imageName)
end

M.loadStagePicture = function(imageName)
    return loadPicture(CONSTANTS.pathImageStage .. imageName)
end

M.loadFloorPicture = function(imageName)
    return loadPicture(CONSTANTS.pathImageFloor .. imageName)
end

M.loadIconFrame = function(iconIndex)
    local image = display.newImage(iconImageSheet, iconIndex)
    image.anchorX = 0
    image.anchorY = 0

    return image
end

M.loadAnimationSheet = function(imageName, frame)
    return loadPicture(CONSTANTS.pathImageAnimation .. imageName, {
        width=frame.width,
        height=frame.height,
        numFrames=frame.numFrames,
        frame=0
    })
end

M.loadCharacterSheet = function(imageName)
    return loadPicture(CONSTANTS.pathImageCharacter .. imageName, {
        width=CONSTANTS.characterWidth,
        height=CONSTANTS.characterHeight,
        numFrames=12,
        frame=0
    })
end


return M