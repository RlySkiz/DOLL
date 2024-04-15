------------------------------------------------------------
--                                                        --
--                       SX Logic                         --
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
local genitalIndex = SXgenitalSelector.SelectedIndex

SXgenitalSelector.Options = {}
for genitalIndex, genital in ipairs(genitals) do
    SXgenitalSelector.Options[genitalIndex] = genital
end


-- local genitalIndexMax = genitals[#genitals]
-- SXgenitalPrevious.OnClick = function ()
--     if genitalIndex ~= 1 then
--         SXgenitalSelector.SelectedIndex = SXgenitalSelector.SelectedIndex-1
--     else
--         SXgenitalSelector.SelectedIndex = genitalIndexMax
--     end
-- end
-- SXgenitalNext.OnClick = function ()
    
--     if genitalIndex ~= genitalIndexMax then
--         SXgenitalSelector.SelectedIndex = SXgenitalSelector.SelectedIndex+1
--     else
--         SXgenitalSelector.SelectedIndex = 1
--     end
-- end