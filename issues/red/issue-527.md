
#527: HALT QUITs console
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [status.reviewed]
<https://github.com/red/red/issues/527>

HALT is a keyword that just QUITs, so if the console executes a script, HALT doesn't just quit the script, but the entire console process. Being a keyword, it can't be overridden to change this behaviour, either.

If possible, please remove HALT as a keyword to allow overriding. To implement the correct behaviour, HALT probably needs to stop DO instead of the OS process.



Comments:
--------------------------------------------------------------------------------

On 2013-09-12T11:07:29Z, dockimbel, commented:
<https://github.com/red/red/issues/527#issuecomment-24310239>

    HALT as a compiler keyword is a leftover of early compiler days, when the native HALT in Red runtime was not implemented yet. So this fix removes it as a keyword, so it's now free to be redefined as needed.

