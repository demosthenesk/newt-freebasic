#define SIGTSTP		20	'from signal.h
declare function raise alias "raise" (as long) as long


#inclib "newt"
#include "newt.bi"
#define NULL 0

type callbackInfo 
    en as newtComponent
    state as zstring ptr
end type

sub disableCallback(co as newtComponent, data_ as any ptr)
    dim cbi as callbackInfo ptr = cast(callbackInfo ptr, data_)

    if *cbi->state = " " then
	newtEntrySetFlags(cbi->en, NEWT_FLAG_DISABLED, NEWT_FLAGS_RESET)
    else 
	newtEntrySetFlags(cbi->en, NEWT_FLAG_DISABLED, NEWT_FLAGS_SET)
    end if

    newtRefresh()
end sub

sub suspend(d as any ptr) 
    newtSuspend()
    raise(SIGTSTP)
    newtResume()
end sub

sub helpCallback(co as newtComponent, tag as any ptr) 
    newtWinMessage("Help", "Ok", tag)
end sub

    dim as newtComponent b1, b2, r1, r2, r3, e2, e3, l1, l2, l3, scale
    dim as newtComponent lb, t, rsf, timeLabel
    dim as newtComponent cs(9)
    dim as newtComponent f, chklist, e1
    dim as callbackInfo cbis(2)
    dim as byte results(9)
    dim as const zstring ptr enr2, enr3, scaleVal
    dim as any ptr ptr selectedList
    dim as long i, numsel
    dim as zstring*19 buf
    dim as const zstring ptr spinner = @"-\\|/"
    dim as const zstring ptr spinState
    dim as newtExitStruct es

    newtInit()
    newtCls()

    newtSetSuspendCallback(@suspend, NULL)
    newtSetHelpCallback(@helpCallback)

    newtDrawRootText(0, 0, "Newt test program")
    newtPushHelpLine(NULL)
    newtDrawRootText(-50, 0, "More root text")

    newtOpenWindow(2, 2, 30, 10, "first window")
    newtOpenWindow(10, 5, 65, 16, "window 2")

    f = newtForm(NULL, @"This is some help text", 0)
    chklist = newtForm(NULL, NULL, 0)

    b1 = newtButton(3, 1, "Exit")
    b2 = newtButton(18, 1, "Update")
    r1 = newtRadiobutton(20, 10, "Choice 1", 0, NULL)
    r2 = newtRadiobutton(20, 11, "Choice 2", 1, r1)
    r3 = newtRadiobutton(20, 12, "Choice 3", 0, r2)
    rsf = newtForm(NULL, NULL, 0)
    newtFormAddComponents(rsf, r1, r2, r3, NULL)
    newtFormSetBackground(rsf, NEWT_COLORSET_CHECKBOX)

    for i=0 to 9
	buf= "Check "+str( i)
	cs(i) = newtCheckbox(3, 10 + i, buf, asc(" "), NULL, @results(i))
	newtFormAddComponent(chklist, cs(i))
    next

    l1 = newtLabel(3, 6, "Scale:")
    l2 = newtLabel(3, 7, "Scrolls:")
    l3 = newtLabel(3, 8, "Hidden:")
    e1 = newtEntry(12, 6, "", 20, @scaleVal, 0)
    e2 = newtEntry(12, 7, "Default", 20, @enr2, NEWT_FLAG_SCROLL)
/'    e3 = newtEntry(12, 8, NULL, 20, @enr3, NEWT_FLAG_HIDDEN) '/
    e3 = newtEntry(12, 8, NULL, 20, @enr3, NEWT_FLAG_PASSWORD)

    cbis(0).state = @results(0)
    cbis(0).en = e1
    newtComponentAddCallback(cs(0), @disableCallback, @cbis(0))

    scale = newtScale(3, 14, 32, 100)

    newtFormSetHeight(chklist, 3)

    newtFormAddComponents(f, b1, b2, l1, l2, l3, e1, e2, e3, chklist, NULL)
    newtFormAddComponents(f, rsf, scale, NULL)

    lb = newtListbox(45, 1, 6, NEWT_FLAG_MULTIPLE or NEWT_FLAG_BORDER or _
				NEWT_FLAG_SCROLL or NEWT_FLAG_SHOWCURSOR)
    newtListboxAppendEntry(lb, "First", cast(any ptr, 1))
    newtListboxAppendEntry(lb, "Second", cast(any ptr, 2))
    newtListboxAppendEntry(lb, "Third", cast(any ptr,3))
    newtListboxAppendEntry(lb, "Fourth", cast(any ptr, 4))
    newtListboxAppendEntry(lb, "Sixth", cast(any ptr, 6))
    newtListboxAppendEntry(lb, "Seventh", cast(any ptr, 7))
    newtListboxAppendEntry(lb, "Eighth", cast(any ptr, 8))
    newtListboxAppendEntry(lb, "Ninth", cast(any ptr, 9))
    newtListboxAppendEntry(lb, "Tenth", cast(any ptr, 10))

    newtListboxInsertEntry(lb, "Fifth", cast(any ptr, 5), cast(any ptr, 4))
    newtListboxInsertEntry(lb, "Eleventh", cast(any ptr, 11), cast(any ptr, 10))
    newtListboxDeleteEntry(lb, cast(any ptr, 11))

    spinState = spinner
    timeLabel = newtLabel(45, 8, "Spinner: -")

    t = newtTextbox(45, 10, 17, 5, NEWT_FLAG_WRAP)
    newtTextboxSetText(t, "This is some text does it look okay?\nThis should be alone.\nThis shouldn't be printed")

    newtFormAddComponents(f, lb, timeLabel, t, NULL)
    newtRefresh()
    newtFormSetTimer(f, 200)

    do
	newtFormRun(f, @es)

	if es.reason = NEWT_EXIT_COMPONENT andalso es.u.co = b2 then
	    newtScaleSet(scale, val(*scaleVal))
	    newtRefresh()
	elseif es.reason = NEWT_EXIT_TIMER then
	    spinState+=1
	    if *spinState=0 then spinState = spinner
	    buf= "Spinner: "+ left(*spinState,1)
	    newtLabelSetText(timeLabel, buf)
	end if
    loop while es.reason <> NEWT_EXIT_COMPONENT orelse es.u.co = b2

    numsel = 0
    selectedList = newtListboxGetSelection(lb, @numsel)

    newtPopWindow()
    newtPopWindow()
    newtFinished()

    print"got string 1: ", *scaleVal
    print"got string 2: ", *enr2
    print"got string 3: ", *enr3

    newtFormDestroy(f)

    print !"\nSelected listbox items :", numsel
    if(selectedList) then
	for i = 0 to numsel-1
	    print cast(integer ptr, selectedList)[i]
	next
    end if
    deallocate(selectedList)
	