
#507: Yet another complex compiler crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/507>

This is the stripped version of what I was left with in #506:

```
Red []

r: routine [
    return: [logic!]
][
]

if no [
    if no [
        if no [
            if s: "" [
                if no [
                    while [yes] [
                        case [
                            no []
                            no []
                            yes [
                                s: skip s 0
                                case [
                                    any [
                                        not s: find s ""
                                        find s ""
                                        find s ""
                                        find s ""
                                        "" = skip tail s  0
                                    ][
                                    ]
                                    all [][]
                                    yes [
                                        if r [append s ""]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
]
```

Compiling to native code... 

**\* Red/System Compiler Internal Error: Script Error : Cannot use add on word! value 
**\* Where: branch 
**\* Near:  [ptr/1: ptr/1 + size]



Comments:
--------------------------------------------------------------------------------

On 2013-08-04T19:59:47Z, dockimbel, commented:
<https://github.com/red/red/issues/507#issuecomment-22077761>

    Thanks! After a few tests, it appears that it's really a Rebol2 memory corruption issue. I am searching for workarounds.

--------------------------------------------------------------------------------

On 2013-08-04T20:16:50Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/507#issuecomment-22078048>

    Looks like REBOL should have bootstrapped itself fifteen years ago...

--------------------------------------------------------------------------------

On 2013-08-04T20:48:01Z, dockimbel, commented:
<https://github.com/red/red/issues/507#issuecomment-22078618>

    :-)

