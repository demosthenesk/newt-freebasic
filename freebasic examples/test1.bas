#inclib "newt"
#include "newt.bi"

newtInit()
newtCls()
newtDrawRootText(0, 0, strptr("Some root text"))
newtRefresh() 'not sure useful here
sleep
newtFinished()

