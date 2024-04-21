-------------------------------------------------------------------------------------------------------
-- 
-- 	                        All purpose CCSV maipualation
-- 
---------------------------------------------------------------------------------------------------------



-- get type by slot nam


CCSV = {}
CCSV.__index = CCSV

function CCSV:new()
    local instance = setmetatable({}, CCSV)
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
---return 				- list of CharacterCreationAppearaceVisual IDs for all CCSV
function CCSV:getAllCCSV()
	local allCCSV = Ext.StaticData.GetAll("CharacterCreationSharedVisual")
		_P("Length of list: ", #allCCSV)
	return allCCSV
end

-- Get all CharacterCreationAppearaceVisuals of type x loaded in the game
---return 				- list of CharacterCreationAppearaceVisual IDs for all CCSV of type x
function CCSV:getAllCCSVOfType(type)
	local allCCSV = CCSV:getAllCCSV()
    local CCSVOfType = {}
	for i, CCSV in pairs(allCCSV)do
		local contents = Ext.StaticData.Get(CCSV, "CharacterCreationSharedVisual")
		local slotName = contents.SlotName
		if slotName and slotName == type then
			_P("Added ", slotName)
			table.insert(CCSVOfType, CCSV)
		end
	end
	return CCSVOfType
end

-- Add the name of the CCSVs to the list
--@param				- list of CharacterCreationAppearaceVisual IDs for CCSV
---return 				- list of names and CharacterCreationAppearaceVisual IDs
function CCSV:addName(listOfCCSV)

	local namesWithCCSV = {}
    for _, item in pairs(listOfCCSV) do
		local content = Ext.StaticData.Get(item,"CharacterCreationSharedVisual")
        local handle = content.DisplayName.Handle.Handle
        local entry = {name = Ext.Loca.GetTranslatedString(handle), uuid = item}
        table.insert(namesWithCCSV, entry)
	end
	
	return namesWithCCSV
end


-- Get all CharacterCreationAppearaceVisuals in Gustav
---return 				- list of CharacterCreationAppearaceVisual IDs for Gustav
function CCSV:getVanillaCCSV(TYPE, default)
 -- TODO
end

-- Get Mod Specific CCSV
--@param            - ModName (FolderName)
---return           - list of CharacterCreationAppearaceVisual IDs CCSV
function CCSV:getModCCSV(modName)
    -- TODO
end


-- Get Mod that CCSV belongs to
--@param  			- CCSV ID
---return 			- Name of Mod (Folder Name)

-- local function getModByCCSV(CCSV)

-- 	local visualResource = Ext.StaticData.Get(CCSV,"CharacterCreationSharedVisual").VisualResource
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
-- 				print("Error: Spell will be added to \"Other CCSV\"")
--                 return "Other_CCSV"
--             end
--         end
--     end

-- 	return modName
-- end
----------------------------------------------------------------------------------------------------
-- 
-- 									CCSV
-- 
----------------------------------------------------------------------------------------------------


-- Get allowed race based on input race (modded races support)
-- @param originalRace		- actual race of the entity
---return 					- raceOverride in case of unsupported modded race / race
---return           		- bodyshapeOverride in case of modded race / bodyshape
function CCSV:getRaceAndBody(originalRace)

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
			if (allowedRace.bs3) or allCCSV.bs4 then
				bodyShapeOverride = true
				print("Using bodyshape override")
			end

		else
			print(race, " is not supported using default human CCSV")
			race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
		end
	end

	return race, bodyShapeOverride
end


-- TODO : test Githzerai again

-- Get all allowed CCSV for entity (Ex: all vulva for human)
-- @param list		- list of CCSV to be filtered
-- @param uuis 	    - uuid of entity that will receive the CCSV
---return 			- List of IDs of CharacterCreationAppearaceVisuals
function CCSV:getPermittedCCSV(uuid, allCCSV)

    local permittedCCSV = {}
    
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
	-- TODO - add support for modded CCSV for modded races

	local bodyShapeOverride = false

	if not RACES[race] then
		print(race, " is not Vanilla, checking for supported custom races")

		race, bodyShapeOverride = CCSV:getRaceAndBody(originalRace)
	end

	-- Halsin is special boy
	if uuid == "S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323" then
		race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
	end

	-- get CCSV with same stats
	for _, CCSV in pairs(allCCSV) do

		local G = Ext.StaticData.Get(CCSV, "CharacterCreationSharedVisual")

		-- bodyshape overrides for modded races - TODO: find a better way to do this
		if bodyShapeOverride then
			bs = 0
		end
		
		if (bt == G.BodyType) and (bs == G.BodyShape) and (race == G.RaceUUID) then
			table.insert(permittedCCSV, CCSV)
		end
    end
    

    -- TODO - Clean up 
    -- Some lazy filtering to filter out default CCSV

    local result = {}

      for _, CCSV in ipairs(permittedCCSV) do

        local content = Ext.StaticData.Get(CCSV,"CharacterCreationSharedVisual")
        local handle = content.DisplayName.Handle.Handle
        local name = Ext.Loca.GetTranslatedString(handle)

        if name ~= "Default" then
            table.insert(result, CCSV)
        end
    end

	return result
end


-- TODO - Halsin is special, give him human CCSV

-- TODO - currently resets on Saveload. Make into uservariable
-- allows to cycle through a list of CCSV instead of choosing a random one
local CCSVChoice = {}

-- Choose random CCSV from selection (Ex: random vulva from vulva a - c)
-- @param spell		- Name of the spell by which the CCSV are filtered (vulva, penis, erection)
-- @param uuid 	    - uuid of entity that will receive the CCSV
---return 			- ID of CharacterCreationAppearaceVisual
function CCSV:getNextCCSV(spell, uuid)

	-- TODO - Shart only has 2 vulvas to choose from instead of 3 after filtering for defailts: issue in the lib? 
    local permittedCCSV = CCSV:getPermittedCCSV(uuid)
    local filteredCCSV = CCSV:getFilteredCCSV(spell, permittedCCSV)

    if CCSVChoice.uuid == uuid and CCSVChoice.spell == spell then
        -- Increment the index, wrap around if necessary
        CCSVChoice.index = (CCSVChoice.index % #filteredCCSV) + 1
    else
        CCSVChoice = {uuid = uuid, spell = spell, index = 1}
    end

    if #filteredCCSV == 0 then
        print("[BG3SX] No " , spell , " CCSV available after filtering for this entity.")
        return nil
    else
        local selectedCCSV = filteredCCSV[CCSVChoice.index]
        return selectedCCSV
    end
end

----------------------------------------------------------------------------------------------------
-- 
-- 									Transformations
-- 
----------------------------------------------------------------------------------------------------

-- Get the current CCSV of the entity
-- @param uuid 	    - uuid of entity that has a CCSV
-- @param type 	    - type of teh CCSV
---return 			- tale of IDs of CharacterCreationAppearaceVisual
function CCSV:getCurrentCCSV(uuid, type)
	local allCCSV = CCSV:getAllCCSV()
	local characterVisuals =  Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationAppearance.Visuals

    local visualsOfType = {}
	
	for _, visual in pairs(characterVisuals)do
        if contains(allCCSV, visual) then
            table.insert(visualsOfType, visual)	
		end
    end
    
    return visualsOfType
end


-- Override the current CCSV with the new one
-- @param newCCSV	- ID of CharacterCreationAppearaceVisual of type PrivateParts
-- @param uuid 	     	- uuid of entity that will receive the CCSV
function CCSV:overrideCCSV(newCCSV, uuid)
	local currentCCSV = CCSV:getCurrentCCSV(uuid, type)
	_P("Current CCSV of type ", type , " = ", uuid)

    for _, CCSV in pairs(currentCCSV) do
	    -- Origins don't have CCSV - We have to add one before we can remove it
	    if not (CCSV == newCCSV) then
		    -- Note: This is not a typo, It's actually called Ovirride
		    Osi.RemoveCustomVisualOvirride(uuid, CCSV) 
	    end
	end
	
	if newCCSV then
		Osi.AddCustomVisualOverride(uuid, newCCSV)
	end
end


function CCSV:addCCSV(uuid, CCSV)
    Osi.AddCustomVisualOverride(uuid, CCSV)
end


function CCSV:removeCCSV(uuid, CCSV)
     Osi.RemoveCustomVisualOvirride(uuid, CCSV)
end


