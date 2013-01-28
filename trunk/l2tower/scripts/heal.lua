TRASTED_CHARS = {"Debuger", "Wsdl", "pussy"}
-- TRASTED_CHARS = {"TheCreator", "xml", "Kilimanjaro"}
-- TRASTED_CHARS = {"Wsdl", "HeadCutter", "БаЧжа"}

HEAL_SKILLS = {11756,11828}

function CastSkill(id)
	skill = GetSkills():FindById(id)
	if skill and skill:CanBeUsed() and skill:GetReuse() == 0 then
		UseSkillRaw(id,false,false)
		return true
	end
	return false
end

function CastOneByList(list)
	-- if "table" ~= type(list) then return dprint("CastOneByList(list) - >> list not a table") end
	for _, id in pairs(list) do
		if CastSkill(id) then
			return true;
		end
	end
end

function IsOneOf(subj, list)
	for k,v in pairs(list) do
		if subj == v then
			return true
		end
	end
	return false;
end

repeat
    if not IsPaused() then
    	-- PLAYER HEAL
    	local pl = GetPlayerList()
		if pl:GetCount() > 0 then
			for user in pl.list do
				if IsOneOf(user:GetName(), TRASTED_CHARS) then
					if not user:IsAlikeDeath()  then
						if user:GetHpPercent() < 80 then 
							Target(user:GetName())
							-- Target(GetMe());
							Sleep(700)
							UseSkillRaw(11570,false,false)
							-- UseSkillRaw(,false,false)
							-- CastOneByList(HEAL_SKILLS)
							Sleep(700)
							ClearTargets();
							CancelTarget(false)
						end
					end
				end
			end
		end
    	-- PET HEAL
    	local petList = GetPetList()
    	if petList:GetCount() > 0 then
    		for user in petList.list do
    			if IsOneOf(user:GetNickName(), TRASTED_CHARS) then
    				-- this:Log(user:GetNickName())
    				if not user:IsAlikeDeath()  then
		-- 					--CastSkill(11570)
						if user:GetHpPercent() < 70 then 
							Target(user)
							Sleep(700)
							UseSkillRaw(11570,false,false)
							-- CastOneByList(HEAL_SKILLS)
							Sleep(700)
							ClearTargets();
							CancelTarget(false)
						end
					end
    			end
    		end
    	else
    		-- this:Log("No pets")
    	end
		-- local pl = GetPlayerList()
		-- if pl:GetCount() > 0 then
		-- 	-- this:Log("here")
		-- 	for user in pl.list do
		-- 		if user:GetName() == "Kilimanjaro" then
		-- 			-- this:Log("here")
		-- 			if user:GetDistance() < 900 then
		-- 				if user:IsAlikeDeath()  then
		-- 					--CastSkill(11570)
		-- 					if user:GetHpPercent() < 90 then 
		-- 						Target(user:GetName())
		-- 						Sleep(700)
		-- 						UseSkillRaw(11570,false,false)
		-- 						Sleep(700)
		-- 						ClearTargets();
		-- 						CancelTarget(false)
		-- 					end
		-- 				end
		-- 			end
		-- 		end
		-- 	end
		-- end
	end

    Sleep(500)
until false