
#410: FORALL crashes within function
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
<https://github.com/red/red/issues/410>

#398 compiles now, but doesn't run:

```
Red []

f: func [
    b [block!]
][
    probe b
    forall b [
    ]
]
f [1 2 3]
```

[1 2 3]

**\* Runtime Error 1: access violation
**\* at: 0805F8A9h



Comments:
--------------------------------------------------------------------------------

On 2013-02-10T21:54:41Z, dockimbel, commented:
<https://github.com/red/red/issues/410#issuecomment-13362089>

    I don't get any error here, it works fine. Maybe a corruption in your git repository?

--------------------------------------------------------------------------------

On 2013-02-10T22:07:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/410#issuecomment-13362368>

    I don't use Git; I download the archive from GitHub. Have you tried Linux?
    
    I've also had different corruptions on FORALL, without crashes, but when I minimised the example I got this crash.

--------------------------------------------------------------------------------

On 2013-02-10T22:29:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/410#issuecomment-13362792>

    Could this have been #409? It works after fixing that.

--------------------------------------------------------------------------------

On 2013-02-10T22:48:41Z, dockimbel, commented:
<https://github.com/red/red/issues/410#issuecomment-13363211>

    Only if you used doc-strings in your testing code.

--------------------------------------------------------------------------------

On 2013-02-10T22:53:13Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/410#issuecomment-13363286>

    No, the test case is as it's here, although real cases with doc-strings are also fixed now.
    
    It's possible that this bug will reappear in other configurations. It already had unstable behaviour.

--------------------------------------------------------------------------------

On 2013-02-11T12:31:39Z, dockimbel, commented:
<https://github.com/red/red/issues/410#issuecomment-13378165>

    I'm closing this ticket, add a comment here if you see it reappear.

