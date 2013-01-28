MY_NAME = GetMe():GetName()
function CastSkill(id)
	skill = GetSkills():FindById(id)
	if skill and skill:CanBeUsed() and skill:GetReuse() == 0 then
		UseSkillRaw(id,false,false)
		return true
	end
	return false
end


repeat
    if not IsPaused() then
    	local petList = GetPetList()
    	local amIHaveAPat = false
    	if petList:GetCount() > 0 then
    		for user in petList.list do
    			if user:GetNickName() == MY_NAME then
    				amIHaveAPat = true;
    			end
    		end
    	end
    	if not amIHaveAPat then
    		CastSkill(1276) -- Призвать Кая
    		Sleep(5000)
    	end
    end
    Sleep(1000)
until false