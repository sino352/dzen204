-- Command("/useshoutcut 1 10")
-- ProcessCommand("/useshoutcut 1 10")
-- local f, err = io.open(GetDir() .. "\\test.test")
-- this:Log(tostring(err))
-- --ShowToClient("DEBUG",tostring(msg), err);
-- if f then
-- 	-- this:Log(tostring(f:read("a")))
-- 	f:write("asd")

-- 	f:close()
-- else
-- 	this:Log("No file")
-- end

-- io.output (GetDir() .. "\\test.test"):write("ssssss", "test", "test")
-- this:Log(tostring(io.input (GetDir() .. "\\test.test"):read("*a")))
-- local t = dofile(GetDir() .. "\\test.test")
-- this:Log(tostring(t))
-- this:Log(tostring(GLOB))


--io.output ("test.test"):write("ssssss")
--local socket = require("socket")

--local c = socket.connect("192.168.1.100", "8081")
-- ShowToClient("SYS",GetMe():GetName())

local outputFile = GetDir() .. "\\test.test"

repeat
	-- dofile(OUTPUT_FILE)
	local outputStatus = io.input(outputFile):read("*a")
	if outputStatus == "READY" then

		local userLoc = GetMe():GetLocation()
		local strToWrite = string.format("USER_LOC = {X = %s, Y = %s, Z = %s}",
			tostring(userLoc.X), tostring(userLoc.Y), tostring(userLoc.Z));

		-- io.output (GetDir() .. "\\test.test"):write(tostring(outCnt))
		local f, err = io.open(outputFile, "w+")
		f:write(strToWrite)
		f:flush()
		f:close()
	end

	Sleep(1000);
until false