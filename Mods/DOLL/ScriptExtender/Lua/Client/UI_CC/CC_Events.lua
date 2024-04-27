headCCAV = {}
hairCCAV = {}
piercingCCAV = {}
beardCCAV = {}
hornCCAV = {}
tailCCAV = {}
genitalCCAV = {}
wingsCCAV = {}
------------------------------------------------------
--                                                  --
--               Server Event Listener              --
--                                                  --
------------------------------------------------------ 

        local function populateSelector(selector, table)
            for i, entry in pairs(table) do
                local name = entry.name
                local uuid = entry.uuid

                --print("[CC_Events.lua] - Entry: ", entry, " with name: ", name, " and UUID: ", uuid)

                selector.Options[i] = name .. "_" .. uuid

                --print("[CC_Events.lua] - Set Selector.Option: ", selector.Options[i])
            end
        end

--------------------------------------------------------


--                  Helper functions


--------------------------------------------------------

Ext.Events.NetMessage:Subscribe(function(e)

    -- Listens to OnLevelGameplayStarted event
    if (e.Channel == "PopulateRefresh") then
        Ext.Net.PostMessageToServer("RequestHost", "Hi")
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Head"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Hair"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Piercing"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Beard"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Horns"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Tail"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Private Parts"))
        Ext.Net.PostMessageToServer("RequestCCVisualsOfType", Ext.Json.Stringify("Wings"))

        print("[CC_Events.lua] - SEND START MESSAGE")
    end

    -- Recieves getHostCharacter()
    if (e.Channel == "SendHost") then
        print("[CC_Events.lua] - Host recieved")
        local msg = Ext.Json.Parse(e.Payload)
        print(msg)
    end

    -- Recieves available CCAVs based on requested type and controlled character race
    if (e.Channel == "SendVisual") then
        local payload = Ext.Json.Parse(e.Payload)

        print("------------------------------------------------")
        local type = payload[1]
        print("[CC_Events.lua] - SendVisual recieved of Type: ")
        print("[CC_Events.lua] - ", type)
        local listOfUUIDs = payload[2]

        if type == "Head" then
            headCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Head Recieved ", uuid)
                table.insert(headCCAV,uuid)
            end
            headSelector.Options = {}
            populateSelector(headSelector, headCCAV)
            print("All Heads Populated")
        elseif type == "Hair" then
            hairCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Hair Recieved ", uuid)
                table.insert(hairCCAV,uuid)
            end
            hairSelector.Options = {}
            populateSelector(hairSelector, hairCCAV)
            print("All Hairstyle Populated")
        elseif type == "Piercing" then
            piercingCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Tail Recieved ", uuid)
                table.insert(piercingCCAV,uuid)
            end
            piercingSelector.Options = {}
            populateSelector(piercingSelector, piercingCCAV)
            print("All Piercings Populated")
        elseif type == "Beard" then
            beardCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Beard Recieved ", uuid)
                table.insert(beardCCAV,uuid)
            end
            beardSelector.Options = {}
            populateSelector(beardSelector, beardCCAV)
            print("All Beards Populated")
        elseif type == "Horns" then
            hornCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Horns Recieved ", uuid)
                table.insert(hornCCAV,uuid)
            end
            hornSelector.Options = {}
            populateSelector(hornSelector, hornCCAV)
            print("All Horns Populated")
        elseif type == "Tail" then
            tailCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Tail Recieved ", uuid)
                table.insert(tailCCAV,uuid)
            end
            tailSelector.Options = {}
            populateSelector(tailSelector, tailCCAV)
            print("All Tails Populated")
        elseif type == "Private Parts" then
            genitalCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Genital Recieved ", uuid)
                table.insert(genitalCCAV,uuid)
            end
            genitalSelector.Options = {}
            populateSelector(genitalSelector, genitalCCAV)
            print("All Genitals Populated")
        elseif type == "Wings" then
            wingsCCAV = {}
            for i,uuid in pairs(listOfUUIDs) do
                -- print("[CC_Events.lua] - Wings Recieved ", uuid)
                table.insert(wingsCCAV,uuid)
            end
            wingsSelector.Options = {}
            populateSelector(wingsSelector, wingsCCAV)
            print("All Wings Populated")



            if #beardCCAV >= 1 then
                CCBeardSep.Visible = true
                CCBeard.Visible = true
            elseif not #beardCCAV then
                CCBeardSep.Visible = false
                CCBeard.Visible = false
            end
            if #hornCCAV >= 1 then
                CCHornsSep.Visible = true
                CCHorns.Visible = true
            elseif not #hornCCAV then
                CCHornsSep.Visible = false
                CCHorns.Visible = false
            end
            if #tailCCAV >= 1 then
                CCTailsSep.Visible = true
                CCTails.Visible = true
            elseif not #tailCCAV then
                CCTailsSep.Visible = false
                CCTails.Visible = false
            end
            if #wingsCCAV >= 1 then
                CCWingsSep.Visible = true
                CCWings.Visible = true
            elseif not #wingsCCAV then
                CCWingsSep.Visible = false
                CCWings.Visible = false
            end
        end



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

            TestText.Label = "CCAVs/CCSVs Recieved"
    end
    print("-- All Selectors populated! --")

end)