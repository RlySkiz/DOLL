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
local allTextureEntities = {}


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

----------------------------------------------------------

-- saves someVariable
--@param  value type - new value of some variable
function Armor:getAllTexturesEntities()
   return allTextureEntities
end
    
    -- saves someVariable
--@param  value type - new value of some variable
function Armor:setAllTextureEntities(value)
    if value then
        allTextureEntities = value
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



-- retrieves all Texture entities in the game
--@return allTextures table - list of all texture entities in the game
function Armor:getAllTextures()
    allTextures = {}
    local allTextureIds = Ext.Resource.GetAll("Texture")
    for _, uuid in pairs(allTextureIds) do
        local thisTexture =  Ext.Resource.Get(uuid, "Texture") -- TODO - this return the incorrect data, it does not include name
        table.insert(allTextures, thisTexture)
    end
    return allTextures
end

-- iterates over all RootTemplates and finds the Armors (rings, cloaks etc.)
--@return allEquipment table - list of all equipments in the game
function Armor:getAllEquipment()

    local allEquipment = {}

    local allTextures = Armor:getAllTexturesEntities()

    -- Name of texture bank has to be === Icon of Stats Resource

    for id,entity in pairs(Ext.ServerTemplate.GetAllRootTemplates()) do

        local entityStats = GetPropertyOrDefault(entity, "Stats", nil) 
        if entityStats then
            local stats = Ext.Stats.Get(entityStats, 2)
            if stats then
                local slot = Armor:findSlot(stats) 
                
                -- current entity is of type armor
                if ARMOR[slot] then

                    -- get the icon (texture) uuid
                    --local iconUUID 
                    --for _, texture in pairs(allTextures) do 
                        -- _D(texture)
                        --_P("Texture Name is ", texture.Name)
                        --if texture.Name == entity.Icon then
                          --  _P("Found texture")
                           -- iconUUID = texture.ID
                        --end
                    --end

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
            table.insert(allEquipmentOfType, entry)
        end
    end
    return allEquipmentOfType 
end


-- TODO - this will break in MP. Can timer carry information? Or register who has clicked?
-- item that is currently being equipped
-- key uuid of character
-- value mapkey of equipment
local equiping = {}

-- equips a character with an armor
--@param character string
--@param mapkey string - mapkey
function Armor:equipArmor(character, mapkey)

    table.insert(equiping, {character = character, mapkey = mapkey})

    -- First we have to spawn an item in with the Mapkey 
    Osi.TemplateAddTo(mapkey, character, 1)

    -- Delay since else the function is too fast for the item to get added 
    Osi.TimerLaunch("AddedItemToInventory",10000)


    -- TODO After that we probably should destroy unusued ones, or give the player a button or something

end

-- get all stats once per load and save
Armor:setAllTextureEntities(Armor:getAllTextures())
Armor:setAllEquipmentTypes(Armor:getAllEquipment())


-- LISTENERS
--------------------------------------------------------------

 Ext.Osiris.RegisterListener("TimerFinished",1,"after",function(event) 
  if (event == "AddedItemToInventory") then
    _P("ten second has passed")

    for  _, entry in pairs(equiping) do
        character = entry.character
        mapkey = entry.mapkey

        -- Then we have to get the actual id
        _P("local uuid = Osi.GetItemByTemplateInInventory( ",mapkey ,", ", character ," ) ")
        local uuid = Osi.GetItemByTemplateInInventory(mapkey, character)
        _P("Id of spawned item is ", uuid)

        -- Then we can equip
        Osi.Equip(character,uuid)
        end
    end
end)








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
    