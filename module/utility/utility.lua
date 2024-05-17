--CONVIENCE FUNCTIONS

local M = {}

M.gotoScene = function(sceneName, params)
    --Show loading screen before going to scene
    --THIS DOESNT WORK AS INTENDED, THE BELOW TIEMR WORKS BUT DOESNT HAVE WHAT I WANT
    M.showLoadingLayer(true)
    composer.gotoScene(sceneName, { params=params })

    --[[ Doesnt really work how i want it to, flashing loading screens is annoying
    --scene has not been loaded yet, run create statement and show loading screen
    local scene = composer.getScene(sceneName)
    if not scene then
        M.showLoadingLayer(true)
        composer.loadScene(sceneName)
        local t = { sceneName=sceneName }
        function t:timer(event)
            if composer.getScene(self.sceneName) then
                timer.cancel(event.source)

                composer.gotoScene(sceneName, { params=params })
            end
        end
        timer.performWithDelay(1, t, -1)
    else
        composer.gotoScene(sceneName, { params=params })
    end
    ]]--
end

M.printJSON = function(object)
    print(require('json').encode(object))
end

M.sceneFadeIn = function(options)
    display.getCurrentStage()[4]:startFadeIn(options)
end

M.sceneFadeOut = function(options)
    display.getCurrentStage()[4]:startFadeOut(options)
end

M.showLoadingLayer = function(isTrue)
    display.getCurrentStage()[5].isVisible = isTrue
end

M.updateBackgroundImages = function(images)
    display.getCurrentStage()[1]:updateBackgroundImages(images)
end

M.focusBackgroundImage = function(index)
    display.getCurrentStage()[1]:focusBackgroundImage(index)
end

M.updateLowerUiLayer = function(options)
    display.getCurrentStage()[2]:show(options)
end

M.updateLowerUiActor = function(imageName)
    display.getCurrentStage()[2]:updateActorPicture(imageName)
end

M.updateLowerUiGold = function()
    display.getCurrentStage()[2]:updateGold()
end

M.updateClickLayer = function()
    display.getCurrentStage()[6]:enableTouchAnimation(MAIN.SYSTEM.OPTIONS.getOptionWithKey('general', 'clickAnimation'))
end

M.removeComposerVariable = function(variableName)
    composer.variables[variableName] = nil
end

return M