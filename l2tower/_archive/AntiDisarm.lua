weapid = 1;
objid = 1;
Disarmlist = {794,485,877,5260};
--funkcje
 
function GetWeaponId()
	invList = GetInventory();
	for item in invList.list do
 if item.ItemType == 0 and item.IsEquipped then
 objid= item.objectId ;
 weapid= item.displayId ;
 end;
	end;
end;
 
function IsEquipped()
	item = GetInventory():FindById(objid);
	if item ~= nil then
 if item.IsEquipped then
 return true;
 else
 return false;
 end;
	else
 weapid = 1;
 objid = 1;
 return true;
	end;
end;
 
function checkDisarm()
	local me=GetMe();
for k,w in pairs(Disarmlist) do
	if me:GotBuff(w) == true then
 return w; 
 end;
end;
	return 1;
end;
 
--end funkcje
 
--loop start
repeat
GetWeaponId();
if weapid ~=1 and objid ~= 1 then
	if IsEquipped() == false then
 if GetMe():GotBuff(checkDisarm()) then
 Sleep(GetMe():GetBuff(checkDisarm()).endTime - GetTime() + 250);
 if UseItem(weapid,objid)==false then
 weapid = 1;
 objid = 1;
 end;
 else
 if UseItem(weapid,objid)==false then
 weapid = 1;
 objid = 1;
 end;
 end;
 Sleep(1500);
	end;
end;
Sleep(200);
until false