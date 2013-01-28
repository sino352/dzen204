LongParameter = "1234567890112345678902123456789031234567890412345678905123456789061234567890712345678908123456789091234567891012345678901123456789021234567890312345678904123456789051234567890612345678907123456789081234567890912345678910"
JSONPar = [[{"prop":{"tprop":"val","tprop2":"val2"}}]]
EXE_PATH = "\"H:\\test.exe %s\"";

function RunCommand(cmd)
	cmd = EXE_PATH:format(cmd)
	--os.execute(cmd);
end

-[[
function Serialize(t)
	local res = {}
	local function iner(outRes, key, val)
		if key == nil or val == nil then
			return table.concat(outRes, "");
		end
		table.insert(outRes, "|"..key.."|:")
		if type(val) == "table" then
			table.insert(outRes,"{"..iner(outRes,next(val).."}"))
		else
			table.insert(outRes,
		end
	end
end
]]

function OnCreate()
	--Event called after plugin is loaded, you should setup here any default vars,
	--and register to any commands or [/b]other things.
	--this:RegisterCommand("run", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
end;
 
function OnCommand_run(vCommandChatType, vNick, vCommandParam)
	RunCommand(JSONPar)
end

function OnDestroy()
	--Event called before plugin gets destroy, make sure you kill any threads what you created.
end;
 
function OnTick()
	--Event called very 100ms, you can use it to check anything, don't put lot of code here.
	--Event is called always, some data maybe unavaible when no user is logged in.
	--Also calling some functions can make game crash (or force you to diconnect).
end;
 
function OnLTick()
	--Event called very 100ms, you can use it to check anything, don't put lot of code here.
	--This event is called only if user is loged in.
end;
 
function OnTick500ms()
	--Event called very 500ms, you can use it to check anything, don't put lot of code here.
	--Event is called always, some data maybe unavaible when no user is logged in.
	--Also calling some functions can make game crash (or force you to diconnect).
end;
 
function OnLTick500ms()
	--Event called very 500ms, you can use it to check anything, don't put lot of code here.
	--This event is called only if user is loged in.
end;
 
function OnTick1s()
	--Event called very 1s, you can use it to check anything, don't put lot of code here.
	--Event is called always, some data maybe unavaible when no user is logged in.
	--Also calling some functions can make game crash (or force you to diconnect).

end;
 
function OnLTick1s()
	--Event called very 1s, you can use it to check anything, don't put lot of code here.
	--This event is called only if user is loged in.
	
end;
 
function OnLogin(username)
	--Event called after user login	
	
end;
 
function OnLogout()
	--Event called before user logout
end;
 
function OnAttackCanceled(user)
	--Event called when some player/npc cancel his attack.
end;
 
function OnAttack(user, target)
	--Event called when some player/npc attack other.
end;
 
function OnAttacked(user, target)
	--Event called when some player/npc attacked other.
end;
 
function OnAutoAttackStart(user, target)
	--Event called when some player/npc activate auto attack.
	--os.execute(EXE_PATH);
			if (C == nil) then
		C = 1
	end
	if C == 10 then
		
		C = nil;
	end
	C = C + 1
end;
 
function OnUserInfo(user)
	--Event called when we get some info about ourself
	
end;
 
function OnCharInfo(player)
	--Event called when we get some info about someother players (he spawn)

end;
 
function OnNpcInfo(npc)
	--Event called when we get some info about some npc/monster (he spawn)
end;
 
function OnDeleteUser(user)
	--Event called when some npc/player/user dissaper from map.
end;
 
function OnDie(user, spoiled)
	--Event called when some npc/player/user die.
end;
 
function OnRevive(user)
	--Event called when some npc/player/user revive.
end;
 
function OnMagicSkillCanceled(user)
	--Event called when some npc/player/user cancel magic skill.
end;
 
function OnMagicSkillLaunched(user, target, skillId, skillLvl)
	--Event called when some npc/player/user casted magic skill on someone other. 
	--For AOE skills this event will be called for every target.
end;
 
function OnMagicSkillUse(user, target, skillId, skillLvl, skillHitTime, skillReuseTime)
	--Event called when some npc/player/user start cast magic skill on someone other. hit time and reuse time is in miliseconds
end;
 
function OnTargetSelected(user, target)
	--Event called when some npc/player/user select target.
end;
 
function OnMyTargetSelected(target)
	--Event called when our target got change.
	--os.execute(EXE_PATH);
end;
 
function OnTargetUnselected(user)
	--Event called when some npc/player/we cancel target.
end;
 
function OnChangeMoveType(user)
	--Event called when some npc/player/we change move type from walk to run for example.
end;
 
function OnChangeWaitType(user)
	--Event called when some npc/player/we change wait type from sit to stand for example.
end;
 
function OnChatUserMessage(chatType, nick, msg)
	--Event called someone say something on chat. chatType is a EChatType enum.
end;
 
function OnChatSystemMessage(id, msg)
	--Event called some system message show up on chat (id - integer, msg - string).
end;

function OnDropItem(user, item)
    --Event called when item get dropped, second argument is ItemData object.
end;

function OnPickupItem(user, item)
    --Event called when someone pickup item, second argument is ItemData object.
end;

function OnSpawnItem(item)
    --Event called when item spawns, first argument is ItemData object.
end;

function OnDeleteItem(item)
    --Event called when item gots deleted - because we went out o range for example, first argument is ItemData object.
end;

function OnMoveToLocation(user, oldLocation, newLocation)
   -- user = User, oldLocation = FVector, newLocation = FVector
   --Event called when user move somwhere (movetolocation, flytolocation, jumptolocation)
end;

function OnTeleportToLocation(user, oldLocation, newLocation)
   -- user = User, oldLocation = FVector, newLocation = FVector
   --Event called when user teleports
end;

function OnStopMove(user, location)
   -- user = User, location = FVector
   --Event called when user stop moving.
end;