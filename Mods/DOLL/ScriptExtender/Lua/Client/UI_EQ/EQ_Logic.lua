------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 

------------------------------------------------------
--                                                  --
--                    Functions                     --
--                                                  --
------------------------------------------------------

--#region Functions
local function populateEquipmentTables()
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Helmet"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Cloak"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Breast"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Gloves"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Boots"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("VanityBody"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("VanityBoots"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Underwear"))
    Ext.Net.PostMessageToServer("InitEquipmentTable", Ext.Json.Stringify("Amulet"))
    print("[EQ_Logic.lua] - 'InitEquipmentTable' Event send to server")
end



--#endregion

--#region Key Input Event Listener
Ext.Events.KeyInput:Subscribe(function (e)

    if e.Event == "KeyDown" and e.Repeat == false then

        if e.Key == "NUM_6" then
            _P("Pressed 6")
            populateEquipmentTables()
        end
    end
end)
--#endregion
