#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

newtInit()
newtCls()
    
newtCenteredWindow(50, 10, "Hello Window")
newtRefresh()
sleep
    
newtPopWindow()
newtFinished()
