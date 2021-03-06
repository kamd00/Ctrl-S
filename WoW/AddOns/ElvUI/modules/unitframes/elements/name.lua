local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');

function UF:Construct_NameText(frame)
	local parent = frame.RaisedElementParent or frame
	local name = parent:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(name)
	name:SetPoint('CENTER', frame.Health)
	
	return name
end

function UF:UpdateNameSettings(frame, childType)
	local db = frame.db
	if childType == "pet" then
		db = frame.db.petsGroup
	elseif childType == "target" then
		db = frame.db.targetsGroup
	end
	
	local name = frame.Name
	if not db.power or not db.power.hideonnpc then
		local x, y = self:GetPositionOffset(db.name.position)
		name:ClearAllPoints()
		name:Point(db.name.position, frame.Health, db.name.position, x + db.name.xOffset, y + db.name.yOffset)				
	end
	
	frame:Tag(name, db.name.text_format)	
end

--[[ function UF:PostNamePosition(frame, unit)
	if not frame.Power.value:IsShown() then return end
	
	if UnitIsPlayer(unit) then
		local db = frame.db
		
		local position = db.name.position
		local x, y = self:GetPositionOffset(position)
		frame.Power.value:SetAlpha(1)
		
		frame.Name:ClearAllPoints()
		frame.Name:Point(position, frame.Health, position, x + db.name.xOffset, y + db.name.yOffset)	
	else
		frame.Power.value:SetAlpha(0)
		
		frame.Name:ClearAllPoints()
		frame.Name:SetPoint(frame.Power.value:GetPoint())
	end
end ]]

function UF:PostNamePosition(frame, unit)
	if frame.Power.value:IsShown() then
		local db = frame.db
		
		local position = db.name.position
		local x, y = self:GetPositionOffset(position)
		frame.Power.value:SetAlpha(1)
			
		frame.Name:ClearAllPoints()
		frame.Name:Point(position, frame.Health, position, x + db.name.xOffset, y + db.name.yOffset)	
	--	if not UnitIsPlayer(unit) then
	--		frame.Power.value:SetAlpha(db.power.hideonnpc and 0 or 1)
	--	end
	end
end
