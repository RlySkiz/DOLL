------------------------------------------------------
--                                                  --
--                 UI Event Listener                --
--                                                  --
------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------------

-- Events to be received:

-- RequestHost              - Client requests the HostCharacter
-- RequestCCAV, Type        - Client requests list of all CCAV of one type (ex: private parts)     
-- changeCCAV,uuidNewItem   - Client requests removal of CCAV of type and addition of certain CCAV uuid
-- addCCAV, uuidNewItem     - Client requests addition of certain CCAV uuid
-- removeCCAV, uuidCCAV     - Client requests removal of CCAV

-- RequestCCAVOfType, type  - Client request lists of CCAVs of certian type (ex: "Private Parts")
-------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------

-- Events to be sent:

-- SendHost              - Server sends Osi.GetHostCharacter()
-- SendCCAV, items       - Server sends table of all CCAV of one type

-- InitialPopulate       - Server sends message on LevelGameplayStarted
--------------------------------------------------------------------------------------------------------------------------------------

-- Send Host Character on Request
Ext.Events.NetMessage:Subscribe(function(e)
    if (e.Channel == "RequestHost") then
        print("Buttonpress recieved")
        host = Osi.GetHostCharacter()
        Ext.Net.BroadcastMessage("SendHost", Ext.Json.Stringify(host)) 
    end
end)


-- TODO - filter based on HostCharacter/Clicked Character
-- TODO - make variable, currently only genitals supported
-- CCAV handling
Ext.Events.NetMessage:Subscribe(function(e)
    if (e.Channel == "RequestCCAV") then
        local type = Ext.Json.Parse(e.Payload)
        print("Requested CCAV of Type: ", type)
        -- TODO - instead of hostCharacter, take clicked character 
        local doll = Osi.GetHostCharacter()

        if type == "Private Parts" then
            -- Creating an instance of Genitals
            local genital = Genitals:new()
            local permittedGenitals = genital:getPermittedGenitals(doll)
            _P("Permitted Genitals")
            _D(permittedGenitals)    
            local payload = {}

            for _, genital in pairs(permittedGenitals) do
                local content = Ext.StaticData.Get(genital,"CharacterCreationAppearanceVisual")
                local handle = content.DisplayName.Handle.Handle
                local entry = {name = Ext.Loca.GetTranslatedString(handle), uuid = genital}
                table.insert(payload, entry)

                return payload
            end
        end

        if type == "Piercing" then
                -- Creating an instance of Piercings
                local piercing = Piercings:new()
                local permittedPiercings = piercing:getPermittedPiercings(doll)
                _P("Permitted Piercings")
                _D(permittedPiercings)    
                local payload = {}

                for _, piercing in pairs(permittedPiercings) do
                    local content = Ext.StaticData.Get(piercing,"CharacterCreationAppearanceVisual")
                    local handle = content.DisplayName.Handle.Handle
                    local entry = {name = Ext.Loca.GetTranslatedString(handle), uuid = piercing}
                    table.insert(payload, entry)

                    return payload
                end
        end
        Ext.Net.BroadcastMessage("SendCCAV",Ext.Json.Stringify(payload)) 
    end

    -- Client requests removal of CCAV of type and addition of certain CCAV uuid
    if (e.Channel == "changeCCAV") then
        local payload = Ext.Json.Parse(e.Payload)
        _P("Payload received:")
        _D(payload)
        local genitalUuid = getUUID(Ext.Json.Parse(e.Payload))
        -- TODO - allow character to be sent via payload
        local character = Osi.GetHostCharacter()
        -- Determine type of uuid
        local content = Ext.StaticData.Get(genitalUuid,"CharacterCreationAppearanceVisual")
        local type = content.SlotName
        -- TODO - make more variable, currently only works for genitals
        local genitals = Genitals:new()  
        genitals:overrideGenital(genitalUuid, character)

    end

    -- Client requests addition of certain CCAV uuid
    if (e.Channel == "addCCAV") then
        local ccav = getUUID(Ext.Json.Parse(e.Payload))
        local CCAV = CCAV:new()
        CCAV:addCCAV(Osi.GetHostCharacter(), ccav)
    end

    -- Client requests removal of CCAV
     if (e.Channel == "removeCCAV") then
        local ccav = getUUID(Ext.Json.Parse(e.Payload))
        local CCAV = CCAV:new()
        CCAV:RemoveCCAV(Osi.GetHostCharacter(),ccav)
     end


    -- TODO - allow receiving of character uuid
    -- Client request lists of CCAVs of certian type (ex: "Private Parts")
     if (e.Channel == "RequestCCAVOfType") then
        local type = Ext.Json.Parse(e.Payload)
        print("Requested CCAV Type: ", type)
        local CCAV = CCAV:new()
        local allCCAV = CCAV:getAllCCAVOfType(type)
        local payload = CCAV:getPermittedCCAV(Osi.GetHostCharacter(), allCCAV)
        Ext.Net.BroadcastMessage("SendCCAV",Ext.Json.Stringify(payload)) 
     end

     if (e.Channel == "UpdateWingColor") then
        local wingColorRed = Ext.Json.Parse(e.Payload)

        local materialBank = Ext.Resource.Get("5e5b7f76-8fa5-16ff-0cf3-33d94f5ea041", "Material")
        _P("[SERVER] Wing Colors:")
        _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
        local wingColors = materialBank.Instance.Parameters.Vector3Parameters[1].Value
        print("[SERVER] Color Red before payload input: ", wingColors[1])
        local wingColorRed = wingColorRed
        local wingColorGreen = wingColors[2]
        local wingColorBlue = wingColors[3]
        
        print("[SERVER] Red: ", wingColorRed)
        print("[SERVER] Green: ", wingColorGreen)
        print("[SERVER] Blue: ", wingColorBlue)
        
     end

end)


Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(_, _)  
    Ext.Net.BroadcastMessage("PopulateRefresh", "LevelGameplayStarted")
end)


Ext.Osiris.RegisterListener("GainedControl", 1, "after", function(target)  
    Ext.Net.BroadcastMessage("PopulateRefresh", "GainedControl")
end)