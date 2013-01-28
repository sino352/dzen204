function OnCreate()
	this:RegisterCommand("info", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("info1", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	
	this:RegisterCommand("send", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
end;


function ShowUserInfo1(user)
	local html = THtmlGenerator("User: " .. user:GetName());
	--html:Table_Start(true, false, 270);
	--html:Table_AddColumns(2);
	--html:AddButton(THtmlAction("info1"), THtmlButtonStyle.BUTTON_TAB, "Base info", true, "", "", 135, 15);
	--html:Table_End();
	
	html:AddNewLine();
	html:AddLine(false);

	html:Table_Start(true, false, 270);
	html:Table_AddColumns(2);
	html:AddHtml("ID:"); html:AddHtml(tostring(user:GetId()));
	html:AddHtml("Name:"); html:AddHtml(user:GetName());
	html:AddHtml("NpcId:"); html:AddHtml(tostring(user:GetNpcId()));
	
	
	html:Table_End();
	
	html:AddLine(true);
	ShowHtml(html:GetString());
end;

function OnCommand_send(vCommandChatType, vNick, vCommandParam)
	Say2(L2ChatType.CHAT_TELL, ".cfg")
end

function OnCommand_info(vCommandChatType, vNick, vCommandParam)
	if (GetTarget() ~= nil) then
		ShowUserInfo1(GetTarget());
	end;
end;

function OnCommand_info1(vCommandChatType, vNick, vCommandParam)
	if (GetTarget() ~= nil) then
		ShowUserInfo1(GetTarget());
	end;
end;