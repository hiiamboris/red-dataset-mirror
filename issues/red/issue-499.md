
#499: Driver compilation broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
<https://github.com/red/red/issues/499>

kaj@kaj $ rsc -t WinDRV hello-kernel-driver.reds 

-= Red/System Compiler =- 
**\* Compiler Internal Error: Script Error : int-ptr! has no value 
**\* Where: none 
**\* Near:  [file-sum: make struct! int-ptr! [0]]



Comments:
--------------------------------------------------------------------------------

On 2013-07-12T00:56:16Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/499#issuecomment-20852629>

    Sorry, failed to run that under WINE, but the error was unexpected. The error it gave previously gave more clues about the cause.

