---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                 Character Creator                --
--                                                  --
------------------------------------------------------

--#region Header/Categories
--Dummies are used for spacing until i figure it out in UI_Style
tEQ:AddDummy(0,5)

tEQ:AddSeparatorText("")

-- @enum StatsItemSlot
--Ext_Enums.StatsItemSlot = {
-- Overhead = 15,

--#region Categories
EQHelmet = tEQ:AddTree("Helmet")
EQHelmet.Framed = true
tEQ:AddSeparatorText("")
EQCloak = tEQ:AddTree("Cloak")
EQCloak.Framed = true
tEQ:AddSeparatorText("")
EQBreast = tEQ:AddTree("Breast")
EQBreast.Framed = true
tEQ:AddSeparatorText("")
EQGloves = tEQ:AddTree("Gloves")
EQGloves.Framed = true
tEQ:AddSeparatorText("")
EQBoots = tEQ:AddTree("Boots")
EQBoots.Framed = true
tEQ:AddSeparatorText("")
EQVanityBody = tEQ:AddTree("VanityBody")
EQVanityBody.Framed = true
tEQ:AddSeparatorText("")
EQVanityBoots = tEQ:AddTree("VanityBoots")
EQVanityBoots.Framed = true
tEQ:AddSeparatorText("")
EQUnderwear = tEQ:AddTree("Underwear")
EQUnderwear.Framed = true
tEQ:AddSeparatorText("")
EQAmulet = tEQ:AddTree("Amulet")
EQAmulet.Framed = true
--#endregion

--#endregion

------------------------------------------------------
--                                                  --
--                      Helmet                      --
--                                                  --
------------------------------------------------------

--#region Helmet
EQHelmet:AddDummy(0,5)

HelmetAmount = EQHelmet:AddText("")
HelmetTable = EQHelmet:AddTable("", 3)

EQHelmet:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                      Cloak                       --
--                                                  --
------------------------------------------------------

--#region Eyes
EQCloak:AddDummy(0,5)

CloakAmount = EQCloak:AddText("")
CloakTable = EQCloak:AddTable("", 3)

EQCloak:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                      Breast                      --
--                                                  --
------------------------------------------------------

--#region Breast
EQBreast:AddDummy(0,5)

BreastAmount = EQBreast:AddText("")
BreastTable = EQBreast:AddTable("", 3)

EQBreast:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                     Gloves                       --
--                                                  --
------------------------------------------------------

--#region Gloves
EQGloves:AddDummy(0,5)

GlovesAmount = EQGloves:AddText("")
GlovesTable = EQGloves:AddTable("", 3)

EQGloves:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                     Boots                        --
--                                                  --
------------------------------------------------------

--#region Hair
EQBoots:AddDummy(0,5)

BootsAmount = EQBoots:AddText("")
BootsTable = EQBoots:AddTable("", 3)

EQBoots:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                  VanityBody                      --
--                                                  --
------------------------------------------------------

--#region VanityBody
EQVanityBody:AddDummy(0,5)

VanityBodyAmount = EQVanityBody:AddText("")
VanityBodyTable = EQVanityBody:AddTable("", 3)

EQVanityBody:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                  VanityBoots                     --
--                                                  --
------------------------------------------------------

--#region VanityBoots
EQVanityBoots:AddDummy(0,5)

VanityBootsAmount = EQVanityBoots:AddText("")
VanityBootsTable = EQVanityBoots:AddTable("", 3)

EQVanityBoots:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                    Underwear 	                --
--                                                  --
------------------------------------------------------

--#region Underwear
EQUnderwear:AddDummy(0,5)

UnderwearAmount = EQUnderwear:AddText("")
UnderwearTable = EQUnderwear:AddTable("", 3)

EQUnderwear:AddDummy(0,5)
--#endregion

------------------------------------------------------
--                                                  --
--                      Amulet 	       		        --
--                                                  --
------------------------------------------------------

--#region Amulet
EQAmulet:AddDummy(0,5)

AmuletAmount = EQAmulet:AddText("")
AmuletTable = EQAmulet:AddTable("", 3)

EQAmulet:AddDummy(0,5)
--#endregion