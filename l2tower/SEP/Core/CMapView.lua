CMapView = {
}
CMapView_mt = { __index = CMapView }

function CMapView.new(name)
    o = {};
    o.name = name
    o.groups = {general = {points = {}}}
    -- o.subViews = {};
    -- o.subViewsCnt = 0;
    return setmetatable(o, CMapView_mt)
end

function CMapView:setPointsList(points, color)
    self.groups[tostring(points)] = {points = points, color = color or "mapGeneral"};
end

function CMapView:addPoint(point)
    table.insert(self.groups.general.points, point)
end


function CMapView:addSubView( view )
    -- self.subViews[view] = view;
    -- inc(self, "subViewsCnt")
    -- if (view.loadView) then
    --     view:loadView()
    -- end
end

function CMapView:layout()
    
    -- local gridStartPoint = CPoint(self.x, self.y)
    -- local gridEndPoint = CPoint(self.x + self.width, self.y + self.height)

    -- local minX, maxX = 10000000000, -10000000000 -- this is some kind of restriction
    -- local minY, maxY = 10000000000, -10000000000
    -- for _, group in pairs(self.dotsGroups) do
    --     for _, loc in pairs(group) do
    --         minX = minX < loc.x and minX or loc.x
    --         maxX = maxX > loc.x and maxX or loc.x
    --         minY = minY < loc.y and minY or loc.y
    --         maxY = maxY > loc.y and maxY or loc.y
    --     end
    -- end
    -- drawReport = string.format("%sminX:%f minY:%f\nmaxX:%f maxY:%f\n", drawReport, minX, minY, maxX, maxY)

    -- local scaleX = (gridEndPoint.x - gridStartPoint.x) / (maxX - minX);
    -- local scaleY = (gridEndPoint.y - gridStartPoint.x) / (maxY - minY);
    -- drawReport = string.format("%sscaleX:%f scaleY:%f\n", drawReport, scaleX, scaleY)

    -- for _, group in pairs(self.dotsGroups) do
    --     for _, loc in pairs(group) do
    --         local pointX = self.x + (loc.x - minX) * scaleX
    --         local pointY = self.y + (loc.y - minY) * scaleY
    --         drawReport = string.format("%sNew point at (X:%f Y:%f) X:%f Y:%f\n", drawReport, loc.x, loc.y, pointX, pointY)
    --         love.graphics.circle("fill", pointX, pointY, 5)
    --     end
    -- end

end

function CMapView:layoutViewport()
end


function CMapView:draw()
    SetColor("white")
    local drawReport = ""

    if self.x then
        local gridStartPoint = {x = self.x, y = self.y}
        local gridEndPoint = {x = self.x + self.width, y = self.y + self.height}

        local minX, maxX = 10000000000, -10000000000 -- this is some kind of restriction
        local minY, maxY = 10000000000, -10000000000
        for _, group in pairs(self.groups) do
            for _, loc in pairs(group.points) do
                if loc.x and loc.y then
                    minX = minX < loc.x and minX or loc.x
                    maxX = maxX > loc.x and maxX or loc.x
                    minY = minY < loc.y and minY or loc.y
                    maxY = maxY > loc.y and maxY or loc.y
                end
            end
        end
        drawReport = string.format("%sminX:%f minY:%f\nmaxX:%f maxY:%f\n", drawReport, minX, minY, maxX, maxY)

        local scaleX = (gridEndPoint.x - gridStartPoint.x) / (maxX - minX);
        local scaleY = (gridEndPoint.y - gridStartPoint.x) / (maxY - minY);
        drawReport = string.format("%sscaleX:%f scaleY:%f\n", drawReport, scaleX, scaleY)

        for _, group in pairs(self.groups) do
            SetColor(group.color)
            for _, loc in pairs(group.points) do
                if loc.x and loc.y then
                    local pointX = self.x + (loc.x - minX) * scaleX
                    local pointY = self.y + (loc.y - minY) * scaleY
                    drawReport = string.format("%sNew point at (X:%f Y:%f) X:%f Y:%f\n", drawReport, loc.x, loc.y, pointX, pointY)
                    love.graphics.circle("fill", pointX, pointY, 5)
                end
            end
        end
    end
    -- love.graphics.print(drawReport, self.x or 100, self.y or 0)
end

function CMapView:press(x, y)
end

function CMapView:release(x, y)
end

