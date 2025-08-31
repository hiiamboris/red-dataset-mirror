
#1053: Routine causes "Segmentation fault: 11"
================================================================================
Issue is closed, was reported by JerryTsai and has 26 comment(s).
[status.built] [status.resolved] [type.review]
<https://github.com/red/red/issues/1053>

I tried to use nanomsg in MacOS, after running the receiving loop for a certain time, I always got a segmentation fault. The bug can be reproduced every time.

The following is the nanomsg wrapper:

``` Red
Red [
    file:    %nanomsg.red
]

#system-global [
    #import [
        "libnanomsg.dylib" cdecl [
            nn_socket:   "nn_socket" [
                domain      [integer!]
                protocol    [integer!]
                return:     [integer!]
            ]
            nn_bind:        "nn_bind" [
                s           [integer!]
                addr        [c-string!]
                return:     [integer!]
            ]
            nn_connect:     "nn_connect" [
                s           [integer!]
                addr        [c-string!]
                return:     [integer!]
            ]
            nn_send:        "nn_send" [
                s           [integer!]
                buf         [byte-ptr!]
                len         [integer!]
                flags       [integer!]
                return:     [integer!]
            ]
            nn_recv:        "nn_recv" [
                s           [integer!]
                buf         [byte-ptr!]
                len         [integer!]
                flags       [integer!]
                return:     [integer!]
            ]
            nn_freemsg:     "nn_freemsg" [
                msg         [byte-ptr!]
                return:     [integer!]
            ]
        ]
    ]
]

nn-socket*: routine [
    domain      [integer!]
    protocol    [integer!]
    return:     [integer!]
    /local
        ret
][
    ret: nn_socket domain protocol
    ret
]

protocols: [
        PAIR   16
        PUB    32
        SUB    33
        REP    49
        REQ    48
        PUSH   80
        PULL   81
        SURVEYOR   96
        RESPONDENT 97
        BUS        112
]

nn-socket: func [ protocol [word!] /local d p ret] [
    ret: -1
    p: select protocols protocol
    ret: nn-socket* 1 p
    ret
]

nn-bind: routine [
    socket      [integer!]
    address     [string!]
    return:     [integer!]
    /local
        ret
][
    ret: nn_bind socket as c-string! string/rs-head address
    ret
]

nn-connect: routine [
    socket      [integer!]
    address     [string!]
    return:     [integer!]
    /local
        ret
] [
    ret: nn_connect socket as c-string! string/rs-head address
    ret
]

nn-send*: routine [
    s   [integer!]
    msg [string!]
    flag [ integer!]
    return:  [integer!]
    /local
    str
    ret
] [
    str: as c-string! string/rs-head msg
    ret: nn_send s as byte-ptr! str size? str flag 
    ret
]

nn-send: func [
    s
    string
] [
    nn-send* s string 0
]

nn-recv*: routine [
    s       [integer!]
    flag    [integer!]
    /local
    pp
    ret
    tmp
] [ 
    pp: 0
    nn_recv s as byte-ptr! :pp -1 flag
    tmp: as c-string! pp
    ret: as red-string! (string/load tmp size? tmp 0)
    nn_freemsg as byte-ptr! tmp
    SET_RETURN(ret)
]   

nn-recv: func [
    s [integer!]
] [ 
    nn-recv* s 0
]   
```

The following is the server code:

``` Red
Red [ ]
#include %nanomsg.red
url: "ipc:///tmp/pipeline.ipc"
sock: nn-socket 'PULL 
ep: nn-bind sock url
i: 0
while [ true ] [
    i: i + 1
    print [ i ": " nn-recv sock ]
]
```

The following is the client code:

``` Red
Red [ ]
#include %nanomsg.red
url: "ipc:///tmp/pipeline.ipc"
sock: nn-socket 'PUSH
ep: nn-connect sock url
while [true] [
    nn-SEND sock "..."
]
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-11T06:02:04Z, qtxie, commented:
<https://github.com/red/red/issues/1053#issuecomment-78209958>

    Testing it on Windows, it works fine. [nanomsg.dll](https://github.com/mhowlett/NNanomsg/tree/master/NNanomsg/x86)
    I'll check it on Mac OS X later.

--------------------------------------------------------------------------------

On 2015-03-11T06:45:07Z, qtxie, commented:
<https://github.com/red/red/issues/1053#issuecomment-78213204>

    Sorry, it crashed on Windows after running a while. Here it the error message:
    
    ```
    125840 :  ...
    125841 :  ...
    125842 :  ...
    
    *** Runtime Error 19: stack error or overflow
    *** at: 004378FEh
    ```
    
    BTW, I notice that there is a recursive function using in `while` loop in nanoserver. Seems it's the reason caused the stack overflow.
    
    ```
    nn-recv*: routine [
        s       [integer!]
        flag    [integer!]
        /local
        pp
        ret
        tmp
    ] [ 
        pp: 0
        **nn_recv** s as byte-ptr! :pp -1 flag
        tmp: as c-string! pp
        ret: as red-string! (string/load tmp size? tmp 0)
        nn_freemsg as byte-ptr! tmp
        SET_RETURN(ret)
    ]   
    
    nn-recv: func [
        s [integer!]
    ] [ 
        nn-recv* s 0
    ]   
    ```
    
    @dockimbel We need to improve the error report on Mac OS. It should be the same as on Windows.

--------------------------------------------------------------------------------

On 2015-03-11T12:35:55Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-78254530>

    nn-recv calls nn-recv\* which calls nn_recv. THERE IS NO RECURSION HERE. "nn-recv" is a red function. "nn_recv" is a red/system function. One is with hyphan "-", the other is with underscore "_".

--------------------------------------------------------------------------------

On 2015-03-11T12:50:47Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-78256639>

    The error message is from OS, so they cannot be the same on different OSes. I think.

--------------------------------------------------------------------------------

On 2015-03-12T01:04:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1053#issuecomment-78405876>

    My mistake about the recursion, I overlooked the code and mislead @qtxie. We'll give it a deeper look today on MacOS.

--------------------------------------------------------------------------------

On 2015-03-12T06:15:58Z, qtxie, commented:
<https://github.com/red/red/issues/1053#issuecomment-78429376>

    This is caused by `string/load` allocate memory larger than 2MB, which doesn't support in Red currently.

--------------------------------------------------------------------------------

On 2015-03-12T09:19:42Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-78446167>

    In my test case, I sent "...", which took 4 bytes in c-string. Why did string/load try to allocate >2MB memory? 

--------------------------------------------------------------------------------

On 2015-03-12T09:51:18Z, qtxie, commented:
<https://github.com/red/red/issues/1053#issuecomment-78450537>

    @JerryTsai To be exact, it is the `root` series-buffer! larger than 2MB. Each time we call `string/load`, it will allocate a `node!` (16KB) from `root`. It's not good, we are going to change `string/load` to allocate the `node` from Red Stack.

--------------------------------------------------------------------------------

On 2015-03-16T09:01:53Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-81515769>

    Just tested this issue with v0.5.1 on MacOS. Not a problem now. Thanks.

--------------------------------------------------------------------------------

On 2015-03-16T09:08:59Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-81518744>

    But after running it for 5 more minutes (which looped 41 million times), I got this:
    
    41256629 :  ...
    **\* Runtime Error 1: access violation
    **\* at: 00032F1Ah

--------------------------------------------------------------------------------

On 2015-03-16T09:15:02Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-81522047>

    I compiled it with -d option for debugging information. I got this in runtime:
    
    **\* Runtime Error 1: access violation
    **\* in file: allocator.reds
    **\* at line: 204

--------------------------------------------------------------------------------

On 2015-03-16T11:40:13Z, qtxie, commented:
<https://github.com/red/red/issues/1053#issuecomment-81596730>

    Oops, out of memory...
    We have no GC now, so the red-string! (which contains "...") you allocated can't be freed. It will used up all available memory after running for a long time.

--------------------------------------------------------------------------------

On 2015-03-16T11:52:25Z, JerryTsai, commented:
<https://github.com/red/red/issues/1053#issuecomment-81602845>

    Since GC is scheduled in v0.9, this ticket can be closed now. But this error information should be changed to "out of memory" instead of "access violation".

