#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

dim button as newtComponent
dim form as newtComponent


newtInit()
newtCls()

button = newtButton(0, 0, "Exit")
form = newtForm(NULL, NULL, 0)
newtFormAddComponents(form, button, NULL)

newtRunForm(form)
newtFinished()
newtFormDestroy(form)
