ITEM_TO_USE = 6037 -- id
INTERVAL = 500 -- ms

repeat
-- i=0;
	invList = GetInventory();
	for item in invList.list do
		if (item.displayId == ITEM_TO_USE) then
			UseItemRaw(item.objectId)
		end;
	end;
	
	Sleep(INTERVAL);
until false;
 

