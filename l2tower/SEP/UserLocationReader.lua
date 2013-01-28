UserLocationReader = {
}

function UserLocationReader:loadView()
	self.layoutManager = LayoutManagers.horizontalBoxLayout;

	local leftPan = CView.new(nil, "leftPan")
	leftPan.layoutManager = LayoutManagers.verticalBoxLayout
	leftPan.width = 200
	self:addSubView(leftPan)

	local btn = CButton.new("myButton")
    -- btn.x = 0
    -- btn.y = 200
    btn.text = "SAVE"
    btn.id = "save"
    btn.listener = self
    leftPan:addSubView(btn)

    local btn = CButton.new("myButton2")
    -- btn.x = 0
    -- btn.y = 200
    btn.text = "ShowConsole";
    btn.id = "showConsole";
    btn.listener = self
    leftPan:addSubView(btn)

    self.map = CMapView.new("MapView")
    self.map.width = 500
    self:addSubView(self.map)

    local wps = DB:readDBTable("WPBorthRoom")
	self.map:setPointsList(wps)
	-- DB:saveDBTable("DB2", )

-- for i in io.popen("dir /B"):lines() do
-- -- if string.find(i,"%.txt$") then print(i) end
-- print(i)
-- end

    -- self:dotGroupsUpdated(dataModel:getDots().mapGeneral)
end


function UserLocationReader:dotGroupsUpdated(dg)
	-- self.mapView.dotsGroups = dg
	self.map:setPointsList(dg)
end

function UserLocationReader:buttonPressed(button)
	-- log(1, "buttonPressed")
end

function UserLocationReader:buttonReleased(button)
	-- log(1, "buttonReleased")
	if button.id == "save" then
		dataModel:saveDots()
	end
end

function UserLocationReader:buttonReleasedOutside(button)
	-- log(1, "buttonReleasedOutside")
end