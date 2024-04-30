------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 

--#region Key Input Event Listener - Open/Close mechanism



Ext.Events.KeyInput:Subscribe(function (e)

    if e.Event == "KeyDown" and e.Repeat == false then

        local logKeyInput = false
        if e.Key == "NUM_0" then
            logKeyInput = not logKeyInput -- Toggles logKeyInput
        end
        if logKeyInput == true then
            _P("--------------------------")
            _P("[KEYINPUT] Key Pressed: ", e.Key)
            _P("[KEYINPUT] Modifiers pressed: ", e.Modifiers)
        end

        if e.Key == "GRAVE" then
            w.Visible = true
            w.Open = not w.Open
        end

        -- Host Dump when pressing 1
        -- if e.Key == "NUM_1" then
        --     _D(Ext.Entity.Get(sessionHost):GetAllComponents())
        -- end
        if e.Key == "NUM_1" then
            populateTable(skinColorTable, skinColorRows, skinColorButtons, skinColorNames)
        end
        if e.Key == "NUM_2" then
            table.insert(skinColorNames, "Testi")
            populateTable(skinColorTable, skinColorRows, skinColorButtons, skinColorNames)
        end
        if e.Key == "NUM_3" then
            for i, name in ipairs(skinColorNames) do
                if skinColorButtons[i].IDContext == skinColorNames[1] .. 3 then
                    _P(skinColorButtons[i].IDContext .. " found!")
                    table.remove(skinColorNames, i)
                    table.remove(skinColorButtons, i)
                    _P("skinColorNames[" .. i .. "]" .. " is now " .. skinColorNames[i])
                    break
                end
                _P("Iterating " .. i)
            end
            populateTable(skinColorTable, skinColorRows, skinColorButtons, skinColorNames)
        end

        if e.Key == "NUM_4" then
            Ext.Net.PostMessageToServer("RequestHost", "Hi")
            _D(Ext.Entity.Get(sessionHost):GetAllComponents())
        end
    end
end)

--#endregion

--#region populateTable Function

-- Resets an IMGUI table based on parameters
-- @param rows	                - List of rows to destroy and reset
-- @param buttons 	     	    - List of buttons to reset
function resetTable(rows, buttons)
    for i = 2, #rows do
        rows[i]:Destroy() -- Destroys all IMGUI components and their children
    end
    while #rows > 1 do
        table.remove(rows) -- Resets rows to just its name on index 1
    end
    while #buttons > 1 do
        table.remove(buttons) -- Resets buttons to just its name on index 1
    end
end

-- Populates an IMGUI table based on parameters
-- @param tableToPopulate	    - The table to populate
-- @param rows 	     	        - Empty list of rows except its own name within its first index
-- @param buttons 	     	    - Empty list of buttons except its own name within its first index
-- @param names 	     	    - List of Items
function populateTable(tableToPopulate, rows, buttons, names)
    if buttons[2] then -- Check if any button already exist
    resetTable(rows, buttons) -- Before table gets populated, reset it first
    _P("rows and buttons reset")
    end

    local rowName = rows[1] -- Get name to name rows later
    local buttonName = buttons[1] -- Get name to name buttons later
    _P(rowName .. " and " .. buttonName)
    table.insert(rows, tableToPopulate:AddRow()) -- Add first row to table
    _P(rows[1], rows[2], rows[3], rows[4])
    rows[2].IDContext =  rowName .. 1 -- Add IDContext to first row based on row input and append 1 for first row
    local j = 2 -- Rows[i]
    for i = 1, #names do
        table.insert(buttons, rows[j]:AddCell():AddButton(names[i])) -- Add a button to current row and add it to the list of buttons
        local currentButton = buttons[i+1]
        currentButton.Label = "  " -- Makes buttons show up without a label
        currentButton.IDContext = buttonName .. i -- Gives buttons a continous ID
        currentButton:Tooltip():AddText(names[i]) -- Gives buttons a popup with their actual name
        _P("Button: " .. i .. " with Name " .. names[i] .. " and ID " .. currentButton.IDContext .. " in row " .. j-1)
        if i % tableToPopulate.Columns == 0 then -- If i is dividable by column count of the table
            j = j+1 -- Increase Rows[i]
            table.insert(rows, tableToPopulate:AddRow()) -- Add new row
            rows[j].IDContext = rowName .. j-1 -- Give the new row the correct IDContext
        end
    end
end

--#endregion

--#region Race Filter
showAllOptionsCheck.OnChange = function()
    print("OnChange")
    if showAllOptionsCheck.Checked == true then
        print("Show All Options = Checked")
        Ext.Net.PostMessageToServer("DisableFilter", "")
    else
        print("Show All Options = Unchecked")
        Ext.Net.PostMessageToServer("EnableFilter", "")
    end
end

--#endregion

--#region [NYI] Race Selector
--probably needs everything else set up first so we can reset those to base values whenever you change race

--#endregion

--[NYI] Wing Color Changing
--#region Skiz Wing Coloring
-- TESTBUTTON.OnClick = function ()
--     local materialBank = Ext.Resource.Get("5e5b7f76-8fa5-16ff-0cf3-33d94f5ea041", "Material")
--     _P("[CLIENT] Material bank parameter values:")
--     _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)

--     _P("[CLIENT] wingColors[] = those values")
--     local wingColors = materialBank.Instance.Parameters.Vector3Parameters[1].Value
--     local wingColorRed = wingColors[1]
--     local wingColorGreen = wingColors[2]
--     local wingColorBlue = wingColors[3]

--     print("[CLIENT] Red: ", wingColorRed)
--     print("[CLIENT] Green: ", wingColorGreen)
--     print("[CLIENT] Blue: ", wingColorBlue)

--     wingColorRed = 0.75
--     print("[CLIENT] set Red to: ", wingColorRed)

--     print("[CLIENT] create new list newWingColors with all previous colors but changed red to ", wingColorRed)
--     local newWingColors = {
--         wingColorRed,
--         wingColorGreen,
--         wingColorBlue
--     }
--     _D(newWingColors)

--     print("[CLIENT] Wing Color Red is therefore = ", wingColorRed)

--     print("[CLIENT] Set wingColors[] = newWingColors[]")
--     wingColors = newWingColors

--     _P("[CLIENT] Dump wingColors:")
--     _D(wingColors)

--     _P("[CLIENT] Now dump materialBank values again: ")
--     _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
--     _P("[CLIENT] Now input wingColors[] into that those materialBank parameters[]")
--     materialBank.Instance.Parameters.Vector3Parameters[1].Value = wingColors

--     _P("[CLIENT] materialBanks new parameter values:")
--     _D(materialBank.Instance.Parameters.Vector3Parameters[1].Value)
--     Ext.Net.PostMessageToServer("UpdateWingColor", Ext.Json.Stringify(newWingColors))
-- end
--#endregion

--------------- Event Sender---------------
-- Ext.Net.PostMessageToServer("Teleport", _)
-------------------------------------------

------------------------------------------------------
--                                                  --
--                      Body                        --
--                                                  --
------------------------------------------------------

--#region Body

--#region Heads
--needs headsTable to be populated by all available heads
--getHeadCount
--populate in steps of 4, then create new line with headsTable:AddRow()
--each row needs to recieve 4x :AddCell():AddButton()

local previousHead = headSelector.Options[headSelector.SelectedIndex]
-- TODO doesn't fire when selecting an item avobe the previously selected index 
headSelector.OnChange = function()
    _D(previousHead)
    if headSelector.SelectedIndex ~= previousHead then
        print("-----------------------------")
        print("New Head Chosen")

        local newHead = headSelector.Options[headSelector.SelectedIndex+1]
        print("Changing Visual ", previousHead, " to ", newHead)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newHead))

       previousHead = newHead
       headSelector.Options[0] = previousHead
       print("Setting previousHead to", previousHead, " until next choice.")
    end
end

--#endregion

--#region Skincolor
--same as heads, but with colors instead and new rows after 10 items

--#endregion

--#region Scars
--same as heads but with scars

--#endregion

--region Maturity
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

--#endregion

--region Freckle Quantity
--same as maturity but with freckleQSelector and the second value

--#endregion

--region Freckle Intensity
--same as maturity but with freckleISelector and the third value

--#endregion

--region Vitiligo Pigmentation
--same as maturity but with vitiligoSelector and the fourth value

--#endregion

--region Genital
local previousGenital = genitalSelector.Options[genitalSelector.SelectedIndex]
genitalSelector.OnChange = function()
    if genitalSelector.SelectedIndex ~= previousGenital then
        print("-----------------------------")
        print("New Genital Chosen")

        local newGenital = genitalSelector.Options[genitalSelector.SelectedIndex+1]
        print("Changing Visual ", previousGenital, " to ", newGenital)
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

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Face                        --
--                                                  --
------------------------------------------------------

--#region Face

--#region Tattoos
--same as heads but with tattoos

--#endregion

--#region Piercing
local previousPiercing = piercingSelector.Options[piercingSelector.SelectedIndex]
piercingSelector.OnChange = function()
    if piercingSelector.SelectedIndex ~= previousPiercing then
        print("-----------------------------")
        print("New Piercing Chosen")

        local newPiercing = piercingSelector.Options[piercingSelector.SelectedIndex+1]
        print("Changing Visual ", previousPiercing, " to ", newPiercing)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newPiercing))

        previousPiercing = newPiercing
        piercingSelector.Options[0] = previousPiercing
        print("Setting previousPiercing to", previousPiercing, " until next choice.")
    end
end

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Eyes                        --
--                                                  --
------------------------------------------------------

--#region Eyes

--#region Heterochromia
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

--#endregion

--#region Eyecolor
--same as skincolor but with available eyecolors

--#endregion

--#region Left Eye
--same as skincolor but with available eyecolors

--#endregion

--#region Right Eye
--same as skincolor but with available eyecolors

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Makeup                      --
--                                                  --
------------------------------------------------------

--#region Makeup

--#region Eye Makeup Style
--same as heads but with makeup style instead

--#endregion

--#region Eye Makeup Color

--#region Intensity
--slider like maturity but without that value nonsense, update color values instead

--#endregion

--#region Metallic Tint
--slider like maturity but without that value nonsense, update color values instead

--#endregion

--#region Glossy Tint
--slider like maturity but without that value nonsense, update color values instead

--#endregion

--#region Color
--same as skincolor but with available makeup colors

--#endregion

--#endregion

--#region Lips Makeup Color

--#region Intensity
--same as eye makeup intensity but for lips

--#endregion

--#region Metallic Tint
--same as eye makeup metallic tint but for lips

--#endregion

--#region Glossy Tint
--same as eye makeup glotty tint but for lips

--#endregion

--#region Color
--same as eye makeup color but for lips

--#endregion

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Hair                        --
--                                                  --
------------------------------------------------------

--#region Hair

--#region Hair Style
--same as heads but with hair styles instead


-- OnChange of Selector, sends the selected Index's value to the server
-- @param selector      - The selector to use (combobox)
-- @param previous 	    - The previousX created above the individual selector to have a starting comparison
function selectorChangeVisual(selector, previous)
    if selector.SelectedIndex ~= previous then
        local newRequest = selector.Options[selector.SelectedIndex+1]
        _P("Changing Visual " .. previous .. " to " .. newRequest)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newRequest))
        previous = newRequest
        selector.Options[0] = previous
        _P("Setting previous to " .. previous .. " until next choice.")
    end
end


local previousHair = hairSelector.Options[hairSelector.SelectedIndex]
hairSelector.OnChange = function()
    selectorChangeVisual(hairSelector, previousHair)
end

--#endregion

--#region Hair Color
--same as skincolor but with available hair colors instead

--#endregion

--#region Highlights

--#region Intensity
--same as makeup intensity but for the color we select below

--#endregion

--#region Color
--same as hair color but for the highlights instead

--#endregion

--#endregion

--#region Greying

--#region Intensity
--same procedure as with highlight intensity but for greying instead

--#endregion

--#region Color
--same procedure as with highlight colors but for greying instead

--#endregion

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                   Facial Hair                    --
--                                                  --
------------------------------------------------------

--#region Facial Hair

--#region Hair Style

--same as heads but with facialhair styles instead
local previousBeard = beardSelector.Options[beardSelector.SelectedIndex]
beardSelector.OnChange = function()
    _P("previousbeard : ", previousBeard )
    if hairSelector.SelectedIndex ~= previousBeard then
        print("-----------------------------")
        print("New Beard Chosen")

        local newBeard = beardSelector.Options[beardSelector.SelectedIndex+1]
        _P("new beard : ", newBeard )
        print("Changing Visual ", previousBeard, " to ", newBeard)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newBeard))

        previousBeard = newBeard
        beardSelector.Options[0] = previousBeard
        print("Setting previousBeard to", previousBeard, " until next choice.")
    end
end

--#endregion

--#region Hair Color
--same as skincolor but with available facialhair colors instead

--#endregion

--#region Greying

--#region Intensity
--same procedure as with highlight intensity but for greying instead

--#endregion

--#region Color
--greying color

--#endregion

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Horns                       --
--                                                  --
------------------------------------------------------

--#region Horns

--#region Horn Style

--same as heads but with horns styles instead
local previousHorn = hornSelector.Options[hornSelector.SelectedIndex]
hornSelector.OnChange = function()
    if hornSelector.SelectedIndex ~= previousHorn then
        print("-----------------------------")
        print("New Horns Chosen")

        local newHorn = hornSelector.Options[hornSelector.SelectedIndex+1]
        print("Changing Visual ", previousHorn, " to ", newHorn)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newHorn))

        previousHorn = newHorn
        hornSelector.Options[0] = previousHorn
        print("Setting previousHorn to", previousHorn, " until next choice.")
    end
end

--#endregion

--#region Horn Color
--same as skincolor but with available horn colors instead

--#endregion

--#region Horn Tip Color
--same as horn color but for the tips instead

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                       Tail                       --
--                                                  --
------------------------------------------------------

--#region Tail

--#region Tail Style
--same as heads but with tail styles instead
local previousTail = tailSelector.Options[tailSelector.SelectedIndex]
tailSelector.OnChange = function()
    if tailSelector.SelectedIndex ~= previousTail then
        print("-----------------------------")
        print("New Tail Chosen")

        local newTail = tailSelector.Options[tailSelector.SelectedIndex+1]
        print("Changing Visual ", previousTail, " to ", newTail)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newTail))

        previousTail = newTail
        tailSelector.Options[0] = previousTail
        print("Setting previousTail to: ", previousTail, " until next choice.")
    end
end

--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Wings                       --
--                                                  --
------------------------------------------------------

--#region Wings

--#region Wing Style
--same as heads but with wing styles instead
local previousWings = wingsSelector.Options[wingsSelector.SelectedIndex]
wingsSelector.OnChange = function()
    if wingsSelector.SelectedIndex ~= previousWings then
        print("-----------------------------")
        print("New Wings Chosen")

        local newWings = wingsSelector.Options[wingsSelector.SelectedIndex+1]
        print("Changing Visual ", previousWings, " to ", newWings)
        Ext.Net.PostMessageToServer("ChangeVisual", Ext.Json.Stringify(newWings))

        previousWings = newWings
        wingsSelector.Options[0] = previousWings
        print("Setting previousWings to: ", previousWings, " until next choice.")
    end
end

--#endregion

--#endregion