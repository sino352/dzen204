BuffDebug = false
IssOOPmode = true; -- also means autoinvite Iss
IssName = "Broadcast";

CharSkills = {
	[139] = { -- Sigel Knight
		jumpSkill = 10015,
		massAttackSkills = {10013, 10014},
		singleAttackSkills = {10011, 10009, 10008, 10010},
	};
	[144] = {	-- ISS
		jumpSkill = 11508,
		massAttackSkills = {11513, 11514},
		singleAttackSkills = {11509, 11510, 11511}
		baff30min = {11517, 11521, 11520, 11519, 11518, 11522, 11567, 11565, 11566};
		baff5min = {11530, 11529, 11532};
	};
	[140] = {	-- Tyrr Warrior
		jumpSkill = 10267,
		massAttackSkills = {10288},
		singleAttackSkills = {10262, 10260, 10265}
	};
}

-- for iss buff
ClassesType = {
	[17] = "Wizard",	-- Prophet
	[21] = "Warrior",	-- Swordsinger
	[34] = "Warrior",	-- Bladedancer
	[49] = "Wizard",	-- Orc Mystic
	[50] = "Wizard",	-- Orc Shaman
	[51] = "Wizard",	-- Overlord
	[52] = "Wizard",	-- Warcryer
	[98] = "Wizard",	-- Hierophant
	[100] = "Warrior",	-- Sword Muse
	[107] = "Warrior",	-- Spectral Dancer
	[115] = "Wizard",	-- Dominator
	[116] = "Wizard",	-- Doomcryer
	[144] = "Warrior",	-- Iss Enchanter
	[15] = "Wizard",	-- Cleric
	[16] = "Wizard",	-- Bishop
	[29] = "Wizard",	-- Elven Oracle
	[30] = "Wizard",	-- Elven Elder
	[97] = "Wizard",	-- Cardinal
	[42] = "Wizard",	-- Shillien Oracle
	[43] = "Wizard",	-- Shillien Elder
	[105] = "Wizard",	-- Eva's Saint
	[112] = "Wizard",	-- Shillien Saint
	[146] = "Wizard",	-- Aeore Healer
	[10] = "Wizard",	-- Human Mystic
	[11] = "Wizard",	-- Human Wizard
	[12] = "Wizard",	-- Sorceror
	[13] = "Wizard",	-- Necromancer
	[25] = "Wizard",	-- Elven Mystic
	[26] = "Wizard",	-- Elven Wizard
	[27] = "Wizard",	-- Spellsinger
	[38] = "Wizard",	-- Dark Mystic
	[39] = "Wizard",	-- Dark Wizard
	[40] = "Wizard",	-- Spellhowler
	[94] = "Wizard",	-- Archmage
	[95] = "Wizard",	-- Soultaker
	[103] = "Wizard",	-- Mystic Muse
	[110] = "Wizard",	-- Storm Screamer
	[143] = "Wizard",	-- Feoh Wizard
	[14] = "Warrior",	-- Warlock
	[28] = "Warrior",	-- Elemental Summoner
	[41] = "Warrior",	-- Phantom Summoner
	[96] = "Warrior",	-- Arcana Lord
	[104] = "Warrior",	-- Elemental Master
	[111] = "Warrior",	-- Spectral Master
	[145] = "Warrior",	-- Wynn Summoner
	[0] = "Warrior",	-- Human Fighter
	[1] = "Warrior",	-- Warrior
	[2] = "Warrior",	-- Gladiator
	[3] = "Warrior",	-- Warlord
	[18] = "Warrior",	-- Elven Fighter
	[19] = "Warrior",	-- Elven Knight
	[31] = "Warrior",	-- Dark Fighter
	[44] = "Warrior",	-- Orc Fighter
	[45] = "Warrior",	-- Orc Raider
	[46] = "Warrior",	-- Destroyer
	[47] = "Warrior",	-- Monk
	[48] = "Warrior",	-- Tyrant
	[53] = "Warrior",	-- Dwarven Fighter
	[56] = "Warrior",	-- Artisan
	[57] = "Warrior",	-- Warsmith
	[88] = "Warrior",	-- Duelist
	[89] = "Warrior",	-- Dreadnought
	[113] = "Warrior",	-- Titan
	[114] = "Warrior",	-- Grand Khavatari
	[118] = "Warrior",	-- Maestro
	[123] = "Warrior",	-- Male Soldier
	[124] = "Warrior",	-- Female Soldier
	[125] = "Warrior",	-- Dragoon
	[126] = "Warrior",	-- Warder
	[127] = "Warrior",	-- Berserker
	[128] = "Warrior",	-- Male Soul Breaker
	[129] = "Warrior",	-- Female Soul Breaker
	[131] = "Warrior",	-- Doombringer
	[132] = "Warrior",	-- Male Soul Hound
	[133] = "Warrior",	-- Female Soul Hound
	[135] = "Warrior",	-- Inspector
	[136] = "Warrior",	-- Judicator
	[140] = "Warrior",	-- Tyrr Warrior
	[7] = "Warrior",	-- Rogue
	[8] = "Warrior",	-- Treasure Hunter
	[22] = "Warrior",	-- Elven Scout
	[23] = "Warrior",	-- Plainswalker
	[35] = "Warrior",	-- Assassin
	[36] = "Warrior",	-- Abyss Walker
	[54] = "Warrior",	-- Scavenger
	[55] = "Warrior",	-- Bounty Hunter
	[93] = "Warrior",	-- Adventurer
	[101] = "Warrior",	-- Wind Rider
	[108] = "Warrior",	-- Ghost Hunter
	[117] = "Warrior",	-- Fortune Seeker
	[141] = "Warrior",	-- Othell Rogue
	[9] = "Warrior",	-- Hawkeye
	[24] = "Warrior",	-- Silver Ranger
	[37] = "Warrior",	-- Phantom Ranger
	[92] = "Warrior",	-- Sagittarius
	[102] = "Warrior",	-- Moonlight Sentinel
	[109] = "Warrior",	-- Ghost Sentinel
	[130] = "Warrior",	-- Arbalester
	[134] = "Warrior",	-- Trickster
	[142] = "Warrior",	-- Yul Archer
	[4] = "Warrior",	-- Human Knight
	[5] = "Knight",	-- Paladin
	[6] = "Knight",	-- Dark Avenger
	[20] = "Knight",	-- Temple Knight
	[32] = "Warrior",	-- Palus Knight
	[33] = "Knight",	-- Shillien Knight
	[90] = "Knight",	-- Phoenix Knight
	[91] = "Knight",	-- Hell Knight
	[99] = "Knight",	-- Eva's Templar
	[106] = "Knight",	-- Shillien Templar
	[139] = "Knight",	-- Sigel Knight
}
-- for iss buff
IssBaffPersonal = {
	Knight = 11524, -- Гармония Берсерка
	Warrior = 11524, -- Гармония Берсерка
	Wizard = 11525, -- Гармония Мага
};

BuffsConfig = {
	["personal"] = {	-- personal buffs are processed by separate function
		-- this is implemented only for ISS
		lastUsed = 0,
		useInterval = 30 * 60,
		saveInterval = 2 * 60,
		isPersonal = true,
	},
	["30min"] = {
		lastUsed = 0,
		useInterval = 30 * 60,
		saveInterval = 2 * 60,
		skillList = "baff30min";
		shouldInviteIss = true,
	},
	["20min"] = {
		lastUsed = 0,
		useInterval = 20 * 60,
		saveInterval = 1 * 60,
		skillList = "baff20min";
	},
	["5min"] = {
		lastUsed = 0,
		useInterval = 5 * 60, -- in min
		saveInterval = 1 * 60,
		skillList = "baff5min";
		shouldInviteIss = true,
	},
};

function dprint(msg)
	if BuffDebug then
		ShowToClient("DEBUG",msg);
	end
end

function ClearTarget()
	ClearTargets();
	CancelTarget(false)
end

function CastSkill(id)
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
	--ClearTarget()
	for _, id in pairs(list) do
		if CastSkill(id) then
			Sleep(900)
		else
			--ShowToClient("SYS", "Fail to cast " .. id)
		end
	end
	SetPause(false)
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

function ProcessPersonalBuffs()
	local function buffPersonalByName(user)
		local skillName = ClassesType[user:GetClass()]
		if not skillName then return false; end
		local skill = GetSkills():FindById(BaffPersonal[skillName])
		-- wait for skill ready
		if skill and skill:GetReuse() > 0 then Sleep(skill:GetReuse() + 100) end
		if skill and skill:CanBeUsed() then
			Target(user:GetName())
			UseSkillRaw(BaffPersonal[skillName],false,false)
			Sleep(700)
			ClearTarget()
			return true
		 end
	end
	
	buffPersonalByName(GetMe())
	
	local party = GetPartyList()
	if party:GetCount() > 0 then
		for user in party.list do
			buffPersonalByName(user)
		end
	end
end


function Buff()
	local wasProcessed = false;
	for _, buffCfg in pairs(BuffsConfig) do
		local timeSinceUse = os.time() - buffCfg.lastUsed;
		if ( -- force use
			(timeSinceUse > buffCfg.useInterval - 10) -- -10 is just a delay before all bufs disappear 
			and (not buffCfg.isPersonal) -- just don't do personal buffs under mobs attack
		) or ( -- use when we are safe
			(timeSinceUse > (buffCfg.useInterval - buffCfg.saveInterval)) 
			and (MobsCount(150) == 0)
		) then
			buffCfg.lastUsed = os.time()
			wasProcessed = true;
			if buffCfg.isPersonal and (MobsCount(150) == 0) then
				ProcessPersonalBuffs()
			elseif buffCfg.skillList then
				CastAllByList(buffCfg.skillList)
			end
		end
	end
	return wasProcessed
end

function Init()
	local userClass = GetMe():GetClass()
	local charCfg = CharSkills[userClass];
	if charCfg then
		MassAttackSkills = charCfg.massAttackSkills
		JumpSkill = charCfg.jumpSkill
		SingleAttackSkills = charCfg.singleAttackSkills
		BuffsConfig["30min"].skillList = charCfg.baff30min
		BuffsConfig["20min"].skillList = charCfg.baff20min
		BuffsConfig["5min"].skillList = charCfg.baff5min
		userIsIss = user:GetClass()
	end
end

Init()

repeat
    if not IsPaused()
	and ((OOPmode and GetPartyMaster() ~= nil) or not OOPmode)
	then
		if IssBuff() and OOPmode then
			LeaveParty();
		end
    end
    Sleep(5000)
until false