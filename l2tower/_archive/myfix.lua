function OnCreate()
	--Event called after plugin is loaded, you should setup here any default vars,
	--and register to any commands or [/b]other things.
	--this:RegisterCommand("watch", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME)
	Attackers = {}
	AttackersC = 0
	LastSkillUseTime = 0
end;

function ResetTarget()
	ShowToClient("Auto Fix"," Try to fix target");

	ShowToClient("Auto Fix"," Try to fix target END");
end

function OnAttack(attacker, target)
	--ShowToClient("Auto Fix", "OnAttack")
	--Event called when some player/npc attacked other.
	--ShowToClient("Auto Fix"," OnAttack ")
	if attacker and target and target:IsMe() and attacker:IsMonster() and not Attackers[attacker:GetId()] then
		Attackers[attacker:GetId()] = attacker:GetId();
		AttackersC = AttackersC + 1;
		--ShowToClient("Auto Fix"," Attacker! we have "..AttackersC.. " of them");
		if not Attackers[GetTarget():GetId()] and (LastSkillUseTime > GetTime() +2*1000) then
			ShowToClient("Auto Fix"," Try to fix target");
			GetTarget():SetBlock(true);
			--CancelTargets();
		end
	end
end;

function OnDie(user, spoiled)
	--ShowToClient("Auto Fix", "OnDie")
	--Event called when some npc/player/user die.
	if user and user:IsMonster() and Attackers[user:GetId()] then
		--ShowToClient("Auto Fix", "in if")
		Attackers[user:GetId()] = nil
		AttackersC = AttackersC - 1
		if AttackersC == 0 then
			--ShowToClient("Auto Fix"," We have defeeted all mobs");
		end
	end
end;

function OnMagicSkillUse(user, target, skillId, skillLvl, skillHitTime, skillReuseTime)
	--ShowToClient("Auto Fix", "OnMagicSkillUse")
	--Event called when some npc/player/user start cast magic skill on someone other. hit time and reuse time is in miliseconds
	if user and user:GetId() then
		LastSkillUseTime = GetTime()
	end
end;

function OnChatSystemMessage(id, msg)
	if (id == 181) or id == 748 then  --cannot see target
		if (GetMe():GetTarget() ~= 0) then 
			ShowToClient("Auto Fix"," Cannot See Target");
			GetTarget():SetBlock(true);
			--ShowToClient("Auto Fix","C")
			--CancelTargets();
			--ShowToClient("Auto Fix"," Cannot See Target end");
		end;
	end;
end;
 
 