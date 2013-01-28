CCore = {
	currentTickTime = 0,
}

function CCore:start()
	CView.newRootView()

	love.update = CCore.update;
	love.draw = CCore.draw;
	love.mousepressed = CCore.mousepressed
	love.mousereleased = CCore.mousereleased
end

function CCore:showConsole()
end


function CCore.update()
    if root then
        root:layout()
    end
    if CCore.currentTickTime + 1 < os.time() then
        CCore.currentTickTime = os.time()
        -- if dataModel then
        --     dataModel:tickUpdate()
        -- end
    end
end

function CCore.draw()
	if Config.debug then
    	SetColor("white")
    	love.graphics.print(RAW_OUT, 200, 0)
    end
    if root then
        root:draw()
    end
end

function CCore.mousepressed(x, y, button)
    -- log(1, "pres")
   if root then
        root:press(x, y)
    end
end

function CCore.mousereleased(x, y, button)
   if root then
        root:release(x, y)
    end
end

