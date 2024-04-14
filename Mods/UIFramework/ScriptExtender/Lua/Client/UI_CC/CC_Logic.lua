------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 

-- Genital Selector

local function getAllGenitalsHandles()
    local allGenitalsHandles = {}
    local allCCAV = Ext.StaticData.GetAll("CharacterCreationAppearanceVisual")
    -- _P("allCCAV: ", allCCAV)
    for _, CCAV in pairs(allCCAV)do
        local content = Ext.StaticData.Get(CCAV, "CharacterCreationAppearanceVisual")
        local handle = content.DisplayName.Handle.Handle
        -- _P("handle: ", handle)
        local slotName = content.SlotName
        -- _P("slotName: ", slotName)
        if slotName and slotName == "Private Parts" then
            local trans =  Ext.Loca.GetTranslatedString(handle)
            -- _P("trans: ", trans)
            table.insert(allGenitalsHandles, trans)
        end
    end
    return allGenitalsHandles
end

local genitals = getAllGenitalsHandles()
local genitalIndex = genitalSelector.SelectedIndex

genitalSelector.Options = {}
for genitalIndex, genital in ipairs(genitals) do
    genitalSelector.Options[genitalIndex] = genital
end

local genitalIndexMax = genitals[#genitals]

genitalPrevious.OnClick = function ()
    if genitalIndex ~= 1 then
        genitalSelector.SelectedIndex = genitalSelector.SelectedIndex-1
    else
        genitalSelector.SelectedIndex = genitalIndexMax
    end
end
genitalNext.OnClick = function ()
    
    if genitalIndex ~= genitalIndexMax then
        genitalSelector.SelectedIndex = genitalSelector.SelectedIndex+1
    else
        genitalSelector.SelectedIndex = 1
    end
end





-- Get all CharacterCreationAppearaceVisuals of type Private Parts loaded in the game
---return                 - list of CharacterCreationAppearaceVisual IDs for all genitals

-- currentPositionButton.OnClick = function()
--     print("pressed")
--     Ext.Net.PostMessageToServer("AskPosition", "") 
-- end

--teleportButton.OnClick = function()
    -- local PositionTable = {}
    --PositionTable["X"] = locationInputX.Value
    --PositionTable["Y"] = locationInputY.Value
    --PositionTable["Z"] = locationInputZ.Value

    --local positionPayload = Ext.Json.Stringify(PositionTable)
    -- Ext.Net.PostMessageToServer("Teleport", _)
--end

-- cycleindex.OnClick = function()
--     if (currentindex > #combo.Options) then
--         combo.SelectedIndex = 0
--         currentindex = 0
--     else 
--         combo.SelectedIndex = currentindex
--         currentindex = currentindex + 1
--     end    
-- end


-- button.OnClick = function()
--     CharTable = {}
--     CharTable["NewName"] = textbox.Text
--     CharTable["UUID"] =  PartyTable[combo.SelectedIndex+1]
--     _D(CharTable)
--     Ext.Net.PostMessageToServer("ChangeDaName", Ext.Json.Stringify(CharTable)) 
--     end

-- updatebutton.OnClick = function()
--     Ext.Net.PostMessageToServer("GiveTableUpdate", "") 
-- end