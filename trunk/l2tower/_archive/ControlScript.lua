Controlstatus = false;
 
function OnCreate()
 this:RegisterCommand("Control", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
end;
 
function OnCommand_Control(vCommandChatType, vNick, vCommandParam)
	if (Controlstatus == false) then
 Controlstatus = true;
 ShowToClient("ControlScrip","Control Commands are Activated.");
	else
 Controlstatus = false;
 ShowToClient("ControlScrip","Control Commands are Deactivated.");	
	end;
end;
 
 
function OnChatUserMessage(chatType, nick, msg)
 local caller = GetUserByName(nick);
 local Message = string.lower(msg); -- Converts message to lower case letters.
 Message = Message:gsub("^%s*(.-)%s*$", "%1"); -- Trimming message of spaces on start.
 
 
 
	if (Controlstatus == true) then
 
------------- FIRST SCRIPT ----------------------------------------------
 
 if (chatType == L2ChatType.CHAT_PM) and 
 (message == "start1") then ---------------------------------- Put here custom command to activate script
 Sleep(1200);
 dofile (GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
 if(chatType == L2ChatType.CHAT_PM) and 
 (message == "stop1") then ---------------------------------- Put here custom command to DEACTIVATE script
 Sleep(1200);
 file:close(GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
 end;
 end;
 
------------------------------------- SECOND SCRIPT ---------------------------------------------- 
 
 if (chatType == L2ChatType.CHAT_PM) and 
 (message == "start2") then ---------------------------------- Put here custom command to activate script
 Sleep(1200);
 dofile (GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
 if(chatType == L2ChatType.CHAT_PM) and 
 (message == "stop2") then ---------------------------------- Put here custom command to DEACTIVATE script
 Sleep(1200);
 file:close(GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
 end;
 end;
 
-------------------------------------------------------------- THIRD SCRIPT ---------------------------------------------- 
 
 if (chatType == L2ChatType.CHAT_PM) and 
 (message == "start3") then ---------------------------------- Put here custom command to activate script
 Sleep(1200);
 dofile (GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
 if(chatType == L2ChatType.CHAT_PM) and 
 (message == "stop3") then ---------------------------------- Put here custom command to DEACTIVATE script
 Sleep(1200);
 file:close(GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
 end;
 end;
 
-------------------------------------------------------------------- Add More if needed ---------------------------------------
 
--------------------------------------------------------------------- if (chatType == L2ChatType.CHAT_PM) and
--------------------------------------------------------------------- (message == "invite") then -------------- Put here custom command to activate script
--------------------------------------------------------------------- Sleep(1200);
--------------------------------------------------------------------- dofile (GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
--------------------------------------------------------------------- if(chatType == L2ChatType.CHAT_PM) and 
--------------------------------------------------------------------- (message == "invite") then --------------------- Put here custom command to DEACTIVATE script
--------------------------------------------------------------------- Sleep(1200);
--------------------------------------------------------------------- file:close(GetDir() .. "\\scripts\\ .lua"); ---- Change File Name for each script
--------------------------------------------------------------------- end;
--------------------------------------------------------------------- end;
 
 end;
	end;