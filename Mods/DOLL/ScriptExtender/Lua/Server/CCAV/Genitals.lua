----------------------------------------------------------------------------------------------------
-- 
-- 	Dynamic Genital Modification -  based on MrFunSize's implementation of Genitals [Folder Structure]
-- 
-------------------------------------------------------------------------------------


Genitals = {}
Genitals.__index = Genitals

function Genitals:new()
    local instance = setmetatable({}, Genitals)
    return instance  -- Ensure the instance is returned!
end


----------------------------------------------------------------------------------------------------
-- 
-- 									Shorthands and Helpers
-- 
----------------------------------------------------------------------------------------------------
--- Checks if an item is present in a list.
-- @param list table	- The table to be searched.
-- @param item any		- The item to search for in the table.
-- @return bool 		- Returns true if the item is found, otherwise returns false.
function Genitals:contains(list, item)
    for i, object in ipairs(list) do
        if object == item then
            return true
        end
    end
    return false
end


-- Checks if the substring 'sub' is present within the string 'str'.
-- @param str string 	-  The string to search within.
-- @param sub string 	- The substring to look for.
-- @return bool			- Returns true if 'sub' is found within 'str', otherwise returns fals
	function Genitals:stringContains(str, sub)
    -- Make the comparison case-insensitive
    str = str:lower()
    sub = sub:lower()
    return (string.find(str, sub, 1, true) ~= nil)
end

-- Helper function to convert a list to a set
-- @param list 		- the list to be converted
-- @return 			- set from list
function Genitals:listToSet(list)
    local set = {}
    for _, v in ipairs(list) do
        set[v] = true
    end
    return set
end

--- Retrieves the value of a specified property from an object or returns a default value if the property doesn't exist.
-- @param obj           The object from which to retrieve the property value.
-- @param propertyName  The name of the property to retrieve.
-- @param defaultValue  The default value to return if the property is not found.
-- @return              The value of the property if found; otherwise, the default value.
function Genitals:GetPropertyOrDefault(obj, propertyName, defaultValue)
    local success, value = pcall(function() return obj[propertyName] end)
    if success then
        return value or defaultValue
    else
        return defaultValue
    end
end


-- for maps
function  Genitals:getKey(map, item)
    for key, object in pairs(map) do
        if object == item then
            return key
        end
    end
    return nil
end
----------------------------------------------------------------------------------------------------
-- 
-- 									XML Handling
-- 				 read information saved in xml files from game
-- 
----------------------------------------------------------------------------------------------------

-- Get all CharacterCreationAppearaceVisuals of type Private Parts loaded in the game
---return 				- list of CharacterCreationAppearaceVisual IDs for all genitals
function Genitals:getAllGenitals()
	local allGenitals = {}
	local allCCAV = Ext.StaticData.GetAll("CharacterCreationAppearanceVisual")
	for _, CCAV in pairs(allCCAV)do
		local contents = Ext.StaticData.Get(CCAV, "CharacterCreationAppearanceVisual")
		local slotName = contents.SlotName
		if slotName and slotName == "Private Parts" then
			table.insert(allGenitals, CCAV)
		end
	end
	return allGenitals
end


function Genitals:getVanillaGenitals(TYPE, default)
    local tableToSearch = (TYPE == "PENIS" and PENIS) or (TYPE == "VULVA" and VULVA)

    if not tableToSearch then
        print("Invalid type specified. Please use 'PENIS', 'VULVA'.")
        return {}
    end

    local result = {}

    -- Collect all genitalIDs from the selected table
    for _, entry in ipairs(tableToSearch) do
        if default and entry.name == "Default" then
            table.insert(result, entry.genitalID)
        elseif not default and entry.name ~= "Default" then
            table.insert(result, entry.genitalID)
        end
    end

    return result
end

-- Get Mod Specific Genitals
--@param            - ModName (FolderName)
---return           - list of CharacterCreationAppearaceVisual IDs genitals
function Genitals:getModGenitals(modName)
    local modGenitals = {}
    local allGenitals = Genitals:getAllGenitals()

    for _, genital in pairs(allGenitals) do
        local visualResource = Ext.StaticData.Get(genital, "CharacterCreationAppearanceVisual").VisualResource
        local sourceFile = Ext.Resource.Get(visualResource, "Visual").SourceFile

        if Genitals:stringContains(sourceFile, modName) then
            table.insert(modGenitals, genital)
        end
    end

    -- Failsafe for CC
    if modName ~= "SimpleErections" then
        local additionalGenitals = Genitals:getAdditionalGenitals(allGenitals)
        for _, genital in ipairs(additionalGenitals) do
            table.insert(modGenitals, genital)
        end
    end

    if #modGenitals == 0 then
        print("No genitals found for this mod")
    end

    return modGenitals
end

-- All genital that are not part of "Vanilla" BG3SX
---return 			- list of CharacterCreationAppearaceVisual IDs genitals htat are not part of Vanilla or MrFunSizeErections
function Genitals:getAdditionalGenitals(allGenitals)
    -- Default genitals that come with BG3SX
    local setVanilla = {
        Genitals:listToSet(Genitals:getVanillaGenitals("VULVA", false)),
        Genitals:listToSet(Genitals:getVanillaGenitals("PENIS", false)),
        Genitals:listToSet(Genitals:getVanillaGenitals("VULVA", true)),
        Genitals:listToSet(Genitals:getVanillaGenitals("PENIS", true)),
        Genitals:listToSet(Genitals:getModGenitals("SimpleErections"))
    }

    local additionalGenitals = {}
    -- Filter allGenitals to find additional genitals
    for _, genital in ipairs(allGenitals) do
        local isUnique = true
        for _, set in ipairs(setVanilla) do
            if set[genital] then
                isUnique = false
                break
            end
        end
        if isUnique then
            table.insert(additionalGenitals, genital)
        end
    end
    return additionalGenitals
end


-- Get Mod that genital belongs to
--@param  			- genital ID
---return 			- Name of Mod (Folder Name)

-- local function getModByGenital(genital)

-- 	local visualResource = Ext.StaticData.Get(genital,"CharacterCreationAppearanceVisual").VisualResource
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
-- 				print("Error: Spell will be added to \"Other Genitals\"")
--                 return "Other_Genitals"
--             end
--         end
--     end

-- 	return modName
-- end

----------------------------------------------------------------------------------------------------
-- 
-- 									Genitals
-- 
----------------------------------------------------------------------------------------------------


-- Get allowed race based on input race (modded races support)
-- @param originalRace		- actual race of the entity
---return 					- raceOverride in case of unsupported modded race / race
---return           		- bodyshapeOverride in case of modded race / bodyshape
function Genitals:getRaceAndBody(originalRace)

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
			if (allowedRace.bs3) or allGenitals.bs4 then
				bodyShapeOverride = true
				print("Using bodyshape override")
			end

		else
			print(race, " is not supported using default human genitals")
			race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
		end
	end

	return race, bodyShapeOverride
end


-- TODO : test Githzerai again

-- Get all allowed genitals for entity (Ex: all vulva for human)
-- @param spell		- Name of the spell by which the genitals are filtered (vulva, penis, erection)
-- @param uuis 	    - uuid of entity that will receive the genital
---return 			- List of IDs of CharacterCreationAppearaceVisuals
function Genitals:getPermittedGenitals(uuid)

	local permittedGenitals = {}

	-- Get entities body
	local allGenitals = Genitals:getAllGenitals()

	-- Get the properties for the character
	local E = Genitals:GetPropertyOrDefault(Ext.Entity.Get(uuid),"CharacterCreationStats", nil)
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
			race = Genitals:getKey(RACES, RACETAGS[tag])
			break
		end
	end

	-- failsafe for modded races - assign human race
	-- TODO - add support for modded genitals for modded races

	local bodyShapeOverride = false

	if not RACES[race] then
		print(race, " is not Vanilla, checking for supported custom races")

		race, bodyShapeOverride = Genitals:getRaceAndBody(originalRace)
	end

	-- Halsin is special boy
	if uuid == "S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323" then
		race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
	end

	-- get genitals with same stats
	for _, genital in pairs(allGenitals) do

		local G = Ext.StaticData.Get(genital, "CharacterCreationAppearanceVisual")

		-- bodyshape overrides for modded races - TODO: find a better way to do this
		if bodyShapeOverride then
			bs = 0
		end
		
		if (bt == G.BodyType) and (bs == G.BodyShape) and (race == G.RaceUUID) then
			table.insert(permittedGenitals, genital)
		end
    end
    

    -- TODO - Clean up 
    -- Some lazy filtering to filter out default genital

    local result = {}

      for _, genital in ipairs(permittedGenitals) do

        local content = Ext.StaticData.Get(genital,"CharacterCreationAppearanceVisual")
        local handle = content.DisplayName.Handle.Handle
        local name = Ext.Loca.GetTranslatedString(handle)

        if name ~= "Default" then
            table.insert(result, genital)
        end
    end

	return result
end


-- Get genitals filteres by used spell (ex: only vulvas, only erections)
-- @param spell					- Name of the spell by which the genitals are filtered (vulva, penis, erection)
-- 								- spell Name has to be the same as Mod folder name
-- @param listOfGenitals 	    - List of genital Ids prefiltered by race/body
---return 						- List of IDs of CharacterCreationAppearaceVisuals
function Genitals:getFilteredGenitals(spell, listOfGenitals)

	local filteredGenitals = {}
	local spellGenitals = {}

	-- Vanilla Spells
	if spell == "Vanilla_Vulva" then
		spellGenitals = Genitals:getVanillaGenitals("VULVA")
	elseif spell == "Vanilla_Flaccid" then
		spellGenitals = Genitals:getVanillaGenitals("PENIS")
	-- Modded Dicks (including MrFunSize)	
	else 
		spellGenitals = Genitals:getModGenitals(spell)
	end

	if not spellGenitals then
		_P("[BG3SX] Error, spell not configured correctly, cannot get genitals")
		return
	end

	-- only keep genitals that are in both filtered (race/body) and Mod
    for _, genital in ipairs(listOfGenitals) do
        if contains(spellGenitals, genital) then
            table.insert(filteredGenitals, genital)
        end
    end

	return filteredGenitals
end



-- TODO - Halsin is special, give him human genitals

-- TODO - currently resets on Saveload. Make into uservariable
-- allows to cycle through a list of genitals instead of choosing a random one
local genitalChoice = {}

-- Choose random genital from selection (Ex: random vulva from vulva a - c)
-- @param spell		- Name of the spell by which the genitals are filtered (vulva, penis, erection)
-- @param uuid 	    - uuid of entity that will receive the genital
---return 			- ID of CharacterCreationAppearaceVisual
function Genitals:getNextGenital(spell, uuid)

	-- TODO - Shart only has 2 vulvas to choose from instead of 3 after filtering for defailts: issue in the lib? 
    local permittedGenitals = Genitals:getPermittedGenitals(uuid)
    local filteredGenitals = Genitals:getFilteredGenitals(spell, permittedGenitals)

    if genitalChoice.uuid == uuid and genitalChoice.spell == spell then
        -- Increment the index, wrap around if necessary
        genitalChoice.index = (genitalChoice.index % #filteredGenitals) + 1
    else
        genitalChoice = {uuid = uuid, spell = spell, index = 1}
    end

    if #filteredGenitals == 0 then
        print("[BG3SX] No " , spell , " genitals available after filtering for this entity.")
        return nil
    else
        local selectedGenital = filteredGenitals[genitalChoice.index]
        return selectedGenital
    end
end

----------------------------------------------------------------------------------------------------
-- 
-- 									Transformations
-- 
----------------------------------------------------------------------------------------------------

-- Get the current genital of the entity
-- @param uuid 	    - uuid of entity that has a genital
---return 			- ID of CharacterCreationAppearaceVisual
function Genitals:getCurrentGenital(uuid)
	local allGenitals = Genitals:getAllGenitals()
	local characterVisuals =  Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationAppearance.Visuals

	
	for _, visual in pairs(characterVisuals)do
		if contains(allGenitals, visual) then
		return visual
		end
	end
end


-- Override the current genital with the new one
-- @param newGenital	- ID of CharacterCreationAppearaceVisual of type PrivateParts
-- @param uuid 	     	- uuid of entity that will receive the genital
function Genitals:overrideGenital(newGenital, uuid)
	local currentGenital = Genitals:getCurrentGenital(uuid)

	-- Origins don't have genitals - We have to add one before we can remove it
	if currentGenital and not (currentGenital == newGenital) then
		-- Note: This is not a typo, It's actually called Ovirride
		Osi.RemoveCustomVisualOvirride(uuid, currentGenital) 
	end
	if newGenital then
		Osi.AddCustomVisualOverride(uuid, newGenital)
	end
end

