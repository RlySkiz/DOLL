-------------------------------------------------------------------------------------------------------
-- 
-- 	                        All purpose Visual maipualation
--
-- 
---------------------------------------------------------------------------------------------------------


Visual = {}
Visual.__index = Visual

function Visual:new()
    local instance = setmetatable({}, Visual)
    return instance
end


-- TODO - I think items can be either CCAV or CCSV 
-- SO we scan for both (they need different methods since
-- CCAV are filtered by bodytype while CCSV are onyl filtered by race)
-- TODO: check what happens when we add the wrong races CCSV



----------------------------------------------------------------------------------------------------
-- 
-- 									Visual Type Identification
-- 
----------------------------------------------------------------------------------------------------

-- get type of uuid
--@param visual	        - uuid of visual
---return String  	    - "CharacterCreationAppearanceVisual" or CharacterCreationSharedVisual"
function Visual:getType(uuid)

    local ccav = Ext.StaticData.Get(uuid,"CharacterCreationAppearanceVisual")
    local ccsv = Ext.StaticData.Get(uuid,"CharacterCreationSharedVisual")

    if ccav then
        return "CharacterCreationAppearanceVisual", ccav.SlotName
    elseif ccsv then
        return "CharacterCreationSharedVisual", ccsv.SlotName
    end
end

----------------------------------------------------------------------------------------------------
-- 
-- 									Get the cumulated information
-- 
----------------------------------------------------------------------------------------------------

-- Get all visuals of one type for an entity with their names
--@param type         - The visual type (ex: Private Parts)
--@param uuid         - The uuid of the entity for who the list is being filtered
--@param visualType   - "CharacterCreationAppearanceVisual" or "CharacterCreationSharedVisual"
--return 			  - list of CharacterCreationAppearaceVisual IDs for all Visual
function Visual:getVisualsWithName(type, uuid, visualType)
    local allVisualsOfType = Visual:getAllVisualsOfType(type, visualType)
    local permittedVisuals = Visual:getPermittedVisual(uuid, allVisualsOfType, visualType)
    local visualsWithName = Visual:addName(permittedVisuals, visualType)
    return visualsWithName
end


-- returns all visuals of a type for an entity : both CCAV and CCSV
--@param type	        - type of the visual (ex: Private Parts)
--@param uuid   	    - uuid of entity who will receive visual
---return 			    - List of IDs of CCAV and CCSV
function Visual:getAllVisualsWithName(type,uuid)
    local allCCAV = Visual:getVisualsWithName(type, uuid,"CharacterCreationAppearanceVisual")
    local allCCSV = Visual:getVisualsWithName(type,uuid, "CharacterCreationSharedVisual")

    -- Append 
    for i, v in ipairs(allCCSV) do
        table.insert(allCCAV, v)
    end
    return allCCAV
end

----------------------------------------------------------------------------------------------------
-- 
-- 									XML Handling
-- 				 read information saved in xml files from game
-- 
----------------------------------------------------------------------------------------------------


-- Get all CharacterCreationAppearaceVisuals loaded in the game
--@param visualType     - "CharacterCreationAppearanceVisual" or "CharacterCreationSharedVisual"
---return 				- list of CharacterCreationAppearaceVisual IDs for all Visual
function Visual:getAllVisuals(visualType)
    local allVisuals = Ext.StaticData.GetAll(visualType)
	return allVisuals
end

-- Get all CharacterCreationAppearaceVisuals of type x loaded in the game
--@param type           - The visual type (ex: Private Parts)
--@param visualType     - "CharacterCreationAppearanceVisual" or "CharacterCreationSharedVisual"
---return 				- list of CharacterCreationAppearaceVisual IDs for all Visual of type x
function Visual:getAllVisualsOfType(type, visualType)
	local allVisuals = Visual:getAllVisuals(visualType)
    local visualOfType = {}
	for i, visual in pairs(allVisuals)do
		local contents = Ext.StaticData.Get(visual, visualType)
		local slotName = contents.SlotName
		if slotName and slotName == type then
			table.insert(visualOfType, visual)
		end
	end
	return visualOfType
end


-- Add the name of the Visuals to the list
--@param listOfVisual	- list of CharacterCreationAppearaceVisual IDs for Visual
--@param visualType     - "CharacterCreationAppearanceVisual" or "CharacterCreationSharedVisual"
---return 				- list of names and CharacterCreationAppearaceVisual IDs
function Visual:addName(listOfVisual, visualType)

	local namesWithVisual = {}
    for _, item in pairs(listOfVisual) do
		local content = Ext.StaticData.Get(item,visualType)
        local handle = content.DisplayName.Handle.Handle
        local entry = {name = Ext.Loca.GetTranslatedString(handle), uuid = item}
        table.insert(namesWithVisual, entry)
	end
	return namesWithVisual
end


-- Get all Visuals in Gustav
---return 				- list of CharacterCreationAppearaceVisual IDs for Gustav
function Visual:getVanillaVisual()
 -- TODO
end

-- Get Mod Specific Visual
-- TODO - use tagging system 
--@param            - ModName (FolderName)
---return           - list of CharacterCreationAppearaceVisual IDs Visual
function Visual:getModVisual(modName)
    -- TODO
end


-- Get Mod that Visual belongs to
-- TODO - use tagging system 
--@param  			- Visual ID
---return 			- Name of Mod (Folder Name)

function Visual:getModByVisual(Visual)
-- TODO
end
----------------------------------------------------------------------------------------------------
-- 
-- 									Visual
-- 
----------------------------------------------------------------------------------------------------

-- TODO - split this up a bit

-- Get all allowed Visual for entity (Ex: all vulva for human)
-- @param list	     	- list of Visual to be filtered
-- @param uuis 	        - uuid of entity that will receive the Visual
--@param visualType     - "CharacterCreationAppearanceVisual" or "CharacterCreationSharedVisual"
---return 			    - List of IDs of CharacterCreationAppearaceVisuals
function Visual:getPermittedVisual(uuid, allVisual, visualType)

	_P("Visual:getPermittedVisual ", uuid, " ", visualType)

    local permittedVisual = {}
    
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
	-- TODO - add support for modded Visual for modded races

	local bodyShapeOverride = false

	if not RACES[race] then
		print(race, " is not Vanilla and does not have a Vanilla parent, " ..  
		" these custom races are currently not supported")
		print("using default human genitals")
		race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
	end

	-- Special Cases

	-- specific Githzerai feature (T3 and T4 are not strong, but normal)
	local bodyShapeOverride = false

	if Contains(raceTags, "7fa93b80-8ba5-4c1d-9b00-5dd20ced7f67") then
		bodyShapeOverride = true
	end

	-- Halsin is special boy
	if uuid == "S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323" then
		race = "0eb594cb-8820-4be6-a58d-8be7a1a98fba"
	end

	-- get Visual with same stats
	for _, visual in pairs(allVisual) do

		local G = Ext.StaticData.Get(visual, visualType)

		-- bodyshape overrides for modded races - TODO: find a better way to do this
		if bodyShapeOverride then
			bs = 0
		end

		gbt = GetPropertyOrDefault(G, "BodyType", bt)	
		gbs = GetPropertyOrDefault(G, "BodyShape", bs)
		gru = GetPropertyOrDefault(G, "RaceUUID", race)

		
		if (bt == gbt) and (bs == gbs) and (race == gru) then
			table.insert(permittedVisual, visual)
		end

    end
    

	-- TODO - only for genitals
    -- TODO - Clean up 
    -- Some lazy filtering to filter out default Visual (for genitals only)

    local result = {}

      for _, visual in ipairs(permittedVisual) do

        local content = Ext.StaticData.Get(visual,visualType)
        local handle = content.DisplayName.Handle.Handle
        local name = Ext.Loca.GetTranslatedString(handle)

        if name ~= "Default" then
            table.insert(result, visual)
        end
    end

	return result
end


-- Choose Visual from selection (Ex:  vulva from vulva a - c)
-- @param spell		- Name of the spell by which the Visual are filtered (vulva, penis, erection)
-- @param uuid 	    - uuid of entity that will receive the Visual
---return 			- ID of CharacterCreationAppearaceVisual
function Visual:getNextVisual(spell, uuid)

    local permittedVisual = Visual:getPermittedVisual(uuid)
    local filteredVisual = Visual:getFilteredVisual(spell, permittedVisual)

    if VisualChoice.uuid == uuid and VisualChoice.spell == spell then
        VisualChoice.index = (VisualChoice.index % #filteredVisual) + 1
    else
        VisualChoice = {uuid = uuid, spell = spell, index = 1}
    end

    if #filteredVisual == 0 then
        print("[BG3SX] No " , spell , " Visual available after filtering for this entity.")
        return nil
    else
        local selectedVisual = filteredVisual[VisualChoice.index]
        return selectedVisual
    end
end

----------------------------------------------------------------------------------------------------
-- 
-- 									Transformations
-- 
----------------------------------------------------------------------------------------------------

-- Get the current Visual of the entity
-- @param uuid 	    - uuid of entity that has a Visual
---return 			- tale of IDs of CharacterCreationAppearaceVisual
function Visual:getCurrentVisual(uuid)
	local characterVisuals =  Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationAppearance.Visuals
    return characterVisuals
end


-- Get the current Visual of the entity of a specific type
-- @param uuid 	   		 - uuid of entity that has a Visual
-- @param type 	   		 - type of the Visual
-- @param visualType     - "CharacterCreationAppearanceVisual" or "CharacterCreationSharedVisual"
---return 			     - tale of IDs of CharacterCreationAppearaceVisual
function Visual:getCurrentVisualOfType(uuid, type, visualType)
	local currentVisual = Visual:getCurrentVisual(uuid)
	local VisualOfType = Visual:getAllVisualsOfType(type, visualType)

    local visualsOfType = {}
	
	for _, visual in pairs(currentVisual)do
        if Contains(VisualOfType, visual) then
            table.insert(visualsOfType, visual)	
		end
    end
    return visualsOfType
end



-- Override the current Visual with the new one
-- @param newVisual	    - ID of CharacterCreationAppearaceVisual of type PrivateParts
-- @param uuid 	     	- uuid of entity that will receive the Visual
function Visual:overrideVisual(newVisual, uuid, type)
	local visualType = Visual:getType(newVisual)
	local currentVisual = Visual:getCurrentVisualOfType(uuid, type, visualType)

    for _, visual in pairs(currentVisual) do
	    if not (visual == newVisual) then
			-- Note: This is not a typo, It's actually called Ovirride
		    Osi.RemoveCustomVisualOvirride(uuid, visual) 
	    end
	end
	
	if newVisual then
		Osi.AddCustomVisualOverride(uuid, newVisual)
	end
end



function Visual:addVisual(uuid, visual)
    Osi.AddCustomVisualOverride(uuid, visual)
end


function Visual:removeVisual(uuid, visual)
     Osi.RemoveCustomVisualOvirride(uuid, visual)
end


