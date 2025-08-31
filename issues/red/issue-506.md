
#506: Another complex compiler crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/506>

This seems a different one than #488, although it might have the same cause:

```
Red []

r: routine [
    i [integer!]
    s [string!]
][
]
r2: routine [
    return: [logic!]
][
]

if no [
    if no [
        if i: 0 [
            if no [
                if no [
                    while [yes] [
                        case [
                            no []
                            no []
                            yes [
                                s: skip "" 0
                                append clear "" ""

                                case [
                                    all [][]
                                    all [][]
                                    all [
                                        r i ""
                                    ][
                                    ]
                                    yes [
                                        if r2 []
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

-= Red Compiler =- 

...compilation time:     288 ms

Compiling to native code... 

**\* Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
**\* Where: branch 
**\* Near:  [ptr/1: ptr/1 + size]

On both R2 2.7.6 and 2.7.8.



Comments:
--------------------------------------------------------------------------------

On 2013-08-03T09:08:31Z, dockimbel, commented:
<https://github.com/red/red/issues/506#issuecomment-22052202>

    I can reproduce it, but only on Linux. Investigating it...

--------------------------------------------------------------------------------

On 2013-08-03T14:13:29Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/506#issuecomment-22055471>

    Great, that was fast! I'm glad to be rid of this; it was very annoying.

--------------------------------------------------------------------------------

On 2013-08-03T15:57:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/506#issuecomment-22056905>

    There must be other cases left. The problem is gone from the stripped sample, but not from my real program.

--------------------------------------------------------------------------------

On 2013-08-03T16:07:11Z, dockimbel, commented:
<https://github.com/red/red/issues/506#issuecomment-22057028>

    What error do you get?

--------------------------------------------------------------------------------

On 2013-08-03T16:26:46Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/506#issuecomment-22057308>

    Same error.
    
    Oh, sorry, this one differs in:
    
    **\* Red/System Compiler Internal Error: Script Error : Cannot use add on word! value
    
    but I've also seen that before.

--------------------------------------------------------------------------------

On 2013-08-03T16:31:02Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/506#issuecomment-22057376>

    Also, the problem occurs more often when I target Linux than when I target MSDOS. For MSDOS, I use red-store-bodies?: no; dunno if that makes a difference.

--------------------------------------------------------------------------------

On 2013-08-03T16:49:06Z, dockimbel, commented:
<https://github.com/red/red/issues/506#issuecomment-22057646>

    Can you give me the full error report please with **where** and **near** fields?

--------------------------------------------------------------------------------

On 2013-08-03T16:51:02Z, dockimbel, commented:
<https://github.com/red/red/issues/506#issuecomment-22057670>

    I could only reproduce such error on Linux, I'm not certain yet, but I suspect it's related to the differences in implementation between R2 on both platforms.

--------------------------------------------------------------------------------

On 2013-08-03T17:37:18Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/506#issuecomment-22058394>

    WHERE and NEAR are identical to above. I gave only the difference. I'm having the error for both the MSDOS and Linux targets for one of my main programs.

