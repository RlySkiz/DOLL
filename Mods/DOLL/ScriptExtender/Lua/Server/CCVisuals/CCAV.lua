-------------------------------------------------------------------------------------------------------
-- 
-- 	                        All purpose CCAV maipualation
-- 
---------------------------------------------------------------------------------------------------------



-- get type by slot nam


CCAV = {}
CCAV.__index = CCAV

function CCAV:new()
    local instance = setmetatable({}, CCAV)
    return instance
end


----------------------------------------------------------------------------------------------------
-- 
-- 									Shorthands and Helpers
-- 
----------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------
-- 
-- 									XML Handling
-- 				 read information saved in xml files from game
-- 
----------------------------------------------------------------------------------------------------

-- Get all CharacterCreationAppearaceVisuals loaded in the game
---return 				- list of CharacterCreationAppearaceVisual IDs for all CCAV
function CCAV:getAllCCAV()
	local allCCAV = Ext.StaticData.GetAll("CharacterCreationAppearanceVisual")
		_P("Length of list: ", #allCCAV)
	return allCCAV
end

-- Get all CharacterCreationAppearaceVisuals of type x loaded in the game
---return 				- list of CharacterCreationAppearaceVisual IDs for all CCAV of type x
function CCAV:getAllCCAVOfType(type)
	local allCCAV = CCAV:getAllCCAV()
    local CCAVOfType = {}
	for i, CCAV in pairs(allCCAV)do
		local contents = Ext.StaticData.Get(CCAV, "CharacterCreationAppearanceVisual")
		local slotName = contents.SlotName
		if slotName and slotName == type then
			_P("Added ", slotName)
			table.insert(CCAVOfType, CCAV)
		end
	end
	return CCAVOfType
end

-- Add the name of the CCAVs to the list
--@param				- list of CharacterCreationAppearaceVisual IDs for CCAV
---return 				- list of names and CharacterCreationAppearaceVisual IDs
function CCAV:addName(listOfCCAV)

	local namesWithCCAV = {}
    for _, item in pairs(listOfCCAV) do
		local content = Ext.StaticData.Get(item,"CharacterCreationAppearanceVisual")
        local handle = content.DisplayName.Handle.Handle
        local entry = {name = Ext.Loca.GetTranslatedString(handle), uuid = item}
        table.insert(namesWithCCAV, entry)
	end
	
	return namesWithCCAV
end


-- Get all CharacterCreationAppearaceVisuals in Gustav
---return 				- list of CharacterCreationAppearaceVisual IDs for Gustav
function CCAV:getVanillaCCAV(TYPE, default)
 -- TODO
end

-- Get Mod Specific CCAV
--@param            - ModName (FolderName)
---return           - list of CharacterCreationAppearaceVisual IDs CCAV
function CCAV:getModCCAV(modName)
    -- TODO
end


-- Get Mod that CCAV belongs to
--@param  			- CCAV ID
---return 			- Name of Mod (Folder Name)

-- local function getModByCCAV(CCAV)

-- 	local visualResource = Ext.StaticData.Get(CCAV,"CharacterCreationAppearanceVisual").VisualResource
-- 	local sourceFile = Ext.Resource.Get(visualResource,"Visual").SourceFile

-- 	-- Use string.match to capture the required part of the path
-- 	-- Pattern explanation:
-- 	-- [^/]+ captures one or more characters that are not a slash (greedily matching as much as possible).
-- 	-- The pattern captures the fourth folder from the end by skipping three sets of "anything followed by a slash" sequences.
-- 	local modName = string.match(sourceFile, ".-([^/]+)/[^/]+/[^/]+/[^/]+$")

-- 	-- Quick error handling in case author places modfile too low
-- 	-- Check if value from RACES is contained within modName

-- 	if modName then
--         for _, race in pairs(RACES) do
-- 			if stringContains(modName, race) then
--                 print("Error: Mod name matches a race name, which suggests improper directory structure.")
-- 				print("Error: Spell will be added to \"Other CCAV\"")
--                 return "Other_CCAV"
--             end
--         end
--     end

-- 	return modName
-- end
----------------------------------------------------------------------------------------------------
-- 
-- 									CCAV
-- 
----------------------------------------------------------------------------------------------------


-- Get allowed race based on input race (modded races support)
-- @param originalRace		- actual race of the entity
---return 					- raceOverride in case of unsupported modded race / race
---return           		- bodyshapeOverride in case of modded race / bodyshape
function CCAV:getRaceAndBody(originalRace)

	local bodyShapeOverride = false
	local race = originalRace
	
	-- Check for supported modded races
	for _, allowedRace in ipairs(MODDED_RACES) do
		if allowedRace.uuid == race then

			print(allowedRace.name, " is a supported race")
			-- if modded race uses the body of vanilla, choose that
			if allowedRace.useDefault then
				race = allowedRace.default
				print(allowedRace.name, " will use ", allowedRace.defaultName ," presets ")
			end

			-- choose different bodyshape preset [for now has to be manually configured]
			if (allowedRace.bs3) or allCCAV.bs4 then
				bodyShapeOverride = true
				print("Using bodyshape override")
			end

		else
			print(race, " is not supported using default human CCAV")
			race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
		end
	end

	return race, bodyShapeOverride
end


-- TODO : test Githzerai again

-- Get all allowed CCAV for entity (Ex: all vulva for human)
-- @param list		- list of CCAV to be filtered
-- @param uuis 	    - uuid of entity that will receive the CCAV
---return 			- List of IDs of CharacterCreationAppearaceVisuals
function CCAV:getPermittedCCAV(uuid, allCCAV)

    local permittedCCAV = {}
    
	-- Get the properties for the character
	local E = GetPropertyOrDefault(Ext.Entity.Get(uuid),"CharacterCreationStats", nil)
	local bt =  Ext.Entity.Get(uuid).BodyType.BodyType
	local bs = 0

	if E then
		bs = E.BodyShape
	end


	-- NPCs only have race tags
	local raceTags = Ext.Entity.Get(uuid):GetAllComponents().ServerRaceTag.Tags

	local race
	for _, tag in pairs(raceTags) do
		if RACETAGS[tag] then
			race = GetKey(RACES, RACETAGS[tag])
			break
		end
	end

	-- failsafe for modded races - assign human race
	-- TODO - add support for modded CCAV for modded races

	local bodyShapeOverride = false

	if not RACES[race] then
		print(race, " is not Vanilla, checking for supported custom races")

		race, bodyShapeOverride = CCAV:getRaceAndBody(originalRace)
	end

	-- Halsin is special boy
	if uuid == "S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323" then
		race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
	end

	-- get CCAV with same stats
	for _, CCAV in pairs(allCCAV) do

		local G = Ext.StaticData.Get(CCAV, "CharacterCreationAppearanceVisual")

		-- bodyshape overrides for modded races - TODO: find a better way to do this
		if bodyShapeOverride then
			bs = 0
		end
		
		if (bt == G.BodyType) and (bs == G.BodyShape) and (race == G.RaceUUID) then
			table.insert(permittedCCAV, CCAV)
		end
    end
    

    -- TODO - Clean up 
    -- Some lazy filtering to filter out default CCAV

    local result = {}

      for _, CCAV in ipairs(permittedCCAV) do

        local content = Ext.StaticData.Get(CCAV,"CharacterCreationAppearanceVisual")
        local handle = content.DisplayName.Handle.Handle
        local name = Ext.Loca.GetTranslatedString(handle)

        if name ~= "Default" then
            table.insert(result, CCAV)
        end
    end

	return result
end


-- TODO - Halsin is special, give him human CCAV

-- TODO - currently resets on Saveload. Make into uservariable
-- allows to cycle through a list of CCAV instead of choosing a random one
local CCAVChoice = {}

-- Choose random CCAV from selection (Ex: random vulva from vulva a - c)
-- @param spell		- Name of the spell by which the CCAV are filtered (vulva, penis, erection)
-- @param uuid 	    - uuid of entity that will receive the CCAV
---return 			- ID of CharacterCreationAppearaceVisual
function CCAV:getNextCCAV(spell, uuid)

	-- TODO - Shart only has 2 vulvas to choose from instead of 3 after filtering for defailts: issue in the lib? 
    local permittedCCAV = CCAV:getPermittedCCAV(uuid)
    local filteredCCAV = CCAV:getFilteredCCAV(spell, permittedCCAV)

    if CCAVChoice.uuid == uuid and CCAVChoice.spell == spell then
        -- Increment the index, wrap around if necessary
        CCAVChoice.index = (CCAVChoice.index % #filteredCCAV) + 1
    else
        CCAVChoice = {uuid = uuid, spell = spell, index = 1}
    end

    if #filteredCCAV == 0 then
        print("[BG3SX] No " , spell , " CCAV available after filtering for this entity.")
        return nil
    else
        local selectedCCAV = filteredCCAV[CCAVChoice.index]
        return selectedCCAV
    end
end

----------------------------------------------------------------------------------------------------
-- 
-- 									Transformations
-- 
----------------------------------------------------------------------------------------------------

-- Get the current CCAV of the entity
-- @param uuid 	    - uuid of entity that has a CCAV
-- @param type 	    - type of teh CCAV
---return 			- tale of IDs of CharacterCreationAppearaceVisual
function CCAV:getCurrentCCAV(uuid, type)
	local allCCAV = CCAV:getAllCCAV()
	local characterVisuals =  Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationAppearance.Visuals

    local visualsOfType = {}
	
	for _, visual in pairs(characterVisuals)do
        if contains(allCCAV, visual) then
            table.insert(visualsOfType, visual)	
		end
    end
    
    return visualsOfType
end


-- Override the current CCAV with the new one
-- @param newCCAV	- ID of CharacterCreationAppearaceVisual of type PrivateParts
-- @param uuid 	     	- uuid of entity that will receive the CCAV
function CCAV:overrideCCAV(newCCAV, uuid)
	local currentCCAV = CCAV:getCurrentCCAV(uuid, type)
	_P("Current CCAV of type ", type , " = ", uuid)

    for _, ccav in pairs(currentCCAV) do
	    -- Origins don't have CCAV - We have to add one before we can remove it
	    if not (ccav == newCCAV) then
		    -- Note: This is not a typo, It's actually called Ovirride
		    Osi.RemoveCustomVisualOvirride(uuid, ccav) 
	    end
	end
	
	if newCCAV then
		Osi.AddCustomVisualOverride(uuid, newCCAV)
	end
end


function CCAV:addVisual(uuid, ccav)
    Osi.AddCustomVisualOverride(uuid, ccav)
end


function CCAV:removeVisual(uuid, ccav)
     Osi.RemoveCustomVisualOvirride(uuid, ccav)
end


