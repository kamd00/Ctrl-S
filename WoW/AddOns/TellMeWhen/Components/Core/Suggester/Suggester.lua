﻿-- --------------------
-- TellMeWhen
-- Originally by Nephthys of Hyjal <lieandswell@yahoo.com>

-- Other contributions by:
--		Sweetmms of Blackrock, Oozebull of Twisting Nether, Oodyboo of Mug'thol,
--		Banjankri of Blackrock, Predeter of Proudmoore, Xenyr of Aszune

-- Currently maintained by
-- Cybeloras of Aerie Peak/Detheroc/Mal'Ganis
-- --------------------


if not TMW then return end

local TMW = TMW
local L = TMW.L
local print = TMW.print

local strlowerCache = TMW.strlowerCache
local GetSpellTexture = TMW.GetSpellTexture

local _, pclass = UnitClass("Player")
local LSM = LibStub("LibSharedMedia-3.0")

local tonumber, tostring, type, pairs, ipairs, tinsert, tremove, sort, wipe, next, getmetatable, setmetatable, assert, rawget, rawset, unpack, select =
	  tonumber, tostring, type, pairs, ipairs, tinsert, tremove, sort, wipe, next, getmetatable, setmetatable, assert, rawget, rawset, unpack, select
local strfind, strmatch, format, gsub, strsub, strtrim, strlen, strsplit, strlower, max, min, floor, ceil, log10 =
	  strfind, strmatch, format, gsub, strsub, strtrim, strlen, strsplit, strlower, max, min, floor, ceil, log10

-- GLOBALS: GameTooltip, GameTooltip_SetDefaultAnchor

local ClassSpellCache = TMW:GetModule("ClassSpellCache")
local AuraCache = TMW:GetModule("AuraCache")
local SpellCache = TMW:GetModule("SpellCache")
local ItemCache = TMW:GetModule("ItemCache")

local SUG = TMW:NewModule("Suggester", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0", "AceTimer-3.0")
TMW.SUG = SUG


TMW.IE:RegisterUpgrade(62217, {
	global = function(self)
		-- These are both old and unused. Kill them.
		TMW.IE.db.global.CastCache = nil
		TMW.IE.db.global.ClassSpellCache = nil
	end,
})

---------- Locals/Data ----------
local SUGIsNumberInput
local SUGpreTable = {}

local ClassSpellLookup = ClassSpellCache:GetSpellLookup()

---------- Initialization/Spell Caching ----------
TMW:RegisterCallback("TMW_ICON_TYPE_CHANGED", function(event, icon)
	if icon == TMW.CI.icon then
		SUG.redoIfSame = 1
		SUG.SuggestionList:Hide()
	end
end)

function SUG:TMW_SPELLCACHE_STARTED()
	SUG.SuggestionList.Status:Show()
	SUG.SuggestionList.Speed:Show()
	SUG.SuggestionList.Finish:Show()
end
TMW:RegisterCallback("TMW_SPELLCACHE_STARTED", SUG)

function SUG:TMW_SPELLCACHE_COMPLETED()
	SUG.SuggestionList.Speed:Hide()
	SUG.SuggestionList.Status:Hide()
	SUG.SuggestionList.Finish:Hide()
	
	if SUG.onCompleteCache and SUG.SuggestionList:IsVisible() then
		SUG.redoIfSame = 1
		SUG:NameOnCursor()
	end
end
TMW:RegisterCallback("TMW_SPELLCACHE_COMPLETED", SUG)

---------- Suggesting ----------
local suggestedForModule
function SUG:DoSuggest()
	if not SUG.SuggestionList:IsVisible() then
		return
	end

	wipe(SUGpreTable)

	local tbl = SUG.CurrentModule:Table_Get()


	SUG.CurrentModule:Table_GetNormalSuggestions(SUGpreTable, SUG.CurrentModule:Table_Get())
	SUG.CurrentModule:Table_GetEquivSuggestions(SUGpreTable, SUG.CurrentModule:Table_Get())

	for specFunc = 1, math.huge do
		local Table_GetSpecialSuggestions = SUG.CurrentModule["Table_GetSpecialSuggestions_" .. specFunc]
		if not Table_GetSpecialSuggestions then
			break
		end

		Table_GetSpecialSuggestions(SUG.CurrentModule, SUGpreTable, SUG.CurrentModule:Table_Get())
	end

	suggestedForModule = SUG.CurrentModule
	SUG:SuggestingComplete(1)
end

local function progressCallback(countdown)
	-- This is called for each step of TMW.shellSortDeferred.
	SUG:SuggestingComplete()

	SUG.SuggestionList.blocker:Show()
	SUG.SuggestionList.Header:SetText(L["SUGGESTIONS_SORTING"] .. " " .. countdown)
end

local buckets_meta = {__index = function(t, k)
	t[k] = {}
	return t[k]
end}
local buckets = setmetatable({}, buckets_meta)

function SUG:SuggestingComplete(doSort)

	SUG.SuggestionList.blocker:Hide()
	SUG.SuggestionList.Header:SetText(SUG.CurrentModule.headerText)
	if doSort and not SUG.CurrentModule.dontSort then
		local sorter, sorterBucket = SUG.CurrentModule:Table_GetSorter()

		if sorterBucket then

			-- Don't GC the buckets while we're using them
			-- (idk if this would ever happen, but better safe than sorry)
			buckets_meta.__mode = nil

			-- Fill the bukkits.
			sorterBucket(SUGpreTable, buckets)

			-- All this data is in the buckets now, so wipe SUGpreTable
			-- so we can fill it after we sort the buckets.
			wipe(SUGpreTable)

			for k, bucket in TMW:OrderedPairs(buckets) do
				-- Sort the bucket.
				sort(bucket, sorter)

				-- Add the sorted bucket's contents to the main table.
				for i = 1, #bucket do
					SUGpreTable[#SUGpreTable + 1] = bucket[i]
				end

				-- We're done with this bucket. Prepare it for next use.
				-- It might get reused, or it might get GC'd.
				wipe(bucket)
			end

			-- Resume GC on the buckets.
			buckets_meta.__mode = 'kv'

		else
			SUG.SuggestionList.blocker:Show()
			SUG.SuggestionList.Header:SetText(L["SUGGESTIONS_SORTING"])

			TMW.shellsortDeferred(SUGpreTable, sorter, nil, SUG.SuggestingComplete, SUG, progressCallback)
			return
		end
	end

	if suggestedForModule ~= SUG.CurrentModule then
		TMW:Debug("SUG module changed mid-suggestion")
		return
	end

	-- Each module should maintain a cached list of invalid entries
	-- We rawget here beccause we don't want to get a parent module's
	-- list of invalid entries - we wan't to get the module's own list.
	local InvalidEntries = rawget(SUG.CurrentModule, "InvalidEntries")
	if not InvalidEntries then
		SUG.CurrentModule.InvalidEntries = {}
		InvalidEntries = SUG.CurrentModule.InvalidEntries
	end

	-- SUG:GetFrame() creates a frame if it doesn't exist.
	local numFramesNeeded = TMW.SUG:GetNumFramesNeeded()
	for id = 1, numFramesNeeded do
		SUG:GetFrame(id)
	end
	
	for frameID = 1, #SUG do
		local id
		while true do
		
			-- Here is how this horrifying line of code works:
			-- This makes sure that the offset can't be more than the number of suggestions plus 1
			-- The plus 1 is so that there will be one blank frame at the end to show the user that they're at the end.
			SUG.offset = min(SUG.offset, max(0, #SUGpreTable-numFramesNeeded+1))
			
			local key = frameID + SUG.offset
			id = SUGpreTable[key]
			
			if not id then
				break
			end
			if InvalidEntries[id] == nil then
				InvalidEntries[id] = not SUG.CurrentModule:Entry_IsValid(id)
			end
			if InvalidEntries[id] then
				tremove(SUGpreTable, key)
			else
				break
			end
		end

		local f = SUG:GetFrame(frameID)

		-- Reset everything about the frame.
		f.Name:SetText(nil)
		f.ID:SetText(nil)
		f.insert = nil
		f.insert2 = nil
		f.tooltipmethod = nil
		f.tooltiparg = nil
		f.tooltiptitle = nil
		f.tooltiptext = nil
		f.overrideInsertID = nil
		f.overrideInsertName = nil
		f.Background:SetVertexColor(0, 0, 0, 0)
		f.Icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

		if SUG.CurrentModule.noTexture then
			f.Icon:SetWidth(0.00001)
		else
			f.Icon:SetWidth(f.Icon:GetHeight())
		end

		if id and frameID <= numFramesNeeded then
			-- Call Entry_AddToList_# methods until there aren't anymore.
			for addFunc = 1, math.huge do
				local Entry_AddToList = SUG.CurrentModule["Entry_AddToList_" .. addFunc]
				if not Entry_AddToList then
					break
				end

				Entry_AddToList(SUG.CurrentModule, f, id)

				if f.insert then
					break
				end
			end

			-- Call Entry_Colorize_# methods until there aren't anymore.
			for colorizeFunc = 1, math.huge do
				local Entry_Colorize = SUG.CurrentModule["Entry_Colorize_" .. colorizeFunc]
				if not Entry_Colorize then
					break
				end

				Entry_Colorize(SUG.CurrentModule, f, id)
			end

			f:Show()
		else
			f:Hide()
		end
	end

	-- If there is a frame that we are mousing over, update its tooltip
	if SUG.mousedOver then
		TMW:TT_Update(SUG.mousedOver)
	end
end

local letterMatch, shouldLetterMatch, shouldWordMatch, wordMatch, wordMatch2
local strfindsugMatches = {}

function SUG:NameOnCursor(isClick)
	if SpellCache:IsCaching() then
		-- Wait for the spell cache to complete.
		-- SUG.onCompleteCache will cause this method to be called when the cache completes.
		SUG.onCompleteCache = 1
		SUG.SuggestionList:Show()
		return
	end

	-- This method gets a whole shitload of info about the words around the cursor in the editbox.
	-- Here are what's currently published by this method:
	--	SUG.oldLastName 		-- SUG.lastName from the previous time this method was called
	--	SUG.startpos 			-- starting position in the editbox of what we're suggestion. Provided by SUG.CurrentModule:GetStartEndPositions()
	--	SUG.endpos 				-- ending position in the editbox of what we're suggestion. Provided by SUG.CurrentModule:GetStartEndPositions()
	--	SUG.lastName_unmodified	-- the text between SUG.startpos and SUG.endpos, cleaned and strlowered.
	--	SUG.lastName 			-- SUG.lastName_unmodified with any duration syntax stripped out, and any special chars for strmatch() escaped.
	--	SUG.duration 			-- the duration if the duration syntax (Spell: duration) was used.
	-- 	SUG.atBeginning 		-- "^" .. SUG.lastName; for ease of use with strmatch.
	-- 	SUG.inputType 			-- "number" or "string", depending on what is being suggested.

	SUG.oldLastName = SUG.lastName
	local text = SUG.Box:GetText()

	SUG.CurrentModule:GetStartEndPositions(isClick)


	SUG.lastName = strlower(TMW:CleanString(strsub(text, SUG.startpos, SUG.endpos)))
	SUG.lastName_unmodified = SUG.lastName

	if strfind(SUG.lastName, ":[%d:%s%.]*$") then
		SUG.lastName, SUG.duration = strmatch(SUG.lastName, "(.-):([%d:%s%.]*)$")
		SUG.duration = strtrim(SUG.duration, " :;.")
		if SUG.duration == "" then
			SUG.duration = nil
		end
	else
		SUG.duration = nil
	end

	-- always escape parentheses, brackets, percent signs, minus signs, plus signs
	-- but don't escape wildcards (* and .)
	SUG.lastName = gsub(SUG.lastName, "([%(%)%%%[%]%-%+])", "%%%1")
	
	if TMW.debug then
		-- Makes building equivalencies easier - I can copy the equiv string straight into the IE
		-- to easily see what spellIDs are still valid.
		SUG.lastName = SUG.lastName:trim("_")
	end

	SUG.atBeginning = "^" .. SUG.lastName
	shouldLetterMatch = #SUG.lastName < 5
	letterMatch = "^" .. gsub(SUG.lastName, "(.)", " %1.-"):trim()
	shouldWordMatch = strfind(SUG.lastName, " ")
	wordMatch = "^" .. gsub(SUG.lastName, " ", ".- "):trim()
	wordMatch2 = " " .. gsub(SUG.lastName, " ", ".- "):trim()
	wipe(strfindsugMatches)


	SUG.inputType = type(tonumber(SUG.lastName) or SUG.lastName)
	SUGIsNumberInput = SUG.inputType == "number"
	
	if (not SUG.CurrentModule:GetShouldSuggest()) or (not SUG.CurrentModule.noMin and (SUG.lastName == "" or not strfind(SUG.lastName, "[^%.]"))) then
		SUG.SuggestionList:Hide()
		return
	else
		SUG.SuggestionList:Show()
	end
	
	if SUG.CurrentModule.OnSuggest then
		SUG.CurrentModule:OnSuggest()
	end

	if SUG.oldLastName ~= SUG.lastName or SUG.redoIfSame then
		SUG.redoIfSame = nil

		SUG.offset = 0
		SUG:DoSuggest()
	end

	-- Create a new table so that old one, which is now nearly 2MB in size, can be GC'd.
	-- Lua doesn't reduce the size of hash tables when they are emptied, apparently.
	strfindsugMatches = {}
end

function SUG.strfindsug(str)
	local matched = strfindsugMatches[str]
	if matched ~= nil then
		return matched
	end

	matched = strfind(str, SUG.atBeginning) or (shouldLetterMatch and strfind(str, letterMatch)) or (shouldWordMatch and (strfind(str, wordMatch) or strfind(str, wordMatch2)))
	strfindsugMatches[str] = not not matched
	return matched
end
local strfindsug = SUG.strfindsug


---------- EditBox Hooking ----------
local EditBoxHooks = {
	OnEditFocusLost = function(self)
		--if self.SUG_Enabled then
			SUG.SuggestionList:Hide()
		--end
	end,
	OnEditFocusGained = function(self)
		if self.SUG_Enabled then
			local newModule = SUG:GetModule(self.SUG_type, true)
			
			
			if not newModule then
				SUG:DisableEditBox(self)
				error(
					("EditBox %q is supposed to implement SUG module %q, but the module doesn't seem to exist..."):
					format(tostring(self:GetName() or self), tostring(self.SUG_type or "<??>"))
				)
			end
			
			SUG.redoIfSame = SUG.CurrentModule ~= newModule
			SUG.Box = self
			SUG.CurrentModule = newModule
			SUG.SuggestionList.Header:SetText(SUG.CurrentModule.headerText)
			SUG:NameOnCursor()
		end
	end,
	OnTextChanged = function(self, userInput)
		if self.SUGTimer then
			self.SUGTimer:Cancel()
		end
		self.SUGTimer = C_Timer.NewTimer(0.2, function()
			if userInput and self.SUG_Enabled then
				SUG.redoIfSame = nil
				SUG:NameOnCursor()
			end
		end)
	end,
	OnMouseUp = function(self)
		if self.SUG_Enabled then
			SUG:NameOnCursor(1)
		end
	end,
	OnTabPressed = function(self)
		if self.SUG_Enabled and SUG[1] and SUG[1].insert and SUG[1]:IsVisible() and not SUG.CurrentModule.noTab and not SUG.SuggestionList.blocker:IsShown() then
			SUG[1]:Click("LeftButton")
			TMW.HELP:Hide("SUG_FIRSTHELP")
		end
	end,
}

--- Enable the suggestion list on an editbox.
function SUG:EnableEditBox(editbox, inputType, onlyOneEntry)
	editbox.SUG_Enabled = 1

	inputType = TMW.get(inputType)
	inputType = (inputType == true and "spell") or inputType
	if not inputType then
		return SUG:DisableEditBox(editbox)
	end
	editbox.SUG_type = inputType
	editbox.SUG_onlyOneEntry = onlyOneEntry

	if not editbox.SUG_hooked then
		for k, v in pairs(EditBoxHooks) do
			editbox:HookScript(k, v)
		end
		editbox.SUG_hooked = 1
	end

	if editbox:HasFocus() then
		EditBoxHooks.OnEditFocusGained(editbox) -- force this to rerun becase we may be calling from within the editbox's script
	end
end

--- Disable the suggestion list on an editbox.
function SUG:DisableEditBox(editbox)
	editbox.SUG_Enabled = nil

	if SUG.Box == editbox then
		SUG.SuggestionList:Hide()
	end
end


---------- Miscellaneous ----------
function SUG:ColorHelp(frame)
	TMW:TT_Anchor(frame)
	GameTooltip:AddLine(SUG.CurrentModule.headerText, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, 1)
	GameTooltip:AddLine(SUG.CurrentModule.helpText, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	
	if SUG.CurrentModule.showColorHelp then
		GameTooltip:AddLine(L["SUG_DISPELTYPES"], 1, .49, .04, 1)
		GameTooltip:AddLine(L["SUG_BUFFEQUIVS"], .2, .9, .2, 1)
		GameTooltip:AddLine(L["SUG_DEBUFFEQUIVS"], .77, .12, .23, 1)
		GameTooltip:AddLine(L["SUG_OTHEREQUIVS"], 1, .96, .41, 1)
		GameTooltip:AddLine(L["SUG_MSCDONBARS"], 0, .44, .87, 1)
		GameTooltip:AddLine(L["SUG_PLAYERSPELLS"], .41, .8, .94, 1)
		GameTooltip:AddLine(L["SUG_CLASSSPELLS"], .96, .55, .73, 1)
		GameTooltip:AddLine(L["SUG_PLAYERAURAS"], .79, .30, 1, 1)
		GameTooltip:AddLine(L["SUG_NPCAURAS"], .78, .61, .43, 1)
		GameTooltip:AddLine(L["SUG_MISC"], .58, .51, .79, 1)
	end

	GameTooltip:Show()
end

function SUG:GetNumFramesNeeded()
	return floor((TMW.SUG.SuggestionList:GetHeight() + 5)/TMW.SUG[1]:GetHeight()) - 2
end

function SUG:GetFrame(id)
	local Suggest = TMW.SUG.SuggestionList
	if TMW.SUG[id] then
		return TMW.SUG[id]
	end
	
	local f = CreateFrame("Button", Suggest:GetName().."Item"..id, Suggest, "TellMeWhen_SpellSuggestTemplate", id)
	TMW.SUG[id] = f
	
	if TMW.SUG[id-1] then
		f:SetPoint("TOPRIGHT", TMW.SUG[id-1], "BOTTOMRIGHT", 0, 0)
		f:SetPoint("TOPLEFT", TMW.SUG[id-1], "BOTTOMLEFT", 0, 0)
	end
	
	return f
end


---------- Suggester Modules ----------
local Module = SUG:NewModule("default")
Module.headerText = L["SUGGESTIONS"]
Module.helpText = L["SUG_TOOLTIPTITLE"]
Module.showColorHelp = true
function Module:GetShouldSuggest()
	return true
end
function Module:GetStartEndPositions(isClick)
	local text = SUG.Box:GetText()
	
	SUG.startpos = 0
	for i = SUG.Box:GetCursorPosition(), 0, -1 do
		if strsub(text, i, i) == ";" then
			SUG.startpos = i+1
			break
		end
	end

	if isClick then
		SUG.endpos = #text
		for i = SUG.startpos, #text do
			if strsub(text, i, i) == ";" then
				SUG.endpos = i-1
				break
			end
		end
	else
		SUG.endpos = SUG.Box:GetCursorPosition()
	end
end
function Module:Table_Get()
	return SpellCache:GetCache()
end
function Module.Sorter_ByName(a, b)
	local nameA, nameB = SUG.SortTable[a], SUG.SortTable[b]
	if nameA == nameB then
		--sort identical names by ID
		return a < b
	else
		--sort by name
		return nameA < nameB
	end
end
function Module:Table_GetSorter()
	if SUG.inputType == "number" then
		return nil -- use the default sort func
	else
		SUG.SortTable = self:Table_Get()
		return self.Sorter_ByName
	end
end
function Module:Table_GetNormalSuggestions(suggestions, tbl, ...)
	local atBeginning = SUG.atBeginning
	local lastName = SUG.lastName

	if SUG.inputType == "number" then
		local len = #SUG.lastName - 1
		local match = tonumber(SUG.lastName)
		for id in pairs(tbl) do
			if min(id, floor(id / 10^(floor(log10(id)) - len))) == match then -- this looks like shit, but is is approx 300% more efficient than the below commented line
		--	if strfind(id, atBeginning) then
				suggestions[#suggestions + 1] = id
			end
		end
	else
		for id, name in pairs(tbl) do
			if strfindsug(name) then
				suggestions[#suggestions + 1] = id
			end
		end
	end
end
function Module:Table_GetEquivSuggestions(suggestions, tbl, ...)
	local lastName = SUG.lastName
	local semiLN = ";" .. lastName
	local long = #lastName > 2
	
	local len = #SUG.lastName - 1
	local match = tonumber(SUG.lastName)
	
	for _, tbl in TMW:Vararg(...) do
		for equiv in pairs(tbl) do
			if 
				(strfindsug(strlowerCache[equiv])) or
				(strfindsug(strlowerCache[L[equiv]]))
			then
				suggestions[#suggestions + 1] = equiv

			elseif long then
				if SUGIsNumberInput then
					for _, id in pairs(TMW:SplitNamesCached(TMW.EquivFullIDLookup[equiv])) do
						-- Check for a match by ID to one of the spells in the equiv
						if min(id, floor(id / 10^(floor(log10(id)) - len))) == match then
							suggestions[#suggestions + 1] = equiv
							break
						end
					end
				else
					for _, name in pairs(TMW:SplitNamesCached(TMW.EquivFullNameLookup[equiv])) do
						if strfindsug(strlowerCache[name]) then
							suggestions[#suggestions + 1] = equiv
							break
						end
					end
				end
			end
		end
	end
end
function Module:Table_GetSpecialSuggestions_1(suggestions, tbl, ...)

end
function Module:Entry_OnClick(frame, button)
	local insert
	if button == "RightButton" and frame.insert2 then
		insert = frame.insert2
	else
		insert = frame.insert
	end
	self:Entry_Insert(insert)
end
function Module:Entry_Insert(insert)
	if insert then
		insert = tostring(insert)
		if SUG.Box.SUG_onlyOneEntry then
			SUG.Box:SetText(TMW:CleanString(insert))
			SUG.Box:ClearFocus()
			return
		end

		-- determine the text before an after where we will be inserting to
		local currenttext = SUG.Box:GetText()
		local start = SUG.startpos-1
		local firsthalf = start > 0 and strsub(currenttext, 0, start) or ""
		local lasthalf = strsub(currenttext, SUG.endpos+1)


		-- DURATION STUFF:
		-- determine if we should add a colon to the inserted text. a colon should be added if:
			-- one existed before (the user clicked on a spell with a duration defined or already typed it in)
			-- the module requests (requires) one
		local doAddColon = SUG.duration or SUG.CurrentModule.doAddColon

		-- determine if there is an actual duration to be added to the inserted spell
		local hasDurationData = SUG.duration

		if doAddColon then
		-- the entire text to be inserted in
			insert = insert .. ": " .. (hasDurationData or "")
		end


		-- the entire text with the insertion added in
		local newtext = firsthalf .. "; " .. insert .. "; " .. lasthalf
		-- clean it up
		SUG.Box:SetText(TMW:CleanString(newtext))

		-- put the cursor after the newly inserted text
		local _, newPos = SUG.Box:GetText():find(insert:gsub("([%(%)%%%[%]%-%+%.%*])", "%%%1"), max(0, SUG.startpos-1))
		if newPos then
			SUG.Box:SetCursorPosition(newPos + 2)
		end

		-- if we are at the end of the editbox then put a semicolon in anyway for convenience
		if SUG.Box:GetCursorPosition() == #SUG.Box:GetText() then
			local append = "; "
			if doAddColon then
				append = (not hasDurationData and " " or "") .. append
			end
			SUG.Box:SetText(SUG.Box:GetText() .. append)
		end

		-- if we added a colon but there was no duration information inserted, move the cursor back 2 characters so the user can type it in quickly
		if doAddColon and not hasDurationData then
			SUG.Box:SetCursorPosition(SUG.Box:GetCursorPosition() - 2)
		end

		-- attempt another suggestion (it will either be hidden or it will do another)
		SUG:NameOnCursor(1)
	end
end
function Module:Entry_IsValid(id)
	return true
end



local Module = SUG:NewModule("item", SUG:GetModule("default"), "AceEvent-3.0")
Module.showColorHelp = false
Module.helpText = L["SUG_TOOLTIPTITLE_GENERIC"]
function Module:GET_ITEM_INFO_RECEIVED()
	if SUG.CurrentModule and SUG.CurrentModule.moduleName:find("item") then
		SUG:CancelTimer(SUG.itemDoSuggestTimer, 1)
		SUG.itemDoSuggestTimer = SUG:ScheduleTimer("DoSuggest", 0.1)
	end
end
Module:RegisterEvent("GET_ITEM_INFO_RECEIVED")
function Module:Table_Get()
	return TMW:GetModule("ItemCache"):GetCache()
end
function Module:Table_GetSpecialSuggestions_1(suggestions, tbl, ...)
	local id = tonumber(SUG.lastName)

	if id and GetItemInfo(id) and not TMW.tContains(suggestions, id) then
		suggestions[#suggestions + 1] = id
	end
end
function Module:Entry_AddToList_1(f, id)
	if id > INVSLOT_LAST_EQUIPPED then
		local name, link = GetItemInfo(id)

		f.Name:SetText(link and link:gsub("[%[%]]", ""))
		f.ID:SetText(id)

		f.insert = SUG.inputType == "number" and id or name
		f.insert2 = SUG.inputType ~= "number" and id or name

		f.tooltipmethod = "SetHyperlink"
		f.tooltiparg = link

		f.Icon:SetTexture(GetItemIcon(id))
	end
end


local Module = SUG:NewModule("spell", SUG:GetModule("default"))
local PlayerSpells, AuraCache_Cache, SpellCache_Cache, EquivFirstIDLookup
function Module:OnSuggest()
	AuraCache_Cache = AuraCache:GetCache()
	SpellCache_Cache = SpellCache:GetCache()
	PlayerSpells = ClassSpellCache:GetPlayerSpells()
	EquivFirstIDLookup = TMW.EquivFirstIDLookup
end
function Module:Table_Get()
	return SpellCache_Cache
end

function Module.Sorter_Bucket(suggestions, buckets)
	for i = 1, #suggestions do
		local id = suggestions[i]

		if id == "GCD" then
			 -- Used by the spell suggestions for the spell CD condition.
			 -- We put it here so that we can still use bucket sort.
			tinsert(buckets[0.5], id)
		elseif EquivFirstIDLookup[id] then
			tinsert(buckets[1], id)
		elseif PlayerSpells[id] then
			tinsert(buckets[2], id)
		elseif ClassSpellLookup[id] then
			tinsert(buckets[3], id)
		else
			local auraSoruce = AuraCache_Cache[id]
			if auraSoruce == 2 then
				tinsert(buckets[4], id)
			elseif auraSoruce == 1 then
				tinsert(buckets[5], id)
			else
				if SUGIsNumberInput then
					tinsert(buckets[6 + floor(id/5000)], id)
				else
					local name = SpellCache_Cache[id]
					local offset = name and strbyte(name) or 0
					tinsert(buckets[6 + offset], id)
				end
			end
		end
	end
end

function Module.Sorter_Spells(a, b)
	-- Due to bucket sort, if EquivFirstIDLookup[a], then it is true for b as well.
	if SUGIsNumberInput or EquivFirstIDLookup[a] then
		--sort by id
		return a < b
	else
		--sort by name
		local nameA, nameB = SpellCache_Cache[a], SpellCache_Cache[b]

		if nameA == nameB then
			--sort identical names by ID
			return a < b
		elseif nameA and nameB then
			--sort by name
			return nameA < nameB
		else
			return nameA
		end
	end
end
function Module:Table_GetSorter()
	return self.Sorter_Spells, self.Sorter_Bucket
end
function Module:Entry_AddToList_1(f, id)
	if tonumber(id) then --sanity check
		local name = GetSpellInfo(id)

		f.Name:SetText(name)
		f.ID:SetText(id)

		f.tooltipmethod = "TMW_SetSpellByIDWithClassIcon"
		f.tooltiparg = id

		if TMW.EquivFirstIDLookup[name] then
			-- Things that conflict with equivalencies should only be inserted as IDs
			f.insert = id
			f.insert2 = name
			f.overrideInsertName = TMW.L["SUG_INSERTNAME_INTERFERE"]
		else
			f.insert = SUG.inputType == "number" and id or name
			f.insert2 = SUG.inputType ~= "number" and id or name
		end

		f.Icon:SetTexture(GetSpellTexture(id))
	end
end
function Module:Entry_Colorize_1(f, id)
	if PlayerSpells[id] then
		f.Background:SetVertexColor(.41, .8, .94, 1) --color all other spells that you have in your/your pet's spellbook mage blue
		return
	elseif ClassSpellLookup[id] then
		f.Background:SetVertexColor(.96, .55, .73, 1) --color all other known class spells paladin pink
		return
	end

	local whoCasted = AuraCache_Cache[id]
	if whoCasted == AuraCache.CONST.AURA_TYPE_NONPLAYER then
		 -- Color known NPC auras warrior brown.
		f.Background:SetVertexColor(.78, .61, .43, 1)
	elseif whoCasted == AuraCache.CONST.AURA_TYPE_PLAYER then
		-- Color known PLAYER auras a bright pink-ish/pruple-ish color that is similar to paladin pink,
		-- but has sufficient contrast for distinguishing.
		f.Background:SetVertexColor(.79, .30, 1, 1)
	end
end


local Module = SUG:NewModule("texture", SUG:GetModule("spell"))
function Module:Entry_AddToList_1(f, id)
	if tonumber(id) then --sanity check
		local name = GetSpellInfo(id)

		f.Name:SetText(name)
		f.ID:SetText(id)

		f.tooltipmethod = "SetSpellByID"
		f.tooltiparg = id

		f.insert = id
		if ClassSpellCache:GetCache()[pclass][id] and name and GetSpellTexture(name) then
			f.insert2 = name
		end

		f.Icon:SetTexture(GetSpellTexture(id))
	end
end



local Module = SUG:NewModule("spellwithduration", SUG:GetModule("spell"))
Module.doAddColon = true
local MATCH_RECAST_TIME_MIN, MATCH_RECAST_TIME_SEC
function Module:OnInitialize()
	MATCH_RECAST_TIME_MIN = SPELL_RECAST_TIME_MIN:gsub("%%%.3g", "([%%d%%.]+)")
	MATCH_RECAST_TIME_SEC = SPELL_RECAST_TIME_SEC:gsub("%%%.3g", "([%%d%%.]+)")
end
function Module:Entry_OnClick(f, button)
	local insert

	local spellID = f.tooltiparg
	local Parser, LT1, LT2, LT3, RT1, RT2, RT3 = TMW:GetParser()
	Parser:SetOwner(UIParent, "ANCHOR_NONE")
	Parser:SetSpellByID(spellID)

	local dur

	for _, text in TMW:Vararg(RT2:GetText(), RT3:GetText()) do
		if text then

			local mins = text:match(MATCH_RECAST_TIME_MIN)
			local secs = text:match(MATCH_RECAST_TIME_SEC)
			if mins then
				dur = mins .. ":00"
			elseif secs then
				dur = secs
			end

			if dur then
				break
			end
		end
	end
	if spellID == 42292 then -- pvp trinket override
		dur = "2:00"
	end

	if button == "RightButton" and f.insert2 then
		insert = f.insert2
	else
		insert = f.insert
	end

	self:Entry_Insert(insert, dur)
end
function Module:Entry_Insert(insert, duration)
	if insert then
		insert = tostring(insert)
		if SUG.Box.SUG_onlyOneEntry then
			SUG.Box:SetText(TMW:CleanString(insert))
			SUG.Box:ClearFocus()
			return
		end

		-- determine the text before an after where we will be inserting to
		local currenttext = SUG.Box:GetText()
		local start = SUG.startpos-1
		local firsthalf = start > 0 and strsub(currenttext, 0, start) or ""
		local lasthalf = strsub(currenttext, SUG.endpos+1)

		-- determine if we should add a colon to the inserted text. a colon should be added if:
			-- one existed before (the user clicked on a spell with a duration defined or already typed it in)
			-- the module requests (requires) one
		local doAddColon = SUG.duration or SUG.CurrentModule.doAddColon

		-- determine if there is an actual duration to be added to the inserted spell
		local hasDurationData = duration or SUG.duration

		-- the entire text to be inserted in
		local insert = (doAddColon and insert .. ": " .. (hasDurationData or "")) or insert

		-- the entire text with the insertion added in
		local newtext = firsthalf .. "; " .. insert .. "; " .. lasthalf


		SUG.Box:SetText(TMW:CleanString(newtext))

		-- put the cursor after the newly inserted text
		local _, newPos = SUG.Box:GetText():find(insert:gsub("([%(%)%%%[%]%-%+%.%*])", "%%%1"), max(0, SUG.startpos-1))
		newPos = newPos or #SUG.Box:GetText()
		SUG.Box:SetCursorPosition(newPos + 2)

		-- if we are at the end of the editbox then put a semicolon in anyway for convenience
		if SUG.Box:GetCursorPosition() == #SUG.Box:GetText() then
			SUG.Box:SetText(SUG.Box:GetText() .. (doAddColon and not hasDurationData and " " or "") .. "; ")
		end

		-- if we added a colon but there was no duration information inserted, move the cursor back 2 characters so the user can type it in quickly
		if doAddColon and not hasDurationData then
			SUG.Box:SetCursorPosition(SUG.Box:GetCursorPosition() - 2)
		end

		-- attempt another suggestion (it will either be hidden or it will do another)
		SUG:NameOnCursor(1)
	end
end


local Module = SUG:NewModule("cast", SUG:GetModule("spell"))
function Module:Table_Get()
	return SpellCache:GetCache(), TMW.BE.casts
end
function Module:Entry_AddToList_2(f, id)
	if TMW.BE.casts[id] then
		-- the entry is an equivalacy
		-- id is the equivalency name (e.g. Tier11Interrupts)
		local equiv = id
		id = TMW.EquivFirstIDLookup[equiv]

		f.Name:SetText(equiv)
		f.ID:SetText(nil)

		f.insert = equiv
		f.overrideInsertName = L["SUG_INSERTEQUIV"]

		f.tooltipmethod = "TMW_SetEquiv"
		f.tooltiparg = equiv

		f.Icon:SetTexture(GetSpellTexture(id))
	end
end
function Module:Entry_Colorize_2(f, id)
	if TMW.BE.casts[id] then
		f.Background:SetVertexColor(1, .96, .41, 1) -- rogue yellow
	end
end
function Module:Entry_IsValid(id)
	if TMW.BE.casts[id] then
		return true
	end

	local _, _, _, castTime = GetSpellInfo(id)
	if not castTime then
		return false
	elseif castTime > 0 then
		return true
	end

	local Parser, LT1, LT2, LT3 = TMW:GetParser()

	Parser:SetOwner(UIParent, "ANCHOR_NONE") -- must set the owner before text can be obtained.
	Parser:SetSpellByID(id)

	if LT2:GetText() == SPELL_CAST_CHANNELED or LT3:GetText() == SPELL_CAST_CHANNELED then
		return true
	end
end


local Module = SUG:NewModule("buff", SUG:GetModule("spell"))
function Module:Table_Get()
	return SpellCache:GetCache(), TMW.BE.buffs, TMW.BE.debuffs
end
function Module:Entry_Colorize_2(f, id)
	if TMW.DS[id] then
		f.Background:SetVertexColor(1, .49, .04, 1) -- druid orange
	elseif TMW.BE.buffs[id] then
		f.Background:SetVertexColor(.2, .9, .2, 1) -- lightish green
	elseif TMW.BE.debuffs[id] then
		f.Background:SetVertexColor(.77, .12, .23, 1) -- deathknight red
	end
end
function Module:Entry_AddToList_2(f, id)
	if TMW.DS[id] then -- if the entry is a dispel type (magic, poison, etc)
		local dispeltype = id

		f.Name:SetText(dispeltype)
		f.ID:SetText(nil)

		f.insert = dispeltype

		f.tooltiptitle = L[dispeltype]
		f.tooltiptext = L["ICONMENU_DISPEL"]

		f.Icon:SetTexture(TMW.DS[id])

	elseif TMW.EquivFirstIDLookup[id] then -- if the entry is an equivalacy (buff, cast, or whatever)
		--NOTE: dispel types are put in TMW.EquivFirstIDLookup too for efficiency in the sorter func, but as long as dispel types are checked first, it wont matter
		local equiv = id
		local firstid = TMW.EquivFirstIDLookup[id]

		f.Name:SetText(equiv)
		f.ID:SetText(nil)

		f.insert = equiv
		f.overrideInsertName = L["SUG_INSERTEQUIV"]

		f.tooltipmethod = "TMW_SetEquiv"
		f.tooltiparg = equiv

		f.Icon:SetTexture(GetSpellTexture(firstid))
	end
end
function Module:Table_GetSpecialSuggestions_1(suggestions, tbl, ...)
	local atBeginning = SUG.atBeginning

	for dispeltype in pairs(TMW.DS) do
		if strfind(strlowerCache[dispeltype], atBeginning) or strfind(strlowerCache[L[dispeltype]], atBeginning)  then
			suggestions[#suggestions + 1] = dispeltype
		end
	end
end

local Module = SUG:NewModule("buffNoDS", SUG:GetModule("buff"))
Module.Table_GetSpecialSuggestions_1 = TMW.NULLFUNC

