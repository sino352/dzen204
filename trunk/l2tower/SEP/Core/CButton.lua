CButton = {
    
}
CButton_mt = { __index = CButton }

function CButton.new(name)
    local o = {}
    o.name = name
    o.width = 100
    o.height = 25
    return setmetatable(o, CButton_mt)
end

function CButton:draw()
    if self.x and self.y and self.width and self.height then
        SetColor("white")
        love.graphics.rectangle( self.pressed and "line" or "fill", self.x, self.y, self.width, self.height )
    end
    if self.text and self.x and self.y then
        SetColor( self.pressed and "white" or "black")
        love.graphics.print(self.text, self.x, self.y+3)
    end
    
end

function CButton:layout()
end

function CButton:press(x, y)
    self.pressed = true;
    if self.listener and self.listener.buttonPressed then
        self.listener.buttonPressed(self.listener, self)
    end
end

function CButton:release(x, y)
    if self.pressed then
        self.pressed = false;
        if self.listener then
            if self.listener.buttonReleased
                and IsPointInRect(x, y, self.x, self.y, self.width, self.height) then
                self.listener.buttonReleased(self.listener, self)
            elseif self.listener.buttonReleasedOutside then
                self.listener.buttonReleasedOutside(self.listener, self)
            end
        end
    end
end