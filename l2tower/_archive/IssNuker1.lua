SelfHealHPP = 50
PetHealHPP = 70

PersonalConfig = {
	["Broadcast"] = "warrior",
	["Wsdl"] = "mage"
}

JumpSkill = 11508; -- Атакующий Стремительный Бросок

SingleAttackSkills = {
	11509, -- Атака Штурмом
	11510, -- Меч Тени
	11511, -- Смертельный Удар
};
MassAttackSkills = {
	11513, -- Пылающая Ярость
	11514, -- Сокрушительный Шторм
};
BaffPersonal = {
	warrior = 11524, -- Гармония Берсерка
	mage = 11525, -- Гармония Мага
};
Baff20min = {
	11517, -- Поэма Рога
	11521, -- Поэма Арфы
	11520, -- Поэма Гитары
	11519, -- Поэма Органа
	11518, -- Поэма Барабана
	11522, -- Поэма Лютни
	11567, -- Сопротивление Психическим Атакам
	11565, -- Сопротивление Стихиям
	11566, -- Сопротивление Божественному
};
Baff5min = {
	11530, -- Соната Движения
	11529, -- Соната Битвы
	11532, -- Соната Расслабления
};

BuffsConfig = {
	{	-- personal buffs are processed by separate function
		lastUsed = 0,
		useInterval = 30 * 60,
		saveInterval = 2 * 60,
		isPersonal = true,
		--skillList = Baff20min;
	},
	{
		lastUsed = 0,
		useInterval = 30 * 60,
		saveInterval = 2 * 60,
		skillList = Baff20min;
	},
	{
		lastUsed = 0,
		useInterval = 5 * 60, -- in min
		saveInterval = 1 * 60,
		skillList = Baff5min;
	},
};

function dprint(msg)
	if BuffDebug then
		ShowToClient("DEBUG",msg);
	end
end

function CastSkill(id)
	--if nil == tonumber(list) then return dprint("CastSkill(id) - >> id not a number") end
	skill = GetSkills():FindById(id)
	--dprint("CastSkill(id) ->> skill ".. (nil ~= skill).. " skill:CanBeUsed()" .. skill:CanBeUsed())
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

function CastAllByList(list)
	if "table" ~= type(list) then return dprint("CastAllByList(list) - >> list not a table") end
	SetPause(true)
	CancelTarget(false)
	for _, id in pairs(list) do
		if CastSkill(id) then
			Sleep(700)
		else
			--ShowToClient("SYS", "Fail to cast " .. id)
		end
	end
	SetPause(false)
end

function Heal(id,tar)
if id and tar then
     skill = GetSkills():FindById(id)
     if skill and skill:CanBeUsed() then
         old = GetTarget()
         Target(tar)
         UseSkillRaw(id,false,false)
         if old then
            Sleep(300)
            Target(old)
         end
         return true
     end
end
return false
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


function IssNuke(target)    
	if
		GetMe():GetMp() > 2000 and
		(
			target:GetDistance() < 100 and
			(
				MobsCount(150) > 1 and 
				(
					CastOneByList(MassAttackSkills)
				) or
				 CastOneByList(SingleAttackSkills) or 
				 CastOneByList(MassAttackSkills)
			)
			or (target:GetDistance() < 600 and target:GetDistance() > 200 and
			(
				CastSkill(JumpSkill)
			))
		 )
		 then return
	end
end

function ProcessPersonalBuffs()
--PersonalConfig BaffPersonal

	local function buffPersonalByName(name)
		local userConfig = PersonalConfig[name]
		if not userConfig then return false; end

		local skill = GetSkills():FindById(BaffPersonal[userConfig])
		 if skill and skill:CanBeUsed() then
			 --old = GetTarget()
			 Target(name)
			 UseSkillRaw(BaffPersonal[userConfig],false,false)
			 Sleep(700)
			 --if old then
			--	Target(old)
			--	Sleep(100)
			-- else
				--Sleep(100)
				ClearTargets();
				CancelTarget(false)
			 --end
			 return true
		 end
	end
	
	buffPersonalByName(GetMe():GetName())
	
	local party = GetPartyList()
	if party:GetCount() > 0 then
		for user in party.list do
			buffPersonalByName(user:GetName())
		end
	end
end

function IssSelfHeal()
me = GetMe()
if me and me:GetHpPercent() < SelfHealHPP then
     return Heal(HM,me:GetId())
end
return false
end

function IssPetHeal()
pets = GetPetList()
for p in pets.list do
     if p:GetHpPercent() < PetHealHPP and p:IsMyPet() then
         if p:GetHpPercent() == 0 then
             return false
         else
             return Heal(HM,p:GetId())
         end
     end
end
return false
end

function IssHeal()
return IssSelfHeal() or IssPetHeal()
end

function IssBuff()
	for _, buffCfg in pairs(BuffsConfig) do
		local timeSinceUse = os.time() - buffCfg.lastUsed;
		if ( -- force use
			(timeSinceUse > buffCfg.useInterval - 5) -- -5 is just a delay before all bufs disappear 
			and (not buffCfg.isPersonal) -- just don't do personal buffs under mobs attack
		) or ( -- use when we are safe
			(timeSinceUse > (buffCfg.useInterval - buffCfg.saveInterval)) 
			and (MobsCount(150) == 0)
		) then
			buffCfg.lastUsed = os.time()
			if buffCfg.isPersonal and (MobsCount(150) == 0) then
				ProcessPersonalBuffs()
			else
				CastAllByList(buffCfg.skillList)
			end
		end
	end
end

repeat
    if not IsPaused() then
		IssBuff()
	
        tar = GetTarget()
        if  GetMe():GetMp() > 100 and
            not GetMe():IsBlocked(true) and 
            --not IssHeal() and 
            tar and 
            tar:IsEnemy() then
            --tar:GetDistance() < 100 then
            IssNuke(tar)
        end
    end
    Sleep(200)
until false