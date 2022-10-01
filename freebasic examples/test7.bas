#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

    dim form as newtComponent
    dim checkbox as newtComponent
    dim button as newtComponent
    dim rb(0 to 2) as newtComponent
    dim cbValue as zstring ptr
    dim byteValue as byte = 0
    dim i as integer

    newtInit()
    newtCls()

    newtOpenWindow(10, 5, 40, 11, "Checkboxes and Radio buttons")

    checkbox = newtCheckbox(1, 1, "A checkbox", byteValue, " *X", @cbValue)

    rb(0) = newtRadiobutton(1, 3, "Choice 1", 1, NULL)
    rb(1) = newtRadiobutton(1, 4, "Choice 2", 0, rb(0))
    rb(2) = newtRadiobutton(1, 5, "Choice 3", 0, rb(1))

    button = newtButton(1, 7, "Ok")

    form = newtForm(NULL, NULL, 0)
    newtFormAddComponent(form, checkbox)
    for i = 0 to 2
    	newtFormAddComponent(form, rb(i))
    next
    
    newtFormAddComponent(form, button)

    newtRunForm(form)
    newtFinished()

    /' We cannot destroy the form until after we've found the current
       radio button '/

    for i = 0 to 2
	    if newtRadioGetCurrent(rb(0)) = rb(i) then
	        print("radio button picked: " & i)
	    end if
	next
    newtFormDestroy(form)

    /' But the checkbox's value is stored locally '/
    print("checkbox value: " & cbValue)
    
