-- MASTER_NAME = "HeadBasher"
-- local noMasterChecks = 0
repeat
	-- local haveMaster = false;
	-- local pl = GetPlayerList()
	-- if pl:GetCount() > 1 then
	-- 	for user in pl.list do
	-- 		if user:GetName() == MASTER_NAME then
	-- 			haveMaster = true
	-- 			noMasterChecks = 0
	-- 		end
	-- 	end
	-- end
	-- if not haveMaster then
	-- 	noMasterChecks = noMasterChecks + 1
	-- end
	-- if noMasterChecks > 5 then
	-- 	ShowToClient("DEBUG","No master. Shutting down");
	-- 	LogOut();
	-- end
	if GetMe() and GetMe():IsAlikeDeath() then
		Sleep(7000);
		LogOut();
		
	end
		Sleep(7000);
until false;