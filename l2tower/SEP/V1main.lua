
RAW_OUT = "";

function log(lvl, msg)
    local levels = {"[DEBUG]: ", "[INFO]: ", "[WRNING]: ", "[ERROR]: "}
    print(levels[lvl] or "[WTF]: ", msg)
    RAW_OUT = string.format("%s\n%s: %s", RAW_OUT, levels[lvl] or "[WTF]: ", msg)
end

function WriteFile(file, str)
    local f, err = io.open(file, "w+")
    f:write(str)
    f:flush()
    f:close()
end

function dofile(filename)
    local function innerDo()
        local f = assert(loadfile(filename))
        f()
    end
    return pcall(innerDo);
end

function ReadFileData()
    dofile("test.test")
    if USER_LOC then
        Dotter:addDot(USER_LOC)
        USER_LOC = nil
    end
    WriteFile("test.test", "READY")
end

function love.load()
    TickTime = { ["2sec"] = 0 }
    -- Dotter:addDot({X = 1200, Y = 1200})
    -- Dotter:addDot({X = 1400, Y = 1400})
    -- Dotter:addDot({X = 2200, Y = 2200})
end

function love.update()
    if TickTime["2sec"] + 2 < os.time() then
        TickTime["2sec"] = os.time()
        On10SecTick();
    end
end

function On10SecTick()
    ReadFileData()
end

function love.draw()

    -- local a = io.input(OUTPUT_FILE):read("*a")
    -- love.graphics.print(RAW_OUT, 0, 0)
    local drawReport = ""

    -- love.graphics.circle("fill", 300, 300, 10)
    local gridStartPoint = {X = 100, Y = 100}
    local gridEndPoint = {X = 600, Y = 600}

    local minX, maxX = 10000000000, -10000000000 -- this is some kind of restriction
    local minY, maxY = 10000000000, -10000000000
    for _, group in pairs(Dotter:getDotGroups()) do
        for _, loc in pairs(group) do
            minX = minX < loc.X and minX or loc.X
            maxX = maxX > loc.X and maxX or loc.X
            minY = minY < loc.Y and minY or loc.Y
            maxY = maxY > loc.Y and maxY or loc.Y
        end
    end
    drawReport = string.format("%sminX:%f minY:%f\nmaxX:%f maxY:%f\n", drawReport, minX, minY, maxX, maxY)

    local scaleX = (gridEndPoint.X - gridStartPoint.X) / (maxX - minX);
    local scaleY = (gridEndPoint.Y - gridStartPoint.X) / (maxY - minY);

    for _, group in pairs(Dotter:getDotGroups()) do
        for _, loc in pairs(group) do
            local pointX = (loc.X - minX) * scaleX
            local pointY = (loc.Y - minY) * scaleY
            drawReport = string.format("%sNew point at (X:%f Y:%f) X:%f Y:%f\n", drawReport, loc.X, loc.Y, pointX, pointY)
            love.graphics.circle("fill", pointX, pointY, 5)
        end
    end

    -- love.graphics.print(drawReport, 0, 0)
end

Dotter = {
    dotsGroups = {}
}
function Dotter:getDotGroups() return self.dotsGroups; end

function Dotter:addDot(loc, group)
    if loc and loc.X and loc.Y then
        group = group or "GENERAL"
        if not self.dotsGroups[group] then
            self.dotsGroups[group] = {}
        end
        table.insert(self.dotsGroups[group], loc)
        log(1, "Dots #" .. tostring(#self.dotsGroups[group]))
    else
        log(3, "Dotter:addDot(loc, group) -> wrong loc")
    end
end
