#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

    dim form as newtComponent
    dim label as newtComponent
    dim entry as newtComponent
    dim button as newtComponent
    dim entryValue as zstring ptr

    newtInit()
    newtCls()

    newtOpenWindow(10, 5, 40, 8, "Entry and Label Sample")

    label = newtLabel(1, 1, "Enter a string")
    entry = newtEntry(16, 1, "sample", 20, @entryValue, NEWT_FLAG_SCROLL OR NEWT_FLAG_RETURNEXIT)
    button = newtButton(17, 3, "Ok")
    form = newtForm(NULL, NULL, 0)
    newtFormAddComponents(form, label, entry, button, NULL)

    newtRunForm(form)

    newtFinished()

    print("Final string was: " & *entryValue)

    /' We cannot destroy the form until after we've used the value
       from the entry widget. '/
    newtFormDestroy(form)

