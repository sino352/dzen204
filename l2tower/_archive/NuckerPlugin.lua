BuffDebug = true
CharSkills = {
	HeadBasher = {
		jumpSkill = 10015,
		massAttackSkills = {10013, 10014},
		singleAttackSkills = {10011, 10009, 10008, 10010},
	}
}

MassAttackSkills = CharSkills.HeadBasher.massAttackSkills
JumpSkill = CharSkills.HeadBasher.jumpSkill
SingleAttackSkills = CharSkills.HeadBasher.singleAttackSkills


function dprint(msg)
	if BuffDebug then
		ShowToClient("DEBUG",msg);
	end
end


CUseSkill = coroutine.create(
       function (skillId)
			dprint("Using skill " .. skillId)
           UseSkillRaw(id,false,false)
		   dprint("end")
       end);
 
  
  
function CastSkill(id)
	--dprint("Using skill " .. id)
	skill = GetSkills():FindById(id)
	if skill and skill:CanBeUsed() then
		--dprint("Using skill ".. skill.name)
		--UseSkillRaw(id,false,false)
		--Command("/useskill " .. skill.name)
		--UseSkill(id)
		coroutine.resume(CUseSkill, id);
		return true
	end
	return false
end

function CastOneByList(list)
	if "table" ~= type(list) then return dprint("CastOneByList(list) - >> list not a table") end
	for _, id in pairs(list) do
		if CastSkill(id) then
			return true;
		end
	end
end

function MobsCount(range)
	mobs = GetMonsterList()
	i=0
	for m in mobs.list do
		 if m:GetDistance() <= range and m:GetHpPercent() ~= 0 then
			 i = i+1
		 end
	end
	return i
end

function Nuke(target)  
	--dprint("Nuke(target)")
	if (target:GetDistance() < 100 
		and (MobsCount(150) > 1 
				and CastOneByList(MassAttackSkills)
				or CastOneByList(SingleAttackSkills)
		)
		--or (target:GetDistance() < 600 and target:GetDistance() > 200
		--	and CastSkill(JumpSkill)
		--)
	)
	then
		return;
	end
end

------------------ EVENTS -------------------------------
function OnCreate()
	AttackersMobs = {}
	AttackersMobsC = 0
	
end;
function OnLogin(username)
	if CharSkills[GetMe():GetName()] then
		local charCfg = CharSkills[GetMe():GetName()];
		MassAttackSkills = charCfg.massAttackSkills
		JumpSkill = charCfg.jumpSkill
		SingleAttackSkills = charCfg.singleAttackSkills
	end
end;

function OnLTick500ms()--OnLTick1s()
	if not IsPaused() then
		local target = GetTarget()
        if  GetMe():GetMp() > 200
		and not GetMe():IsBlocked(true)
		and target
		and target:IsEnemy()
		then
			Nuke(target);
		end
	end
end;

--[[
function OnCreate()
	--Event called after plugin is loaded, you should setup here any default vars,
	--and register to any commands or [/b]other things.
		Attackers = {}
	AttackersC = 0
end;
 
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
--]]