
#509: Stack overflow compiler crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/509>

This sends the compiler into a memory loop:

```
Red []

r: routine [
    i           [integer!]
    s           [string!]
    return:     [logic!]
][
]

if no [
    if no [
        if no [
            if all [
                while [yes] [
                    case [
                        yes [
                            case [
                                (
                                    all [
                                        any [
                                            all [
                                                r 0  append append append append append append
                                                    "" ""
                                                    "" mold system/version
                                                    "" system/platform
                                                    ""
                                            ]
                                        ]
                                    ]
                                )[
                                ]
                            ]
                        ]
                    ]
                ]
            ][
            ]
        ]
    ]
]
```

-= Red Compiler =- 
**\* Red Compiler Internal Error: Internal Error : Stack overflow 
**\* Where: convert-to-block 
**\* Near:  [change/part/only mark copy/deep mark tail]



Comments:
--------------------------------------------------------------------------------

On 2013-08-05T20:28:41Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/509#issuecomment-22138576>

    If this were a Linux bug tracker, I would report that this single core action completely distorts audio playing and UI responsiveness on my dual core. :-(

--------------------------------------------------------------------------------

On 2013-08-06T08:36:15Z, dockimbel, commented:
<https://github.com/red/red/issues/509#issuecomment-22164881>

    This is another Rebol2 internal memory corruption case, the fix forces the corrupted block! to be MOLDed, which seems to fix the _heisenbug_.

