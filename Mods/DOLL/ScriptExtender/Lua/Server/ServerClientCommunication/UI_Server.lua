------------------------------------------------------
--                                                  --
--                 UI Event Listener                --
--                                                  --
------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- RequestHost                   - Client requests the HostCharacter
-- RequestCCVisuals, Type        - Client requests list of all Visual of one type (ex: private parts)     
-- ChangeVisual,uuidNewItem      - Client requests removal of Visual of type and addition of certain Visual uuid
-- addVisual, uuidNewItem        - Client requests addition of certain Visual uuid
-- removeVisual, uuidVisual      - Client requests removal of Visual

-- RequestCCVisualsOfType, type  - Client request lists of Visuals of certian type (ex: "Private Parts")


-- "DisableFilter"              - Client requests to disable race filter
-- "EnableFilter"               - Client requests to filter all options by bodytype, bodyshape and race

-------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:

-- SendHost              - Server sends Osi.GetHostCharacter()
-- SendVisual, items      - Server sends table of all Visual of one type

-- InitialPopulate       - Server sends message on LevelGameplayStarted
--------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------

-- Classes

local vis = Visual:new()


---------------------------------------------------------------------------------

-- Variables


local filter = true


--------------------------------------------------------------------------------

-- Send Host Character on Request
Ext.Events.NetMessage:Subscribe(function(e)
    if (e.Channel == "RequestHost") then
        host = Osi.GetHostCharacter()
        Ext.Net.BroadcastMessage("SendHost", Ext.Json.Stringify(host)) 
        Ext.IO.SaveFile("output.json", Ext.DumpExport(Ext.Entity.Get(host):GetAllComponents()))
    end
end)



-- TODO - filter based on HostCharacter/Clicked Character/NPC



Ext.Events.NetMessage:Subscribe(function(e)


    ----------------------------------------------------
    --                                                --
    --   Client request to enable or disable filter   --
    --                                                --
    -----------------------------------------------------

    -- TODO - Categories don't seem to populate that is
    -- disabling filter as human doesnt give tails until one dragonborn has been selected
    if (e.Channel == "DisableFilter") then
        filter = false
        Ext.Net.BroadcastMessage("PopulateRefresh", "LevelGameplayStarted")
    end

    if (e.Channel == "EnableFilter") then
        filter = true
        Ext.Net.BroadcastMessage("PopulateRefresh", "LevelGameplayStarted")
    end

    -------------------------------------------------
    --                                             --
    --   Client request content to populate UI     --
    --                                             --
    -------------------------------------------------

    -- TODO - hair might not get removed correctly, maybe handle differently? 
    if (e.Channel == "RequestCCVisualsOfType") then
        local type = Ext.Json.Parse(e.Payload)
        -- TODO - instead of hostCharacter, take clicked character 
        local doll = Osi.GetHostCharacter()
        local character = Osi.GetHostCharacter()       
        local visuals = vis:getAllVisualsWithName(type,character, filter)
        local payload = {type, visuals}
        Ext.Net.BroadcastMessage("SendVisual",Ext.Json.Stringify(payload)) 
    end


    ---------------------------------------------------
    --                                               --
    --   Client requests removal of Visual of type   --
    --     and addition of certain Visual uuid         --
    --                                               --
    ---------------------------------------------------

    if (e.Channel == "ChangeVisual") then
        local payload = Ext.Json.Parse(e.Payload)
        local visualUuid = GetUUID(Ext.Json.Parse(e.Payload))

        if visualUuid then
            -- TODO - allow character to be sent via payload
            local character = Osi.GetHostCharacter()
            -- Determine type of uuid
            local visualType, type = vis:getType(visualUuid)

            vis:overrideVisual(visualUuid, character, type)
        end
    end


    ----------------------------------------------------------
    --                                                      --
    --   Client requests addition of certain Visual uuid    --
    --                                                      --
    ----------------------------------------------------------

    if (e.Channel == "addVisual") then
        local visual = GetUUID(Ext.Json.Parse(e.Payload))
        Osi.AddCustomVisualOverride(Osi.GetHostCharacter(), visual)
    end


    --------------------------------------------------
    --                                              --
    --   Client requests removal of Visual          --
    --                                              --
    --------------------------------------------------

     if (e.Channel == "removeVisual") then
        local visual = GetUUID(Ext.Json.Parse(e.Payload))
        Osi.AddCustomVisualOvirride(Osi.GetHostCharacter(), visual)
     end

end)



    -----------------------------------------------------------------------
    --                                                                   --
    --   Send Client Signal to send population request on Level Loaded   --
    --                                                                   --
    -----------------------------------------------------------------------

Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(_, _)  
    Ext.Net.BroadcastMessage("PopulateRefresh", "LevelGameplayStarted")
end)

    ------------------------------------------------------------------------------------
    --                                                                                --
    --   Send Client Signal to send population request on HostCharacter switched      --
    --                                                                                --
    ------------------------------------------------------------------------------------

Ext.Osiris.RegisterListener("GainedControl", 1, "after", function(target)  
    Ext.Net.BroadcastMessage("PopulateRefresh", "GainedControl")
end)




-- Skiz wing coloring 
-- Ext.Events.NetMessage:Subscribe(function(e)

--      if (e.Channel == "UpdateWingColor") then
--        local wingColorRed = Ext.Json.Parse(e.Payload)

--        local materialBank = Ext.Resource.Get("5e5b7f76-8fa5-16ff-0cf3-33d94f5ea041", "Material")
--         _P("[SERVER] Wing Colors:")
--        _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
--        local wingColors = materialBank.Instance.Parameters.Vector3Parameters[1].Value



    --leave these as comments
    --    print("[SERVER] Color Red before payload input: ", wingColors[1])
    --    local wingColorRed = wingColorRed
    --    local wingColorGreen = wingColors[2]
    --    local wingColorBlue = wingColors[3]
        
    --    print("[SERVER] Red: ", wingColorRed)
    --    print("[SERVER] Green: ", wingColorGreen)
    --    print("[SERVER] Blue: ", wingColorBlue)
        
--      end
-- end)