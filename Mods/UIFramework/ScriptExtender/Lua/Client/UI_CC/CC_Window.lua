---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                 Character Creator                --
--                                                  --
------------------------------------------------------
tSec:AddText("Character Creation:")

---- Base Headers
CCBody = tSec:AddCollapsingHeader("Body")
tSec:AddSeparatorText("")
CCFace = tSec:AddCollapsingHeader("Face")
tSec:AddSeparatorText("")
CCEyes = tSec:AddCollapsingHeader("Eyes")
tSec:AddSeparatorText("")
CCMakeup = tSec:AddCollapsingHeader("Makeup")
tSec:AddSeparatorText("")
CCHair = tSec:AddCollapsingHeader("Hair")
------------------------------------------------------
--                                                  --
--                      Body                        --
--                                                  --
------------------------------------------------------

----- Race
raceHeader = CCBody:AddSeparatorText("Race")
raceTable = CCBody:AddTable("", 3)
raceRow = raceTable:AddRow()
racePrevious = raceRow:AddCell():AddButton("<")
raceSelector = raceRow:AddCell():AddCombo("")
raceNext = raceRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5) -- Dummies are used for spacing until i figure it out in UI_Style
----- Heads
headsHeader = CCBody:AddCollapsingHeader("Heads")
headsTable = headsHeader:AddTable("", 4)
headsRow = headsTable:AddRow()
headPrevious = headsRow:AddCell():AddButton("<")
headSelector = headsRow:AddCell():AddCombo("")
headNext = headsRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
--- Skincolor
skincolorHeader = CCBody:AddCollapsingHeader("Skincolor")
-- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
skincolorTable = skincolorHeader:AddTable("", 10)
skincolorRow = skincolorTable:AddRow()
skincolorPrevious = skincolorRow:AddCell():AddButton("<")
skincolorSelector = skincolorRow:AddCell():AddCombo("")
skincolorNext = skincolorRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
----- Scars
scarsHeader = CCBody:AddCollapsingHeader("Scars")
scarsTable = scarsHeader:AddTable("", 4)
scarsRow = scarsTable:AddRow()
scarPrevious = scarsRow:AddCell():AddButton("<")
scarSelector = scarsRow:AddCell():AddCombo("")
scarNext = scarsRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
----- Maturity
ageHeader = CCBody:AddSeparatorText("Maturity")
ageTable = CCBody:AddTable("", 3)
ageRow = ageTable:AddRow()
agePrevious = ageRow:AddCell():AddButton("<")
ageSelector = ageRow:AddCell():AddSliderInt("", 0, 0, 100)
ageNext = ageRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
----- Freckle Quantity
freckleQHeader = CCBody:AddSeparatorText("Freckle Quantity")
freckleQTable = CCBody:AddTable("", 3)
freckeQRow = freckleQTable:AddRow()
freckeQPrevious = freckeQRow:AddCell():AddButton("<")
freckeQSelector = freckeQRow:AddCell():AddSliderInt("", 0, 0, 100)
freckeQNext = freckeQRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
----- Freckle Intensity
freckleIHeader = CCBody:AddSeparatorText("Freckle Intensity")
freckeITable = CCBody:AddTable("", 3)
freckleIRow = freckeITable:AddRow()
freckleIPrevious = freckleIRow:AddCell():AddButton("<")
freckleISelector = freckleIRow:AddCell():AddSliderInt("", 0, 0, 100)
freckleINext = freckleIRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
----- Vitiligo Pigmentation
vitiligoHeader = CCBody:AddSeparatorText("Vitiligo Pigmentation")
vitiligoTable = CCBody:AddTable("", 3)
vitiligoRow = vitiligoTable:AddRow()
vitiligoPrevious = vitiligoRow:AddCell():AddButton("<")
vitiligoSelector = vitiligoRow:AddCell():AddSliderInt("", 0, 0, 100)
vitiligoNext = vitiligoRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)
----- Genital
genitalHeader = CCBody:AddSeparatorText("Genital")
genitalTable = CCBody:AddTable("", 3)
genitalRow = genitalTable:AddRow()
genitalPrevious = genitalRow:AddCell():AddButton("<")
genitalSelector = genitalRow:AddCell():AddCombo("")
genitalNext = genitalRow:AddCell():AddButton(">")
-----
CCBody:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Face                        --
--                                                  --
------------------------------------------------------

----- Tattoos
tattooHeader = CCFace:AddCollapsingHeader("Tattos")
tattooTable = tattooHeader:AddTable("", 4)
tattooRow = tattooTable:AddRow()
tattooPrevious = tattooRow:AddCell():AddButton("<")
tattooSelector = tattooRow:AddCell():AddCombo("")
tattooNext = tattooRow:AddCell():AddButton(">")
-----
CCFace:AddDummy(0,5)
----- Piercing
piercingHeader = CCFace:AddCollapsingHeader("Piercing")
piercingTable = piercingHeader:AddTable("", 3)
piercingRow = piercingTable:AddRow()
piercingPrevious = piercingRow:AddCell():AddButton("<")
piercingSelector = piercingRow:AddCell():AddCombo("")
piercingNext = piercingRow:AddCell():AddButton(">")
-----
CCFace:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Eyes                        --
--                                                  --
------------------------------------------------------

----- Heterochromia
heterechromiaHeader = CCEyes:AddSeparatorText("")
heterechromiaButton = CCEyes:AddCheckbox("Heterochromia")
-----
CCEyes:AddDummy(0,5)
----- Eyecolor
eyecolorHeader = CCEyes:AddCollapsingHeader("Eyecolor")
----- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
eyecolorTable = eyecolorHeader:AddTable("", 10)
eyecolorRow = eyecolorTable:AddRow()
eyecolorPrevious = eyecolorRow:AddCell():AddButton("<")
eyecolorSelector = eyecolorRow:AddCell():AddCombo("")
eyecolorNext = eyecolorRow:AddCell():AddButton(">")
--- Left Eye
eyecolorLHeader = CCEyes:AddCollapsingHeader("Left Eye")
-- skincolor:AddColorEdit("Skincolor Editor")
-- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
-- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
eyecolorLTable = eyecolorLHeader:AddTable("", 10)
eyecolorLRow = eyecolorLTable:AddRow()
eyecolorLPrevious = eyecolorLRow:AddCell():AddButton("<")
eyecolorLSelector = eyecolorLRow:AddCell():AddCombo("")
eyecolorLNext = eyecolorLRow:AddCell():AddButton(">")
--- Right Eye
eyecolorRHeader = CCEyes:AddCollapsingHeader("Right Eye")
-- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
eyecolorRTable = eyecolorRHeader:AddTable("", 10)
eyecolorRRow = eyecolorRTable:AddRow()
eyecolorRPrevious = eyecolorRRow:AddCell():AddButton("<")
eyecolorRSelector = eyecolorRRow:AddCell():AddCombo("")
eyecolorRNext = eyecolorRRow:AddCell():AddButton(">")
-----
CCEyes:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Makeup                      --
--                                                  --
------------------------------------------------------

----- Eye Makeup Style
makeupStyleHeader = CCMakeup:AddCollapsingHeader("Eye Makeup Style")
makeupStyleTable = makeupStyleHeader:AddTable("", 4)
makeupStyleRow = makeupStyleTable:AddRow()
makeupStylePrevious = makeupStyleRow:AddCell():AddButton("<")
makeupStyleSelector = makeupStyleRow:AddCell():AddCombo("")
makeupStyleNext = makeupStyleRow:AddCell():AddButton(">")
-----
CCMakeup:AddDummy(0,5)
----- Eye Makeup Color
makeupHeaderContainer = CCMakeup:AddCollapsingHeader("Eye Makeup Color")
--- Intensity
makeupIntHeader = makeupHeaderContainer:AddSeparatorText("Intensity")
makeupIntTable = makeupHeaderContainer:AddTable("", 3)
makeupIntRow = makeupIntTable:AddRow()
makeupIntPrevious = makeupIntRow:AddCell():AddButton("<")
makeupIntSelector = makeupIntRow:AddCell():AddSliderInt("", 0, 0, 100)
makeupIntNext = makeupIntRow:AddCell():AddButton(">")
--- Metallic Tint
makeupMetalHeader = makeupHeaderContainer:AddSeparatorText("Metallic Tint")
makeupMetalTable = makeupHeaderContainer:AddTable("", 3)
makeupMetalRow = makeupMetalTable:AddRow()
makeupMetalPrevious = makeupMetalRow:AddCell():AddButton("<")
makeupMetalSelector = makeupMetalRow:AddCell():AddSliderInt("", 0, 0, 100)
makeupMetalNext = makeupMetalRow:AddCell():AddButton(">")
--- Glossy Tint
makeupGlossHeader = makeupHeaderContainer:AddSeparatorText("Glossy Tint")
makeupGlossTable = makeupHeaderContainer:AddTable("", 3)
makeupGlossRow = makeupGlossTable:AddRow()
makeupGlossPrevious = makeupGlossRow:AddCell():AddButton("<")
makeupGlossSelector = makeupGlossRow:AddCell():AddSliderInt("", 0, 0, 100)
makeupGlossNext = makeupGlossRow:AddCell():AddButton(">")
--- Color
makeupColorHeader = makeupHeaderContainer:AddCollapsingHeader("Color")
makeupColorTable = makeupColorHeader:AddTable("", 10)
makeupColorRow = makeupColorTable:AddRow()
makeupColorPrevious = makeupColorRow:AddCell():AddButton("<")
makeupColorSelector = makeupColorRow:AddCell():AddSliderInt("", 0, 0, 100)
makeupColorNext = makeupColorRow:AddCell():AddButton(">")
-----
CCMakeup:AddDummy(0,5)
----- Lips Makeup Color
lipsHeaderContainer = CCMakeup:AddCollapsingHeader("Lips Makeup Color")
--- Intensity
lipsIntHeader = lipsHeaderContainer:AddSeparatorText("Intensity")
lipsIntTable = lipsHeaderContainer:AddTable("", 3)
lipsIntRow = lipsIntTable:AddRow()
lipsIntPrevious = lipsIntRow:AddCell():AddButton("<")
lipsIntSelector = lipsIntRow:AddCell():AddSliderInt("", 0, 0, 100)
lipsIntNext = lipsIntRow:AddCell():AddButton(">")
--- Metallic Tint
lipsMetalHeader = lipsHeaderContainer:AddSeparatorText("Metallic Tint")
lipsMetalTable = lipsHeaderContainer:AddTable("", 3)
lipsMetalRow = lipsMetalTable:AddRow()
lipsMetalPrevious = lipsMetalRow:AddCell():AddButton("<")
lipsMetalSelector = lipsMetalRow:AddCell():AddSliderInt("", 0, 0, 100)
lipsMetalNext = lipsMetalRow:AddCell():AddButton(">")
--- Glossy Tint
lipsGlossHeader = lipsHeaderContainer:AddSeparatorText("Glossy Tint")
lipsGlossTable = lipsHeaderContainer:AddTable("", 3)
lipsGlossRow = lipsGlossTable:AddRow()
lipsGlossPrevious = lipsGlossRow:AddCell():AddButton("<")
lipsGlossSelector = lipsGlossRow:AddCell():AddSliderInt("", 0, 0, 100)
lipsGlossNext = lipsGlossRow:AddCell():AddButton(">")
--- Color
lipsColorHeader = lipsHeaderContainer:AddCollapsingHeader("Color")
lipsColorTable = lipsHeaderContainer:AddTable("", 10)
lipsColorRow = lipsColorTable:AddRow()
lipsColorButton1 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton2 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton3 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton4 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton5 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton6 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton7 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton8 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton9 = lipsColorRow:AddCell():AddButton("X")
lipsColorButton10 = lipsColorRow:AddCell():AddButton("X")
-----
CCMakeup:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Hair                        --
--                                                  --
------------------------------------------------------

----- Hair Style
hairStyleHeader = CCHair:AddCollapsingHeader("Hair Style")
hairStyleTable = hairStyleHeader:AddTable("", 4)
hairStyleRow = hairStyleTable:AddRow()
hairStylePrevious = hairStyleRow:AddCell():AddButton("<")
hairStyleSelector = hairStyleRow:AddCell():AddCombo("")
hairStyleNext = hairStyleRow:AddCell():AddButton(">")
-----
CCHair:AddDummy(0,5)
----- Hair Color
hairColorHeader = CCHair:AddCollapsingHeader("Hair Color")
hairColorTable = hairColorHeader:AddTable("", 10)
hairColorRow = hairColorTable:AddRow()
hairColorButton1 = hairColorRow:AddCell():AddButton("X")
hairColorButton2 = hairColorRow:AddCell():AddButton("X")
hairColorButton3 = hairColorRow:AddCell():AddButton("X")
hairColorButton4 = hairColorRow:AddCell():AddButton("X")
hairColorButton5 = hairColorRow:AddCell():AddButton("X")
hairColorButton6 = hairColorRow:AddCell():AddButton("X")
hairColorButton7 = hairColorRow:AddCell():AddButton("X")
hairColorButton8 = hairColorRow:AddCell():AddButton("X")
hairColorButton9 = hairColorRow:AddCell():AddButton("X")
hairColorButton10 = hairColorRow:AddCell():AddButton("X")
-----
CCHair:AddDummy(0,5)
----- Highlights
highlightsHeaderContainer = CCHair:AddCollapsingHeader("Highlights")
--- Intensity
highlightsIntHeader = highlightsHeaderContainer:AddSeparatorText("Highlight Intensity")
highlightsIntTable = highlightsHeaderContainer:AddTable("", 3)
highlightsIntRow = highlightsIntTable:AddRow()
highlightsIntPrevious = highlightsIntRow:AddCell():AddButton("<")
highlightsIntSelector = highlightsIntRow:AddCell():AddSliderInt("", 0, 0, 100)
highlightsIntNext = highlightsIntRow:AddCell():AddButton(">")
--- Color
highlightsColorHeader = highlightsHeaderContainer:AddCollapsingHeader("Highlight Color")
highlightsColorTable = highlightsColorHeader:AddTable("", 10)
highlightsColorRow = highlightsColorTable:AddRow()
highlightsColorButton1 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton2 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton3 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton4 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton5 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton6 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton7 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton8 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton9 = highlightsColorRow:AddCell():AddButton("X")
highlightsColorButton10 = highlightsColorRow:AddCell():AddButton("X")
-----
CCHair:AddDummy(0,5)
----- Greying
greyingHeaderContainer = CCHair:AddCollapsingHeader("Greying")
--- Intensity
greyingIntHeader = greyingHeaderContainer:AddSeparatorText("Greying Intensity")
greyingIntTable = greyingHeaderContainer:AddTable("", 3)
greyingIntRow = greyingIntTable:AddRow()
greyingIntPrevious = greyingIntRow:AddCell():AddButton("<")
greyingIntSelector = greyingIntRow:AddCell():AddSliderInt("", 0, 0, 100)
greyingIntNext = greyingIntRow:AddCell():AddButton(">")
--- Color
greyingColorHeader = greyingHeaderContainer:AddCollapsingHeader("Greying Color")
greyingColorTable = greyingColorHeader:AddTable("", 10)
greyingColorRow = greyingColorTable:AddRow()
greyingColorButton1 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton2 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton3 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton4 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton5 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton6 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton7 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton8 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton9 = greyingColorRow:AddCell():AddButton("X")
greyingColorButton10 = greyingColorRow:AddCell():AddButton("X")
-----
CCHair:AddDummy(0,5)