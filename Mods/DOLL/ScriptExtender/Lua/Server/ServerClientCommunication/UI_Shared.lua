----------------------------------------------------------------------
--                                                                  --
--                 UI Event Listener for Shared Events              --
--                                                                  --
----------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- RequestHost                   - Client requests the HostCharacter
-------------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:

-- SendHost              - Server sends Osi.GetHostCharacter()

--------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------

-- Send Host Character on Request
Ext.Events.NetMessage:Subscribe(function(e)
    if (e.Channel == "RequestHost") then
        host = Osi.GetHostCharacter()
        Ext.Net.BroadcastMessage("SendHost", Ext.Json.Stringify(host)) 
        Ext.IO.SaveFile("output.json", Ext.DumpExport(Ext.Entity.Get(host):GetAllComponents()))
    end
end)



-- TODO - filter based on HostCharacter/Clicked Character/NPC
