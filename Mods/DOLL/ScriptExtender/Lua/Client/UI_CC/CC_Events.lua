genitalCCAV = {}
piercingCCAV = {}
------------------------------------------------------
--                                                  --
--               Server Event Listener              --
--                                                  --
------------------------------------------------------ 

        local function populateSelector(selector, table)
            for i, entry in pairs(table) do
                local name = entry.name
                local uuid = entry.uuid
    
                print("[CC_Events.lua] - Entry: ", entry, " with name: ", name, " and UUID: ", uuid)
    
                selector.Options[i] = name .. "_" .. uuid
    
                print("[CC_Events.lua] - Set Selector.Option: ", selector.Options[i])  
            end
        end

--------------------------------------------------------


--                  Helper functions


--------------------------------------------------------

Ext.Events.NetMessage:Subscribe(function(e)

    -- Listens to OnLevelGameplayStarted event
    if (e.Channel == "PopulateRefresh") then
        Ext.Net.PostMessageToServer("RequestHost", "Hi")
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Private Parts"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Tail")) -- Piercings/Wings
        print("[CC_Events.lua] - SEND START MESSAGE")
    end

    -- Recieves getHostCharacter()
    if (e.Channel == "SendHost") then
        print("[CC_Events.lua] - Host recieved")
        local msg = Ext.Json.Parse(e.Payload)
        print(msg)
    end

    -- Recieves available CCAVs based on requested type and controlled character race
    if (e.Channel == "SendCCAV") then
        local payload = Ext.Json.Parse(e.Payload)

        print("----------------")
        print("[CC_Events.lua] - SendCCAV Event recieved")
        print("[CC_Events.lua] - Payload Print:")
        print(e.Payload)
        print("----------------")
        print("[CC_Events.lua] - Payload Dump:")
        _D(e.Payload)
        print("----------------")


        local type = payload[1]
        print("[CC_Events.lua] - SendCCAV Type: ")
        print("[CC_Events.lua] - ", type)
        local listOfUUIDs = payload[2]


        if type == "Private Parts" then
            genitalCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                print("[CC_Events.lua] - Genital Recieved ", uuid)
                table.insert(genitalCCAV,uuid)
            end
        elseif type == "Tail" then
            piercingCCAV = {}
            wingsCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                print("[CC_Events.lua] - Tail Recieved ", uuid)
                table.insert(piercingCCAV,uuid)

                print("[CC_Events.lua] - Wings Recieved ", uuid)
                table.insert(wingsCCAV,uuid)

            end
            if #wingsCCAV >= 1 then
                CCWingsSep.Visible = true
                CCWings.Visible = true
            elseif not #wingsCCAV then
                CCWingsSep.Visible = false
                CCWings.Visible = false
            end
        end

        genitalSelector.Options = {}
        populateSelector(genitalSelector, genitalCCAV)
        piercingSelector.Options = {}
        populateSelector(piercingSelector, piercingCCAV)
        wingsSelector.Options = {}
        populateSelector(wingsSelector, wingsCCAV)

        print("All Selectors populated!")

        -- for i, entry in pairs(genitalCCAV) do
        --     local name = entry.name
        --     local uuid = entry.uuid

        --     print("[CC_Events.lua] - Entry: ", entry, " with name: ", name, " and UUID: ", uuid)

        --     genitalSelector.Options[i] = name .. "_" .. uuid

        --     print("[CC_Events.lua] - Set genitalSelector.Option: ", genitalSelector.Options[i])

        -- end

        -- for i, entry in pairs(piercingCCAV) do
        --     local name = entry.name
        --     local uuid = entry.uuid

        --     print("[CC_Events.lua] - Entry: ", entry, " with name: ", name, " and UUID: ", uuid)

        --     piercingSelector.Options[i] = name .. "_" .. uuid

        --     print("[CC_Events.lua] - Set piercingSelector.Option: ", piercingSelector.Options[i])

        -- end

        -- for i, entry in pairs(wingsCCAV) do
        --     local name = entry.name
        --     local uuid = entry.uuid

        --     print("[CC_Events.lua] - Entry: ", entry, " with name: ", name, " and UUID: ", uuid)

        --     wingsSelector.Options[i] = name .. "_" .. uuid

        --     print("[CC_Events.lua] - Set wingsSelector.Option: ", wingsSelector.Options[i])

        -- end

        TestText.Label = "Genitals Recieved"
    end

end)