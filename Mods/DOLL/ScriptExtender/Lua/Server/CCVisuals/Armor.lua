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



-- PERISTENT VARIABLES
--------------------------------------------------------------

PersistentVars = {}


-- GETTERS AND SETTERS
--------------------------------------------------------------


-- returns equipment
--@return armor table
function Armor:getAllEquipmentTypes()
    --return allEquipmentTypes
    return PersistentVars['armor']
end



-- saves equipment
--@param  value table 
function Armor:setAllEquipmentTypes(value)
    if value then
        PersistentVars['armor'] = value
    end
end



-- METHODS
--------------------------------------------------------------


-- Original Code by Norbyte, modified by me (˶◕‿◕˶✿)
-- iterates over all RootTemplates and finds the Armors (rings, cloaks etc.)
--@return allEquipment table - list of all equipments in the game
function Armor:getAllEquipment()

    local allEquipment = {}
    -- used for filtering
    local setOfMapkeys = {}

    local allRootTemplates = Ext.Template.GetAllRootTemplates()

    for id, statsName in pairs(Ext.Stats.GetStats()) do
        local stats = Ext.Stats.Get(statsName)      
        
        if (stats.ModifierList == "Armor") then --and (stats.Type == "item") then -- stats is userdata
            -- check matching rootTemplate by Name
            for id,template in pairs(allRootTemplates) do
            

                if template.TemplateType == "item" and (statsName == template.Stats) then

                    local template = Ext.Template.GetRootTemplate(stats.RootTemplate)
                    local name = Ext.Loca.GetTranslatedString(template.DisplayName.Handle.Handle)
                    -- entity.Id is the mapkey
                    if setOfMapkeys[template.Id] == nil then
                        local entry = {uuid = template.Id, slot = stats.Slot, name = statsName, icon = template.Icon}
                        table.insert(allEquipment, entry)
                        setOfMapkeys[template.Id] = true
                    end
                end
            end
        end
    end
    return allEquipment
end


--------------------------------------------------------------

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

--------------------------------------------------------------


-- get all equipment
--Armor:setAllTextureEntities(Armor:getAllTextures())
function Armor:initializeEquipment()
    -- reset persVars
    PersistentVars['armor'] = {}
    Armor:setAllEquipmentTypes(Armor:getAllEquipment())
end


--------------------------------------------------------------

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
    Osi.TimerLaunch("AddedItemToInventory",100)


    -- TODO After that we probably should destroy unusued ones, or give the player a button or something

end


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


-- EXECUTION/MAIN 
--------------------------------------------------------------

-- get all stats once if its not saved in persvars yet or if the user requests a new load
-- a new load has to be triggered when visual mods are loaded/deleted


-- load persVars
function OnSessionLoaded()


        if not PersistentVars['armor'] then
            PersistentVars['armor'] = {}
        end

        -- if the persvars are empty, initialize. ) 
        -- Should only happen once per save
        if #PersistentVars['armor'] == 0 then
            _P("Initializing persvars")
            _P("THIS SHOULD ONLY HAPPEN ONCE")
        Armor:initializeEquipment()
        end
end

    

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)