---------------------------------------------------------------
--                                                           --
--                 UI Event Listener for Armor               --
--                                                           --
---------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- "RequestSlotData"         - Client requests Equipments
--                              - CLient requests to dress  the character in a certain equipment

-------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:


-- "PopulateSlotTables"   - Server sends Equipments of a certain type

--------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--
--                                     CONSTANTS
--
--
--------------------------------------------------------------------------------------------


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

-----------------------------------------------------------------------------------


Ext.Events.NetMessage:Subscribe(function(e)


    -------------------------------------------------
    --                                             --
    --   Client request content to populate UI     --
    --                                             --
    -------------------------------------------------

    if (e.Channel == "RequestSlotData") then
        local slot = Ext.Json.Parse(e.Payload)

        if ARMOR[slot] then

            local armor = Armor:getAllEquipmentOfType(slot)
            local payload = {slot = slot, data = armor}
            Ext.Net.BroadcastMessage("PopulateSlotTables",Ext.Json.Stringify(payload))
        end
    end


    --------------------------------------------------
    --                                              --
    --   Client requests to dress character         --
    --                                              --
    --------------------------------------------------

    if (e.Channel == "RequestEquipmentChange") then
        local mapkey = Ext.Json.Parse(e.Payload)
        local doll = Osi.GetHostCharacter()
        Armor:equipArmor(doll, mapkey)
    end

end)



