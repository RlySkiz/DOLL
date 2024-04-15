------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 

---- Base Headers


------------------------------------------------------
--                                                  --
--                      Body                        --
--                                                  --
------------------------------------------------------

----- Race
--probably needs everything else set up first so we can reset those to base values whenever you change race

----- Heads
--needs headsTable to be populated by all available heads
--getHeadCount
--populate in steps of 4, then create new line with headsTable:AddRow()
--each row needs to recieve 4x :AddCell():AddButton()

---- Skincolor
--same as heads, but with colors instead and new rows after 10 items

----- Scars
--same as heads but with scars

----- Maturity
--if ageSelector.OnChange then
--"AdditionalChoices" :
-- [
--     1036831949, <-- this one = ageSelector.Value
--     1058139013,
--     1058306785,
--     1045220557
-- ],

-----additional info -- CHOICESVALUE seems to increase by a rate of 1,055869637763624 per 1 value on slider

----- Freckle Quantity
--same as maturity but with freckleQSelector and the second value

----- Freckle Intensity
--same as maturity but with freckleISelector and the third value

----- Vitiligo Pigmentation
--same as maturity but with vitiligoSelector and the fourth value

----- Genital

-- Checks all available CharacterCreationAppearanceVisuals and finds those names "Private Parts"
-- @return allGenitalsHandles
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

--- Populates the genitalSelector Combobox
genitalSelector.Options = {}
for genitalIndex, genital in ipairs(genitals) do
    genitalSelector.Options[genitalIndex] = genital
end

local genitalIndexMax = genitals[#genitals]

--- Handles "Previous" and "Next" Button Clicks
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

------------------------------------------------------
--                                                  --
--                      Face                        --
--                                                  --
------------------------------------------------------

----- Tattoos
--same as heads but with tattoos

----- Piercing
--same as genitals but with piercings

------------------------------------------------------
--                                                  --
--                      Eyes                        --
--                                                  --
------------------------------------------------------

----- Heterochromia
heterochromiaButton.OnChange = function()
    print("OnChange")
    if heterochromiaButton.Checked == true then
        print("Checked")
        eyecolorHeader.Visible = false
        eyecolorLHeader.Visible = true
        eyecolorRHeader.Visible = true
    else
        print("Unchecked")
        eyecolorHeader.Visible = true
        eyecolorLHeader.Visible = false
        eyecolorRHeader.Visible = false
    end
end



-- then
-- --     print("OnChange") -- doesn't happen on clicking the checkbox
-- -- end
-- if heterochromiaButton.OnChange == true then
--     print("OnChange == true") -- doesn't happen on clicking the checkbox
-- end
-- if heterochromiaButton.OnChange == 1 then
--     print("OnChange == 1") -- doesn't happen on clicking the checkbox
-- end


-- if heterochromiaButton.Checked == false then
--     print("UNCHECKED")
--     if heterochromiaButton.OnChange == true then
--         print("CHANGE")
--         heterochromiaButton.Checked = false
--         print("CHECKING")
--     end
-- end
-- if heterochromiaButton.Checked == true then
--     print("CHECKED")
--     if heterochromiaButton.OnChange == true then
--         print("CHANGE")
--         heterochromiaButton.Checked = false
--         print("UNCHECKING")
--     end
-- end



-- if heterochromiaButton.OnChange == true and heterochromiaButton.Checked == false then -- "Checked" is the press itself
--         print("Button checked")
--         eyecolorHeader.Visible = false
--         eyecolorLHeader.Visible = true
--         eyecolorRHeader.Visible = true
-- end
-- if heterochromiaButton.OnChange == true and heterochromiaButton.Checked == true then
--         print("Button unchecked")
--         eyecolorHeader.Visible = true
--         eyecolorLHeader.Visible = false
--         eyecolorRHeader.Visible = false
-- end

----- Eyecolor
--same as skincolor but with available eyecolors

--- Left Eye
--same as skincolor but with available eyecolors

--- Right Eye
--same as skincolor but with available eyecolors

------------------------------------------------------
--                                                  --
--                      Makeup                      --
--                                                  --
------------------------------------------------------

----- Eye Makeup Style
--same as heads but with makeup style instead

----- Eye Makeup Color
--- Intensity
--slider like maturity but without that value nonsense, update color values instead

--- Metallic Tint
--slider like maturity but without that value nonsense, update color values instead

--- Glossy Tint
--slider like maturity but without that value nonsense, update color values instead

--- Color
--same as skincolor but with available makeup colors

----- Lips Makeup Color
--- Intensity
--same as eye makeup intensity but for lips

--- Metallic Tint
--same as eye makeup metallic tint but for lips

--- Glossy Tint
--same as eye makeup glotty tint but for lips

--- Color
--same as eye makeup color but for lips

------------------------------------------------------
--                                                  --
--                      Hair                        --
--                                                  --
------------------------------------------------------

----- Hair Style
--same as heads but with hair styles instead

----- Hair Color
--same as skincolor but with available hair colors instead

----- Highlights
--- Intensity
--same as makeup intensity but for the color we select below

--- Color
--same as hair color but for the highlights instead

----- Greying
--- Intensity
--same procedure as with highlight intensity but for greying instead

--- Color
--same procedure as with highlight colors but for greying instead
