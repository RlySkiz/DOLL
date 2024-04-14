PartyTable = {}

------------------------------------------------------
--                                                  --
--               Server Event Listener              --
--    (For events which reflect change in IMGUI)    --
--                                                  --
------------------------------------------------------ 

Ext.Events.NetMessage:Subscribe(function(e) 

    if (e.Channel == "PopulateUI") then
        combo.Options = {}
        print("UI POPULATION")
        StupidJson = Ext.Json.Parse(e.Payload)
        PartyTable = StupidJson
        for i=1,#StupidJson,1 do
            combo.Options[i] = Ext.Loca.GetTranslatedString(Ext.Entity.Get(StupidJson[i][1]).DisplayName.NameKey.Handle.Handle)
        end
    end
end)