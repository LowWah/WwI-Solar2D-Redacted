local M = {}

local json = require('json')

--Module to read/ write json
M.readJson = function(filename, path)
    --Read a json file
    local filePath = system.pathForFile(filename, path)
    if filePath then
        local file, errorString = io.open(filePath, 'r')
        local contents = nil
        if file then
            local string = file:read('*a')
            string = MAIN.ENCRYPTION.decryptFile(string)
            contents = json.decode(string)
            io.close(file)
        end
        return contents
    end
end

M.writeJson = function(filename, contents)
    --Write a table to json, path will always be system.DocumentsDirectory
    local filePath = system.pathForFile(filename, system.DocumentsDirectory)
    local file, errorString = io.open( filePath, "wb" ) 
    if file then
        local c = json.encode(contents)
        c = MAIN.ENCRYPTION.encryptFile(c)
        file:write(c)
        io.close(file)
        return true
    else
        print( "File error: " .. errorString )
        return false
    end 
end

return M