CView = {
}
CView_mt = { __index = CView }

function CView.new(o, name)
    o = o or {};
    o.name = name
    o.subViews = {};
    o.subViewsCnt = 0;
    return setmetatable(o, CView_mt)
end

function CView.newRootView()
    if root then
        log(4, "Double root not supported")
    else
        root = CView.new(nil, "ROOT")
        root.x = 0
        root.y = 0
        root.width = love.graphics.getWidth( )
        root.height = love.graphics.getHeight( )
        return root;
    end
end

function CView:addSubView( view )
    self.subViews[view] = view;
    inc(self, "subViewsCnt")
    if (view.loadView) then
        view:loadView()
    end
end

function CView:layout()
    if self.layoutManager then
        self:layoutManager()
    else
        LayoutManagers.centralBoxLayout(self)
    end
end

function CView:draw()
    for _,view in pairs(self.subViews) do
        view:draw()
    end
end

function CView:press(x, y)
    if IsPointInRect(x, y, self.x, self.y, self.width, self.height) then
        for k,v in pairs(self.subViews) do
            --dump(v)
            if IsPointInRect(x, y, v.x, v.y, v.width, v.height) then
                v:press(x, y)
            -- else
            --     log(1, "miss")
            end
        end
    -- else
    --     log(1, "No subViews")
    end
end

function CView:release(x, y)
    for k,v in pairs(self.subViews) do
        v:release(x, y)
    end
end

function IsPointInRect(pX, pY, rectX, rectY, rectW, rectH)
    return (pX > rectX and pX < (rectX + rectW))
        and (pY > rectY and pY < (rectY + rectH))
end



function SetColor(color)
    if "black" == color then
        love.graphics.setColor( 0, 0, 0, 255 )
    elseif "white" == color then
        love.graphics.setColor( 255, 255, 255, 255 )
    end
end