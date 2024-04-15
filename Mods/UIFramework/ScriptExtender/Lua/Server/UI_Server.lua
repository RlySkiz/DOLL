------------------------------------------------------
--                                                  --
--                 UI Event Listener                --
--                                                  --
------------------------------------------------------

-- Ext.Events.NetMessage:Subscribe(function(e) 
--     local player = Osi.GetHostCharacter()

--     if (e.Channel == "ChangeDaName") then
--         NewChar = Ext.Json.Parse(e.Payload)
--         _D(NewChar)
--         SetStoryDisplayName(NewChar["UUID"][1], NewChar["NewName"])
--         -- modvar stuff 
--     end

--     if (e.Channel == "GiveTableUpdate") then
--         Ext.Net.BroadcastMessage("PopulateUI", Ext.Json.Stringify(Osi.DB_PartyMembers:Get(nil))) 
--     end
-- end)