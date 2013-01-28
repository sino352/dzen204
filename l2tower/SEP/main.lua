Config = {
    scriptFolder = "SEP/";
    debug = true;
}

Loader = {
    MODULES = {
        "Core/CClass.lua",
        "Core/CPoint.lua",
        "Core/CCore.lua",
        "Core/CView.lua",
        "Core/CButton.lua",
        "Core/CUtils.lua",
        "Core/CLayoutManagers.lua",
        "Core/CMapView.lua",
        "DB.txt", -- we need DB !!!
        "DB.lua",
        "DataModel.lua",
        "UserLocationReader.lua",
        

    }
}
function dofile(filename)
    local function innerDo()
        local f = assert(loadfile(filename))
        return f()
    end
    -- return pcall(innerDo);
    innerDo() --for dev
    return true
end
RAW_OUT = "Loading...\n"
function log(lvl, msg)
    local levels = {"[DEBUG]: ", "[INFO]: ", "[WRNING]: ", "[ERROR]: "}
    -- print(levels[lvl] or "[WTF]: ", msg)
    msg = "table" == type(msg) and tableToString(msg) or tostring(msg)
    msg = string.format("%s: %s", levels[lvl] or "[WTF]: ", msg)
    RAW_OUT = RAW_OUT .. "\n" .. msg;
    -- RAW_OUT = string.format("%s\n%s: %s", RAW_OUT, levels[lvl] or "[WTF]: ", msg)
end

function Loader:loadModules()
    for _, mod in pairs(self.MODULES) do
        if not dofile(Config.scriptFolder..mod) then
            log(4, "Unable to load module: "..tostring(mod))
            return false;
        end
    end
    return true
end

function Loader:startCore()
    CCore:start()
    self:startApp()
end

function Loader:startApp()
    dataModel = DataModel
    dataModel:init()

    local screen = CView.new(UserLocationReader, "SApp")
    root:addSubView(screen)
end


-- WARNING!!! events declared here will be owerriten by the core
function love.load()
    LoadStartTime = os.time()
    Loader:loadModules()
end

function love.update()
    if os.time() - LoadStartTime > 1 then
        Loader:startCore()
    end
end

function love.draw()
    love.graphics.print(RAW_OUT, 0, 0)
end









