--------------------------------------------------------


--                  Variables


--------------------------------------------------------




-- Combined map for linking both EQ and IMGUI tables to SlotName
-- Access this like so:
-- helmetEQ = COMBINED_TABLE["Helmet"].EQ
-- helmetTable = COMBINED_TABLE["Helmet"].IMGUI   -- these have been set in EQ_Window

COMBINED_TABLE = {
    ["Helmet"] = { EQ = {}, IMGUI = HelmetTable},
    ["Cloak"] = { EQ = {}, IMGUI = CloakTable },
    ["Breast"] = { EQ = {}, IMGUI = BreastTable },
    ["Gloves"] = { EQ = {}, IMGUI = GlovesTable },
    ["Boots"] = { EQ = {}, IMGUI = BootsTable },
    ["VanityBody"] = { EQ = {}, IMGUI = VanityBodyTable },
    ["VanityBoots"] = { EQ = {}, IMGUI = VanityBootsTable },
    ["Underwear"] = { EQ = {}, IMGUI = UnderwearTable },
    ["Amulet"] = { EQ = {}, IMGUI = AmuletTable }
}


--------------------------------------------------------


--                  Getters and setters


--------------------------------------------------------


-- Returns the EQ table based on slot name
-- @param slot string - allowed string (see COMBINED_TABLE keys)
-- @return eqTable table or nil if slot does not exist
function GetEQTable(slot)
    local entry = COMBINED_TABLE[slot]
    if entry then
        return entry.EQ
    else
        _P("[EQ_Events.lua] - Error - GetEQTable() - ", slot, " is not a valid Slot")
        return nil
    end
end

-- Returns the IMGUI table based on slot name
-- @param slot string - allowed string (see COMBINED_TABLE keys)
-- @return imguiTable table or nil if slot does not exist
function GetImguiTable(slot)
    local entry = COMBINED_TABLE[slot]
    if entry then
        return entry.IMGUI
    else
        _P("[EQ_Events.lua] - Error - GetImguiTable() - ", slot, " is not a valid Slot")
        return nil
    end
end


-- Adds the data from server to the EQ element
-- @param payload table - table containing slot and data 
local function setEQTable(payload)
    _P("Populating table for key ", payload.slot)
    table.insert(COMBINED_TABLE[payload.slot].EQ, payload.data)
end


--------------------------------------------------------


--                  Helper functions


--------------------------------------------------------


-- populates the IMGUI element for DOLL
--@param slot string - slot that will be populated
local function populateImguiTable(slot)

    local imguiTable = GetImguiTable(slot)
    local eqTable = GetEQTable(slot)


    for i, dataPacket in pairs(eqTable) do

        local imguiTableRow = imguiTable:AddRow()

          
        --local imguiTable = tableOfMapkeys.tbl
        --local slotName = tableOfMapkeys.slotName
        --local slotData = tableOfMapkeys.data

        for j, data in pairs(dataPacket) do

            local uuid = data.uuid
            local slot = data.slot
            local icon = data.icon
            local name = data.name


            if i % 6 == 0 then -- if i is multiple of 6
                _P("New Row iteration: ", m+1)
                local imguiTableRow = imguiTable:AddRow()
            end

            local imguiTableCell = imguiTableRow:AddCell()
            local imguiTableTable = imguiTableCell:AddTable("", 1)
            local imguiTableTableRow = imguiTableTable:AddRow()
            local imguiTableTableCell = imguiTableTableRow:AddCell()
            local entryName = imguiTableTableCell:AddText(name)
            local imguiTableTableRow2 = imguiTableTable:AddRow()
            local imguiTableTableCell2 = imguiTableTableRow:AddCell()
            local entryUUID = imguiTableTableCell2:AddButton(uuid)
            local imguiTableTableRow3 = imguiTableTable:AddRow()
            local imguiTableTableCell3 = imguiTableTableRow:AddCell()
            local entryIcon = imguiTableTableCell2:AddImageButton(icon)
            
            entryUUID.OnClick = function()
                _P("[EQ_Events.lua] - ", entryUUID, " clicked!")
            end

            entryIcon.Size = {10,10}
            entryIcon.OnClick = function()
                _P("[EQ_Events.lua] - ", entryIcon, " clicked!")
            end
        end           
    end
    _P("[EQ_Events.lua] - populateImGuiTable(", slot, ") executed!")
end


-- -- this is sent by the server
-- payload = {slot, data}
-- data= , {uuid = entity.Id, slot = slot, name = entity.Name, icon = entity.Icon}

-- for _, entry in pairs(data) do

--     uuid = entry.uuid
--     slot = entry.slot
--     icon = entry.icon
--     name = entry.name

-- end
    

------------------------------------------------------
--                                                  --
--               Server Event Listener              --
--                                                  --
------------------------------------------------------ 

-- local payload = {slot = slot, data = armor}


-- Listens to OnLevelGameplayStarted event
Ext.Events.NetMessage:Subscribe(function(e) 
    if (e.Channel == "PopulateEquipment") then
        local payload = Ext.Json.Parse(e.Payload)
        local slot = payload.slot

        setEQTable(payload)
        populateImguiTable(slot)
    end
end)
