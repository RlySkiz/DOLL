------------------------------------------------------
--                                                  --
--                      UI Style                    --
--                                                  --
------------------------------------------------------ 
w.NoTitleBar = false
w.Closeable = true
-- w.MenuBar = true
w:SetStyle("WindowMinSize", 200, 200)
w:SetStyle("WindowRounding", 15)
w:SetColor("WindowBg", {0.4824, 0.4078, 0.9333, 0.2})
w:SetColor("TableRowBg", {0.4824, 0.4078, 0.9333, 0.4})

------------------------------------------------------
--                                                  --
--                    CC Elements                   --
--                                                  --
------------------------------------------------------ 



------------------------------------------------------
--                                                  --
--                 Settings Elements                --
--                                                  --
------------------------------------------------------ 

-- erectionCheckBox:SetColor("CheckMark", {1, 1, 1, 1})

------------------------------------------------------
--                                                  --
--                   About Elements                 --
--                                                  --
------------------------------------------------------ 

-- test.SameLine = true



-- tableOne.NoClip = true -- doesnt work smh
-- browserInfo.SameLine = true -- doesnt work smh



-- BEGIN_ENUM(GuiStyleVar, int32_t)
-- 	EV(Alpha, (int32_t)ImGuiStyleVar_Alpha)
-- 	EV(DisabledAlpha, (int32_t)ImGuiStyleVar_DisabledAlpha)

-- 	EV(WindowPadding, (int32_t)ImGuiStyleVar_WindowPadding)
-- 	EV(WindowRounding, (int32_t)ImGuiStyleVar_WindowRounding)
-- 	EV(WindowBorderSize, (int32_t)ImGuiStyleVar_WindowBorderSize)
-- 	EV(WindowMinSize, (int32_t)ImGuiStyleVar_WindowMinSize)
-- 	EV(WindowTitleAlign, (int32_t)ImGuiStyleVar_WindowTitleAlign)

-- 	EV(ChildRounding, (int32_t)ImGuiStyleVar_ChildRounding)
-- 	EV(ChildBorderSize, (int32_t)ImGuiStyleVar_ChildBorderSize)

-- 	EV(PopupRounding, (int32_t)ImGuiStyleVar_PopupRounding)
-- 	EV(PopupBorderSize, (int32_t)ImGuiStyleVar_PopupBorderSize)

-- 	EV(FramePadding, (int32_t)ImGuiStyleVar_FramePadding)
-- 	EV(FrameRounding, (int32_t)ImGuiStyleVar_FrameRounding)
-- 	EV(FrameBorderSize, (int32_t)ImGuiStyleVar_FrameBorderSize)

-- 	EV(ItemSpacing, (int32_t)ImGuiStyleVar_ItemSpacing)
-- 	EV(ItemInnerSpacing, (int32_t)ImGuiStyleVar_ItemInnerSpacing)
-- 	EV(IndentSpacing, (int32_t)ImGuiStyleVar_IndentSpacing)

-- 	EV(CellPadding, (int32_t)ImGuiStyleVar_CellPadding)

-- 	EV(ScrollbarSize, (int32_t)ImGuiStyleVar_ScrollbarSize)
-- 	EV(ScrollbarRounding, (int32_t)ImGuiStyleVar_ScrollbarRounding)

-- 	EV(GrabMinSize, (int32_t)ImGuiStyleVar_GrabMinSize)
-- 	EV(GrabRounding, (int32_t)ImGuiStyleVar_GrabRounding)

-- 	EV(TabRounding, (int32_t)ImGuiStyleVar_TabRounding)
-- 	EV(TabBarBorderSize, (int32_t)ImGuiStyleVar_TabBarBorderSize)

-- 	EV(ButtonTextAlign, (int32_t)ImGuiStyleVar_ButtonTextAlign)
-- 	EV(SelectableTextAlign, (int32_t)ImGuiStyleVar_SelectableTextAlign)

-- 	EV(SeparatorTextBorderSize, (int32_t)ImGuiStyleVar_SeparatorTextBorderSize)
-- 	EV(SeparatorTextAlign, (int32_t)ImGuiStyleVar_SeparatorTextAlign)
-- 	EV(SeparatorTextPadding, (int32_t)ImGuiStyleVar_SeparatorTextPadding)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_ENUM(GuiColor, int32_t)
-- 	EV(Text, (int32_t)ImGuiCol_Text)
-- 	EV(TextDisabled, (int32_t)ImGuiCol_TextDisabled)

-- 	EV(WindowBg, (int32_t)ImGuiCol_WindowBg)
-- 	EV(ChildBg, (int32_t)ImGuiCol_ChildBg)
-- 	EV(PopupBg, (int32_t)ImGuiCol_PopupBg)

-- 	EV(Border, (int32_t)ImGuiCol_Border)
-- 	EV(BorderShadow, (int32_t)ImGuiCol_BorderShadow)

-- 	EV(FrameBg, (int32_t)ImGuiCol_FrameBg)
-- 	EV(FrameBgHovered, (int32_t)ImGuiCol_FrameBgHovered)
-- 	EV(FrameBgActive, (int32_t)ImGuiCol_FrameBgActive)

-- 	EV(TitleBg, (int32_t)ImGuiCol_TitleBg)
-- 	EV(TitleBgActive, (int32_t)ImGuiCol_TitleBgActive)
-- 	EV(TitleBgCollapsed, (int32_t)ImGuiCol_TitleBgCollapsed)

-- 	EV(MenuBarBg, (int32_t)ImGuiCol_MenuBarBg)

-- 	EV(ScrollbarBg, (int32_t)ImGuiCol_ScrollbarBg)
-- 	EV(ScrollbarGrab, (int32_t)ImGuiCol_ScrollbarGrab)
-- 	EV(ScrollbarGrabHovered, (int32_t)ImGuiCol_ScrollbarGrabHovered)
-- 	EV(ScrollbarGrabActive, (int32_t)ImGuiCol_ScrollbarGrabActive)

-- 	EV(CheckMark, (int32_t)ImGuiCol_CheckMark)

-- 	EV(SliderGrab, (int32_t)ImGuiCol_SliderGrab)
-- 	EV(SliderGrabActive, (int32_t)ImGuiCol_SliderGrabActive)

-- 	EV(Button, (int32_t)ImGuiCol_Button)
-- 	EV(ButtonHovered, (int32_t)ImGuiCol_ButtonHovered)
-- 	EV(ButtonActive, (int32_t)ImGuiCol_ButtonActive)

-- 	EV(Header, (int32_t)ImGuiCol_Header)
-- 	EV(HeaderHovered, (int32_t)ImGuiCol_HeaderHovered)
-- 	EV(HeaderActive, (int32_t)ImGuiCol_HeaderActive)

-- 	EV(Separator, (int32_t)ImGuiCol_Separator)
-- 	EV(SeparatorHovered, (int32_t)ImGuiCol_SeparatorHovered)
-- 	EV(SeparatorActive, (int32_t)ImGuiCol_SeparatorActive)

-- 	EV(ResizeGrip, (int32_t)ImGuiCol_ResizeGrip)
-- 	EV(ResizeGripHovered, (int32_t)ImGuiCol_ResizeGripHovered)
-- 	EV(ResizeGripActive, (int32_t)ImGuiCol_ResizeGripActive)

-- 	EV(Tab, (int32_t)ImGuiCol_Tab)
-- 	EV(TabHovered, (int32_t)ImGuiCol_TabHovered)
-- 	EV(TabActive, (int32_t)ImGuiCol_TabActive)
-- 	EV(TabUnfocused, (int32_t)ImGuiCol_TabUnfocused)
-- 	EV(TabUnfocusedActive, (int32_t)ImGuiCol_TabUnfocusedActive)

-- 	EV(PlotLines, (int32_t)ImGuiCol_PlotLines)
-- 	EV(PlotLinesHovered, (int32_t)ImGuiCol_PlotLinesHovered)
-- 	EV(PlotHistogram, (int32_t)ImGuiCol_PlotHistogram)
-- 	EV(PlotHistogramHovered, (int32_t)ImGuiCol_PlotHistogramHovered)

-- 	EV(TableHeaderBg, (int32_t)ImGuiCol_TableHeaderBg)
-- 	EV(TableBorderStrong, (int32_t)ImGuiCol_TableBorderStrong)
-- 	EV(TableBorderLight, (int32_t)ImGuiCol_TableBorderLight)
-- 	EV(TableRowBg, (int32_t)ImGuiCol_TableRowBg)
-- 	EV(TableRowBgAlt, (int32_t)ImGuiCol_TableRowBgAlt)

-- 	EV(TextSelectedBg, (int32_t)ImGuiCol_TextSelectedBg)

-- 	EV(DragDropTarget, (int32_t)ImGuiCol_DragDropTarget)

-- 	EV(NavHighlight, (int32_t)ImGuiCol_NavHighlight)
-- 	EV(NavWindowingHighlight, (int32_t)ImGuiCol_NavWindowingHighlight)
-- 	EV(NavWindowingDimBg, (int32_t)ImGuiCol_NavWindowingDimBg)

-- 	EV(ModalWindowDimBg, (int32_t)ImGuiCol_ModalWindowDimBg)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiWindowFlags, uint32_t)
-- 	EV(NoTitleBar, (uint32_t)ImGuiWindowFlags_NoTitleBar)
-- 	EV(NoResize, (uint32_t)ImGuiWindowFlags_NoResize)
-- 	EV(NoMove, (uint32_t)ImGuiWindowFlags_NoMove)
-- 	EV(NoScrollbar, (uint32_t)ImGuiWindowFlags_NoScrollbar)
-- 	EV(NoScrollWithMouse, (uint32_t)ImGuiWindowFlags_NoScrollWithMouse)
-- 	EV(NoCollapse, (uint32_t)ImGuiWindowFlags_NoCollapse)
-- 	EV(AlwaysAutoResize, (uint32_t)ImGuiWindowFlags_AlwaysAutoResize)
-- 	EV(NoBackground, (uint32_t)ImGuiWindowFlags_NoBackground)
-- 	EV(NoSavedSettings, (uint32_t)ImGuiWindowFlags_NoSavedSettings)
-- 	EV(NoMouseInputs, (uint32_t)ImGuiWindowFlags_NoMouseInputs)
-- 	EV(MenuBar, (uint32_t)ImGuiWindowFlags_MenuBar)
-- 	EV(HorizontalScrollbar, (uint32_t)ImGuiWindowFlags_HorizontalScrollbar)
-- 	EV(NoFocusOnAppearing, (uint32_t)ImGuiWindowFlags_NoFocusOnAppearing)
-- 	EV(NoBringToFrontOnFocus, (uint32_t)ImGuiWindowFlags_NoBringToFrontOnFocus)
-- 	EV(AlwaysVerticalScrollbar, (uint32_t)ImGuiWindowFlags_AlwaysVerticalScrollbar)
-- 	EV(AlwaysHorizontalScrollbar, (uint32_t)ImGuiWindowFlags_AlwaysHorizontalScrollbar)
-- 	EV(NoNavInputs, (uint32_t)ImGuiWindowFlags_NoNavInputs)
-- 	EV(NoNavFocus, (uint32_t)ImGuiWindowFlags_NoNavFocus)
-- 	EV(UnsavedDocument, (uint32_t)ImGuiWindowFlags_UnsavedDocument)
-- 	EV(NoNav, (uint32_t)ImGuiWindowFlags_NoNav)
-- 	EV(NoDecoration, (uint32_t)ImGuiWindowFlags_NoDecoration)
-- 	EV(NoInputs, (uint32_t)ImGuiWindowFlags_NoInputs)
-- END_ENUM()

--------------------------------------------------


-- BEGIN_BITMASK(GuiTreeNodeFlags, uint32_t)
-- 	EV(Selected, (uint32_t)ImGuiTreeNodeFlags_Selected)
-- 	EV(Framed, (uint32_t)ImGuiTreeNodeFlags_Framed)
-- 	EV(AllowOverlap, (uint32_t)ImGuiTreeNodeFlags_AllowOverlap)
-- 	EV(NoTreePushOnOpen, (uint32_t)ImGuiTreeNodeFlags_NoTreePushOnOpen)
-- 	EV(NoAutoOpenOnLog, (uint32_t)ImGuiTreeNodeFlags_NoAutoOpenOnLog)
-- 	EV(DefaultOpen, (uint32_t)ImGuiTreeNodeFlags_DefaultOpen)
-- 	EV(OpenOnDoubleClick, (uint32_t)ImGuiTreeNodeFlags_OpenOnDoubleClick)
-- 	EV(OpenOnArrow, (uint32_t)ImGuiTreeNodeFlags_OpenOnArrow)
-- 	EV(Leaf, (uint32_t)ImGuiTreeNodeFlags_Leaf)
-- 	EV(Bullet, (uint32_t)ImGuiTreeNodeFlags_Bullet)
-- 	EV(FramePadding, (uint32_t)ImGuiTreeNodeFlags_FramePadding)
-- 	EV(SpanAvailWidth, (uint32_t)ImGuiTreeNodeFlags_SpanAvailWidth)
-- 	EV(SpanFullWidth, (uint32_t)ImGuiTreeNodeFlags_SpanFullWidth)
-- 	EV(SpanAllColumns, (uint32_t)ImGuiTreeNodeFlags_SpanAllColumns)
-- 	EV(NavLeftJumpsBackHere, (uint32_t)ImGuiTreeNodeFlags_NavLeftJumpsBackHere)
-- 	EV(CollapsingHeader, (uint32_t)ImGuiTreeNodeFlags_CollapsingHeader)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiTabBarFlags, uint32_t)
-- 	EV(Reorderable, (uint32_t)ImGuiTabBarFlags_Reorderable)
-- 	EV(AutoSelectNewTabs, (uint32_t)ImGuiTabBarFlags_AutoSelectNewTabs)
-- 	EV(TabListPopupButton, (uint32_t)ImGuiTabBarFlags_TabListPopupButton)
-- 	EV(NoCloseWithMiddleMouseButton, (uint32_t)ImGuiTabBarFlags_NoCloseWithMiddleMouseButton)
-- 	EV(NoTabListScrollingButtons, (uint32_t)ImGuiTabBarFlags_NoTabListScrollingButtons)
-- 	EV(NoTooltip, (uint32_t)ImGuiTabBarFlags_NoTooltip)
-- 	EV(FittingPolicyResizeDown, (uint32_t)ImGuiTabBarFlags_FittingPolicyResizeDown)
-- 	EV(FittingPolicyScroll, (uint32_t)ImGuiTabBarFlags_FittingPolicyScroll)
-- 	EV(FittingPolicyMask, (uint32_t)ImGuiTabBarFlags_FittingPolicyMask_)
-- 	EV(FittingPolicyDefault, (uint32_t)ImGuiTabBarFlags_FittingPolicyDefault_)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiTabItemFlags, uint32_t)
-- 	EV(UnsavedDocument, (uint32_t)ImGuiTabItemFlags_UnsavedDocument)
-- 	EV(SetSelected, (uint32_t)ImGuiTabItemFlags_SetSelected)
-- 	EV(NoCloseWithMiddleMouseButton, (uint32_t)ImGuiTabItemFlags_NoCloseWithMiddleMouseButton)
-- 	EV(NoPushId, (uint32_t)ImGuiTabItemFlags_NoPushId)
-- 	EV(NoTooltip, (uint32_t)ImGuiTabItemFlags_NoTooltip)
-- 	EV(NoReorder, (uint32_t)ImGuiTabItemFlags_NoReorder)
-- 	EV(Leading, (uint32_t)ImGuiTabItemFlags_Leading)
-- 	EV(Trailing, (uint32_t)ImGuiTabItemFlags_Trailing)
-- 	EV(NoAssumedClosure, (uint32_t)ImGuiTabItemFlags_NoAssumedClosure)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiTableFlags, uint32_t)
-- 	EV(Resizable, (uint32_t)ImGuiTableFlags_Resizable)
-- 	EV(Reorderable, (uint32_t)ImGuiTableFlags_Reorderable)
-- 	EV(Hideable, (uint32_t)ImGuiTableFlags_Hideable)
-- 	EV(Sortable, (uint32_t)ImGuiTableFlags_Sortable)
-- 	EV(NoSavedSettings, (uint32_t)ImGuiTableFlags_NoSavedSettings)
-- 	EV(ContextMenuInBody, (uint32_t)ImGuiTableFlags_ContextMenuInBody)

-- 	// Decorations
-- 	EV(RowBg, (uint32_t)ImGuiTableFlags_RowBg)
-- 	EV(BordersInnerH, (uint32_t)ImGuiTableFlags_BordersInnerH)
-- 	EV(BordersOuterH, (uint32_t)ImGuiTableFlags_BordersOuterH)
-- 	EV(BordersInnerV, (uint32_t)ImGuiTableFlags_BordersInnerV)
-- 	EV(BordersOuterV, (uint32_t)ImGuiTableFlags_BordersOuterV)
-- 	EV(BordersH, (uint32_t)ImGuiTableFlags_BordersH)
-- 	EV(BordersV, (uint32_t)ImGuiTableFlags_BordersV)
-- 	EV(BordersInner, (uint32_t)ImGuiTableFlags_BordersInner)
-- 	EV(BordersOuter, (uint32_t)ImGuiTableFlags_BordersOuter)
-- 	EV(Borders, (uint32_t)ImGuiTableFlags_Borders)
-- 	EV(NoBordersInBody, (uint32_t)ImGuiTableFlags_NoBordersInBody)
-- 	EV(NoBordersInBodyUntilResize, (uint32_t)ImGuiTableFlags_NoBordersInBodyUntilResize)

-- 	// Sizing Policy (read above for defaults)
-- 	EV(SizingFixedFit, (uint32_t)ImGuiTableFlags_SizingFixedFit)
-- 	EV(SizingFixedSame, (uint32_t)ImGuiTableFlags_SizingFixedSame)
-- 	EV(SizingStretchProp, (uint32_t)ImGuiTableFlags_SizingStretchProp)
-- 	EV(SizingStretchSame, (uint32_t)ImGuiTableFlags_SizingStretchSame)

-- 	// Sizing Extra Options
-- 	EV(NoHostExtendX, (uint32_t)ImGuiTableFlags_NoHostExtendX)
-- 	EV(NoHostExtendY, (uint32_t)ImGuiTableFlags_NoHostExtendY)
-- 	EV(NoKeepColumnsVisible, (uint32_t)ImGuiTableFlags_NoKeepColumnsVisible)
-- 	EV(PreciseWidths, (uint32_t)ImGuiTableFlags_PreciseWidths)

-- 	// Clipping
-- 	EV(NoClip, (uint32_t)ImGuiTableFlags_NoClip)

-- 	// Padding
-- 	EV(PadOuterX, (uint32_t)ImGuiTableFlags_PadOuterX)
-- 	EV(NoPadOuterX, (uint32_t)ImGuiTableFlags_NoPadOuterX)
-- 	EV(NoPadInnerX, (uint32_t)ImGuiTableFlags_NoPadInnerX)

-- 	// Scrolling
-- 	EV(ScrollX, (uint32_t)ImGuiTableFlags_ScrollX)
-- 	EV(ScrollY, (uint32_t)ImGuiTableFlags_ScrollY)

-- 	// Sorting
-- 	EV(SortMulti, (uint32_t)ImGuiTableFlags_SortMulti)
-- 	EV(SortTristate, (uint32_t)ImGuiTableFlags_SortTristate)

-- 	// Miscellaneous
-- 	EV(HighlightHoveredColumn, (uint32_t)ImGuiTableFlags_HighlightHoveredColumn)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiTableRowFlags, uint32_t)
-- 	EV(Headers, (uint32_t)ImGuiTableRowFlags_Headers)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiPopupFlags, uint32_t)
-- 	EV(MouseButtonLeft, (uint32_t)ImGuiPopupFlags_MouseButtonLeft)
-- 	EV(MouseButtonRight, (uint32_t)ImGuiPopupFlags_MouseButtonRight)
-- 	EV(MouseButtonMiddle, (uint32_t)ImGuiPopupFlags_MouseButtonMiddle)
-- 	EV(MouseButtonMask_, (uint32_t)ImGuiPopupFlags_MouseButtonMask_)
-- 	EV(MouseButtonDefault_, (uint32_t)ImGuiPopupFlags_MouseButtonDefault_)
-- 	EV(NoReopen, (uint32_t)ImGuiPopupFlags_NoReopen)
-- 	EV(NoOpenOverExistingPopup, (uint32_t)ImGuiPopupFlags_NoOpenOverExistingPopup)
-- 	EV(NoOpenOverItems, (uint32_t)ImGuiPopupFlags_NoOpenOverItems)
-- 	EV(AnyPopupId, (uint32_t)ImGuiPopupFlags_AnyPopupId)
-- 	EV(AnyPopupLevel, (uint32_t)ImGuiPopupFlags_AnyPopupLevel)
-- 	EV(AnyPopup, (uint32_t)ImGuiPopupFlags_AnyPopup)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiInputTextFlags, uint32_t)
-- 	EV(CharsDecimal, (uint32_t)ImGuiInputTextFlags_CharsDecimal)
-- 	EV(CharsHexadecimal, (uint32_t)ImGuiInputTextFlags_CharsHexadecimal)
-- 	EV(CharsUppercase, (uint32_t)ImGuiInputTextFlags_CharsUppercase)
-- 	EV(CharsNoBlank, (uint32_t)ImGuiInputTextFlags_CharsNoBlank)
-- 	EV(AutoSelectAll, (uint32_t)ImGuiInputTextFlags_AutoSelectAll)
-- 	EV(EnterReturnsTrue, (uint32_t)ImGuiInputTextFlags_EnterReturnsTrue)
-- 	EV(CallbackCompletion, (uint32_t)ImGuiInputTextFlags_CallbackCompletion)
-- 	EV(CallbackHistory, (uint32_t)ImGuiInputTextFlags_CallbackHistory)
-- 	EV(CallbackAlways, (uint32_t)ImGuiInputTextFlags_CallbackAlways)
-- 	EV(CallbackCharFilter, (uint32_t)ImGuiInputTextFlags_CallbackCharFilter)
-- 	EV(AllowTabInput, (uint32_t)ImGuiInputTextFlags_AllowTabInput)
-- 	EV(CtrlEnterForNewLine, (uint32_t)ImGuiInputTextFlags_CtrlEnterForNewLine)
-- 	EV(NoHorizontalScroll, (uint32_t)ImGuiInputTextFlags_NoHorizontalScroll)
-- 	EV(AlwaysOverwrite, (uint32_t)ImGuiInputTextFlags_AlwaysOverwrite)
-- 	EV(ReadOnly, (uint32_t)ImGuiInputTextFlags_ReadOnly)
-- 	EV(Password, (uint32_t)ImGuiInputTextFlags_Password)
-- 	EV(NoUndoRedo, (uint32_t)ImGuiInputTextFlags_NoUndoRedo)
-- 	EV(CharsScientific, (uint32_t)ImGuiInputTextFlags_CharsScientific)
-- 	EV(CallbackResize, (uint32_t)ImGuiInputTextFlags_CallbackResize)
-- 	EV(CallbackEdit, (uint32_t)ImGuiInputTextFlags_CallbackEdit)
-- 	EV(EscapeClearsAll, (uint32_t)ImGuiInputTextFlags_EscapeClearsAll)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiComboFlags, uint32_t)
-- 	EV(PopupAlignLeft, (uint32_t)ImGuiComboFlags_PopupAlignLeft)
-- 	EV(HeightSmall, (uint32_t)ImGuiComboFlags_HeightSmall)
-- 	EV(HeightRegular, (uint32_t)ImGuiComboFlags_HeightRegular)
-- 	EV(HeightLarge, (uint32_t)ImGuiComboFlags_HeightLarge)
-- 	EV(HeightLargest, (uint32_t)ImGuiComboFlags_HeightLargest)
-- 	EV(NoArrowButton, (uint32_t)ImGuiComboFlags_NoArrowButton)
-- 	EV(NoPreview, (uint32_t)ImGuiComboFlags_NoPreview)
-- 	EV(WidthFitPreview, (uint32_t)ImGuiComboFlags_WidthFitPreview)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiSliderFlags, uint32_t)
-- 	EV(AlwaysClamp, (uint32_t)ImGuiSliderFlags_AlwaysClamp)
-- 	EV(Logarithmic, (uint32_t)ImGuiSliderFlags_Logarithmic)
-- 	EV(NoRoundToFormat, (uint32_t)ImGuiSliderFlags_NoRoundToFormat)
-- 	EV(NoInput, (uint32_t)ImGuiSliderFlags_NoInput)
-- END_ENUM()

--------------------------------------------------

-- BEGIN_BITMASK(GuiColorEditFlags, uint32_t)
-- 	EV(NoAlpha, (uint32_t)ImGuiColorEditFlags_NoAlpha)
-- 	EV(NoPicker, (uint32_t)ImGuiColorEditFlags_NoPicker)
-- 	EV(NoOptions, (uint32_t)ImGuiColorEditFlags_NoOptions)
-- 	EV(NoSmallPreview, (uint32_t)ImGuiColorEditFlags_NoSmallPreview)
-- 	EV(NoInputs, (uint32_t)ImGuiColorEditFlags_NoInputs)
-- 	EV(NoTooltip, (uint32_t)ImGuiColorEditFlags_NoTooltip)
-- 	EV(NoLabel, (uint32_t)ImGuiColorEditFlags_NoLabel)
-- 	EV(NoSidePreview, (uint32_t)ImGuiColorEditFlags_NoSidePreview)
-- 	EV(NoDragDrop, (uint32_t)ImGuiColorEditFlags_NoDragDrop)
-- 	EV(NoBorder, (uint32_t)ImGuiColorEditFlags_NoBorder)

--------------------------------------------------

-- 	// User Options (right-click on widget to change some of them).
-- 	EV(AlphaBar, (uint32_t)ImGuiColorEditFlags_AlphaBar)
-- 	EV(AlphaPreview, (uint32_t)ImGuiColorEditFlags_AlphaPreview)
-- 	EV(AlphaPreviewHalf, (uint32_t)ImGuiColorEditFlags_AlphaPreviewHalf)
-- 	EV(HDR, (uint32_t)ImGuiColorEditFlags_HDR)
-- 	EV(DisplayRGB, (uint32_t)ImGuiColorEditFlags_DisplayRGB)
-- 	EV(DisplayHSV, (uint32_t)ImGuiColorEditFlags_DisplayHSV)
-- 	EV(DisplayHex, (uint32_t)ImGuiColorEditFlags_DisplayHex)
-- 	EV(Uint8, (uint32_t)ImGuiColorEditFlags_Uint8)
-- 	EV(Float, (uint32_t)ImGuiColorEditFlags_Float)
-- 	EV(PickerHueBar, (uint32_t)ImGuiColorEditFlags_PickerHueBar)
-- 	EV(PickerHueWheel, (uint32_t)ImGuiColorEditFlags_PickerHueWheel)
-- 	EV(InputRGB, (uint32_t)ImGuiColorEditFlags_InputRGB)
-- 	EV(InputHSV, (uint32_t)ImGuiColorEditFlags_InputHSV)
-- END_ENUM()