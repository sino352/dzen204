TimeTillRequestChangeTarget = 1000*15 ; -- in mile seconds
TimeTillTryFixMovement = 1000*5 ; -- in mile seconds
 
TargetFixStatus = false;
unstuckingstatus = false;
mytargetid = 0;
MyTargetTimeStamp = GetTime();
unstuckmovementstamp = GetTime();
 
function OnCreate()
	this:RegisterCommand("targetfix", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
end;
 
function OnCommand_targetfix(vCommandChatType, vNick, vCommandParam)
	if (TargetFixStatus == false) then
		TargetFixStatus = true;
		ShowToClient("Auto Fix","Target Fix Is Activated.");
	else
		TargetFixStatus = false;
		ShowToClient("Auto Fix","Target Fix Is Is Deactivated.");	
	end;
end;
 
 
 
function OnChatSystemMessage(id, msg)
	if (id == 181) then  --cannot see target
		if (GetMe():GetTarget() ~= 0) then 
			ShowToClient("Auto Fix"," Cannot See Target");
			GetTarget():SetBlock(true);
			CancelTargets();
		end;
	end;
end;
 
function OnLTick1s()
	if not IsPaused() then
		if (TargetFixStatus == true) then
			if (mylastcordcheck ~= nil) then
				if (IsMoving() == false)  then
					if (GetTarget() ~= nil) and (GetMe():GetTarget() ~= 0)  then
						if (GetTarget():IsAlikeDeath() == false) and (GetTarget():IsMonster()) then
							if (mytargetid ~= GetTarget():GetId()) then
								mytargetid = GetTarget():GetId();
								MyTargetTimeStamp = GetTime();					
							end;					
						end;			
					end;
				else
					MyTargetTimeStamp = GetTime();
				end;
			end;	
			if (GetTarget() ~= nil) and (GetMe():GetTarget() ~= 0)  then
				if GetTarget():IsMonster()  and (GetTarget():IsAlikeDeath() == false) then
					if (MyTargetTimeStamp + TimeTillRequestChangeTarget < GetTime()) then
						ShowToClient("Auto Fix"," Char Didnt Move/Hit/Nuke for the last " .. tostring(TimeTillRequestChangeTarget/1000) .. " seconds, so Changing Target!");
						GetTarget():SetBlock(true);
						CancelTargets();		
					elseif (MyTargetTimeStamp + TimeTillTryFixMovement < GetTime()) and (unstuckingstatus == false) then
						SetPause(true);
						unstuckmovementstamp = GetTime();
						unstuckingstatus = true;
						MovePerpendicularlyFromUser(GetTarget(),200);
					end;
				end;
			end; 
		end;
		mylastcordcheck = GetMe():GetLocation();
		 
		if (GetTarget() == nil) or (GetMe():GetTarget() == 0) or (GetMe():IsBlocked(true))  then
			MyTargetTimeStamp = GetTime();
		end;
	end	 
	if (unstuckmovementstamp +2000 < GetTime()) and (unstuckingstatus == true) then
		unstuckingstatus = false;
		SetPause(false);
		ShowToClient("Auto Fix","char should be unstuck by now");
	end;
	
end;
 
 
function MovePerpendicularlyFromUser(user,dist) -- took me an hour to write this down!
	YQ = user:GetLocation().Y
	YP = GetMe():GetLocation().Y
	XQ = user:GetLocation().X
	XP = GetMe():GetLocation().X
	Mp = -1/((YQ-YP)/(XQ-XP))		
	if ((-2*XP-2*Mp*Mp*XP)*(-2*XP-2*Mp*Mp*XP) -4*(Mp*Mp+1)*(Mp*Mp*XP*XP + XP*XP-dist*dist) > 0) then
		undersqrt = (-2*XP-2*Mp*Mp*XP)*(-2*XP-2*Mp*Mp*XP) -4*(Mp*Mp+1)*(Mp*Mp*XP*XP + XP*XP-dist*dist);
	else
		undersqrt = (-2*XP-2*Mp*Mp*XP)*(-2*XP-2*Mp*Mp*XP) -4*(Mp*Mp+1)*(Mp*Mp*XP*XP + XP*XP+dist*dist);
	end;		
	XN = (-1*(-2*XP-2*Mp*Mp*XP)+math.sqrt(undersqrt))/(2*(Mp*Mp+1));
	YN = YP + Mp*(XN-XP)		
	MoveToNoWait(XN,YN,GetMe():GetLocation().Z);
end;
 
 
function IsMoving()
	if (GetDistanceVector(GetMe():GetLocation(),mylastcordcheck) > 100) then
		return true;
	end;
return false;
end;
 
function OnMagicSkillUse(user, target, skillId, skillvl, skillHitTime, skillReuse)
	if (user:IsMe()) then
		MyTargetTimeStamp = GetTime();
	end;
end;
 
function OnAttack(user, target)
	if (user:IsMe()) or (target:IsMe()) then
		MyTargetTimeStamp = GetTime();
	end;
end;

function OnDie(user)
	if user and user:IsMe() then
		TargetFixStatus = false
	end
end
 
function CancelTargets()
ClearTargets();
CancelTarget(true);
end;