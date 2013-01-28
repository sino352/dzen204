den_exp_mode = false
Eyes = { 18812, 18813, 18814 }

function OnCreate()
	this:RegisterCommand("den", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME)
end;

function OnChatSystemMessage(id, msg)
	if ( den_exp_mode == false ) then
		return
	end
	if ( id == 3023 or id == 3022 or id == 3024) then
		ShowToClient("DEN", "Eye is about to explode!")
		EnableEyes()
	end
end

function OnDie(user, spoiled)
	--Event called when some npc/player/user die.
	if ( den_exp_mode == false ) then
		return
	end
	local id = user:GetNpcId()
	for k, v in pairs(Eyes) do
		if ( v == id ) then
			if ( user:GetDistance() < 2000 ) then
				ShowToClient("DEN", "Eye just died!")
				DisableEyes()
			end
		end
	end
end

function DisableMob(mobType)	
	local monster = L2TConfig.GetConfig().pve:GetMonster(mobType)
	monster.Attackable = false
end

function EnableMob(mobType)
	local monster = L2TConfig.GetConfig().pve:GetMonster(mobType)
	monster.Attackable = true
	monster.Priority = L2TConfig.EPriority.PRIORITY_HIGHEST
end

function EnableEyes()
	for k, v in pairs(Eyes) do
		EnableMob(v)
	end
end

function DisableEyes()
	for k, v in pairs(Eyes) do
		DisableMob(v)
	end
end

function OnCommand_den(vCommandChatType, vNick, vCommandParam)
	if ( den_exp_mode == false ) then
		den_exp_mode = true
		ShowOnScreen(2, 2000, 0, "Den Of Evil auto Kasha Eye kill ON")
		ShowToClient("DEN", "Den Of Evil auto Kasha Eye kill ON")
		DisableEyes()
	else
		den_exp_mode = false
		ShowOnScreen(2, 2000, 0, "Den Of Evil auto Kasha Eye kill OFF");
		ShowToClient("DEN", "Den Of Evil auto Kasha Eye kill OFF");
	end
end;
