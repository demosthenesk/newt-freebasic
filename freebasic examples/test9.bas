/' This file was written by Angelo Rosina aka angros47 '/

#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

    dim form as newtComponent
    dim b1 as newtComponent
    dim b2 as newtComponent
    dim p as newtComponent

	sub fCallback()
		newtCls()
		newtDrawRootText(0, 0, strptr("I am in callback!"))
		newtRefresh()
	end sub

    
    newtInit()
    newtCls()

    newtOpenWindow(10, 5, 40, 6, "Button Sample")

    b1 = newtButton(10, 1, "Ok")

    b2 = newtCompactButton(22, 2, "Cancel")
    form = newtForm(NULL, NULL, 0)
    newtFormAddComponents(form, b1, b2, NULL)


    p=newtRunForm(form)
	if p=b1 then fCallback()
	sleep
    newtFormDestroy(form)
    newtFinished()