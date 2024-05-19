------------------------------------------------------------------------------------------------------------------------------
--
--
--                                         For handling visuals
--
--
---------------------------------------------------------------------------------------------------------------------------


-- CONSTRUCTOR
--------------------------------------------------------------

Armor = {}
Armor.__index = Armor



-- CONSTANTS
--------------------------------------------------------------


local ARMOR = {
    ["Helmet"] = true,
    ["Breast"] = true,
    ["Cloak"] = true,
    ["Underwear"] = true,
    ["Boots"] = true,
    ["Gloves"] = true,
    ["Amulet"] = true,
    ["VanityBody"] = true,
    ["VanityBoots"] = true
}


-- VARIABLES
--------------------------------------------------------------

local allEquipmentTypes = {}


-- GETTERS AND SETTERS
--------------------------------------------------------------


-- returns someVariable
--@return someVariable type
function Armor:getAllEquipmentTypes()
    return allEquipmentTypes
end



-- saves someVariable
--@param  value type - new value of some variable
function Armor:setAllEquipmentTypes(value)
    if value then
        allEquipmentTypes = value
    end
end



-- METHODS
--------------------------------------------------------------

-- TODO - concert camp to armor and vice versa


-- gets the earliest occurence of the "Slot" component
--@param stats string - searchTerm
function Armor:findSlot(stats) 
    local slot = GetPropertyOrDefault(stats, "Slot", nil) 
    if slot then
        return slot
    else
        local parent = GetPropertyOrDefault(stats, "Using", nil) 
        if parent then
            local parentStats = Ext.Stats.Get(parent, 2)
            return Armor:findSlot(parentStats)
        else
            return nil
        end
    end
end





-- iterates over all RootTemplates and finds the Armors (rings, cloaks etc.)
--@return allEquipment table - list of all equipments in the game
function Armor:getAllEquipment()

    local allEquipment = {}

    for id,entity in pairs(Ext.ServerTemplate.GetAllRootTemplates()) do

        local entityStats = GetPropertyOrDefault(entity, "Stats", nil) 
        if entityStats then
            local stats = Ext.Stats.Get(entityStats, 2)
            if stats then
                local slot = Armor:findSlot(stats) 
            
                if ARMOR[slot] then
                    -- entity.Id is the mapkey
                    local entry = {uuid = entity.Id, slot = slot, name = entity.Name, icon = entity.Icon}
                    table.insert(allEquipment, entry)
                end
            end
        end
    end

    return allEquipment
end


-- Returns the Armors of a certain type (rings, cloaks etc.)
--@param  type ARMOR - type of the armor
--@return allEquipmentOfType table - list of all uuids of a certain type
function Armor:getAllEquipmentOfType(type)

    local allEquipmentOfType = {}

    local allEquipment = Armor:getAllEquipmentTypes()

    for _, entry in pairs(allEquipment) do
        if entry.slot == type then
            table.insert(allEquipmentOfType, entry.uuid)
        end
    end
    return allEquipmentOfType 
end


-- equips a character with an armor
--@param character string
--@param mapkey string - mapkey
function equipArmor(character, mapkey)

    -- First we have to spawn an item in with the Mapkey 
    Osi.TemplateAddTo(character, mapkey, 1)


    -- Then we have to get the actual id
    local uuid = Osi.GetItemByTemplateInInventory(mapkey, character)

    -- Then we can equip
    Osi.Equip(character,uuid)

    -- TODO After that we probably should destroy unusued ones, or give the player a button or something

end




-- get all stats once per load and save
Armor:setAllEquipmentTypes(Armor:getAllEquipment())



-- LISTENERS
--------------------------------------------------------------








-- Research 

  -- check if I can stringify the entity name to only look at GameObjects
        -- local mapkey = entity.Id
    
    
        -- check either Stats or Name
        -- if it starts with "ARM_ it is armor. "ARM_Camp" or "ARM_Vanity for camp stuff
        -- MAG also is a prefix
    
    
            -- Spawned instance of the mapkey
            -- Ext.Entity.Get("3eba3df3-744d-6056-2e15-fda406b20eea").Equipable.Slot --- returns "Breats"
    
    
            -- I might be able to use equipmentTypes instead . Check Data/EquipmentTypes.lua for types
            -- however it only contains helmets
            -- local equipmentType = entity.EquipmentTypeID
    



        -- Access the stats (userdata)
        -- local stats = Ext.Stats.Get(stats, 2) -- 2 for armor - ex: "MAG_Bard_TempHP_Armor"
        -- -- TO access parent get "Using" 
        -- local using = stats.Using -- returns "ARM_Leather_Body"
        -- -- access those stats 
        -- local stats2 = Ext.Stats.Get(using, 2) -- returns userdata
        -- -- access its parent
        -- local using2 = stats2.Using -- returns "_Body"
        -- -- This has to be repeated until a stats is found that has component Slot
        -- -- As soon as Slot is found, stop recursion
        -- local parent = Ext.Stats.Get(using2, 2) -- returns userdata
        -- -- access its Slot components
        -- local slot = parent.Slot -- returns Breast
    
        -- Access the stats (userdata)
        -- local stats =  -- 2 for armor - ex: "MAG_Bard_TempHP_Armor"
        -- -- TO access parent get "Using" 
        -- local using = stats.Using -- returns "ARM_Leather_Body"
        -- -- access those stats 
        -- local stats2 = Ext.Stats.Get(using, 2) -- returns userdata
        -- -- access its parent
        -- local using2 = stats2.Using -- returns "_Body"
        -- -- This has to be repeated until a stats is found that has component Slot
        -- -- As soon as Slot is found, stop recursion
        -- local parent = Ext.Stats.Get(using2, 2) -- returns userdata
        -- -- access its Slot components
        -- local slot = parent.Slot -- returns Breast
    