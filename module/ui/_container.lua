local M = {}

--rectangle defaults
local rectangle_options = {
    --parent=nil,
    --x=nil,
    --y=nil,
    --width=nil,
    --height=nil,
    padding=CONSTANTS.rectanglePadding,
    fillColour=CONSTANTS.rectangleFillColour,
    strokeColour=CONSTANTS.rectangleStrokeColourActive,
    strokeColourDisabled=CONSTANTS.rectangleStrokeColourInactive,
    strokeWidth=CONSTANTS.rectangleStrokeWidth,
    --create=nil,
    --refresh=nil,
    --touch=nil,
    --se=nil TODO There actually is a default
}

function rectangle_options:inheritDefaults(options)
    --setup default options
    setmetatable(options, self)
    self.__index = self
end

M.createRectangleGroup = function(options)
    rectangle_options:inheritDefaults(options)
    
    local group = display.newGroup()
    options.parent:insert(group)
    
    --Move the group anchor to centre so scale will be at centre
    group.x = options.x + options.width / 2
    group.y = options.y + options.height / 2

    --Define rectangle dimensions
    --Note - stroke gets split between inner and out, so actual rect width needs to be reduced, we use an even number as there is logic for odds
    local adjust = options.padding + options.strokeWidth * 0.5
    local rectWidth = options.width - adjust * 2
    local rectHeight = options.height - adjust * 2

    --Create a rectangle and insert into group
    local rect = display.newRect(0, 0, rectWidth, rectHeight)
    --We've already adjusted the group location so we reset the rect position
    group:insert(rect, true)

    --Set disabled rect colours
    rect:setFillColor(options.fillColour[1], options.fillColour[2], options.fillColour[3], options.fillColour[4])
    rect.strokeWidth = options.strokeWidth
    rect:setStrokeColor(options.strokeColourDisabled[1], options.strokeColourDisabled[2], options.strokeColourDisabled[3], options.strokeColourDisabled[4])

    --Create display objects
    --Rect includes half a stroke width, so to draw after the stroke we need to reduce it
    local containerWidth = rectWidth - options.strokeWidth
    local containerHeight = rectHeight - options.strokeWidth

    --set x/y/width/height coords to the rectangle area, x/y will point to top/left
    --We need to allow custom inputs so scrollview create can include index, doing workaround for now
    options.create({
        parent=group,
        x=(-containerWidth * 0.5),
        y=(-containerHeight * 0.5),
        width=containerWidth,
        height=containerHeight
    })

    --Create refresh function
    group._refresh = options.refresh
    function group:refresh(input)
        --include any additional input
        input = input or {}
        input.parent = self

        self._refresh(input)
    end

    --Setup touch
    group._touch = options.touch
    group._se = options.se
    function rect:touch(event)
        if self.canTouch then
            if event.phase == 'began' then
                transition.to(self.parent, {time=0, xScale=CONSTANTS.touchScale, yScale=CONSTANTS.touchScale})
                --Set stage to focus touch events for this object only
                local stage = display.getCurrentStage()
                stage:setFocus( self )
                self.isFocus = true
            elseif self.isFocus then
                if event.phase == 'moved' then
                    --Check if touch still inbounds
                    local bounds = self.contentBounds
                    if event.x < bounds.xMin or event.x > bounds.xMax or event.y < bounds.yMin or event.y > bounds.yMax then
                        self.isFocus = false
                        transition.to(self.parent, {time=0, xScale=1, yScale=1})
                        local stage = display.getCurrentStage()
                        stage:setFocus( nil )
                        
                        --Change focus to scroll view
                        if self.parent.scrollView then
                            self.parent.scrollView:takeFocus( event )
                        end
                    end
                elseif event.phase == 'ended' then
                    self.isFocus = false
                    transition.to(self.parent, {time=0, xScale=1, yScale=1})
                    local stage = display.getCurrentStage()
                    stage:setFocus( nil )
                    if self.parent._se then
                        AUDIO.playSe(self.parent._se)
                    end
                    --Execute function
                    self.parent._touch()
                end
            end
            return true
        end
    end

    function group:enableTouch(enabled)
        local rect = self[1]

        local strokeColour = enabled and options.strokeColour or options.strokeColourDisabled
        rect:setStrokeColor(strokeColour[1], strokeColour[2], strokeColour[3], strokeColour[4])
        rect.canTouch = enabled
    end

    if group._touch then
        group[1]:addEventListener('touch', group[1])
        group:enableTouch(true)
    end
    
    return group
end


--scrollview defaults
local scrollview_options = {
    --parent=nil,
    --x=nil,
    --y=nil,
    --width=nil,
    --height=nil,
    --columns=nil,
    --rows=nil,
    numItems=0,
    items={},
    padding=CONSTANTS.rectanglePadding,
    spacing=CONSTANTS.rectangleSpacing,
    fillColour=CONSTANTS.rectangleFillColour,
    strokeColour=CONSTANTS.rectangleStrokeColourActive,
    strokeColourDisabled=CONSTANTS.rectangleStrokeColourInactive,
    strokeWidth=CONSTANTS.rectangleStrokeWidth,
    --create=nil,
    --refresh=nil,
    --touch=nil,
    isTouchEnabled=true
    --se=nil - TODO There is a default
}

function scrollview_options:inheritDefaults(options)
    --setup default options
    setmetatable(options, self)
    self.__index = self
end

M.createScrollViewWithRectangles = function(options)
    scrollview_options:inheritDefaults(options)

    --Define scrollview dimensions
    local scrollViewWidth = options.width - options.padding * 2
    local scrollViewHeight = options.height - options.padding * 2

    --Define rectangle width/ height
    local itemWidth = (scrollViewWidth - options.spacing * (options.columns - 1)) / options.columns
    local itemHeight = (scrollViewHeight - options.spacing * (options.rows - 1)) / options.rows

    --Create scrollview
    local scrollView = require('widget').newScrollView(
        {
            left = options.x + options.padding,
            top = options.y + options.padding,
            width = scrollViewWidth,
            height = scrollViewHeight,
            hideBackground=true,
            isBounceEnabled=false,
            hideScrollBar=false,
            friction=0
        }
    )
    options.parent:insert(scrollView)

    scrollView.currentIndex = 0

    --Select functions
    function scrollView:itemAtIndex(index)
        return self.items[index]
    end

    function scrollView:currentItem()
        return self:itemAtIndex(self.currentIndex)
    end

    function scrollView:select(index)
        if self.currentIndex ~= index then
            local collectorGroup = self._collectorGroup

            local lastGroup = collectorGroup[self.currentIndex]
            if lastGroup then
                local lastRect = lastGroup[1]
                local fillColour = CONSTANTS.rectangleFillColour
                lastRect:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
                lastRect.canTouch = options.isTouchEnabled and true
                self:refreshAtIndex(self.currentIndex)
            end

            local group = collectorGroup[index]
            if group then
                local rect = group[1]
                local fillColour = CONSTANTS.rectangleSelectedCOlour
                rect:setFillColor(fillColour[1], fillColour[2], fillColour[3], fillColour[4])
                rect.canTouch = false
            end

            self.currentIndex = index
        end
        
        --[[
        if index ~= 0 and not self:isIndexVisible(index) then
            self:scrollToIndex(index)
        end]]
    end

    function scrollView:selectAndCall(index, force)
        --Add a force flag so it reactivate regardless
        if self.currentIndex ~= index or force then
            local group = self._collectorGroup[index]
            if group then
                local rect = group[1]
                rect.canTouch = true
                rect.isFocus = true
                --Manual innvocation, disable any sound
                local se = group._se
                group._se = nil
                rect:touch({ phase='ended' })
                group._se = se
            end
            self:select(index)
        end
    end

    --create rectangles function
    function scrollView:refreshRectangles()
        --Determine the number of rectangles required
        local numItems = math.max(#self.items, options.numItems)
        --num items always need to be a modulus of num columns if scrolling down
        if options.rows > 1 and (numItems % options.columns) ~= 0 then
            numItems = numItems + options.columns - (numItems % options.columns)
        end

        --If rows is one, we only append horizontally, so we dont need to specify itemWidth and let it go over
        if options.rows == 1 then
            for i = 1, numItems do
                local rect = self._collectorGroup[i]
                if not rect then
                    rect = M.createRectangleGroup({
                        parent=self,
                        x=(i-1)*(itemWidth+options.spacing),
                        y=0,
                        width=itemWidth,
                        height=itemHeight,
                        padding=0,
                        strokeColour=options.strokeColour,
                        strokeColourDisabled=options.strokeColourDisabled,
                        create=function(input)
                            input.index = i
                            options.create(input)
                        end,
                        refresh=options.refresh,
                        touch=function()
                            self:select(i)
                            if options.touch then
                                options.touch({parent=rect,index=i,item=self:itemAtIndex(i)})
                            end
                        end,
                        se=options.se
                    })
                    --Attach the scrollview to the rect for touch
                    rect.scrollView = self
                    rect:enableTouch(options.isTouchEnabled)
                end
                rect:refresh({index=i,item=self:itemAtIndex(i)})
            end
        else
            local floor = math.floor
            for i = 1, numItems do
                local rect = self._collectorGroup[i]
                if not rect then
                    local posX = (i - 1) % options.columns
                    local posY = floor((i - 1) / options.columns)
                    rect = M.createRectangleGroup({
                        parent=self,
                        x=posX*(itemWidth+options.spacing),
                        y=posY*(itemHeight+options.spacing),
                        width=itemWidth,
                        height=itemHeight,
                        padding=0,
                        strokeColour=options.strokeColour,
                        strokeColourDisabled=options.strokeColourDisabled,
                        create=function(input)
                            input.index = i
                            options.create(input)
                        end,
                        refresh=options.refresh,
                        touch=function()
                            self:select(i)
                            if options.touch then
                                options.touch({parent=rect,index=i,item=self:itemAtIndex(i)})
                            end
                        end,
                        se=options.se
                    })
                    --Attach the scrollview to the rect for touch
                    rect.scrollView = self
                    rect:enableTouch(options.isTouchEnabled)
                end
                rect:refresh({index=i,item=self:itemAtIndex(i)})
            end
        end

        --Check if there are any rectangles over the current numItems and remove them
        while self._collectorGroup.numChildren > numItems do
            self._collectorGroup[self._collectorGroup.numChildren]:removeSelf()
        end

        --Update scrollability
        if numItems <= options.rows * options.columns then
            --self:scrollTo('left', { time=0 })
            --self:scrollTo('top', { time=0 })
            self:scrollToPosition({
                x=0,
                y=0,
                time=0
            })
            self:setIsLocked(true)
        else
            self:setIsLocked(false)
    
            --Check for horizontal/vertical scroll
            --scrollWidth/ height actually gets automatically updated after insert but it doesnt include padding so we still need to update it
            if options.columns == 1 then
                self:scrollToPosition({
                    x=0,
                    time=0
                })
                self:setIsLocked(true, 'horizontal')
            else
                --Default there is no horizontal scroll, only when there is only one row
                if options.rows == 1 then
                    self:setIsLocked(false, 'horizontal')
                    self:setScrollWidth(math.ceil(numItems / options.rows) * (itemWidth + options.spacing) - options.spacing)
                else
                    self:scrollToPosition({
                        x=0,
                        time=0
                    })
                    self:setIsLocked(true, 'horizontal')
                end
            end
            if options.rows == 1 then
                self:scrollToPosition({
                    y=0,
                    time=0
                })
                self:setIsLocked(true, 'vertical')
            else
                self:setIsLocked(false, 'vertical')
                self:setScrollHeight(math.ceil(numItems / options.columns) * (itemHeight + options.spacing) - options.spacing)
            end
        end
    end

    function scrollView:refreshAtIndex(index)
        local input = { index=index, item=self:itemAtIndex(index) }
        self._collectorGroup[index]:refresh(input)
    end

    --set items
    function scrollView:setItems(items)
        self.items = items
        self:refreshRectangles()
        self:select(0)
        self:scrollToIndex(0)
    end

    --scroll
    function scrollView:isIndexVisible(index)
        if index and index ~= 0 then
            local x, y = self:getContentPosition()
            if options.rows == 1 then
                local minRange = x
                local maxRange = x - (itemWidth + options.spacing) * options.columns

                local currentIndexX = -(itemWidth + options.spacing) * (index - 1)

                return minRange >= currentIndexX and maxRange <= currentIndexX
            else
                local minRange = y
                local maxRange = y -(itemHeight + options.spacing) * (options.rows - 1)

                local currentIndexY = -(itemHeight + options.spacing) * (math.floor(index / options.columns) - 1)

                return minRange >= currentIndexY and maxRange <= currentIndexY
            end
        end
    end

    function scrollView:scrollToIndex(index)
        if index == 0 then
            if options.rows == 1 then
                self:scrollTo('left', { time=0 })
            else
                self:scrollTo('top', { time=0 })
            end
        else
            local numItems = #self.items
            --limit index so it doesnt go over
            index = math.min(index, math.max(1, numItems - options.rows * options.columns + 1))
            if options.rows == 1 then
                --horizontal
                local x = -(itemWidth + options.spacing) * (index - 1)
                self:scrollToPosition({ x=x, time=2 })
            else
                --vertical
                local y = -(itemHeight + options.spacing) * (math.floor(index / options.columns) - 1)
                --i think there is a bug when it first creates, so we need a time
                self:scrollToPosition({ y=y, time=2 })
            end
        end

    end
    
    scrollView:setItems(options.items)

    return scrollView
end


--gradientrect defaults
local gradientrect_options = {
    --parent=nil,
    --x=nil,
    --y=nil,
    --width=nil,
    --height=nil,
    colour1=CONSTANTS.overlayColour,
    colour2={ 0, 0, 0, 0}
}

function gradientrect_options:inheritDefaults(options)
    --setup default options
    setmetatable(options, self)
    self.__index = self
end

M.createGradientRect = function(options)
    gradientrect_options:inheritDefaults(options)

    local rect = display.newRect(options.parent, options.x, options.y, options.width, options.height)
    rect.anchorX = 0
    rect.anchorY = 0

    rect:setFillColor({
        type='gradient',
        color1={ options.colour1[1], options.colour1[2], options.colour1[3], options.colour1[4] }, 
        color2={ options.colour2[1], options.colour2[2], options.colour2[3], options.colour2[4] }, 
        --only do one direction for convience
        direction='left'
    })

    return rect
end

--gauge defaults
local gauge_options = {
    --parent=nil,
    --x=nil,
    --y=nil,
    --width=nil,
    --height=nil,
    padding=2,
    colour1={ 0, 0, 0, 0 },
    colour2={ 0.2, 0.2, 0.2, 1 },
    rate=0
}

function gauge_options:inheritDefaults(options)
    --setup default options
    setmetatable(options, self)
    self.__index = self
end

M.createRectangleGauge = function(options)
    gauge_options:inheritDefaults(options)

    local group = display.newGroup()
    options.parent:insert(group)

    --get dimensions of gauge, save the original gauge width so it can be refenced when updating
    group.gaugeWidth = options.width - options.padding * 2
    local gaugeWidth = group.gaugeWidth * options.rate
    local gaugeHeight = options.height - options.padding * 2

    local rectX, anchorX, paddingX
    if options.direction == 'right' then
        rectX = options.x + options.width
        anchorX = 1
        paddingX = -1 * options.padding
    else
        rectX = options.x
        anchorX = 0
        paddingX = options.padding
    end

    local gaugeBackRect = display.newRect(group, rectX, options.y, options.width, options.height)
    gaugeBackRect:setFillColor(options.colour2[1], options.colour2[2], options.colour2[3], options.colour2[4])
    gaugeBackRect.anchorX = anchorX
    gaugeBackRect.anchorY = 0
    local gaugeRect = display.newRect(group, rectX + paddingX, options.y + options.padding, gaugeWidth, gaugeHeight)
    gaugeRect.anchorX = anchorX
    gaugeRect.anchorY = 0
    gaugeRect:setFillColor(options.colour1[1], options.colour1[2], options.colour1[3], options.colour1[4])

    function group:setRate(rate, time)
        --cancel any ongoing transitions
        transition.cancel(self[2])

        --get transition time
        time = time or 0
        --Clamp rate to 0,1
        rate = math.max(0, math.min(1, rate))
        transition.to(self[2], { time=time, width=self.gaugeWidth * rate })
    end

    return group

end

return M