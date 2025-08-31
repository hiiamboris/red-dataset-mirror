
#508: Complex compiler crash #4
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/508>

This one was particularly disastrous to strip down. It happens for the MSDOS target, but not for the Linux target.

```
Red []

#include %../common/common.red

r: routine [
    return:     [logic!]
][
]
rs: routine [
    s           [string!]
][
]
ris: routine [
    i           [integer!]
    s           [string!]
][
]
ri: routine [
    i           [integer!]
    return:     [integer!]
][
]
rii: routine [
    i           [integer!]
    j           [integer!]
    return:     [integer!]
][
]
riii: routine [
    i           [integer!]
    j           [integer!]
    k           [integer!]
    return:     [logic!]
][
]

s: any [ri 3  ""]

if s: ri 1 []

if s: ri 2 []

if i: ri 4 [i: rs s]

#system-global [filter: context [

    #import ["kernel32.dll" stdcall [
        close-handle: "CloseHandle" [
            object          [handle!]
            return:         [integer!]
        ]

        get-process-ID: "GetCurrentProcessId" [
            return:         [unsigned32!]
        ]
        open-process: "OpenProcess" [
            access          [enum!]
            inherit-handle? [logic!]
            ID              [unsigned32!]
            return:         [handle!]
        ]

        make-completion-port: "CreateIoCompletionPort" [
            file            [handle!]
            completion-port [handle!]
            key             [unsigned!]
            threads         [unsigned32!]
            return:         [handle!]
        ]
        get-completion: "GetQueuedCompletionStatus" [
            completion-port [handle!]
            size            [pointer! [unsigned32!]]
            key             [pointer! [unsigned!]]
            overlap         [handle-reference!]
            milliseconds    [unsigned32!]
            return:         [logic!]
        ]
    ]]

    #import ["FltLib.dll" stdcall [
        connect: "FilterConnectCommunicationPort" [
            name            [binary!]
            options         [unsigned32!]
            context         [handle!]
            size            [unsigned16!]
            security        [handle!]
            port            [handle-reference!]
            return:         [integer!]
        ]
        fetch: "FilterGetMessage" [
            port            [handle!]
            message         [handle!]
            size            [unsigned32!]
            overlap         [handle!]
            return:         [integer!]
        ]
        reply: "FilterReplyMessage" [
            port            [handle!]
            message         [handle!]
            size            [unsigned16!]
            return:         [integer!]
        ]
    ]]

    #enum operation! [
        operation-open
        operation-close
    ]
    #enum mode! [
        mode-read
        mode-write
    ]

    request!: alias struct! [
        reply-size                  [unsigned!]
        pad                         [integer32!]
        ID                          [integer64!]

        size                        [unsigned!]
        operation                   [operation!]
        mode                        [mode!]
        process                     [unsigned32!]
        file                        [integer64!]
        file2                       [integer64!]
        file3                       [integer64!]
        file4                       [integer64!]
        file5                       [integer64!]
        file6                       [integer64!]
        file7                       [integer64!]
        file8                       [integer64!]
        file9                       [integer64!]
        file10                      [integer64!]
        file11                      [integer64!]
        file12                      [integer64!]
        file13                      [integer64!]
        file14                      [integer64!]
        file15                      [integer64!]
        file16                      [integer64!]
        file17                      [integer64!]
        file18                      [integer64!]
        file19                      [integer64!]
        file20                      [integer64!]
        file21                      [integer64!]
        file22                      [integer64!]
        file23                      [integer64!]
        file24                      [integer64!]
        file25                      [integer64!]
        file26                      [integer64!]
        file27                      [integer64!]
        file28                      [integer64!]
        file29                      [integer64!]
        file30                      [integer64!]
        file31                      [integer64!]
        file32                      [integer64!]
    ]

]]

s: append append append append
    form r
    "" r
    "" r

if no [
    if zero? i: ri i [
        if zero? i: rii i i [
            if all [
                riii i i i
                riii i i i
                riii i i i
                rii i i
                (
                    s: ""
                    rs append append append append append
                        "" "" "" "" "" ""
                )
                rii i i
            ][
                if no [
                    while [yes] [
                        case [
                            0 = i: ri i []
                            not rs s []
                            yes [
                                s: skip s 0

                                case [
                                    any [
                                        not s: find s s
                                        find s ""
                                        find s ""
                                        find s ""
                                        "" = skip tail s  0
                                    ][
                                    ]
                                    all [
                                        rs s
                                        any [
                                            "" = skip tail s  0
                                            "" = skip tail s  0
                                        ]
                                    ][
                                    ]
                                    all [
                                        ris i  append append
                                            copy either r [s] [s]
                                            s
                                            either r [""] [""]
                                        rii i i
                                    ]
                                    []
                                    yes [
                                        if r [append clear s ""]
                                    ]
                                ]
                                if 0 = i: ri case [
                                    s = "" 0
                                ][
                                ]
                            ]
                        ]
                    ]
                ]
            ]
            if ri i []
        ]
        if ri i []
    ]
]
```

Compiling to native code... 

**\* Red/System Compiler Internal Error: Script Error : at expected index argument of type: number logic pair 
**\* Where: resolve-symbol-refs 
**\* Near:  [change at cbuf ref form-struct]



Comments:
--------------------------------------------------------------------------------

On 2013-08-05T08:55:31Z, dockimbel, commented:
<https://github.com/red/red/issues/508#issuecomment-22094017>

    I can't reproduce it with the MSDOS target from Windows or Linux.

--------------------------------------------------------------------------------

On 2013-08-05T10:14:12Z, dockimbel, commented:
<https://github.com/red/red/issues/508#issuecomment-22097391>

    Tell me if this fix improves it.

--------------------------------------------------------------------------------

On 2013-08-05T17:17:45Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/508#issuecomment-22121303>

    No change for my setup, but when I remove red-store-bodies?: no, this case now works, but my real program still doesn't, so it's probably accidental.
    
    Are you using my latest common repository?

--------------------------------------------------------------------------------

On 2013-08-06T08:37:58Z, dockimbel, commented:
<https://github.com/red/red/issues/508#issuecomment-22164953>

    Yes, I was using the latest version of common repo.
    
    Does the fix for #509 cure this one too?

--------------------------------------------------------------------------------

On 2013-08-06T15:40:48Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/508#issuecomment-22188628>

    No.
    
    Did you use red-store-bodies?: no to reproduce?

--------------------------------------------------------------------------------

On 2013-08-06T16:22:02Z, dockimbel, commented:
<https://github.com/red/red/issues/508#issuecomment-22191644>

    Ok, reproduced it on Linux with that option. Another case of Rebol2 internal memory corruption...

