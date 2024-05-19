---------------------------------------------------------------
--                                                           --
--                 UI Event Listener for Armor               --
--                                                           --
---------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- "InitEquipmentTable"         - Client requests Equipments
--                              - CLient requests to dress  the character in a certain equipment

-------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:


-- "PopulateEquipment"   - Server sends Equipments of a certain type

--------------------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------


Ext.Events.NetMessage:Subscribe(function(e)

    -----------------------------------------------------------------
    --                                                             --
    --   Client requests to receive armor  of certain type         --
    --                                                             --
    ------------------------------------------------------------------

    if (e.Channel == "InitEquipmentTable") then
        local slot = Ext.Json.Parse(e.Payload)
        local armor = Armor:getAllEquipmentOfType(slot)
        local payload = {slot = slot, data = armor}


        print("[UI_Armor.lua] - PopulateEquipment Event sending to client")

        Ext.Net.BroadcastMessage("PopulateEquipment",Ext.Json.Stringify(payload)) 
    end


    --------------------------------------------------
    --                                              --
    --   Client requests to dress character         --
    --                                              --
    --------------------------------------------------

    if (e.Channel == "?") then

        local mapkey = Ext.Json.Parse(e.Payload)
        Armor.equipArmor(Osi.GetHostCharacter(), mapkey)
    end

end)



