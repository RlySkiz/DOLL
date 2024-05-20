------------------------------------------------------------
--                                                        --
--                      CC Logic                          --
--                                                        --
------------------------------------------------------------ 

-- local visualDataTable = GetVisualDataTable()

------------------------------------------------------
--                                                  --
--                    Functions                     --
--                                                  --
------------------------------------------------------

--#region Functions
-- local function populateSlotTables(slot)

--     if visualDataTable[slot] then
--         Ext.Net.PostMessageToServer("RequestSlotData", Ext.Json.Stringity(slot))
--         _P("[EQ_Logic.lua] - 'RequestSlotData' Event for slot ", slot, " send to server!")
--     else
--         _P("[EQ_Logic.lua] - populateSlotTables() - " , slot " is not a valid slot to request from server!")
--     end
-- end

-- for _, HEADER in pairs(visualDataTable) do
--     -- _P("Giving ", tree, " OnClick functionality!")
--     local usedBefore = false
--     -- _P("Tree: ", tree, " was used before?: ", usedBefore)
--     HEADER.OnClick = function()
--         if usedBefore == false then
--             usedBefore = true
--             -- _P("Tree: ", tree, " was used before?: ", usedBefore)
--             populateSlotTables(HEADER.Label)
--             -- _P("[EQ_Logic.lua] - ", header, " .OnClick function called!/n calling populateSlotTables(", HEADER.Label, ")")
--         end
--     end
-- end

--#endregion

--#region Key Input Event Listener
-- Ext.Events.KeyInput:Subscribe(function (e)

--     if e.Event == "KeyDown" and e.Repeat == false then

--         -- if e.Key == "NUM_6" then
--         --     _P("Pressed 6")
--         --     populateSlotTables()
--         -- end
--     end
-- end)
--#endregion
