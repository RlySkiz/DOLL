------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 

-- TESTBUTTON.OnClick = function ()
--     local materialBank = Ext.Resource.Get("5e5b7f76-8fa5-16ff-0cf3-33d94f5ea041", "Material")
--     _P("[CLIENT] Wing Colors:")
--     _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
--     local wingColors = materialBank.Instance.Parameters.Vector3Parameters[1].Value
--     local wingColorRed = wingColors[1]
--     local wingColorGreen = wingColors[2]
--     local wingColorBlue = wingColors[3]

--     print("[CLIENT] Red: ", wingColorRed)
--     print("[CLIENT] Green: ", wingColorGreen)
--     print("[CLIENT] Blue: ", wingColorBlue)

--     wingColorRed = 0.75

--     newWingColors = {
--         wingColorRed,
--         wingColorGreen,
--         wingColorBlue
--     }
--     print("[CLIENT] Wing Color Red after change = ", wingColorRed)

--     wingColors = newWingColors
--     _P("[CLIENT] wingColors:")
--     _D(wingColors)
--     _P("[CLIENT] materialbank value:")
--     _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
--     materialBank.Instance.Parameters.Vector3Parameters[1].Value = wingColors
--     _P("[CLIENT] materialbank value 2:")
--     _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
--     Ext.Net.PostMessageToServer("UpdateWingColor", Ext.Json.Stringify(newWingColors))
-- end



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

local previousHead = headSelector.SelectedIndex
headSelector.OnChange = function()
    if headSelector.SelectedIndex ~= previousHead then
        print("-----------------------------")
        print("New Head Chosen")

        local newHead = headSelector.Options[headSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousHead, " to add ", newHead)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newHead))

        previousHead = newHead
        headSelector.Options[0] = previousHead
        print("Setting previousHead to", previousHead, " until next choice.")
    end
end

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
    if genitalSelector.SelectedIndex ~= previousGenital then
        print("-----------------------------")
        print("New Genital Chosen")

        local newGenital = genitalSelector.Options[genitalSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousGenital, " to add ", newGenital)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newGenital))

        previousGenital = newGenital
        genitalSelector.Options[0] = previousGenital
        print("Setting previousGenital to", previousGenital, " until next choice.")
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
local previousPiercing = piercingSelector.SelectedIndex
piercingSelector.OnChange = function()
    if piercingSelector.SelectedIndex ~= previousPiercing then
        print("-----------------------------")
        print("New Piercing Chosen")

        local newPiercing = piercingSelector.Options[piercingSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousPiercing, " to add ", newPiercing)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newPiercing))

        previousPiercing = newPiercing
        piercingSelector.Options[0] = previousPiercing
        print("Setting previousPiercing to", previousPiercing, " until next choice.")
    end
end

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
local previousHair = hairSelector.SelectedIndex
hairSelector.OnChange = function()
    print("Clicked")
    if hairSelector.SelectedIndex ~= previousHair then
        print("clicked")
        print("-----------------------------")
        print("New Hair Chosen")

        local newHair = hairSelector.Options[hairSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousHair, " to add ", newHair)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newHair))

        previousHair = newHair
        hairSelector.Options[0] = previousHair
        print("Setting previousHair to", previousHair, " until next choice.")
    end
end

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

------------------------------------------------------
--                                                  --
--                   Facial Hair                    --
--                                                  --
------------------------------------------------------

----- Hair Style
--same as heads but with facialhair styles instead
local previousBeard = beardSelector.SelectedIndex
beardSelector.OnChange = function()
    if hairSelector.SelectedIndex ~= previousBeard then
        print("-----------------------------")
        print("New Beard Chosen")

        local newBeard = beardSelector.Options[beardSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousBeard, " to add ", newBeard)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newBeard))

        previousBeard = newBeard
        beardSelector.Options[0] = previousBeard
        print("Setting previousBeard to", previousBeard, " until next choice.")
    end
end

----- Hair Color
--same as skincolor but with available facialhair colors instead

----- Greying
--- Intensity
--same procedure as with highlight intensity but for greying instead

------------------------------------------------------
--                                                  --
--                      Horns                       --
--                                                  --
------------------------------------------------------

----- Horn Style
--same as heads but with horns styles instead
local previousHorn = hornSelector.SelectedIndex
hornSelector.OnChange = function()
    if hornSelector.SelectedIndex ~= previousHorn then
        print("-----------------------------")
        print("New Horns Chosen")

        local newHorn = hornSelector.Options[hornSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousHorn, " to add ", newHorn)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newHorn))

        previousHorn = newHorn
        hornSelector.Options[0] = previousHorn
        print("Setting previousHorn to", previousHorn, " until next choice.")
    end
end

----- Horn Color
--same as skincolor but with available horn colors instead

----- Horn Tip Color
--same as horn color but for the tips instead

------------------------------------------------------
--                                                  --
--                       Tail                       --
--                                                  --
------------------------------------------------------

----- Tail Style
--same as heads but with tail styles instead
local previousTail = tailSelector.SelectedIndex
tailSelector.OnChange = function()
    if tailSelector.SelectedIndex ~= previousTail then
        print("-----------------------------")
        print("New Tail Chosen")

        local newTail = tailSelector.Options[tailSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousTail, " to add ", newTail)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newTail))

        previousTail = newTail
        tailSelector.Options[0] = previousTail
        print("Setting previousTail to: ", previousTail, " until next choice.")
    end
end

------------------------------------------------------
--                                                  --
--                      Wings                       --
--                                                  --
------------------------------------------------------

----- Wing Style
--same as heads but with wing styles instead
local previousWings = wingsSelector.SelectedIndex
wingsSelector.OnChange = function()
    if wingsSelector.SelectedIndex ~= previousWings then
        print("-----------------------------")
        print("New Wings Chosen")

        local newWings = wingsSelector.Options[wingsSelector.SelectedIndex+1]
        print("Sending Remove Request for: ", previousWings, " to add ", newWings)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newWings))

        previousWings = newWings
        wingsSelector.Options[0] = previousWings
        print("Setting previousWings to: ", previousWings, " until next choice.")
    end
end