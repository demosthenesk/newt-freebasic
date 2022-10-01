#pragma once

#include once "crt/stdarg.bi"

extern "C"

#define H_NEWT
const NEWT_COLORSET_ROOT = 2
const NEWT_COLORSET_BORDER = 3
const NEWT_COLORSET_WINDOW = 4
const NEWT_COLORSET_SHADOW = 5
const NEWT_COLORSET_TITLE = 6
const NEWT_COLORSET_BUTTON = 7
const NEWT_COLORSET_ACTBUTTON = 8
const NEWT_COLORSET_CHECKBOX = 9
const NEWT_COLORSET_ACTCHECKBOX = 10
const NEWT_COLORSET_ENTRY = 11
const NEWT_COLORSET_LABEL = 12
const NEWT_COLORSET_LISTBOX = 13
const NEWT_COLORSET_ACTLISTBOX = 14
const NEWT_COLORSET_TEXTBOX = 15
const NEWT_COLORSET_ACTTEXTBOX = 16
const NEWT_COLORSET_HELPLINE = 17
const NEWT_COLORSET_ROOTTEXT = 18
const NEWT_COLORSET_EMPTYSCALE = 19
const NEWT_COLORSET_FULLSCALE = 20
const NEWT_COLORSET_DISENTRY = 21
const NEWT_COLORSET_COMPACTBUTTON = 22
const NEWT_COLORSET_ACTSELLISTBOX = 23
const NEWT_COLORSET_SELLISTBOX = 24
#define NEWT_COLORSET_CUSTOM(x) (30 + (x))
const NEWT_ARG_LAST = -100000
const NEWT_ARG_APPEND = -1

type newtColors
	rootFg as zstring ptr
	rootBg as zstring ptr
	borderFg as zstring ptr
	borderBg as zstring ptr
	windowFg as zstring ptr
	windowBg as zstring ptr
	shadowFg as zstring ptr
	shadowBg as zstring ptr
	titleFg as zstring ptr
	titleBg as zstring ptr
	buttonFg as zstring ptr
	buttonBg as zstring ptr
	actButtonFg as zstring ptr
	actButtonBg as zstring ptr
	checkboxFg as zstring ptr
	checkboxBg as zstring ptr
	actCheckboxFg as zstring ptr
	actCheckboxBg as zstring ptr
	entryFg as zstring ptr
	entryBg as zstring ptr
	labelFg as zstring ptr
	labelBg as zstring ptr
	listboxFg as zstring ptr
	listboxBg as zstring ptr
	actListboxFg as zstring ptr
	actListboxBg as zstring ptr
	textboxFg as zstring ptr
	textboxBg as zstring ptr
	actTextboxFg as zstring ptr
	actTextboxBg as zstring ptr
	helpLineFg as zstring ptr
	helpLineBg as zstring ptr
	rootTextFg as zstring ptr
	rootTextBg as zstring ptr
	emptyScale as zstring ptr
	fullScale as zstring ptr
	disabledEntryFg as zstring ptr
	disabledEntryBg as zstring ptr
	compactButtonFg as zstring ptr
	compactButtonBg as zstring ptr
	actSelListboxFg as zstring ptr
	actSelListboxBg as zstring ptr
	selListboxFg as zstring ptr
	selListboxBg as zstring ptr
end type

type newtFlagsSense as long
enum
	NEWT_FLAGS_SET
	NEWT_FLAGS_RESET
	NEWT_FLAGS_TOGGLE
end enum

const NEWT_FLAG_RETURNEXIT = 1 shl 0
const NEWT_FLAG_HIDDEN = 1 shl 1
const NEWT_FLAG_SCROLL = 1 shl 2
const NEWT_FLAG_DISABLED = 1 shl 3
const NEWT_FLAG_BORDER = 1 shl 5
const NEWT_FLAG_WRAP = 1 shl 6
const NEWT_FLAG_NOF12 = 1 shl 7
const NEWT_FLAG_MULTIPLE = 1 shl 8
const NEWT_FLAG_SELECTED = 1 shl 9
const NEWT_FLAG_CHECKBOX = 1 shl 10
const NEWT_FLAG_PASSWORD = 1 shl 11
const NEWT_FLAG_SHOWCURSOR = 1 shl 12
const NEWT_FD_READ = 1 shl 0
const NEWT_FD_WRITE = 1 shl 1
const NEWT_FD_EXCEPT = 1 shl 2
const NEWT_CHECKBOXTREE_UNSELECTABLE = 1 shl 12
const NEWT_CHECKBOXTREE_HIDE_BOX = 1 shl 13
#define NEWT_CHECKBOXTREE_COLLAPSED asc(!"\0")
#define NEWT_CHECKBOXTREE_EXPANDED asc(!"\1")
#define NEWT_CHECKBOXTREE_UNSELECTED asc(" ")
#define NEWT_CHECKBOXTREE_SELECTED asc("*")
const NEWT_LISTBOX_RETURNEXIT = NEWT_FLAG_RETURNEXIT
const NEWT_ENTRY_SCROLL = NEWT_FLAG_SCROLL
const NEWT_ENTRY_HIDDEN = NEWT_FLAG_HIDDEN
const NEWT_ENTRY_RETURNEXIT = NEWT_FLAG_RETURNEXIT
const NEWT_ENTRY_DISABLED = NEWT_FLAG_DISABLED
const NEWT_TEXTBOX_WRAP = NEWT_FLAG_WRAP
const NEWT_TEXTBOX_SCROLL = NEWT_FLAG_SCROLL
const NEWT_FORM_NOF12 = NEWT_FLAG_NOF12
type newtComponent as newtComponent_struct ptr
extern newtDefaultColorPalette as const newtColors
type newtCallback as sub(byval as newtComponent, byval as any ptr)
type newtSuspendCallback as sub(byval data as any ptr)

declare function newtInit() as long
declare function newtFinished() as long
declare sub newtCls()
declare sub newtResizeScreen(byval redraw as long)
declare sub newtWaitForKey()
declare sub newtClearKeyBuffer()
declare sub newtDelay(byval usecs as ulong)
declare function newtOpenWindow(byval left as long, byval top as long, byval width as ulong, byval height as ulong, byval title as const zstring ptr) as long
declare function newtCenteredWindow(byval width as ulong, byval height as ulong, byval title as const zstring ptr) as long
declare sub newtPopWindow()
declare sub newtPopWindowNoRefresh()
declare sub newtSetColors(byval colors as newtColors)
declare sub newtSetColor(byval colorset as long, byval fg as zstring ptr, byval bg as zstring ptr)
declare sub newtRefresh()
declare sub newtSuspend()
declare sub newtSetSuspendCallback(byval cb as newtSuspendCallback, byval data as any ptr)
declare sub newtSetHelpCallback(byval cb as newtCallback)
declare function newtResume() as long
declare sub newtPushHelpLine(byval text as const zstring ptr)
declare sub newtRedrawHelpLine()
declare sub newtPopHelpLine()
declare sub newtDrawRootText(byval col as long, byval row as long, byval text as const zstring ptr)
declare sub newtBell()
declare sub newtCursorOff()
declare sub newtCursorOn()
declare function newtCompactButton(byval left as long, byval top as long, byval text as const zstring ptr) as newtComponent
declare function newtButton(byval left as long, byval top as long, byval text as const zstring ptr) as newtComponent
declare function newtCheckbox(byval left as long, byval top as long, byval text as const zstring ptr, byval defValue as byte, byval seq as const zstring ptr, byval result as zstring ptr) as newtComponent
declare function newtCheckboxGetValue(byval co as newtComponent) as byte
declare sub newtCheckboxSetValue(byval co as newtComponent, byval value as byte)
declare sub newtCheckboxSetFlags(byval co as newtComponent, byval flags as long, byval sense as newtFlagsSense)
declare function newtRadiobutton(byval left as long, byval top as long, byval text as const zstring ptr, byval isDefault as long, byval prevButton as newtComponent) as newtComponent
declare function newtRadioGetCurrent(byval setMember as newtComponent) as newtComponent
declare sub newtRadioSetCurrent(byval setMember as newtComponent)
declare sub newtGetScreenSize(byval cols as long ptr, byval rows as long ptr)
declare function newtLabel(byval left as long, byval top as long, byval text as const zstring ptr) as newtComponent
declare sub newtLabelSetText(byval co as newtComponent, byval text as const zstring ptr)
declare sub newtLabelSetColors(byval co as newtComponent, byval colorset as long)
declare function newtVerticalScrollbar(byval left as long, byval top as long, byval height as long, byval normalColorset as long, byval thumbColorset as long) as newtComponent
declare sub newtScrollbarSet(byval co as newtComponent, byval where as long, byval total as long)
declare sub newtScrollbarSetColors(byval co as newtComponent, byval normal as long, byval thumb as long)
declare function newtListbox(byval left as long, byval top as long, byval height as long, byval flags as long) as newtComponent
declare function newtListboxGetCurrent(byval co as newtComponent) as any ptr
declare sub newtListboxSetCurrent(byval co as newtComponent, byval num as long)
declare sub newtListboxSetCurrentByKey(byval co as newtComponent, byval key as any ptr)
declare sub newtListboxSetEntry(byval co as newtComponent, byval num as long, byval text as const zstring ptr)
declare sub newtListboxSetWidth(byval co as newtComponent, byval width as long)
declare sub newtListboxSetData(byval co as newtComponent, byval num as long, byval data as any ptr)
declare function newtListboxAppendEntry(byval co as newtComponent, byval text as const zstring ptr, byval data as const any ptr) as long
declare function newtListboxAddEntry alias "newtListboxAppendEntry"(byval co as newtComponent, byval text as const zstring ptr, byval data as const any ptr) as long
declare function newtListboxInsertEntry(byval co as newtComponent, byval text as const zstring ptr, byval data as const any ptr, byval key as any ptr) as long
declare function newtListboxDeleteEntry(byval co as newtComponent, byval data as any ptr) as long
declare sub newtListboxClear(byval co as newtComponent)
declare sub newtListboxGetEntry(byval co as newtComponent, byval num as long, byval text as zstring ptr ptr, byval data as any ptr ptr)
declare function newtListboxGetSelection(byval co as newtComponent, byval numitems as long ptr) as any ptr ptr
declare sub newtListboxClearSelection(byval co as newtComponent)
declare sub newtListboxSelectItem(byval co as newtComponent, byval key as const any ptr, byval sense as newtFlagsSense)
declare function newtListboxItemCount(byval co as newtComponent) as long
declare function newtCheckboxTree(byval left as long, byval top as long, byval height as long, byval flags as long) as newtComponent
declare function newtCheckboxTreeMulti(byval left as long, byval top as long, byval height as long, byval seq as zstring ptr, byval flags as long) as newtComponent
declare function newtCheckboxTreeGetSelection(byval co as newtComponent, byval numitems as long ptr) as const any ptr ptr
declare function newtCheckboxTreeGetCurrent(byval co as newtComponent) as const any ptr
declare sub newtCheckboxTreeSetCurrent(byval co as newtComponent, byval item as any ptr)
declare function newtCheckboxTreeGetMultiSelection(byval co as newtComponent, byval numitems as long ptr, byval seqnum as byte) as const any ptr ptr
declare function newtCheckboxTreeAddItem(byval co as newtComponent, byval text as const zstring ptr, byval data as const any ptr, byval flags as long, byval index as long, ...) as long
declare function newtCheckboxTreeAddArray(byval co as newtComponent, byval text as const zstring ptr, byval data as const any ptr, byval flags as long, byval indexes as long ptr) as long
declare function newtCheckboxTreeFindItem(byval co as newtComponent, byval data as any ptr) as long ptr
declare sub newtCheckboxTreeSetEntry(byval co as newtComponent, byval data as const any ptr, byval text as const zstring ptr)
declare sub newtCheckboxTreeSetWidth(byval co as newtComponent, byval width as long)
declare function newtCheckboxTreeGetEntryValue(byval co as newtComponent, byval data as const any ptr) as byte
declare sub newtCheckboxTreeSetEntryValue(byval co as newtComponent, byval data as const any ptr, byval value as byte)
declare function newtTextboxReflowed(byval left as long, byval top as long, byval text as zstring ptr, byval width as long, byval flexDown as long, byval flexUp as long, byval flags as long) as newtComponent
declare function newtTextbox(byval left as long, byval top as long, byval width as long, byval height as long, byval flags as long) as newtComponent
declare sub newtTextboxSetText(byval co as newtComponent, byval text as const zstring ptr)
declare sub newtTextboxSetHeight(byval co as newtComponent, byval height as long)
declare function newtTextboxGetNumLines(byval co as newtComponent) as long
declare sub newtTextboxSetColors(byval co as newtComponent, byval normal as long, byval active as long)
declare function newtReflowText(byval text as zstring ptr, byval width as long, byval flexDown as long, byval flexUp as long, byval actualWidth as long ptr, byval actualHeight as long ptr) as zstring ptr

type newtExitStruct_reason as long
enum
	NEWT_EXIT_HOTKEY
	NEWT_EXIT_COMPONENT
	NEWT_EXIT_FDREADY
	NEWT_EXIT_TIMER
	NEWT_EXIT_ERROR
end enum

union newtExitStruct_u
	watch as long
	key as long
	co as newtComponent
end union

type newtExitStruct
	reason as newtExitStruct_reason
	u as newtExitStruct_u
end type

declare function newtForm(byval vertBar as newtComponent, byval helpTag as any ptr, byval flags as long) as newtComponent
declare sub newtFormSetTimer(byval form as newtComponent, byval millisecs as long)
declare sub newtFormWatchFd(byval form as newtComponent, byval fd as long, byval fdFlags as long)
declare sub newtFormSetSize(byval co as newtComponent)
declare function newtFormGetCurrent(byval co as newtComponent) as newtComponent
declare sub newtFormSetBackground(byval co as newtComponent, byval color as long)
declare sub newtFormSetCurrent(byval co as newtComponent, byval subco as newtComponent)
declare sub newtFormAddComponent(byval form as newtComponent, byval co as newtComponent)
declare sub newtFormAddComponents(byval form as newtComponent, ...)
declare sub newtFormSetHeight(byval co as newtComponent, byval height as long)
declare sub newtFormSetWidth(byval co as newtComponent, byval width as long)
declare function newtRunForm(byval form as newtComponent) as newtComponent
declare sub newtFormRun(byval co as newtComponent, byval es as newtExitStruct ptr)
declare sub newtDrawForm(byval form as newtComponent)
declare sub newtFormAddHotKey(byval co as newtComponent, byval key as long)
declare function newtFormGetScrollPosition(byval co as newtComponent) as long
declare sub newtFormSetScrollPosition(byval co as newtComponent, byval position as long)
type newtEntryFilter as function(byval entry as newtComponent, byval data as any ptr, byval ch as long, byval cursor as long) as long
declare function newtEntry(byval left as long, byval top as long, byval initialValue as const zstring ptr, byval width as long, byval resultPtr as const zstring ptr ptr, byval flags as long) as newtComponent
declare sub newtEntrySet(byval co as newtComponent, byval value as const zstring ptr, byval cursorAtEnd as long)
declare sub newtEntrySetFilter(byval co as newtComponent, byval filter as newtEntryFilter, byval data as any ptr)
declare function newtEntryGetValue(byval co as newtComponent) as zstring ptr
declare sub newtEntrySetFlags(byval co as newtComponent, byval flags as long, byval sense as newtFlagsSense)
declare sub newtEntrySetColors(byval co as newtComponent, byval normal as long, byval disabled as long)
declare function newtEntryGetCursorPosition(byval co as newtComponent) as long
declare sub newtEntrySetCursorPosition(byval co as newtComponent, byval position as long)
declare function newtScale(byval left as long, byval top as long, byval width as long, byval fullValue as longint) as newtComponent
declare sub newtScaleSet(byval co as newtComponent, byval amount as ulongint)
declare sub newtScaleSetColors(byval co as newtComponent, byval empty as long, byval full as long)
declare sub newtComponentAddCallback(byval co as newtComponent, byval f as newtCallback, byval data as any ptr)
declare sub newtComponentTakesFocus(byval co as newtComponent, byval val as long)
declare sub newtComponentGetPosition(byval co as newtComponent, byval left as long ptr, byval top as long ptr)
declare sub newtComponentGetSize(byval co as newtComponent, byval width as long ptr, byval height as long ptr)
declare sub newtComponentAddDestroyCallback(byval co as newtComponent, byval f as newtCallback, byval data as any ptr)
declare sub newtFormDestroy(byval form as newtComponent)
declare sub newtComponentDestroy(byval co as newtComponent)

#define NEWT_KEY_TAB asc(!"\t")
#define NEWT_KEY_ENTER asc(!"\r")
#define NEWT_KEY_SUSPEND asc(!"\26")
#define NEWT_KEY_ESCAPE asc(!"\27")
#define NEWT_KEY_RETURN NEWT_KEY_ENTER
const NEWT_KEY_EXTRA_BASE = &h8000
const NEWT_KEY_UP = NEWT_KEY_EXTRA_BASE + 1
const NEWT_KEY_DOWN = NEWT_KEY_EXTRA_BASE + 2
const NEWT_KEY_LEFT = NEWT_KEY_EXTRA_BASE + 4
const NEWT_KEY_RIGHT = NEWT_KEY_EXTRA_BASE + 5
const NEWT_KEY_BKSPC = NEWT_KEY_EXTRA_BASE + 6
const NEWT_KEY_DELETE = NEWT_KEY_EXTRA_BASE + 7
const NEWT_KEY_HOME = NEWT_KEY_EXTRA_BASE + 8
const NEWT_KEY_END = NEWT_KEY_EXTRA_BASE + 9
const NEWT_KEY_UNTAB = NEWT_KEY_EXTRA_BASE + 10
const NEWT_KEY_PGUP = NEWT_KEY_EXTRA_BASE + 11
const NEWT_KEY_PGDN = NEWT_KEY_EXTRA_BASE + 12
const NEWT_KEY_INSERT = NEWT_KEY_EXTRA_BASE + 13
const NEWT_KEY_F1 = NEWT_KEY_EXTRA_BASE + 101
const NEWT_KEY_F2 = NEWT_KEY_EXTRA_BASE + 102
const NEWT_KEY_F3 = NEWT_KEY_EXTRA_BASE + 103
const NEWT_KEY_F4 = NEWT_KEY_EXTRA_BASE + 104
const NEWT_KEY_F5 = NEWT_KEY_EXTRA_BASE + 105
const NEWT_KEY_F6 = NEWT_KEY_EXTRA_BASE + 106
const NEWT_KEY_F7 = NEWT_KEY_EXTRA_BASE + 107
const NEWT_KEY_F8 = NEWT_KEY_EXTRA_BASE + 108
const NEWT_KEY_F9 = NEWT_KEY_EXTRA_BASE + 109
const NEWT_KEY_F10 = NEWT_KEY_EXTRA_BASE + 110
const NEWT_KEY_F11 = NEWT_KEY_EXTRA_BASE + 111
const NEWT_KEY_F12 = NEWT_KEY_EXTRA_BASE + 112
const NEWT_KEY_RESIZE = NEWT_KEY_EXTRA_BASE + 113
const NEWT_KEY_ERROR = NEWT_KEY_EXTRA_BASE + 114
const NEWT_ANCHOR_LEFT = 1 shl 0
const NEWT_ANCHOR_RIGHT = 1 shl 1
const NEWT_ANCHOR_TOP = 1 shl 2
const NEWT_ANCHOR_BOTTOM = 1 shl 3
const NEWT_GRID_FLAG_GROWX = 1 shl 0
const NEWT_GRID_FLAG_GROWY = 1 shl 1
type newtGrid as grid_s ptr

type newtGridElement as long
enum
	NEWT_GRID_EMPTY = 0
	NEWT_GRID_COMPONENT
	NEWT_GRID_SUBGRID
end enum

declare function newtCreateGrid(byval cols as long, byval rows as long) as newtGrid
declare function newtGridVStacked(byval type as newtGridElement, byval what as any ptr, ...) as newtGrid
declare function newtGridVCloseStacked(byval type as newtGridElement, byval what as any ptr, ...) as newtGrid
declare function newtGridHStacked(byval type1 as newtGridElement, byval what1 as any ptr, ...) as newtGrid
declare function newtGridHCloseStacked(byval type1 as newtGridElement, byval what1 as any ptr, ...) as newtGrid
declare function newtGridBasicWindow(byval text as newtComponent, byval middle as newtGrid, byval buttons as newtGrid) as newtGrid
declare function newtGridSimpleWindow(byval text as newtComponent, byval middle as newtComponent, byval buttons as newtGrid) as newtGrid
declare sub newtGridSetField(byval grid as newtGrid, byval col as long, byval row as long, byval type as newtGridElement, byval val as any ptr, byval padLeft as long, byval padTop as long, byval padRight as long, byval padBottom as long, byval anchor as long, byval flags as long)
declare sub newtGridPlace(byval grid as newtGrid, byval left as long, byval top as long)
declare sub newtGridFree(byval grid as newtGrid, byval recurse as long)
declare sub newtGridDestroy alias "newtGridFree"(byval grid as newtGrid, byval recurse as long)
declare sub newtGridGetSize(byval grid as newtGrid, byval width as long ptr, byval height as long ptr)
declare sub newtGridWrappedWindow(byval grid as newtGrid, byval title as zstring ptr)
declare sub newtGridWrappedWindowAt(byval grid as newtGrid, byval title as zstring ptr, byval left as long, byval top as long)
declare sub newtGridAddComponentsToForm(byval grid as newtGrid, byval form as newtComponent, byval recurse as long)
declare function newtButtonBarv(byval button1 as zstring ptr, byval b1comp as newtComponent ptr, byval args as va_list) as newtGrid
declare function newtButtonBar(byval button1 as zstring ptr, byval b1comp as newtComponent ptr, ...) as newtGrid
declare sub newtWinMessage(byval title as zstring ptr, byval buttonText as zstring ptr, byval text as zstring ptr, ...)
declare sub newtWinMessagev(byval title as zstring ptr, byval buttonText as zstring ptr, byval text as zstring ptr, byval argv as va_list)
declare function newtWinChoice(byval title as zstring ptr, byval button1 as zstring ptr, byval button2 as zstring ptr, byval text as zstring ptr, ...) as long
declare function newtWinTernary(byval title as zstring ptr, byval button1 as zstring ptr, byval button2 as zstring ptr, byval button3 as zstring ptr, byval message as zstring ptr, ...) as long
declare function newtWinMenu(byval title as zstring ptr, byval text as zstring ptr, byval suggestedWidth as long, byval flexDown as long, byval flexUp as long, byval maxListHeight as long, byval items as zstring ptr ptr, byval listItem as long ptr, byval button1 as zstring ptr, ...) as long

type newtWinEntry
	text as zstring ptr
	value as zstring ptr ptr
	flags as long
end type

declare function newtWinEntries(byval title as zstring ptr, byval text as zstring ptr, byval suggestedWidth as long, byval flexDown as long, byval flexUp as long, byval dataWidth as long, byval items as newtWinEntry ptr, byval button1 as zstring ptr, ...) as long

end extern
