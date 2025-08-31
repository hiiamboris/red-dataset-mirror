
#962: Compiler crash on CASE ALL local object! paths with local variable
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/962>

Source:

```
Red []

f: function [
    o [object!]
][
    v: none

    case [
        all [
            o/a = o/a
            o/a = o/a
        ][
        ]
    ]
]
```

Error:

```
*** Red Compiler Internal Error: Script Error : Out of range or past end 
*** Where: comp-block 
*** Near:  [mold mark 
append/only list copy
]
```



Comments:
--------------------------------------------------------------------------------

On 2014-10-20T14:57:50Z, dockimbel, commented:
<https://github.com/red/red/issues/962#issuecomment-59770778>

    Which commit (hash number) are you using to reproduce that issue?

--------------------------------------------------------------------------------

On 2014-10-20T18:33:37Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/962#issuecomment-59817062>

    The latest. I don't have it anymore, because for two months or so now, I always have to roll back to an old objects branch to be able to continue with my program.

--------------------------------------------------------------------------------

On 2014-10-21T10:21:42Z, dockimbel, commented:
<https://github.com/red/red/issues/962#issuecomment-59907139>

    Related to #509.

--------------------------------------------------------------------------------

On 2014-10-22T16:33:28Z, dockimbel, commented:
<https://github.com/red/red/issues/962#issuecomment-60114155>

    This was not _the_ heisenbug we were tracking. The `past-end` error in this case was solidly reproductible and legitimate.

--------------------------------------------------------------------------------

On 2014-10-22T19:42:34Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/962#issuecomment-60143072>

    Yes, it stopped being a Heisenbug when I observed it. Of course, there's an infinite number left undetected.

