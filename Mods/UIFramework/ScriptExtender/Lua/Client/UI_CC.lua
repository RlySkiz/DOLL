---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                 Character Creator                --
--                                                  --
------------------------------------------------------
tSec:AddText("Character Creation:")

CCBody = tSec:AddCollapsingHeader("Body")
CCFace = tSec:AddCollapsingHeader("Face")
CCEyes = tSec:AddCollapsingHeader("Eyes")
CCMakeup = tSec:AddCollapsingHeader("Makeup")
CCHair = tSec:AddCollapsingHeader("Hair")
------------------------------------------------------
--                                                  --
--                      Body                        --
--                                                  --
------------------------------------------------------

----- Race
CCBody:AddSeparatorText("Race")
raceTable = CCBody:AddTable("", 3)
raceRow = raceTable:AddRow()
-- Row 1 - Column 1
racePrevious = raceRow:AddCell():AddButton("<")
-- Row 1 - Column 2
raceSelector = raceRow:AddCell():AddCombo("")
-- Row 1 - Column 3
raceNext = raceRow:AddCell():AddButton(">")
-----

----- Heads
heads = CCBody:AddCollapsingHeader("Heads")
headsTable = heads:AddTable("", 4)
headsRow = headsTable:AddRow()
-- Row 2 - Column 1
headPrevious = headsRow:AddCell():AddButton("<")
-- Row 2 - Column 2
headSelector = headsRow:AddCell():AddCombo("")
-- Row 2 - Column 3
headNext = headsRow:AddCell():AddButton(">")
-----

-- Skincolor
skincolor = CCBody:AddCollapsingHeader("Skincolor")
-- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
skincolorTable = skincolor:AddTable("", 10)
skincolorRow = skincolorTable:AddRow()
-- Row 3 - Column 1
skincolorPrevious = skincolorRow:AddCell():AddButton("<")
-- Row 3 - Column 2
skincolorSelector = skincolorRow:AddCell():AddCombo("")
-- Row 3 - Column 3
skincolorNext = skincolorRow:AddCell():AddButton(">")
-----

-- Scars
scars = CCBody:AddCollapsingHeader("Scars")
scarsTable = scars:AddTable("", 4)
scarsRow = scarsTable:AddRow()
-- Row 4 - Column 1
scarPrevious = scarsRow:AddCell():AddButton("<")
-- Row 4 - Column 2
scarSelector = scarsRow:AddCell():AddCombo("")
-- Row 4 - Column 3
scarNext = scarsRow:AddCell():AddButton(">")
-----

----- Maturity
CCBody:AddSeparatorText("Maturity")
ageTable = CCBody:AddTable("", 3)
ageRow = ageTable:AddRow()
-- Row 5 - Column 1
agePrevious = ageRow:AddCell():AddButton("<")
-- Row 5 - Column 2
ageSelector = ageRow:AddCell():AddSliderInt("", 0, 0, 100)
-- Row 5 - Column 3
ageNext = ageRow:AddCell():AddButton(">")
-----

----- Freckle Quantity
CCBody:AddSeparatorText("Freckle Quantity")
freckleQTable = CCBody:AddTable("", 3)
freckeQRow = freckleQTable:AddRow()
-- Row 5 - Column 1
freckeQPrevious = freckeQRow:AddCell():AddButton("<")
-- Row 5 - Column 2
freckeQSelector = freckeQRow:AddCell():AddSliderInt("", 0, 0, 100)
-- Row 5 - Column 3
freckeQNext = freckeQRow:AddCell():AddButton(">")
-----

----- Freckle Intensity
CCBody:AddSeparatorText("Freckle Intensity")
freckeITable = CCBody:AddTable("", 3)
freckleIRow = freckeITable:AddRow()
-- Row 5 - Column 1
freckleIPrevious = freckleIRow:AddCell():AddButton("<")
-- Row 5 - Column 2
freckleISelector = freckleIRow:AddCell():AddSliderInt("", 0, 0, 100)
-- Row 5 - Column 3
freckleINext = freckleIRow:AddCell():AddButton(">")
-----

----- Vitiligo Pigmentation
CCBody:AddSeparatorText("Vitiligo Pigmentation")
vitiligoTable = CCBody:AddTable("", 3)
vitiligoRow = vitiligoTable:AddRow()
-- Row 5 - Column 1
vitiligoPrevious = vitiligoRow:AddCell():AddButton("<")
-- Row 5 - Column 2
vitiligoSelector = vitiligoRow:AddCell():AddSliderInt("", 0, 0, 100)
-- Row 5 - Column 3
vitiligoNext = vitiligoRow:AddCell():AddButton(">")
-----

----- Genital
CCBody:AddSeparatorText("Genital")
genitalTable = CCBody:AddTable("", 3)
genitalRow = genitalTable:AddRow()
-- Row 1 - Column 1
genitalPrevious = genitalRow:AddCell():AddButton("<")
-- Row 1 - Column 2
genitalSelector = genitalRow:AddCell():AddCombo("")
-- Row 1 - Column 3
genitalNext = genitalRow:AddCell():AddButton(">")
-----

------------------------------------------------------
--                                                  --
--                      Face                        --
--                                                  --
------------------------------------------------------

-- Tattoos
tatoo = CCFace:AddCollapsingHeader("Tattos")
tatooTable = tatoo:AddTable("", 4)
tatooRow = tatooTable:AddRow()
-- Row 4 - Column 1
tatooPrevious = tatooRow:AddCell():AddButton("<")
-- Row 4 - Column 2
tatooSelector = tatooRow:AddCell():AddCombo("")
-- Row 4 - Column 3
tatooNext = tatooRow:AddCell():AddButton(">")
-----

-- Piercing
piercing = CCFace:AddCollapsingHeader("Piercing")
piercingTable = piercing:AddTable("", 4)
piercingRow = piercingTable:AddRow()
-- Row 4 - Column 1
piercingPrevious = piercingRow:AddCell():AddButton("<")
-- Row 4 - Column 2
piercingSelector = piercingRow:AddCell():AddCombo("")
-- Row 4 - Column 3
piercingNext = piercingRow:AddCell():AddButton(">")
-----

------------------------------------------------------
--                                                  --
--                      Eyes                        --
--                                                  --
------------------------------------------------------

-- Heterochromia
heterechromia = CCEyes:AddCollapsingHeader("Tattos")
heterechromiaButton = heterechromia:AddButton("Heterochromia")
-----

-- Eyecolor
eyecolor = CCEyes:AddCollapsingHeader("Eyecolor")
-- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
eyecolorTable = eyecolor:AddTable("", 10)
eyecolorRow = eyecolorTable:AddRow()
-- Row 3 - Column 1
eyecolorPrevious = eyecolorRow:AddCell():AddButton("<")
-- Row 3 - Column 2
eyecolorSelector = eyecolorRow:AddCell():AddCombo("")
-- Row 3 - Column 3
eyecolorNext = eyecolorRow:AddCell():AddButton(">")
-----
eyecolorL = CCEyes:AddCollapsingHeader("Left Eye")
-- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
eyecolorLTable = eyecolorL:AddTable("", 10)
eyecolorLRow = eyecolorLTable:AddRow()
-- Row 3 - Column 1
eyecolorLPrevious = eyecolorLRow:AddCell():AddButton("<")
-- Row 3 - Column 2
eyecolorLSelector = eyecolorLRow:AddCell():AddCombo("")
-- Row 3 - Column 3
eyecolorLNext = eyecolorLRow:AddCell():AddButton(">")
-----
eyecolorR = CCEyes:AddCollapsingHeader("Right Eye")
-- skincolor:AddColorEdit("Skincolor Editor")
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
eyecolorRTable = eyecolorR:AddTable("", 10)
eyecolorRRow = eyecolorRTable:AddRow()
-- Row 3 - Column 1
eyecolorRPrevious = eyecolorRRow:AddCell():AddButton("<")
-- Row 3 - Column 2
eyecolorRSelector = eyecolorRRow:AddCell():AddCombo("")
-- Row 3 - Column 3
eyecolorRNext = eyecoloRrRow:AddCell():AddButton(">")
-----


