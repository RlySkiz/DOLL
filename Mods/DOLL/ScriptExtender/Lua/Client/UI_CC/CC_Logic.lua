------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 





--------------- Event Sender---------------
-- Ext.Net.PostMessageToServer("Teleport", _)
-------------------------------------------

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
--set these
--"AdditionalChoices" :
-- [
--     1038174126,   = vitiligoSelector.Value
--     1040522936,   = freckleQSelector.Value     
--     1041194025,   = ageSelector.Value 
--     1039516303    = freckleISelector.Value 
-- ],
--to ageSelector.Value, so the third value for this slider

-----additional info -- AdditionalChoices Values are mapped in AdditionalChoices.txt

----- Freckle Quantity
--same as maturity but with freckleQSelector and the second value

----- Freckle Intensity
--same as maturity but with freckleISelector and the third value

----- Vitiligo Pigmentation
--same as maturity but with vitiligoSelector and the fourth value

----- Genital

local previousGenital = genitalSelector.SelectedIndex
genitalSelector.OnChange = function()
    Ext.Net.PostMessageToServer("requestCCAVOfType", Ext.Json.Stringify("Private Parts"))
    if genitalSelector.SelectedIndex ~= previousGenital then
        print("New Genital Chosen")
        
        local newGenital = genitalSelector.Options[genitalSelector.SelectedIndex+1]
        print("Removing ", previousGenital, " and adding ", newGenital)
        Ext.Net.PostMessageToServer("changeCCAV", Ext.Json.Stringify(newGenital))

        previousGenital = newGenital
        print("Previous Genital set to: ", previousGenital, " until next choice.")
    end
end

--- Handles "Previous" and "Next" Button Clicks
-- local genitalIndexMax = genitals[#genitals]
-- genitalPrevious.OnClick = function ()
--     if genitalIndex ~= 1 then
--         genitalSelector.SelectedIndex = genitalSelector.SelectedIndex-1
--     else
--         genitalSelector.SelectedIndex = genitalIndexMax
--     end
-- end
-- genitalNext.OnClick = function ()

--     if genitalIndex ~= genitalIndexMax then
--         genitalSelector.SelectedIndex = genitalSelector.SelectedIndex+1
--     else
--         genitalSelector.SelectedIndex = 1
--     end
-- end

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
