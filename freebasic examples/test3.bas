#Ifndef NULL
  #Define NULL 0
#Endif

#inclib "newt"
#include "newt.bi"

newtInit()
newtCls()

    newtDrawRootText(0, 0, "Some root text")
    newtDrawRootText(-30, -2, "Root text in the other corner")

    newtPushHelpLine(NULL)
    newtRefresh()
    sleep

    newtPushHelpLine("A help line")
    newtRefresh()
    sleep

    newtPopHelpLine()
    newtRefresh()
    sleep

    newtFinished()
