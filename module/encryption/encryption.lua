local M = {}

local isSimulator = 'simulator' == system.getInfo('environment')

local key = <GET KEY SOMEHOW>
local iv = <GET IV SOMEHOW>

local cipher = require('plugin.openssl').get_cipher('aes-256-cbc')
local decrypt = function(bytes)
    return cipher:decrypt(bytes, key, iv)
end

local encrypt = function(bytes)
    return cipher:encrypt(bytes, key, iv)
end

--FILES
M.encryptFile = function(string)
    if not isSimulator then
        string = encrypt(string)

        local mime = require('mime')
        string = mime.b64(string)
    end

    return string
end

M.decryptFile = function(string)
    if not isSimulator then
        local mime = require('mime')
        string = mime.unb64(string)

        string = decrypt(string)
    end

    return string
end

--IMAGES
local imageCache = {}
M.incrementImageCache = function(filename)
    --image cache will save the output filename, will change / to _ to remove directories and end with -<Number> for cache increments
    local cache = {}
    if imageCache[filename] then
        local oldFilename = imageCache[filename][1]
        os.remove(system.pathForFile(oldFilename .. CONSTANTS.fileImage, system.TemporaryDirectory))

        for i = #oldFilename, 1, -1 do
            if string.sub(oldFilename, i, i) == '-' then
                local index = tonumber(string.sub(oldFilename, i + 1, #oldFilename))
                index = index + 1
                cache[1] = string.sub(oldFilename, 1, i) .. index
                break
            end
        end
    else
        cache[1] = filename:gsub('/', '_') .. '-0'
    end

    cache[2] = true
    imageCache[filename] = cache

    return cache[1] .. CONSTANTS.fileImage
end

M.decryptImage = function(filename)
    local finalFilename = filename .. CONSTANTS.fileImage
    local directory = system.ResourceDirectory
    if not isSimulator then
        directory = system.TemporaryDirectory

        if imageCache[filename] and not imageCache[filename][2] then
            finalFilename = imageCache[filename][1] .. CONSTANTS.fileImage
        else
            finalFilename = M.incrementImageCache(filename)

            --load buffer, decrypt, output to temp location
            local filePath = system.pathForFile(filename .. CONSTANTS.fileEncryption, system.ResourceDirectory)
            local file = io.open(filePath, 'rb')

            local bytes = file:read('*a')
            io.close(file)
            bytes = decrypt(bytes)

            local outputFile = io.open(system.pathForFile(finalFilename, directory), 'wb')
            outputFile:write(bytes)
            io.close(outputFile)
        end
    end

    return finalFilename, directory
end

M.finaliseDecryptImage = function(filename)
    if not isSimulator and imageCache[filename][2] then
        imageCache[filename][2] = false
        local finalFilename = imageCache[filename][1] .. CONSTANTS.fileImage

        --delete it after one second
        timer.performWithDelay(500, function(event)
            local removed = os.remove(system.pathForFile(finalFilename, system.TemporaryDirectory))
            if removed then
                local outputFile = io.open(system.pathForFile(finalFilename, system.TemporaryDirectory), 'w')
                io.close(outputFile)

                timer.cancel(event.source)
            end
            
        end, 10)

        --[[
        assert(os.remove(system.pathForFile(finalFilename, system.TemporaryDirectory)))

        --even though load image is cached it still needs a file to exist, so we replace it with a blank
        --for some reason we cant simply write over the file (encounter File Error - Invalid Argument), so we delete the file first
        os.remove(system.pathForFile(finalFilename, system.TemporaryDirectory))

        local outputFile = io.open(system.pathForFile(finalFilename, system.TemporaryDirectory), 'w')
        io.close(outputFile)

        ]]
    end
end

return M