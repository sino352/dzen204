STOPPED = true -- setting this to false will block all actions. Accessable by comand /stop

AUTOBUFF = false -- setting this to true will cause script to watch all bufs. Accessable by command /watchbuf

OOP_MODE = false -- When true bot will wait for party to give buff and will leave party after the buff

ENABLED = true -- internal setting that will disable plugin for other clasess the ISS

CLASS_TYPES = {
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
	[144] = "Wizard",	-- Iss Enchanter
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

BUFF_PERSONAL = {
	Knight = 11523, -- Гармония Стража
	Warrior = 11524, -- Гармония Берсерка
	Wizard = 11525, -- Гармония Мага
};
BUFF_20MIN = {
	11517, -- Поэма Рога
	11522, -- Поэма Лютни
	11521, -- Поэма Арфы
	11520, -- Поэма Гитары
	11519, -- Поэма Органа
	11518, -- Поэма Барабана
	11567, -- Сопротивление Психическим Атакам
	11565, -- Сопротивление Стихиям
	11566, -- Сопротивление Божественному
};
BUFF_5MIN = {
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
		skillList = BUFF_20MIN;
	},
	{
		lastUsed = 0,
		useInterval = 5 * 60, -- in min
		saveInterval = 1 * 60,
		skillList = BUFF_5MIN;
	},
};

function dprint(msg)
		ShowToClient("INFO",msg);
end
	   
function CastSkill(id, canWait)
	skill = GetSkills():FindById(id)
	if skill and skill:GetReuse() > 0 then DelayCallFnk(skill:GetReuse() + 100, CastSkill, id, canWait) end
	if skill and skill:CanBeUsed() then
		UseSkillRaw(id,false,false)
		return true
	end
	return false
end


function CastSkillsByList(list, finishCallback)
	if CastIterator then dprint("CastSkillsByList() - > CastIterator conflict") return; end

	local offset = 0;
	local skillToCast = nil;
	CastIterator = function(castedSkill)
		if skillToCast == castedSkill then -- should we cast next skill ?
			offset = offset + 1;
			skillToCast = list[offset] -- select next skill
			if skillToCast then
				CastSkill(skillToCast) -- try to cast
			else -- exit iterator
				CastIterator = nil;
				if finishCallback then
					finishCallback();
				end
			end
		end
	end
	CastIterator();
end

function CastPersonalBuffs(args, finishCallback) -- args is fix for "unpack{}"
	local skillToCast;
	local party = GetPartyList()
	local partyIterator = party.list

	local function Finish(message)
		if message then this:Log(message) end
		CastIterator = nil
		if finishCallback then finishCallback() end
	end

	function CastIterator(castedSkill, user)
		if skillToCast == castedSkill then
			local userToBuff;
			if user then -- user here is to buff myself
				userToBuff = user
			elseif not user and party:GetCount() > 0 then -- select party member 
				userToBuff = partyIterator()
			end 
			if not userToBuff then -- we have just gave buff to averybody
				return Finish()
			end
			local skillName = CLASS_TYPES[userToBuff:GetClass()]
			if not skillName then return Finish("Failed to find skill for player") end

			ClearTargets();
			TargetRaw(userToBuff:GetId());

			skillToCast = BUFF_PERSONAL[skillName];
			DelayCallFnk(100, CastSkill, skillToCast, true)
		end
	end
	
	CastIterator(nil, GetMe())
end

function IsInParty()
	return (GetPartyMaster() ~= nil);
end

function IssBuff()

	if not OOP_MODE or (OOP_MODE and IsInParty()) then
		local actionsToProcess = {};
		for _, buffCfg in pairs(BuffsConfig) do
			local timeSinceUse = os.time() - buffCfg.lastUsed;
			if ( -- force use
				(timeSinceUse > buffCfg.useInterval - 10) -- -10 is just a delay before all bufs disappear 
				-- and (not buffCfg.isPersonal) -- just don't do personal buffs under mobs attack
			) or ( -- use when we are safe
				(timeSinceUse > (buffCfg.useInterval - buffCfg.saveInterval)) 
				-- and (MobsCount(150) == 0)
			) then
	-- TODO: invite more
				-- if (InviteMode and not IsInParty()) then
				-- 	Command("/invite "..InviteName)
				-- 	for i=1, (5000/500) do -- wait for party for 4s, check every 500ms
				-- 		if IsInParty() then break; end
				-- 		Sleep(500)
				-- 	end
				-- 	if not IsInParty() then eprint("Fail to get party") return; end
				-- end
				buffCfg.lastUsed = os.time()
				if buffCfg.isPersonal then--and (MobsCount(150) == 0) then
					table.insert(actionsToProcess, {fnk = CastPersonalBuffs, args = {}})
					
				else
					table.insert(actionsToProcess, {fnk = CastSkillsByList, args = {buffCfg.skillList}})

				end
			end
		end

		if #actionsToProcess > 0 then
			if OOP_MODE then
				table.insert(actionsToProcess, {fnk = DelayCallFnk, isLast = true, args = {2000, Command, "/leave"}})
				-- table.insert(actionsToProcess, {fnk = Command, args = {"/leave"}})
			end
			RunCommandsByList(actionsToProcess)
		end
	end
end

--- Call function with delay +-500ms
-- @prop delay [number] delay before call
-- @prop fnk [function] function to be called
-- @prop ... [any] stack of the properties
function DelayCallFnk(delay, fnk, ...)
	if DelayCallTask then this:Log("DelayCallFnk() - > DelayCallTask conflict") end
	this:Log("DelayCallTask init ".. tostring(delay))
	local args = {...}
	local shouldTriggerOn = GetTime() + delay;
	DelayCallTask = function()
		this:Log("DelayCallTask chack")
		if shouldTriggerOn < GetTime() then

			DelayCallTask = nil;
			fnk(unpack(args))
		end
	end
end

-- commandsList = { -- numerated table with commands that should be processed one by one
-- 	{
-- 		fnk = CastSkillsByList, -- function should accept link to callback function as last parameter
-- 		args = {...} -- numerated table with arguments. It will be unpacked
-- 	},
-- }
function RunCommandsByList(commandsList)
	local offset = 0;
	local function iterator()
		offset = offset + 1
		this:Log("Running command")
		local cmd = commandsList[offset];
		if cmd then
			if cmd.isLast then
				cmd.fnk(unpack(cmd.args))
			else
				cmd.fnk(unpack(cmd.args), iterator)
			end
		end
	end
	iterator()
end

function ResetWatchedBufs()
	for k, v in pairs(BuffsConfig) do
		v.lastUsed = 0;
	end
end
-----------------------------------------------------------------------------------------------------
-------------------------------------	EVENTS		-----------------------------------------------
-----------------------------------------------------------------------------------------------------
function OnCreate()
	-- this:RegisterCommand("bufs", CommandChatType.CHAT_ALLY, CommandAccessLevel.PARTY);
	this:RegisterCommand("bufs", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("stop", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("watchbuf", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("status", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	STOPPED = true
	AUTOBUFF = false
	ResetWatchedBufs()
end

function OnLogin(username)
	--Event called after user login	
	ENABLED = (GetMe() and GetMe():GetClass() == 144)
	STOPPED = true
	AUTOBUFF = false;
	ResetWatchedBufs()
end;

function OnCommand_status(vCommandChatType, vNick, vCommandParam)
	dprint("IssByff: plugin is now " .. (ENABLED and "enabled" or "disabled"))
	dprint("IssByff: STOP is now " .. (STOPPED and "enabled" or "disabled"))
	dprint("IssByff: watching is now " .. (AUTOBUFF and "enabled" or "disabled"))
	
	-- local actions = {
	-- 	{fnk = DelayCallFnk, isLast = true, args = {2000, Command, "/leave"}}
	-- }
	-- RunCommandsByList(actions)
	-- DelayCallFnk(2000, Command, "/leave")
end

function OnCommand_bufs(vCommandChatType, vNick, vCommandParam)
	if STOPPED then return end
	local buffSeq = {
		{fnk = CastPersonalBuffs, args = {}},
		{fnk = CastSkillsByList, args = {BUFF_20MIN}},
		{fnk = CastSkillsByList, args = {BUFF_5MIN}},
	}
	RunCommandsByList(buffSeq)
end

function OnCommand_stop(vCommandChatType, vNick, vCommandParam)
	ENABLED = (GetMe() and GetMe():GetClass() == 144)
	if not ENABLED then return end
	STOPPED = not STOPPED
	local stateString = STOPPED and "enabled" or "disabled"
	dprint("IssByff: plugin is now " .. stateString)
end

function OnCommand_watchbuf(vCommandChatType, vNick, vCommandParam)
	if not ENABLED then return end
	ResetWatchedBufs()
	AUTOBUFF = not AUTOBUFF
	local stateString = AUTOBUFF and "enabled" or "disabled"
	dprint("IssByff: watching buffs is now " .. stateString)
end

function OnMagicSkillLaunched(user, target, skillId, skillLvl)
	--Event called when some npc/player/user casted magic skill on someone other. 
	--For AOE skills this event will be called for every target.
	if STOPPED then return end
	if CastIterator and user:GetId() == GetMe():GetId() then
		CastIterator(skillId); -- this is needed in order to proceed with procedures like "CastSkillsByList"
	end
end;

function OnLTick500ms()
	--Event called very 500ms, you can use it to check anything, don't put lot of code here.
	--This event is called only if user is loged in.
	if STOPPED then return end
	if DelayCallTask then
		DelayCallTask()
	end
end;

function OnLTick1s()
	--Event called very 1s, you can use it to check anything, don't put lot of code here.
	--This event is called only if user is loged in.
	if STOPPED then return end
	if AUTOBUFF then
		IssBuff()
	end
end;

--[[
function OnCreate()
	--Event called after plugin is loaded, you should setup here any default vars,
	--and register to any commands or [/b]other things.
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
 
function OnLTick1s()
	--Event called very 1s, you can use it to check anything, don't put lot of code here.
	--This event is called only if user is loged in.
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