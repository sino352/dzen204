
CharSkills = {
	HeadBasher = {
		jumpSkill = 10015,
		massAttackSkills = {10013, 10014},
		singleAttackSkills = {10011, 10009, 10008, 10010},
	};
	Broadcast = {
		jumpSkill = 11508,
		massAttackSkills = {11513, 11514},
		singleAttackSkills = {11509, 11510, 11511}
	};
	pussy = {
		jumpSkill = 10267,
		massAttackSkills = {10288},
		singleAttackSkills = {10262, 10260, 10265}
	};
}



function dprint(msg)
	if BuffDebug then
		ShowToClient("DEBUG",msg);
	end
end

function CastSkill(id)
	skill = GetSkills():FindById(id)
	if skill and skill:CanBeUsed() then
		UseSkillRaw(id,false,false)
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
	dprint("Nuke(target)")
	if (target:GetDistance() < 100 
		and (MobsCount(150) > 1 
				and CastOneByList(MassAttackSkills)
				or CastOneByList(SingleAttackSkills)
		)
		or (target:GetDistance() < 600 and target:GetDistance() > 200
			and CastSkill(JumpSkill)
		)
	)
	then
		return;
	end
end

function Init()
	local charCfg = CharSkills[GetMe():GetName()];
	MassAttackSkills = charCfg.massAttackSkills
	JumpSkill = charCfg.jumpSkill
	SingleAttackSkills = charCfg.singleAttackSkills
end

Init()

repeat
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
    Sleep(200)
until false