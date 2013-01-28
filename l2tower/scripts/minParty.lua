USER_TO_INVITE = "bOObs" -- Broadcast
TRIGGER_INTEVAL = 9/2 * 60
BLOCK_TRIGGER_TIME = 3 * 60-- def: 3min. When this time elapsed script will stop working

OpdateOnUTC = os.time();
repeat
    if not IsPaused() then
		if OpdateOnUTC < os.time() then -- and OpdateOnUTC < os.time() + BLOCK_TRIGGER_TIME
			OpdateOnUTC = os.time() + TRIGGER_INTEVAL;
			Command("/invite " .. USER_TO_INVITE)
		end
    end
    Sleep(5000)
until false