
#384: Interpreter sets refinements
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/384>

The interpreter seems to set refinements to TRUE, even when a function is called without refinements, so the interpreter actually executes it. This makes any function that has refinements unusable even without.



Comments:
--------------------------------------------------------------------------------

On 2013-01-16T11:12:14Z, dockimbel, commented:
<https://github.com/red/red/issues/384#issuecomment-12313956>

    Can you give me a code example? I tried testing with several natives (`mold`, `quit`,...) and I don't see any issue when they are called without refinements (I've tested from console).

--------------------------------------------------------------------------------

On 2013-01-16T21:28:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/384#issuecomment-12341074>

    I've tested with a FUNC. I now have a case where the first refinement is FALSE and the second TRUE, so it seems they're set to semi-random uninitialised values.

--------------------------------------------------------------------------------

On 2013-01-16T21:33:18Z, dockimbel, commented:
<https://github.com/red/red/issues/384#issuecomment-12341346>

    Support for function creation from interpreter has not been implemented yet, so you can't use any function constructor yet.

--------------------------------------------------------------------------------

On 2013-01-16T21:47:20Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/384#issuecomment-12342053>

    No, I've tested with a FUNC, not a NATIVE.

--------------------------------------------------------------------------------

On 2013-01-16T21:54:03Z, dockimbel, commented:
<https://github.com/red/red/issues/384#issuecomment-12342387>

    Ok, I have reproduced the issue.

