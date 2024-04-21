------------------------------------------------------
--                                                  --
--               Server Event Listener              --
--                                                  --
------------------------------------------------------ 

Ext.Events.NetMessage:Subscribe(function(e) 

    -- Listens to OnLevelGameplayStarted event
    if (e.Channel == "PopulateRefresh") then
        Ext.Net.PostMessageToServer("RequestHost", "Hi")
        Ext.Net.PostMessageToServer("RequestCCAV", Ext.Json.Stringify("Private Parts"))
        Ext.Net.PostMessageToServer("RequestCCAV", Ext.Json.Stringify("Piercing"))
        print("SEND START MESSAGE")
    end

    -- Recieves getHostCharacter()
    if (e.Channel == "SendHost") then
        print("Host recieved")
        local msg = Ext.Json.Parse(e.Payload)
        print(msg)
    end

    -- Recieves available CCAVs based on requested type and controlled character race
    if (e.Channel == "SendCCAV") then
        print("----------------")
        print("CCAV recieved")
        print("CCAV Print:")
        print(e.Payload)
        print("CCAV Dump:")
        _D(e.Payload)
        

        genitalSelector.Options = {}
        piercingSelector.Options = {}
        local genitalTable = Ext.Json.Parse(e.Payload)
        

        print("Parsed Payload:")
        print(genitalTable)
        _D(genitalTable)
        
        print("Genitals Recieved:")
        for i, entry in pairs(genitalTable) do
            local name = entry.name
            local uuid = entry.uuid
            
            print("Entry: ", entry, " with name: ", name, " and UUID: ", uuid)

            genitalSelector.Options[i] = name .. "_" .. uuid

            print("genitalSelector.Option: ", genitalSelector.Options[i])
            
        end

        TestText.Label = "Genitals Recieved"
    end

end)