local imguiTables = {}
local helmetEQ = {}
local cloakEQ = {}
local breastEQ = {}
local glovesEQ = {}
local bootsEQ = {}
local vanitybodyEQ = {}
local vanitybootsEQ = {}
local underwearEQ = {}
local amuletEQ = {}

--------------------------------------------------------


--                  Helper functions


--------------------------------------------------------

local function setEquipmentData(equipmentSlotData)
    local slot = equipmentSlotData.slot
    local data = equipmentSlotData.data
    if slot == "Helmet" then
        table.insert(helmetEQ,data)

    elseif slot == "Cloak" then
        table.insert(cloakEQ,data)

    elseif slot == "Breast" then
        table.insert(breastEQ,data)

    elseif slot == "Gloves" then
        table.insert(glovesEQ,data)

    elseif slot == "Boots" then
        table.insert(bootsEQ,data)

    elseif slot == "VanityBody" then
        table.insert(vanitybodyEQ,data)

    elseif slot == "VanityBoots" then
        table.insert(vanitybootsEQ,data)

    elseif slot == "Underwear" then
        table.insert(underwearEQ,data)

    elseif slot == "Amulet" then
        table.insert(amuletEQ,data)

    else
        _P("[EQ_Events.lua] - Error - setEquipmentData() - ", slot ," is not a valid Slot")
    end
end

function GetEquipmentData(slot)
    if slot == "Helmet" then
        return helmetEQ

    elseif slot == "Cloak" then
        return helmetEQ

    elseif slot == "Breast" then
        return helmetEQ

    elseif slot == "Gloves" then
        return glovesEQ

    elseif slot == "Boots" then
        return bootsEQ

    elseif slot == "VanityBody" then
        return vanitybodyEQ

    elseif slot == "VanityBoots" then
        return vanitybootsEQ

    elseif slot == "Underwear" then
        return underwearEQ

    elseif slot == "Amulet" then
        return amuletEQ

    else
        _P("[EQ_Events.lua] - Error - GetEquipmentData() - ", slot ," is not a valid Slot")
    end
end

local function setupImguiTable(slot)
    _P("set imgui table for slot ", slot)
    if slot == "Helmet" then
        table.insert(imguiTables, {tbl = HelmetTable, slotName = "Helmet"})

    elseif slot == "Cloak" then
        table.insert(imguiTables, {tbl = CloakTable, slotName = "Cloak"})

    elseif slot == "Breast" then
        table.insert(imguiTables, {tbl = BreastTable, slotName = "Breast"})

    elseif slot == "Gloves" then
        table.insert(imguiTables, {tbl = GlovesTable, slotName = "Gloves"})

    elseif slot == "Boots" then
        table.insert(imguiTables, {tbl = BootsTable, slotName = "Boots"})

    elseif slot == "VanityBody" then
        table.insert(imguiTables, {tbl = VanityBodyTable, slotName = "VanityBody"})

    elseif slot == "VanityBoots" then
        table.insert(imguiTables, {tbl = VanityBootsTable, slotName = "VanityBoots"})

    elseif slot == "Underwear" then
        table.insert(imguiTables, {tbl = UnderwearTable, slotName = "Underwear"})

    elseif slot == "Amulet" then
       table.insert(imguiTables, {tbl = AmuletTable, slotName = "Amulet"})

    else
        _P("[EQ_Events.lua] - Error - setupImguiTable() - ", slot ," is not a valid Slot")
    end    
end

function GetImguiTable(searchSlot)
    local table = imguiTables
    for _, entry in pairs(table) do
        local tbl = entry.tbl
        local slotName = entry.slotName

        if slotName == searchSlot then
            return tbl

            _P("[EQ_Events.lua] - Error - GetImguiTable() - ", slot ," is not a valid Slot")
        end
    end
end

local function populateImguiTable(slot)

    for i, equipmentTable in pairs(GetImguiTable(slot)) do
        _P("EquipmentTable iteration: ", i)
        local imguiTable = equipmentTable.tbl
        local slotName = equipmentTable.slotName
        local slotData = GetEquipmentData(slotName)
        
        local imguiTableRow = imguiTable:AddRow()

        for j, dataTable in pairs(slotData) do
            _P("imguiTable iteration: ", j)
            local uuid = dataTable.uuid
            local slot = dataTable.slot
            local icon = dataTable.icon
            local name = dataTable.name
            
            if m % 6 == 0 then -- if i is multiple of 6
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
        _P("[EQ_Events.lua] - PopulateEquipment Event recieved from server")
        local data = Ext.Json.Parse(e.Payload)
        local slot = data.slot
        _P("Processing ", slot, "table population.")
        _P(slot)
        _D(slot)
        setEquipmentData(data)
        setupImguiTable(slot)
        _P("populateImguiTable start")
        populateImguiTable(slot)
        _P("populateImguiTable finish")
    end
end)

_P("parsed EQ_Events.lua")