---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                 Character Creator                --
--                                                  --
------------------------------------------------------
tCC:AddDummy(0,5)

-- TESTBUTTON = tCC:AddButton("BUMP ME")
----- Race
-- raceHeader = CCBody:AddSeparatorText("Race")
-- racePrevious = CCBody:AddButton("<")
TestText = tCC:AddText("No CCAVs/CCSVs Recieved")
raceSelector = tCC:AddCombo("Race")
showAllOptionsCheck = tCC:AddCheckbox("Show All Options")
showAllOptionsCheck.SameLine = true
showAllOptionsCheck.Checked = false
-- raceSelector.SameLine = true
-- raceNext = CCBody:AddButton(">")
-- raceNext.SameLine = true

tCC:AddSeparatorText("")
---- Base Headers
CCBody = tCC:AddCollapsingHeader("Body")
tCC:AddSeparatorText("")
CCFace = tCC:AddCollapsingHeader("Face")
tCC:AddSeparatorText("")
CCEyes = tCC:AddCollapsingHeader("Eyes")
tCC:AddSeparatorText("")
CCMakeup = tCC:AddCollapsingHeader("Makeup")
tCC:AddSeparatorText("")
CCHair = tCC:AddCollapsingHeader("Hair")
CCBeardSep = tCC:AddSeparatorText("")
CCBeardSep.Visible = true
CCBeard = tCC:AddCollapsingHeader("Facial Hair")
CCBeard.Visible = true
CCHornsSep = tCC:AddSeparatorText("")
CCHornsSep.Visible = true
CCHorns = tCC:AddCollapsingHeader("Horns")
CCHorns.Visible = true
CCTailsSep = tCC:AddSeparatorText("")
CCTailsSep.Visible = true
CCTails = tCC:AddCollapsingHeader("Tail")
CCTails.Visible = true
CCWingsSep = tCC:AddSeparatorText("")
CCWingsSep.Visible = true
CCWings = tCC:AddCollapsingHeader("Wings")
CCWings.Visible = true
------------------------------------------------------
--                                                  --
--                      Body                        --
--                                                  --
------------------------------------------------------

CCBody:AddDummy(0,5)
-----
CCBody:AddDummy(0,5) -- Dummies are used for spacing until i figure it out in UI_Style
----- Heads
-- headsHeader = CCBody:AddCollapsingHeader("Heads")
-- headsAdder = headsHeader:AddButton("Add Head")
-- headsTable = headsHeader:AddTable("", 4)
-- headsRow = headsTable:AddRow()
-- headButton1 = headsRow:AddCell():AddButton("X")
-- headButton2 = headsRow:AddCell():AddButton("X")
-- headButton3 = headsRow:AddCell():AddButton("X")
headSelector = CCBody:AddCombo("Heads")

-----
CCBody:AddDummy(0,5)
--- Skincolor
skinColorHeader = CCBody:AddCollapsingHeader("Skincolor")
skinColorTable = skinColorHeader:AddTable("", 10)
skinColorRow = skinColorTable:AddRow()
skinColorButton1 = skinColorRow:AddCell():AddButton("X")
skinColorButton2 = skinColorRow:AddCell():AddButton("X")
skinColorButton3 = skinColorRow:AddCell():AddButton("X")
skinColorButton4 = skinColorRow:AddCell():AddButton("X")
skinColorButton5 = skinColorRow:AddCell():AddButton("X")
skinColorButton6 = skinColorRow:AddCell():AddButton("X")
skinColorButton7 = skinColorRow:AddCell():AddButton("X")
skinColorButton8 = skinColorRow:AddCell():AddButton("X")
skinColorButton9 = skinColorRow:AddCell():AddButton("X")
skinColorButton10 = skinColorRow:AddCell():AddButton("X")
-----
CCBody:AddDummy(0,5)
----- Scars
scarsHeader = CCBody:AddCollapsingHeader("Scars")
scarsTable = scarsHeader:AddTable("", 4)
scarsRow = scarsTable:AddRow()
scarsButton1 = scarsRow:AddCell():AddButton("X")
scarsButton2 = scarsRow:AddCell():AddButton("X")
scarsButton3 = scarsRow:AddCell():AddButton("X")
scarsButton4 = scarsRow:AddCell():AddButton("X")
-----
CCBody:AddDummy(0,5)
----- Maturity
-- ageHeader = CCBody:AddSeparatorText("Maturity")
-- agePrevious = CCBody:AddButton("<")
ageSelector = CCBody:AddSliderInt("Maturity", 0, 0, 100)
-- ageSelector.SameLine = true
-- ageNext = CCBody:AddButton(">")
-- ageNext.SameLine = true
-----
CCBody:AddDummy(0,5)
----- Freckle Quantity
-- freckleQHeader = CCBody:AddSeparatorText("Freckle Quantity")
-- freckleQPrevious = CCBody:AddButton("<")
freckleQSelector = CCBody:AddSliderInt("Freckle Quantity", 0, 0, 100)
-- freckleQSelector.SameLine = true
-- freckleQNext = CCBody:AddButton(">")
-- freckleQNext.SameLine = true
-----
CCBody:AddDummy(0,5)
----- Freckle Intensity
-- freckleIHeader = CCBody:AddSeparatorText("Freckle Intensity")
-- freckleIPrevious = CCBody:AddButton("<")
freckleISelector = CCBody:AddSliderInt("Freckle Intensity", 0, 0, 100)
-- freckleISelector.SameLine = true
-- freckleINext = CCBody:AddButton(">")
-- freckleINext.SameLine = true
-----
CCBody:AddDummy(0,5)
----- Vitiligo Pigmentation
-- vitiligoHeader = CCBody:AddSeparatorText("Vitiligo Pigmentation")
-- vitiligoPrevious = CCBody:AddButton("<")
vitiligoSelector = CCBody:AddSliderInt("Vitiligo Pigmentation", 0, 0, 100)
-- vitiligoSelector.SameLine = true
-- vitiligoNext = CCBody:AddButton(">")
-- vitiligoNext.SameLine = true
-----
CCBody:AddDummy(0,5)
----- Genital
-- genitalHeader = CCBody:AddSeparatorText("Genital")
-- genitalPrevious = CCBody:AddButton("<")
genitalSelector = CCBody:AddCombo("Genital")
-- genitalSelector.SameLine = true
-- genitalNext = CCBody:AddButton(">")
-- genitalNext.SameLine = true
-----
CCBody:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Face                        --
--                                                  --
------------------------------------------------------

CCFace:AddDummy(0,5)
----- Tattoos
tattooHeader = CCFace:AddCollapsingHeader("Tattos")
tattooTable = tattooHeader:AddTable("", 4)
tattooRow = tattooTable:AddRow()
tattooButton1 = tattooRow:AddCell():AddButton("X")
tattooButton2 = tattooRow:AddCell():AddButton("X")
tattooButton3 = tattooRow:AddCell():AddButton("X")
tattooButton4 = tattooRow:AddCell():AddButton("X")
-----
CCFace:AddDummy(0,5)
----- Piercing
-- piercingHeader = CCFace:AddCollapsingHeader("Piercing")
-- piercingPrevious = piercingHeader:AddButton("<")
piercingSelector = CCFace:AddCombo("Piercing")
-- piercingSelector.SameLine = true
-- piercingNext = piercingHeader:AddButton(">")
-- piercingNext.SameLine = true
-----
CCFace:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Eyes                        --
--                                                  --
------------------------------------------------------

CCEyes:AddDummy(0,5)
----- Heterochromia
heterochromiaButton = CCEyes:AddCheckbox("Heterochromia")
-----
CCEyes:AddDummy(0,5)
----- Eyecolor
eyecolorHeader = CCEyes:AddCollapsingHeader("Eyecolor")
eyecolorTable = eyecolorHeader:AddTable("", 10)
eyecolorRow = eyecolorTable:AddRow()
eyecolorPrevious = eyecolorRow:AddCell():AddButton("<")
eyecolorSelector = eyecolorRow:AddCell():AddCombo("")
eyecolorNext = eyecolorRow:AddCell():AddButton(">")
--- Left Eye
eyecolorLHeader = CCEyes:AddCollapsingHeader("Left Eye")
eyecolorLHeader.Visible = false
eyecolorLTable = eyecolorLHeader:AddTable("", 10)
eyecolorLRow = eyecolorLTable:AddRow()
eyecolorLPrevious = eyecolorLRow:AddCell():AddButton("<")
eyecolorLSelector = eyecolorLRow:AddCell():AddCombo("")
eyecolorLNext = eyecolorLRow:AddCell():AddButton(">")
--- Right Eye
eyecolorRHeader = CCEyes:AddCollapsingHeader("Right Eye")
eyecolorRHeader.Visible = false
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

CCMakeup:AddDummy(0,5)
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
-- makeupIntHeader = makeupHeaderContainer:AddSeparatorText("Intensity")
-- makeupIntPrevious = makeupHeaderContainer:AddButton("<")
makeupIntSelector = makeupHeaderContainer:AddSliderInt("Makeup Intensity", 0, 0, 100)
-- makeupIntSelector.SameLine = true
-- makeupIntNext = makeupHeaderContainer:AddButton(">")
-- makeupIntNext.SameLine = true

--- Metallic Tint
-- makeupMetalHeader = makeupHeaderContainer:AddSeparatorText("Metallic Tint")
-- makeupMetalPrevious = makeupHeaderContainer:AddButton("<")
makeupMetalSelector = makeupHeaderContainer:AddSliderInt("Makeup Metallic Tint", 0, 0, 100)
-- makeupMetalSelector.SameLine = true
-- makeupMetalNext = makeupHeaderContainer:AddButton(">")
-- makeupMetalNext.SameLine = true

--- Glossy Tint
-- makeupGlossHeader = makeupHeaderContainer:AddSeparatorText("Glossy Tint")
-- makeupGlossPrevious = makeupHeaderContainer:AddButton("<")
makeupGlossSelector = makeupHeaderContainer:AddSliderInt("Makeup Glossy Tint", 0, 0, 100)
-- makeupGlossSelector.SameLine = true
-- makeupGlossNext = makeupHeaderContainer:AddButton(">")
-- makeupGlossNext.SameLine = true

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
-- lipsIntHeader = lipsHeaderContainer:AddSeparatorText("Intensity")
-- lipsIntPrevious = lipsHeaderContainer:AddButton("<")
lipsIntSelector = lipsHeaderContainer:AddSliderInt("Lips Color Intensity", 0, 0, 100)
-- lipsIntSelector.SameLine = true
-- lipsIntNext = lipsHeaderContainer:AddButton(">")
-- lipsIntNext.SameLine = true

--- Metallic Tint
-- lipsMetalHeader = lipsHeaderContainer:AddSeparatorText("Metallic Tint")
-- lipsMetalPrevious = lipsHeaderContainer:AddButton("<")
lipsMetalSelector = lipsHeaderContainer:AddSliderInt("Lips Metallic Tint", 0, 0, 100)
-- lipsMetalSelector.SameLine = true
-- lipsMetalNext = lipsHeaderContainer:AddButton(">")
-- lipsMetalNext.SameLine = true

--- Glossy Tint
-- lipsGlossHeader = lipsHeaderContainer:AddSeparatorText("Glossy Tint")
-- lipsGlossPrevious = lipsHeaderContainer:AddButton("<")
lipsGlossSelector = lipsHeaderContainer:AddSliderInt("Lips Glossy Tint", 0, 0, 100)
-- lipsGlossSelector.SameLine = true
-- lipsGlossNext = lipsHeaderContainer:AddButton(">")
-- lipsGlossNext.SameLine = true

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

CCHair:AddDummy(0,5)
----- Hair Style
-- hairStyleHeader = CCHair:AddCollapsingHeader("Hair Style")
-- hairStyleTable = hairStyleHeader:AddTable("", 4)
-- hairStyleRow = hairStyleTable:AddRow()
-- hairStylePrevious = hairStyleRow:AddCell():AddButton("<")
-- hairStyleSelector = hairStyleRow:AddCell():AddCombo("")
-- hairStyleNext = hairStyleRow:AddCell():AddButton(">")
hairSelector = CCHair:AddCombo("Hair Style")
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
-- highlightsIntHeader = highlightsHeaderContainer:AddSeparatorText("Highlight Intensity")
-- highlightsIntPrevious = highlightsHeaderContainer:AddButton("<")
highlightsIntSelector = highlightsHeaderContainer:AddSliderInt("Highlight Intensity", 0, 0, 100)
-- highlightsIntSelector.SameLine = true
-- highlightsIntNext = highlightsHeaderContainer:AddButton(">")
-- highlightsIntNext.SameLine = true
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
-- greyingIntHeader = greyingHeaderContainer:AddSeparatorText("Greying Intensity")
-- greyingIntPrevious = greyingHeaderContainer:AddButton("<")
greyingIntSelector = greyingHeaderContainer:AddSliderInt("Greying Intensity", 0, 0, 100)
-- greyingIntSelector.SameLine = true
-- greyingIntNext = greyingHeaderContainer:AddButton(">")
-- greyingIntNext.SameLine = true
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

------------------------------------------------------
--                                                  --
--                   Facial Hair                    --
--                                                  --
------------------------------------------------------

CCBeard:AddDummy(0,5)
----- Hair Style
-- beardstyleHeader = CCBeard:AddCollapsingHeader("Beard")
-- beardstyleTable = beardstyleHeader:AddTable("", 4)
-- beardstyleRow = beardstyleTable:AddRow()
-- beardstyleButton1 = beardstyleRow:AddCell():AddButton("X")
-- beardstyleButton2 = beardstyleRow:AddCell():AddButton("X")
-- beardstyleButton3 = beardstyleRow:AddCell():AddButton("X")
beardSelector = CCBeard:AddCombo("Beard Types")
-----
CCBeard:AddDummy(0,5)
----- Hair Color
beardColorHeader = CCBeard:AddCollapsingHeader("Hair Color")
beardColorTable = beardColorHeader:AddTable("", 10)
beardColorRow = beardColorTable:AddRow()
beardColorButton1 = beardColorRow:AddCell():AddButton("X")
beardColorButton2 = beardColorRow:AddCell():AddButton("X")
beardColorButton3 = beardColorRow:AddCell():AddButton("X")
beardColorButton4 = beardColorRow:AddCell():AddButton("X")
beardColorButton5 = beardColorRow:AddCell():AddButton("X")
beardColorButton6 = beardColorRow:AddCell():AddButton("X")
beardColorButton7 = beardColorRow:AddCell():AddButton("X")
beardColorButton8 = beardColorRow:AddCell():AddButton("X")
beardColorButton9 = beardColorRow:AddCell():AddButton("X")
beardColorButton10 = beardColorRow:AddCell():AddButton("X")
-----
CCBeard:AddDummy(0,5)
----- Greying
beardgreyingHeaderContainer = CCBeard:AddCollapsingHeader("Greying")
--- Intensity
-- greyingIntHeader = greyingHeaderContainer:AddSeparatorText("Greying Intensity")
-- greyingIntPrevious = greyingHeaderContainer:AddButton("<")
beardgreyingIntSelector = beardgreyingHeaderContainer:AddSliderInt("Greying Intensity", 0, 0, 100)
-- greyingIntSelector.SameLine = true
-- greyingIntNext = greyingHeaderContainer:AddButton(">")
-- greyingIntNext.SameLine = true
-----
CCBeard:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Horns                       --
--                                                  --
------------------------------------------------------

CCHorns:AddDummy(0,5)
----- Hair Style
-- hornstyleHeader = CCHorns:AddCollapsingHeader("Horn Style")
-- hornstyleTable = hornstyleHeader:AddTable("", 4)
-- hornstyleRow = hornstyleTable:AddRow()
-- hornstyleButton1 = hornstyleRow:AddCell():AddButton("X")
-- hornstyleButton2 = hornstyleRow:AddCell():AddButton("X")
-- hornstyleButton3 = hornstyleRow:AddCell():AddButton("X")
hornSelector = CCHorns:AddCombo("Horns Types")
-----
CCHorns:AddDummy(0,5)
----- Horn Color
hornColorHeader = CCHorns:AddCollapsingHeader("Horn Color")
hornColorTable = hornColorHeader:AddTable("", 10)
hornColorRow = hornColorTable:AddRow()
hornColorButton1 = hornColorRow:AddCell():AddButton("X")
hornColorButton2 = hornColorRow:AddCell():AddButton("X")
hornColorButton3 = hornColorRow:AddCell():AddButton("X")
hornColorButton4 = hornColorRow:AddCell():AddButton("X")
hornColorButton5 = hornColorRow:AddCell():AddButton("X")
hornColorButton6 = hornColorRow:AddCell():AddButton("X")
hornColorButton7 = hornColorRow:AddCell():AddButton("X")
hornColorButton8 = hornColorRow:AddCell():AddButton("X")
hornColorButton9 = hornColorRow:AddCell():AddButton("X")
hornColorButton10 = hornColorRow:AddCell():AddButton("X")
-----
CCHorns:AddDummy(0,5)
----- Horn Tip Color
horntipColorHeader = CCHorns:AddCollapsingHeader("Horn Tip Color")
horntipColorTable = horntipColorHeader:AddTable("", 10)
horntipColorRow = horntipColorTable:AddRow()
horntipColorButton1 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton2 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton3 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton4 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton5 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton6 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton7 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton8 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton9 = horntipColorRow:AddCell():AddButton("X")
horntipColorButton10 = horntipColorRow:AddCell():AddButton("X")
-----
CCHorns:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                       Tail                       --
--                                                  --
------------------------------------------------------

CCTails:AddDummy(0,5)
----- Tail Style
-- tailHeader = CCTails:AddCollapsingHeader("Tails")
-- tailTable = tailHeader:AddTable("", 4)
-- tailRow = tailTable:AddRow()
-- tailButton1 = tailRow:AddCell():AddButton("X")
-- tailButton2 = tailRow:AddCell():AddButton("X")
-- tailButton3 = tailRow:AddCell():AddButton("X")
tailSelector = CCTails:AddCombo("Tail Types")
-----
CCTails:AddDummy(0,5)

------------------------------------------------------
--                                                  --
--                      Wings                       --
--                                                  --
------------------------------------------------------

CCWings:AddDummy(0,5)
----- Wing Style
-- wingsHeader = CCWings:AddCollapsingHeader("Wings")
wingsSelector = CCWings:AddCombo("Wing Types")
-- wingsTable = wingsHeader:AddTable("", 4)
-- wingsRow = wingsTable:AddRow()
-- wingsButton1 = wingsRow:AddCell():AddButton("X")
-- wingsButton2 = wingsRow:AddCell():AddButton("X")
-- wingsButton3 = wingsRow:AddCell():AddButton("X")
-----
CCTails:AddDummy(0,5)

