
#2354: libRedRT doesn't compile with -u option
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2354>

[![Снимок123.png](https://s13.postimg.org/ioom6712v/123.png)](https://postimg.org/image/6a1u5v9kj/)

autoit.reds:
```
autoit: context [
    point!: alias struct! [
        x [integer!]
        y [integer!]
    ]
    mouse-pos: declare point!
    
    #import [
        "AutoItX3.dll" stdcall [
            ;AU3_API void WINAPI AU3_Send(LPCWSTR szSendText, int nMode = 0);
            send: "AU3_Send" [
                szSendText [byte-ptr!]
                nMode [integer!]
            ]
        ]
    ]
]
```

script.red
```
Red []
#system-global [#include %autoitx.reds]
press: routine [
    str [string!]
] [
    autoit/send as byte-ptr! unicode/to-utf16 str 0
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-29T14:48:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2354#issuecomment-263589807>

    I can reproduce the issue. It happens only if the %libRedRT-extras.r contains only one entry.

