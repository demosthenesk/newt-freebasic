#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

    dim form as newtComponent
    dim text as newtComponent
    dim button as newtComponent
    dim txt as string
 
    txt = "This is a pretty long message. It will be displayed in a newt textbox, and illustrates how to construct a textbox from arbitrary text which may not have very good line breaks. Notice how literal characters are respected, and may be used to force line breaks and blank lines."
   

    newtInit()
    newtCls()

 
    text = newtTextboxReflowed(1, 1, StrPtr(txt), 30, 5, 5, 0)
    button = newtButton(12, newtTextboxGetNumLines(text) + 2, "Ok")

    newtOpenWindow(10, 5, 37, newtTextboxGetNumLines(text) + 7, "Textboxes")

    form = newtForm(NULL, NULL, 0)
    newtFormAddComponents(form, text, button, NULL)

    newtRunForm(form)
    newtFormDestroy(form)
    newtFinished()
    
