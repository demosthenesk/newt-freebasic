/' This file was written by Angelo Rosina aka angros47
   it is a port of c examples of newt lib
'/

#inclib "newt"
#include "newt.bi"
#define NULL 0


    dim as newtComponent b1, b2, b3, b4
    dim as newtComponent f, t
    dim as newtGrid grid, subgrid
    dim as zstring ptr flowedText
    dim as long textWidth, textHeight, rc, i
    dim as zstring ptr menuContents(...) => { @"One", @"Two", @"Three", @"Four", @"Five", NULL }
    dim as zstring ptr entries(9)
    dim as newtWinEntry autoEntries(...) => {_
	( @"An entry", @entries(0), 0 ),_
	( @"Another entry", @entries(1), 0 ),_
	( @"Third entry", @entries(2), 0 ),_
	( @"Fourth entry", @entries(3), 0 ),_
	( NULL, NULL, 0 ) }

    erase entries

    newtInit()
    newtCls()

    b1 = newtCheckbox(-1, -1, "An pretty long checkbox for testing", asc(" "), NULL, NULL)
    b2 = newtButton(-1, -1, "Another Button")
    b3 = newtButton(-1, -1, "But, but")
    b4 = newtButton(-1, -1, "But what?")

    f = newtForm(NULL, NULL, 0)

    grid = newtCreateGrid(2, 2)
    newtGridSetField(grid, 0, 0, NEWT_GRID_COMPONENT, b1, 0, 0, 0, 0, _
			NEWT_ANCHOR_RIGHT, 0)
    newtGridSetField(grid, 0, 1, NEWT_GRID_COMPONENT, b2, 0, 0, 0, 0, 0, 0)
    newtGridSetField(grid, 1, 0, NEWT_GRID_COMPONENT, b3, 0, 0, 0, 0, 0, 0)
    newtGridSetField(grid, 1, 1, NEWT_GRID_COMPONENT, b4, 0, 0, 0, 0, 0, 0)


    newtFormAddComponents(f, b1, b2, b3, b4, NULL)

    newtGridWrappedWindow(grid, "first window")
    newtGridFree(grid, 1)

    newtRunForm(f)
	
    newtFormDestroy(f)
    newtPopWindow()

    flowedText = newtReflowText(!"This is a quite a bit of text. It is 40 " + _
			  	!"columns long, so some wrapping should be " + _
			  	!"done. Did you know that the quick, brown " + _
			  	!"fox jumped over the lazy dog?\n\n" + _
				!"In other news, it's pretty important that we " + _
				!"can properly force a line break.",_
				40, 5, 5, @textWidth, @textHeight)
    t = newtTextbox(-1, -1, textWidth, textHeight, NEWT_FLAG_WRAP)
    newtTextboxSetText(t, flowedText)
    deallocate(flowedText)

    
    b1 = newtButton(-1, -1, "Okay")
    b2 = newtButton(-1, -1, "Cancel")

    grid = newtCreateGrid(1, 2)
    subgrid = newtCreateGrid(2, 1)

    newtGridSetField(subgrid, 0, 0, NEWT_GRID_COMPONENT, b1, 0, 0, 0, 0, 0, 0)
    newtGridSetField(subgrid, 1, 0, NEWT_GRID_COMPONENT, b2, 0, 0, 0, 0, 0, 0)

    newtGridSetField(grid, 0, 0, NEWT_GRID_COMPONENT, t, 0, 0, 0, 1, 0, 0)
    newtGridSetField(grid, 0, 1, NEWT_GRID_SUBGRID, subgrid, 0, 0, 0, 0, 0,_
			NEWT_GRID_FLAG_GROWX)
    newtGridWrappedWindow(grid, "another example")
    newtGridDestroy(grid, 1)

    f = newtForm(NULL, NULL, 0)
    newtFormAddComponents(f, b1, t, b2, NULL)
    newtRunForm(f)

    newtPopWindow()
    newtFormDestroy(f)

    newtWinMessage("Simple", "Ok", "This is a simple message window")
    newtWinChoice("Simple", "Ok", "Cancel", "This is a simple choice window")

    textWidth = 0
    rc = newtWinMenu("Test Menu", "This is a sample invovation of the " + _
		     "newtWinMenu() call. It may or may not have a scrollbar, " + _
		     "depending on the need for one.", 50, 5, 5, 3, _
		     @menuContents(0), @textWidth, "Ok", "Cancel", NULL)

    rc = newtWinEntries("Text newtWinEntries()", "This is a sample invovation of " + _
		     "newtWinEntries() call. It lets you get a lot of input " + _
		     "quite easily.", 50, 5, 5, 20, @autoEntries(0), "Ok", _
		     "Cancel", NULL)
    for i = 0 to ubound (autoEntries)-1
	    if autoEntries(i).value=0 then exit for
	    deallocate(*autoEntries(i).value)
    next

    newtFinished()

    print"rc = ";rc;" item = "; textWidth

