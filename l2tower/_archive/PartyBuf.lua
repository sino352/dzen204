ShowToClient("SYS","Script Para Buffar Estartado");
PPName = "NAMEISS"; --here write name of your PPname
DDName = "NAMECHAR"; --write name of char you want buff
 
SendInvItBufferInRange = 800;
----------------------------------------------------------------
WhoToInv = nil;
 
 
repeat
	if(GetUserByName(PPName) == nil)then
		ShowToClient("SYS","Buffer Muito Longe, Espere");
		repeat
			Sleep(1000);
		until (GetUserByName(PPName) ~= nil);
		ShowToClient("SYS","O Buffer esta Perto");
		WhoToInv = GetUserByName(PPName);
	elseif(GetUserByName(PPName) ~= nil)then
		WhoToInv = GetUserByName(PPName);
	end;
 
	if((GetMe():GotBuff(11529) == false) or --Prevailing 
		(GetMe():GotBuff(11530) == false) or --Daring
		(GetMe():GotBuff(11532) == false) or --Refreshing
		(GetMe():GotBuff(11524) == false) or --Warrior's Harmony 11525 Wizzard's
		(GetMe():GotBuff(11517) == false) or --Horn Melody
		(GetMe():GotBuff(11518) == false) or --Drum Melody
		(GetMe():GotBuff(11520) == false) or --Guitar Melody
		(GetMe():GotBuff(11521) == false) or --Harp Melody
		(GetMe():GotBuff(11522) == false) or --Lute Melody
		(GetMe():GotBuff(11519) == false) or --Pipe Organ Melody
		(GetMe():GotBuff(11565) == false) or --Elemental Protection
		(GetMe():GotBuff(11566) == false) or --Divine Protection
		(GetMe():GotBuff(11567) == false)) and --Mental Protection
	 
		(WhoToInv ~= nil) and 
		(WhoToInv:IsMyPartyMember() == false) and
		(GetMe():GetRangeTo(WhoToInv) < SendInvItBufferInRange)
	then
 
		ShowToClient("SYS", "Invitando " ..PPName .. " Para Buffar");
		Sleep(400);
		Command("/invite "..PPName);
	 
		repeat 
			Sleep(100);
		until ((GetMe():GotBuff(11529)) and --Prevailing 
		(GetMe():GotBuff(11530)) and --Daring
		(GetMe():GotBuff(11532)) and --Refreshing
		(GetMe():GotBuff(11524)) and --Warrior's Harony 11525 Wizzard's
		(GetMe():GotBuff(11517)) and --Horn Melody
		(GetMe():GotBuff(11518)) and --Drum Melody
		(GetMe():GotBuff(11520)) and --Guitar Melody
		(GetMe():GotBuff(11521)) and --Harp Melody
		(GetMe():GotBuff(11522)) and --Lute Melody
		(GetMe():GotBuff(11519)) and --Pipe Organ Melody
		(GetMe():GotBuff(11565)) and --Elemental Protection
		(GetMe():GotBuff(11566)) and --Divine Protection
		(GetMe():GotBuff(11567))) and --Mental Protection
		(WhoToInv:IsMyPartyMember() == true);
 
		ShowToClient("SYS", "Buffs Ok, Saindo da pt...");
		Sleep(2000);
		Command("/dismiss "..PPName); 
		Sleep(400);
	end;
	;
until false;
 
Buffs Mentor
 
ShowToClient("SYS","Script Iniciado");
PPName = "NAMEISS"; --here write name of your PPname
DDName = "NAMECHAR"; --write name of char you want buff
 
SendInvItBufferInRange = 800;
----------------------------------------------------------------
WhoToInv = nil;
 
 
repeat
if(GetUserByName(PPName) == nil)then
ShowToClient("SYS","Buffer Fora do Alcance");
repeat
Sleep(1000);
until (GetUserByName(PPName) ~= nil);
ShowToClient("SYS","Buffer Esta no Alcance");
WhoToInv = GetUserByName(PPName);
elseif(GetUserByName(PPName) ~= nil)then
WhoToInv = GetUserByName(PPName);
end;
 
if((GetMe():GotBuff(11529) == false) or --Prevailing
(GetMe():GotBuff(11530) == false) or --Daring 
(GetMe():GotBuff(11532) == false) or --Refreshing
(GetMe():GotBuff(11525) == false) or --Warrior's Harmony
(GetMe():GotBuff(11565) == false) or --Elemental Protection
(GetMe():GotBuff(11566) == false) or --Divine Protection
(GetMe():GotBuff(11567) == false)) and --Mental Protection
 
 
 
(WhoToInv ~= nil) and 
(WhoToInv:IsMyPartyMember() == false) and
(GetMe():GetRangeTo(WhoToInv) < SendInvItBufferInRange)then
 
ShowToClient("SYS", "Invitando " ..PPName .. " Para Buffar");
Sleep(800);
Command("/invite "..PPName);
 
repeat 
Sleep(500);
 
until ((GetMe():GotBuff(11529)) and --Prevailing 
(GetMe():GotBuff(11530)) and --Daring 
(GetMe():GotBuff(11532)) and --Refreshing
(GetMe():GotBuff(11525)) and --Warrior's Harmony
(GetMe():GotBuff(11565)) and --Elemental Protection
(GetMe():GotBuff(11566)) and --Divine Protection
(GetMe():GotBuff(11567))) and --Mental Protection
 
 
(WhoToInv:IsMyPartyMember() == true);
 
ShowToClient("SYS", "Buffs Ok, Saindo da pt...");
Sleep(4000);
Command("/dismiss "..PPName); 
Sleep(800);
end;
Sleep(1000);
until false;