-----------------------------------------------------------------
--                                                             --
--                 UI Event Listener for Visuals               --
--                                                             --
-----------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- "RequestSlotData", Slot        - Client requests list of all Visual of one type (ex: private parts)     
-- ChangeVisual,uuidNewItem      - Client requests removal of Visual of type and addition of certain Visual uuid
-- addVisual, uuidNewItem        - Client requests addition of certain Visual uuid
-- removeVisual, uuidVisual      - Client requests removal of Visual



-- "DisableFilter"              - Client requests to disable race filter
-- "EnableFilter"               - Client requests to filter all options by bodytype, bodyshape and race

-------------------------------------------------------------------------------------------------------------------------------------





--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:

-- PopulateSlotTables, items      - Server sends table of all Visual of one type

-- InitialPopulate       - Server sends message on LevelGameplayStarted

--------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------
--
--                                     CONSTANTS
--
--
--------------------------------------------------------------------------------------------

local VISUALS = {
    ["Head"] = true,
    ["Private Parts"] = true,
    ["Piercing"] = true,
    ["Hair"] = true,
    ["Beard"] = true,
    ["Horns"] = true,
    ["Amulet"] = true,
    ["Tail"] = true,
}



-- Classes

local vis = Visual:new()


---------------------------------------------------------------------------------

-- Variables


local filter = true


--------------------------------------------------------------------------------




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

    -- TODO - filter based on HostCharacter/Clicked Character/NPC


    -------------------------------------------------
    --                                             --
    --   Client request content to populate UI     --
    --                                             --
    -------------------------------------------------
        

    if (e.Channel == "RequestSlotData") then

        local slot = Ext.Json.Parse(e.Payload)

        if VISUALS[slot] then

            -- TODO - instead of hostCharacter, take clicked character 
            local doll = Osi.GetHostCharacter()
            local visuals = Visual:getAllVisualsWithName(slot,doll, filter)
            local payload = {slot = slot, data = visuals}
            Ext.Net.BroadcastMessage("PopulateSlotTables",Ext.Json.Stringify(payload))

        end
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