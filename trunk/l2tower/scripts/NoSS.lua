-- name = "Blessed Spiritshot (A-Grade)";
SS_ID = 17754 -- ssr

COLISIONS = 0;


function CountMonstersInRange(range)
	local me = GetMe();
	local l = GetMonsterList();
	local c = 0;
 
	for user in l.list do 
		if ((user:IsAlikeDeath() == false) and (user:GetRangeTo(me)<range)) then
			c = c + 1;
		end;		
	end;
	return c;
end;
 


repeat
-- i=0;
	invList = GetInventory();
	for item in invList.list do
		if (item.displayId == SS_ID) then
			local i=item.ItemNum;
			if (i < 500) and (GetMe():GetTarget() ~= nil) and (CountMonstersInRange(300) == 0) then
				ShowToClient("DEBUG","We ran out of ss. Shutting down");
				SetPause(true)
				Sleep(2000);
				LogOut();
				-- if (GetZoneType() == 15) then
				-- 	UseItem(736); --SoE
				-- end;
				-- if (GetZoneType() == 12) then
				-- 	
				--     ShowToClient("Script", "Bye.");
				-- 	LogOut();
				-- end;
			end;
		end;
	end;
	-- local pl = GetPlayerList()
	-- if pl:GetCount() > 1 or COLISIONS > 0 then
	-- 	for user in pl.list do
	-- 		if user:GetName() ~= "bOObs" then
	-- 			if user:GetDistance() < 600 then
	-- 				ShowToClient("DEBUG","More collisions");
	-- 				COLISIONS = COLISIONS + 1
	-- 				if CountMonstersInRange(300) == 0 and (COLISIONS == 1 or COLISIONS == 6)then
	-- 					SetPause(true)
	-- 					Sleep(3000)
	-- 					SetPause(false)
	-- 				end
	-- 			elseif COLISIONS > 1 then
	-- 				ShowToClient("DEBUG","Less collisions");
	-- 				COLISIONS = COLISIONS - 1
	-- 			end
	-- 		end
	-- 	end
	-- 	if COLISIONS > 10 then
	-- 		ShowToClient("DEBUG","Somebody is watching us. Shutting down");
	-- 		LogOut();
	-- 	end
	-- end
	if GetMe() and GetMe():IsAlikeDeath() then
		Sleep(3000);
		LogOut();
	end
	Sleep(1000);
until false;
 

