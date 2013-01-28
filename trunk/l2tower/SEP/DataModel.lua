DataModel = {
	dotsGroups = DB,
    eventListeners = {}
}

function DataModel:init()
    -- self:readDots()
end

function DataModel:addDot(loc, group)
    if loc and loc.x and loc.y then
        group = group or "GENERAL"
        if not self.dotsGroups[group] then
            self.dotsGroups[group] = {}
        end
        table.insert(self.dotsGroups[group], loc)
        --log(1, "Dots #" .. tostring(#self.dotsGroups[group]))
    --else
        --log(3, "Dotter:addDot(loc, group) -> wrong loc")
    end
end

function DataModel:getDots()
    return self.dotsGroups;
end

function DataModel:readDot()
	-- self:addDot({X = 100, Y = 100})
	-- self:addDot({X = 200, Y = 200})
	-- self:addDot({X = 200, Y = 250})
    dofile("test.test")
    if USER_LOC then
        log(1, "new dot")
        self:addDot(USER_LOC)
        USER_LOC = nil
    end
    WriteFile("test.test", "READY")
end


function DataModel:tickUpdate()
    self:readDot()
end


function DataModel:saveDots()
    local out = "OUT = {"
    for gk,gv in pairs(self.dotsGroups) do
        out = string.format("%s[\"%s\"] = {\n", out, gk)
        for dk,dv in ipairs(gv) do
            if dv.Z then
                out = string.format("%s{X = %f, Y = %f, Z = %f};\n", out, dv.x, dv.y, dv.z)
            else
                out = string.format("%s{X = %f, Y = %f};\n", out, dv.x, dv.y)
            end
        end
        out = out .. "};\n"
    end
    out = out .. "};\n"
    -- WriteFile("DB.txt", dump(self.dotsGroups))
    WriteFile("DB.txt", out)
end



-- Observer = {eventListeners = {}}
function DataModel:callListeners(fnkName)
    for _,listener in pairs(self.eventListeners) do
        if "function" == type(listener[fnkName]) then
            listener[fnkName](listener)
        end
    end
end
function DataModel:addListener(listener)
    self.eventListeners[listener] = listener;
end
function DataModel:removeListener(listener)
    self.eventListeners[listener] = nil;
end