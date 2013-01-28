BuffDebug = true
BuffCounter = 0

function RunBuffFile(f)
	Sleep(500); -- just in case
	local moveTo_huck = MoveTo; -- we don't want to move now
	MoveTo = function(...) dprint("Stay still my bot"); return true; end
	dofile (GetDir() .. "scripts\\" .. f .. ".lua");
	MoveTo = moveTo_huck;
end

function WaitForParty()
	repeat
		Sleep(1000);
	until (GetPartyMaster() ~= nil);
	dprint("We are in party now");
	return true;
end

function dprint(msg)
	if BuffDebug then
		ShowToClient("DEBUG",msg);
	end
end

repeat
	
	WaitForParty()
	
	BuffCounter = BuffCounter +1
	if BuffCounter == 1 then
		dprint("Buff all");
		RunBuffFile("fullbuff");
	elseif BuffCounter == 3 then
		BuffCounter=0
	end
	
	dprint("Buff viki");
	RunBuffFile("vikibuff")
		
	LeaveParty();
	Sleep(10000);	
until false;


