------------------------------------------------------
--                                                  --
--                 UI Event Listener                --
--                                                  --
------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- RequestHost              - Client requests the HostCharacter
-- RequestCCVisuals, Type        - Client requests list of all CCAV of one type (ex: private parts)     
-- ChangeVisual,uuidNewItem   - Client requests removal of CCAV of type and addition of certain CCAV uuid
-- addVisual, uuidNewItem     - Client requests addition of certain CCAV uuid
-- removeVisual, uuidCCAV     - Client requests removal of CCAV

-- RequestCCVisualsOfType, type  - Client request lists of CCAVs of certian type (ex: "Private Parts")
-------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:

-- SendHost              - Server sends Osi.GetHostCharacter()
-- SendCCAV, items       - Server sends table of all CCAV of one type

-- InitialPopulate       - Server sends message on LevelGameplayStarted
--------------------------------------------------------------------------------------------------------------------------------------

-- TODO - move to own class


-- Get all permitted CCAVs of a type with names for an entity
local function getCCAVWithName(type, character)
    local CCAV = CCAV:new()
    local allCCAV = CCAV:getAllCCAVOfType(type)
    local CCAVOfType = CCAV:getPermittedCCAV(character, allCCAV)
    local CCAVWithName = CCAV:addName(CCAVOfType)
    return CCAVWithName
end

-- Get all permitted CCSVs of a type with names for an entity
local function getCCSVWithName(type, character)
    local CCSV = CCSV:new()
    local allCCSV = CCSV:getAllCCSVOfType(type)
    local CCSVOfType = CCSV:getPermittedCCSV(character, allCCSV)
    local CCSVWithName = CCSV:addName(CCSVOfType)
    return CCSVWithName
end


local function getAllVisualWithName(type,character)
    local allAV = getCCAVWithName(type,character)
    local allSV = getCCSVWithName(type,character)

    -- Append 
    for i, v in ipairs(allSV) do
        table.insert(allAV, v)
    end

    return allAV
end


-- get type of uuid
function getType(uuid)

    local ccav = Ext.StaticData.Get(uuid,"CharacterCreationAppearanceVisual")
    local ccsv = Ext.StaticData.Get(uuid,"CharacterCreationSharedVisual")

    if ccav then
        return "ccav", ccav.SlotName
    elseif ccsv then
        return "ccsv", ccsv.SlotName
    end

end

-----------------------------------------------------------------------------------



---------------------------------------------------------------------------------


-- Send Host Character on Request
Ext.Events.NetMessage:Subscribe(function(e)
    if (e.Channel == "RequestHost") then
        print("Buttonpress recieved")
        host = Osi.GetHostCharacter()
        Ext.Net.BroadcastMessage("SendHost", Ext.Json.Stringify(host)) 
    end
end)


-- TODO - I think items can be either CCAV or CCSV 
-- SO we scan for both (they need different methods since
-- CCAV are filtered by bodytype while CCSV are onyl filtered by race)
-- TODO: check what happens when we add the wrong races CCSV


-- TODO - filter based on HostCharacter/Clicked Character
-- TODO - make variable, currently only genitals supported
-- CCAV handling


Ext.Events.NetMessage:Subscribe(function(e)
    

    -------------------------------------------------
    --                                             --
    --   Client request content to populate UI     --
    --                                             --
    -------------------------------------------------

    if (e.Channel == "RequestCCVisualsOfType") then
        local type = Ext.Json.Parse(e.Payload)
        -- TODO - instead of hostCharacter, take clicked character 
        local doll = Osi.GetHostCharacter()

        -- Special case for genitals since there are double entries in vanilla
        if type == "Private Parts" then
            local genital = Genitals:new()
            local permittedGenitals = genital:getPermittedGenitals(doll)
            local genitalsWithName = Genitals:addName(permittedGenitals)
            local payload = {"Private Parts", genitalsWithName}
            Ext.Net.BroadcastMessage("SendCCAV",Ext.Json.Stringify(payload)) 
        else
            -- TODO - instead of hostCharacter, take clicked character 
            local character = Osi.GetHostCharacter()       
            local visuals = getAllVisualWithName(type,character)
            local payload = {type, visuals}
            Ext.Net.BroadcastMessage("SendCCAV",Ext.Json.Stringify(payload)) 
        end
    end



    ---------------------------------------------------
    --                                               --
    --   Client requests removal of Visual of type   --
    --     and addition of certain CCAV uuid         --
    --                                               --
    ---------------------------------------------------

    if (e.Channel == "ChangeVisual") then
        local payload = Ext.Json.Parse(e.Payload)
        local visualUuid = getUUID(Ext.Json.Parse(e.Payload))
        print("RECEIVED CHANGE VISUAL")

        if visualUuid then
            -- TODO - allow character to be sent via payload
            local character = Osi.GetHostCharacter()
            -- Determine type of uuid
            local class, type = getType(visualUuid)
            print("ATTENTION : SKIZ ASKED TO CHANGE CURRENT ", type ," TO ", visualUuid)

            if class == "ccav" then
                local CCAV = CCAV:new()
                CCAV:overrideCCAV(visualUuid, character, type)
            elseif class == "ccsv" then
                local CCSV = CCSV:new()
                CCSV:overrideCCSV(visualUuid, character, type)
            end
        else
            print("BUT THE UUID WAS EMPTY")
        end
    end


    ----------------------------------------------------------
    --                                                      --
    --   Client requests addition of certain Visual uuid    --
    --                                                      --
    ----------------------------------------------------------

    if (e.Channel == "addVisual") then
        local visual = getUUID(Ext.Json.Parse(e.Payload))
        Osi.AddCustomVisualOverride(Osi.GetHostCharacter(), visual)
    end


    --------------------------------------------------
    --                                              --
    --   Client requests removal of Visual          --
    --                                              --
    --------------------------------------------------

     if (e.Channel == "removeVisual") then
        local visual = getUUID(Ext.Json.Parse(e.Payload))
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


     --if (e.Channel == "UpdateWingColor") then
        --local wingColorRed = Ext.Json.Parse(e.Payload)

       -- local materialBank = Ext.Resource.Get("5e5b7f76-8fa5-16ff-0cf3-33d94f5ea041", "Material")
        --_P("[SERVER] Wing Colors:")
       -- _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
       -- local wingColors = materialBank.Instance.Parameters.Vector3Parameters[1].Value
       -- print("[SERVER] Color Red before payload input: ", wingColors[1])
       -- local wingColorRed = wingColorRed
       -- local wingColorGreen = wingColors[2]
       -- local wingColorBlue = wingColors[3]
        
       -- print("[SERVER] Red: ", wingColorRed)
       -- print("[SERVER] Green: ", wingColorGreen)
       -- print("[SERVER] Blue: ", wingColorBlue)
        
     --end