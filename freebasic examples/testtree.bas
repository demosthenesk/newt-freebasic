#inclib "newt"
#include "newt.bi"
#define NULL 0

dim as newtGrid grid
dim as newtComponent checktree
dim as newtComponent button
dim as newtComponent form
dim result as const any ptr ptr, ptr_ as const any ptr ptr
dim as long numselected, i, j
dim as long ptr list
    
    newtInit()
    newtCls()

    checktree = newtCheckboxTreeMulti(-1, -1, 10, " ab", NEWT_FLAG_SCROLL)
    newtCheckboxTreeAddItem(checktree, "Numbers", cast(any ptr, 2), 0,_
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Really really long thing",_
			   cast(any ptr, 3), 0, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 5", cast(any ptr, 5), _
    			    NEWT_FLAG_SELECTED, _
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 6", cast(any ptr, 6), 0, _
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 7", cast(any ptr, 7), _
    			    NEWT_FLAG_SELECTED, _
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 8", cast(any ptr, 8), 0, _
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 9", cast(any ptr, 9), 0, _
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 10", cast(any ptr, 10),_
    			    NEWT_FLAG_SELECTED,_
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "number 11", cast(any ptr, 11), 0, _
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Donuts", cast(any ptr, 12),_
    			    NEWT_FLAG_SELECTED,_
    			    NEWT_ARG_APPEND, NEWT_ARG_LAST)

    newtCheckboxTreeAddItem(checktree, "Bavarian Cream", cast(any ptr,301),_
    			    NEWT_FLAG_SELECTED,_
    			    9, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Honey dipped", cast(any ptr, 302),_
    			    NEWT_FLAG_SELECTED,_
    			    9, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Jelly", cast(any ptr, 303),_
    			    NEWT_FLAG_SELECTED,_
    			    9, NEWT_ARG_APPEND, NEWT_ARG_LAST)

    newtCheckboxTreeAddItem(checktree, "Colors", cast(any ptr, 1), 0,_
    			    0, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Red", cast(any ptr, 100), 0,_
    			    0, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "White", cast(any ptr, 101), 0,_
    			    0, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Blue", cast(any ptr, 102), 0,_
    			    0, NEWT_ARG_APPEND, NEWT_ARG_LAST)

    newtCheckboxTreeAddItem(checktree, "number 4", cast(any ptr, 4), 0,_
    			    3, NEWT_ARG_LAST)

    newtCheckboxTreeAddItem(checktree, "Single digit", cast(any ptr, 200), 0,_
    			    1, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "One", cast(any ptr, 201), 0,_
    			    1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Two", cast(any ptr, 202), 0,_
    			    1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Three", cast(any ptr, 203), 0,_
    			    1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Four", cast(any ptr, 204), 0,_
    			    1, 0, NEWT_ARG_APPEND, NEWT_ARG_LAST)

    newtCheckboxTreeAddItem(checktree, "Double digit", cast(any ptr, 300), 0,_
    			    1, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Ten", cast(any ptr, 210), 0,_
    			    1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Eleven", cast(any ptr, 211), 0,_
    			    1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Twelve", cast(any ptr, 212), 0,_
    			    1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST)
    newtCheckboxTreeAddItem(checktree, "Thirteen", cast(any ptr, 213), 0,_
    			    1, 1, NEWT_ARG_APPEND, NEWT_ARG_LAST)

    newtCheckboxTreeSetCurrent(checktree, cast(any ptr, 12))

    button = newtButton(-1, -1, "Exit")
    
    grid = newtCreateGrid(1, 2)
    newtGridSetField(grid, 0, 0, NEWT_GRID_COMPONENT, checktree, 0, 0, 0, 1, _
		     NEWT_ANCHOR_RIGHT, 0)
    newtGridSetField(grid, 0, 1, NEWT_GRID_COMPONENT, button, 0, 0, 0, 0, _
		     0, 0)

    newtGridWrappedWindow(grid, "Checkbox Tree Test")
    newtGridFree(grid, 1)

    form = newtForm(NULL, NULL, 0)
    newtFormAddComponents(form, checktree, button, NULL)

    newtRunForm(form)

    newtFinished()

    result = newtCheckboxTreeGetSelection(checktree, @numselected)
    ptr_ = result
    if result=0 orelse numselected=0 then
	print "none selected"
    else
	print "Current selection (all) ", numselected
    end if
    for i = 0 to numselected -1
	j = cast (integer, *ptr_): ptr_+=1
	print  j
    next
    deallocate(result)

    result = newtCheckboxTreeGetMultiSelection(checktree, @numselected, asc("b"))
    ptr_ = result
    if result=0 orelse numselected=0 then
	print "none selected"
    else
	print "Current selection (b) :";numselected
    end if
    for i = 0 to numselected -1
	j = cast (integer, *ptr_): ptr_+=1
	print j
    next
	
    if (result) then deallocate(result)

    list = newtCheckboxTreeFindItem(checktree, cast (any ptr,213))
    print "path:"
    i=0: do while list andalso list[i] <> NEWT_ARG_LAST: i+=1
        print list[i]
    loop
    print
    deallocate(list)
    
    newtFormDestroy(form)
	