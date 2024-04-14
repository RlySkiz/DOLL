---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                    UI Layout                     --
--                                                  --
------------------------------------------------------
w = Ext.IMGUI.NewWindow("BG3 REDACTEDtender")
-- w:AddText("Test") -- test if you can add above tab bar (works)
tabBar = w:AddTabBar("")
tSec = tabBar:AddTabItem("Secret")
tExp = tabBar:AddTabItem("Browser")
tOne = tabBar:AddTabItem("REDACTED Controls")
tTwo = tabBar:AddTabItem("Settings")
tThr = tabBar:AddTabItem("About")
------------------------------------------------------
--                                                  --
--                     Browser                      --
--                                                  --
------------------------------------------------------

tExp:AddSeparatorText("General:")
browserTable = tExp:AddTable("AddTable", 2)

-- Row 1 - Column 1
btrow1 = browserTable:AddRow()
btrow1:AddCell():AddText("Game Browser:")
-- Row 1 - Column 2
browserSearch = btrow1:AddCell():AddInputText("Search")
-- Row 2 - Column 1
btrow2 = browserTable:AddRow()
browserTree = btrow1:AddCell():AddTree("Data")
-- Row 2 - Column 2
browserInfo = btrow1:AddCell():AddText("Test")




------------------------------------------------------
--                                                  --
--                 BG3SX Elements                   --
--                                                  --
------------------------------------------------------

tOne:AddSeparatorText("General:")
tOne:AddText("Choose your REDACTED:")
tableOne = tOne:AddTable("AddTable", 3, 3)
row1 = tableOne:AddRow()
SXgenitalPrevious = row1:AddCell():AddButton("<")
SXgenitalSelector = row1:AddCell():AddCombo("")
SXgenitalNext = row1:AddCell():AddButton(">")


-- tableOne:AddRow()


tOne:AddSeparatorText("Misc.:")
tOne:AddText("Text before :AddSpacing")
tOne:AddSpacing("AddSpacing")
tOne:AddText("Text before :AddNewLine")
tOne:AddNewLine("AddNewLine")
tOne:AddText("Text before :AddDummy(widthGap, heightGap)(0,40)")
tOne:AddDummy(0, 40)
tOne:AddText("AddText")
l1 = tOne:AddText("AddText"); tOne:AddText("AddText"); tOne:AddText("AddText")
tOne:AddText("AddText")

------------------------------------------------------
--                                                  --
--                 Settings Elements                --
--                                                  --
------------------------------------------------------

tTwo:AddSeparatorText("REDACTED Settings")
stripCheckBox = tTwo:AddCheckbox("Block REDACTED?", true)
erectionCheckBox = tTwo:AddCheckbox("Would you like to get REDACTED?", true)
-- check.SetColor(0.3, 0.3, 0.7, 1.0)

tTwo:AddSeparatorText("General Settings")

------------------------------------------------------
--                                                  --
--                   About Elements                 --
--                                                  --
------------------------------------------------------

tThr:AddSeparatorText("Authors:")
tThr:AddText("Skiz & Satan")
tThr:AddText("Test")


-- tThr:AddText("Test2").SameLine = true

-- currentPositionButton = tOne:AddButton("Update current position")
-- locationInputX = tOne:AddInputInt("X", 0)
-- locationInputY = tOne:AddInputInt("Y", 0)
-- locationInputZ = tOne:AddInputInt("Z", 0)
-- teleportButton = tOne:AddButton("Teleport")


-- textbox = tOne:AddInputText("New name:", "Sextender")
-- tOne:AddBulletText("AddBulletText")
-- tOne:AddButton("AddButton")
-- tOne:AddCheckbox("AddCheckbox")
-- h = tOne:AddCollapsingHeader("AddCollapsingHeader")
-- tOne:AddColorEdit("AddColorEdit")
-- tOne:AddColorPicker("AddColorPicker")
-- tOne:AddCombo("AddCombo")
-- h:AddText("Text next to Combobox")
-- tOne:AddDrag("AddDrag")
-- tOne:AddDragInt("AddDragInt")
-- tOne:AddDummy(6,4) -- (widthgap, heightgap)
-- tOne:AddGroup("AddGroup")
-- tOne:AddInputInt("AddInputInt")
-- tOne:AddInputScalar("AddInputScalar")
-- tOne:AddInputText("AddInputText")
-- tOne:AddNewLine("AddNewLine")
-- tOne:AddPopup("AddPopup")
-- tOne:AddSeparator("AddSeparator")
-- tOne:AddSeparatorText("AddSeparatorText")
-- tOne:AddSlider("AddSlider")
-- tOne:AddSliderInt("AddSliderInt")
-- tOne:AddSpacing("AddSpacing")
-- tOne:AddTable("AddTable",2)
-- tOne:AddText("AddText")
-- tOne:AddTree("AddTree")


---  ExtuiTreeParent:ExtuiStyledRenderable
--- AddBulletText fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddButton fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddCheckbox fun(self:ExtuiTreeParent, a1:string, a2:boolean|nil):ImguiHandle
--- AddCollapsingHeader fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddCombo fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddDrag fun(self:ExtuiTreeParent, a1:string, a2:number|nil, a3:number|nil, a4:number|nil):ImguiHandle
--- AddDragInt fun(self:ExtuiTreeParent, a1:string, a2:int32|nil, a3:int32|nil, a4:int32|nil):ImguiHandle
--- AddDummy fun(self:ExtuiTreeParent, a1:number, a2:number):ImguiHandle
--- AddGroup fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddInputInt fun(self:ExtuiTreeParent, a1:string, a2:int32|nil):ImguiHandle
--- AddInputScalar fun(self:ExtuiTreeParent, a1:string, a2:number|nil):ImguiHandle
--- AddInputText fun(self:ExtuiTreeParent, a1:string, a2:string|nil):ImguiHandle
--- AddNewLine fun(self:ExtuiTreeParent):ImguiHandle
--- AddPopup fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddRadioButton fun(self:ExtuiTreeParent, a1:string, a2:boolean|nil):ImguiHandle
--- AddSeparator fun(self:ExtuiTreeParent):ImguiHandle
--- AddSeparatorText fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddSlider fun(self:ExtuiTreeParent, a1:string, a2:number|nil, a3:number|nil, a4:number|nil):ImguiHandle
--- AddSliderInt fun(self:ExtuiTreeParent, a1:string, a2:int32|nil, a3:int32|nil, a4:int32|nil):ImguiHandle
--- AddSpacing fun(self:ExtuiTreeParent):ImguiHandle
--- AddTabBar fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddTable fun(self:ExtuiTreeParent, a1:string, a2:uint32):ImguiHandle
--- AddText fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddTree fun(self:ExtuiTreeParent, a1:string):ImguiHandle

_D("Dump Window: ", w)
