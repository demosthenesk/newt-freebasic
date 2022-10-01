#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

    dim form as newtComponent
    dim b1 as newtComponent
    dim b2 as newtComponent
    
    newtInit()
    newtCls()

    newtOpenWindow(10, 5, 40, 6, "Button Sample")

    b1 = newtButton(10, 1, "Ok")
    b2 = newtCompactButton(22, 2, "Cancel")
    form = newtForm(NULL, NULL, 0)
    newtFormAddComponents(form, b1, b2, NULL)

    newtRunForm(form)

    newtFormDestroy(form)
    newtFinished()
