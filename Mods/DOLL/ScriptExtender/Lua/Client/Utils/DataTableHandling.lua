--------------------------------------------------------


--                  Variables


--------------------------------------------------------




-- Combined map for linking both DATA and IMGUI tables to SlotName
-- Access this like so:
-- helmetDATA = VISUALDATA_TABLE["Helmet"].DATA
-- helmetTable = VISUALDATA_TABLE["Helmet"].IMGUI   -- these have been set in DATA_Window
local VISUALDATA_TABLE = {
    -- CCAV/CCSV
    ["Head"] = { DATA = {}, HEADER = HeadsHeader, TABLE = HeadsTable, AMOUNT = HeadsAmount},
    ["Private Parts"] = { DATA = {}, HEADER = CCBody, TABLE = PrivatePartsCombo, AMOUNT = PrivatePartsAmount},
    ["Piercing"] = { DATA = {}, HEADER = CCFace, TABLE = PiercingCombo, AMOUNT = PiercingAmount},
    ["Hair"] = { DATA = {}, HEADER = HairStyleHeader, TABLE = HairStyleTable, AMOUNT = HairStyleAmount},
    ["Beard"] = { DATA = {}, HEADER = BeardStyleHeader, TABLE = BeardStyleTable, AMOUNT = BeardStyleAmount},
    ["Horns"] = { DATA = {}, HEADER = HornsHeader, TABLE = HornsTable, AMOUNT = HornsAmount},
    ["Tail"] = { DATA = {}, HEADER = TailHeader, TABLE = TailTable, AMOUNT = TailAmount},
    -- Equipment
    ["Helmet"] = { DATA = {}, HEADER = EQHelmet, TABLE = HelmetTable, AMOUNT = HelmetAmount},
    ["Cloak"] = { DATA = {}, HEADER = EQCloak, TABLE = CloakTable, AMOUNT = CloakAmount},
    ["Breast"] = { DATA = {}, HEADER = EQBreast, TABLE = BreastTable, AMOUNT = BreastAmount},
    ["Gloves"] = { DATA = {}, HEADER = EQGloves, TABLE = GlovesTable, AMOUNT = GlovesAmount},
    ["Boots"] = { DATA = {}, HEADER = EQBoots, TABLE = BootsTable, AMOUNT = BootsAmount},
    ["VanityBody"] = { DATA = {}, HEADER = EQVanityBody, TABLE = VanityBodyTable, AMOUNT = VanityBodyAmount},
    ["VanityBoots"] = { DATA = {}, HEADER = EQVanityBoots, TABLE = VanityBootsTable, AMOUNT = VanityBootsAmount},
    ["Underwear"] = { DATA = {}, HEADER = EQUnderwear, TABLE = UnderwearTable, AMOUNT = UnderwearAmount},
    ["Amulet"] = { DATA = {}, HEADER = EQAmulet, TABLE = AmuletTable, AMOUNT = AmuletAmount}
}

--------------------------------------------------------


--                  Getters and setters


--------------------------------------------------------

function GetVISUALDATA_TABLE()
    return VISUALDATA_TABLE
end


-- Returns the DATA table based on slot name
-- @param slot string - allowed string (see VISUALDATA_TABLE keys)
-- @return dataTable table or nil if slot does not exist
function GetDATATable(slot)
    local entry = VISUALDATA_TABLE[slot]
    if entry then
        return entry.DATA
    else
        _P("[DataTableHandling.lua] - Error - GetDATATable() - ", slot, " is not a valid Slot")
        return nil
    end
end

-- Returns the TABLE table based on slot name
-- @param slot string - allowed string (see VISUALDATA_TABLE keys)
-- @return imguiTable table or nil if slot does not exist
function GetHEADERTable(slot)
    local entry = VISUALDATA_TABLE[slot]
    if entry then
        return entry.HEADER
    else
        _P("[DataTableHandling.lua] - Error - GetHEADERTable() - ", slot, " is not a valid Slot")
        return nil
    end
end

-- Returns the TABLE table based on slot name
-- @param slot string - allowed string (see VISUALDATA_TABLE keys)
-- @return imguiTable table or nil if slot does not exist
function GetIMGUITable(slot)
    local entry = VISUALDATA_TABLE[slot]
    if entry then
        return entry.TABLE
    else
        _P("[DataTableHandling.lua] - Error - GetIMGUITable() - ", slot, " is not a valid Slot")
        return nil
    end
end


-- Adds the data from server to the DATA element
-- @param payload table - table containing slot and data 
local function setDATATable(payload)
    _P("[DataTableHandling.lua] - setDATATable() - Populating table for slot ", payload.slot)
    VISUALDATA_TABLE[payload.slot].DATA = payload.data

    -- _P("[DataTableHandling.lua] - setDATATable() - DUMP:")
    -- _D(VISUALDATA_TABLE[payload.slot].DATA)
end


--------------------------------------------------------


--                  Helper functions


--------------------------------------------------------

local function populateSlotTables(slot)
    if VISUALDATA_TABLE[slot] then
        Ext.Net.PostMessageToServer("RequestSlotData", Ext.Json.Stringify(slot))
        _P("[DataTableHandling.lua] - 'RequestSlotData' Event for slot ", slot, " send to server!")
    else
        _P("[DataTableHandling.lua] - populateSlotTables() - " , slot, " is not a valid slot to request from server!")
    end
end

local dataRefreshed = false
function SetDataRefreshed()
    dataRefreshed = true
end

for slot, entry in pairs(VISUALDATA_TABLE) do
    local HEADER = entry.HEADER
    local usedBefore = false

    HEADER.OnClick = function()
        if dataRefreshed == true then
            usedBefore = false
        end
        if usedBefore == false then
            usedBefore = true
            populateSlotTables(slot)
        end
    end

    if slot == "Private Parts" or slot == "Piercing" then
        local combo = entry.TABLE
        if combo == PrivatePartsCombo or combo == PiercingCombo then
            local previousSelection = combo.Options[combo.SelectedIndex]
            combo.OnChange = function()
                print("---------------------------------------------------------")
                print("[DataTableHandling.lua] - New Selection Chosen")
                -- selectorChangeVisual(combo, previousSelection)
            end
        end 
    end
end

-- -- OnChange of Selector, sends the selected Index's value to the server
-- -- @param selector      - The selector to use (combobox)
-- -- @param previous 	    - The previousX created above the individual selector to have a starting comparison
-- function selectorChangeVisual(selector, previous)
-- if selector.SelectedIndex ~= previous then
-- local newRequest = selector.Options[selector.SelectedIndex+1]
-- _P("Changing Visual " .. previous .. " to " .. newRequest)
-- Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newRequest))
-- previous = newRequest
-- selector.Options[0] = previous
-- _P("Setting previous to " .. previous .. " until next choice.")
-- end
-- end

-- populates the TABLE element for DOLL
--@param slot string - slot that will be populated
local function populateImguiTable(slot)
    
    local dataTable = GetDATATable(slot)
    _D(dataTable)
    local tableRow
    local cellAmount = 0
    local totalIcons = 0
    
    -- Create CCInfoTable about having to enter CharacterCreation/Mirror to load Vanilla Icons
    local header = GetHEADERTable(slot)
    local CCInfoTable = header:AddTable("", 2)
    local CCInfoTableRow = CCInfoTable:AddRow()
    local CCInfoTableCell = CCInfoTableRow:AddCell()
    local CCInfoTableCell2 = CCInfoTableRow:AddCell()
    local CCInfoText = CCInfoTableCell:AddText("Vanilla Icon Textures are only accessible\nif you have been in Character Creation/Mirror\nat least once after installing this mod.\nThis Button will automate it. (Takes roughly 3 seconds)")
    local CCInfoButton = CCInfoTableCell2:AddButton("Load Vanilla Icons")
    
    CCInfoButton.OnClick = function()
        _P("[DataTableHandling.lua.lua] - CCButton Pressed - Initialize Character Creation/Mirror to load Vanilla Icons!")
        CCInfoButton.Visible = false
        CCInfoText.Visible = false
        CCInfoTableCell2.Visible = false
        CCInfoTableCell.Visible = false
        CCInfoTableRow.Visible = false
        CCInfoTable.Visible = false
    end
    
    -- local refreshButton = header:AddButton("Refresh") -- unused

    -- _P("[DataTableHandling.lua] - populateImguiTable() - dataTable Dump:") -- DEBUG
    -- _D(dataTable)
    
    local entryAmount = header:AddText("")
    -- local tableToPopulate = GetIMGUITable(slot)
    local tableToPopulate = header:AddTable("", 4)
    tableToPopulate.ScrollY = true
    for i, data in pairs(dataTable) do
        local uuid = data.uuid
        -- local slot = data.slot
        local icon = data.icon
        local name = data.name

        if cellAmount == 0 or cellAmount == tableToPopulate.Columns then -- create new row if there is none or if cellAmount reaches 6 (5 columns)
            tableRow = tableToPopulate:AddRow()
            cellAmount = 0
        end

        local tableCell = tableRow:AddCell()
        tableCell.IDContext = cellAmount
        cellAmount = cellAmount + 1
        totalIcons = totalIcons + 1

        local objInstanceTable = tableCell:AddTable("", 1)
        objInstanceTable.Borders = true

        --  Worki
        -- local objInstanceRow = objInstanceTable:AddRow()
        -- local objInstanceCell = objInstanceRow:AddCell()
        -- local objInstanceName = objInstanceCell:AddText(name)

        -- local objInstanceRow2 = objInstanceTable:AddRow()
        -- local objInstanceCell2 = objInstanceRow2:AddCell()
        -- local objInstanceButton = objInstanceCell2:AddButton("Select")

        -- local objInstanceRow3 = objInstanceTable:AddRow()
        -- local objInstanceCell3 = objInstanceRow3:AddCell()
        -- local objInstanceIcon = objInstanceCell3:AddIcon(icon)

        --  Not Worki - But better lookie
        local objInstanceRow = objInstanceTable:AddRow()
        local objInstanceCell = objInstanceRow:AddCell()
        local objInstanceName = objInstanceCell:AddText(name)
        
        local objInstanceRow2 = objInstanceTable:AddRow()
        local objInstanceTableRow2Cell = objInstanceRow2:AddCell()
        local objInstanceTableInner = objInstanceTableRow2Cell:AddTable("",2)
        objInstanceTableInner.IDContext = "IconButtonWrapper"

        local objInstanceTableInnerRow = objInstanceTableInner:AddRow()
        local objInstanceTableInnerCell = objInstanceTableInnerRow:AddCell()
        local objInstanceIcon = objInstanceTableInnerCell:AddIcon(icon)
        local objInstanceTableInnerCell2 = objInstanceTableInnerRow:AddCell()
        local objInstanceButton = objInstanceTableInnerCell2:AddButton("Select")
        
        local imguiToPad
        if slot == "Head" then
            imguiToPad = CCBody
            local dummyPadding = imguiToPad:AddDummy(0,5)
        -- elseif slot == "Private Parts" then
        --     imguiToPad = 
        -- elseif slot  == "Piercing" then
        --     imguiToPad = 
        elseif slot  == "Hair" then
            imguiToPad = CCHair
            local dummyPadding = imguiToPad:AddDummy(0,5)
        elseif slot  == "Beard" then
            imguiToPad = CCBeard
            local dummyPadding = imguiToPad:AddDummy(0,5)
        elseif slot  == "Horns" then
            imguiToPad = CCHorns
            local dummyPadding = imguiToPad:AddDummy(0,5)
        -- elseif slot  == "Tail" then
        --     imguiToPad = CCTail
        --     local dummyPadding = imguiToPad:AddDummy(0,5)
        -- -- Equipment
        -- elseif slot  == "Helmet" then
        --     imguiToPad = 
        -- elseif slot  == "Cloak" then
        --     imguiToPad = 
        -- elseif slot  == "Breast" then
        --     imguiToPad = 
        -- elseif slot  == "Gloves" then
        --     imguiToPad = 
        -- elseif slot  == "Boots" then
        --     imguiToPad = 
        -- elseif slot  == "VanityBody" then
        --     imguiToPad = 
        -- elseif slot  == "VanityBoots" then
        --     imguiToPad = 
        -- elseif slot  == "Underwear" then
        --     imguiToPad = 
        -- elseif slot  == "Amulet" then
        --     imguiToPad = 
        end
        
        objInstanceButton.OnClick = function()
            _P("[DataTableHandling.lua] - Button clicked for: ", name, " , with UUID: ", uuid, " clicked!")
            Ext.Net.PostMessageToServer("RequestEquipmentChange", Ext.Json.Stringify(uuid))
            _P("[DataTableHandling.lua] - 'RequestEquipmentChange' Event for item ", uuid, " send to server!")
        end

        -- objInstanceIcon.Size = {10,10}
        -- objInstanceIcon.OnClick = function()
        --     _P("[EQ_Events.lua] - ", objInstanceIcon, " clicked!")
        -- end          
    end

    -- refreshButton.OnClick = function()
    --     Ext.Net.PostMessageToServer("RefreshAllData", Ext.Json.Stringify(slot))
    -- end

    _P("[DataTableHandling.lua] - populateImGuiTable(", slot, ") executed!")
    _P("[DataTableHandling.lua] - Total Icons created: ", totalIcons)
    entryAmount.Label = "Loaded: " .. tostring(totalIcons) .. " items."
end

local function populateCombo(slot)
    local combo = VISUALDATA_TABLE[slot].TABLE
    local data = VISUALDATA_TABLE[slot].DATA

    for i, entry in pairs(data) do
        local name = entry.name
        local uuid = entry.uuid
        combo.Options[i] = name
        -- combo.Options[i] = name .. "_" .. uuid -- Show with UUID
    end
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

    if (e.Channel == "RefreshAllTables") then
        for slot, entry in pairs(VISUALDATA_TABLE) do
            local HEADER = entry.HEADER
            if slot == "Private Parts" or slot == "Piercing" then
                _P("TODO - Combobox Refresh Handling")
            else
                for i, child in ipairs(HEADER.Children) do
                    HEADER.Children[i]:Destroy()
                end
            end

            Ext.Net.PostMessageToServer("RequestSlotData", Ext.Json.Stringify(slot))
        end
    end

    if (e.Channel == "PopulateSlotTables") then
        local payload = Ext.Json.Parse(e.Payload)
        local slot = payload.slot
        
        setDATATable(payload)
        if slot == "Private Parts" or slot == "Piercing" then
            populateCombo(slot)
        else
            populateImguiTable(slot)
        end
    end
end)