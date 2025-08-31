
#411: Semi-random compile crash
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 24 comment(s).
[status.built] [type.bug] [status.resolved] [Red/System]
<https://github.com/red/red/issues/411>

I can't minimise this further: any change makes the issue disappear. I've also seen it on other programs. The base of the problem seems to be in the first ALL.

```
Red []

#include %../../common/common.red
#include %../../ZeroMQ-binding/ZeroMQ-binding.red
#include %../GTK.red

x: any [get-argument 1  ""]

f: does [
    print form-error system-error
]

unless zero? pool: make-pool 1 [
    unless zero? socket: open-socket pool subscribe! [
        either all [
            connect socket ""
            zmq-set socket filter 0 0
        ][
            while [yes] [
                if data: receive socket [
                    print ""
                    print data

                    all [
                        not tail? data
                        not tail? code: load data
                        view code
                    ]
                ]
            ]
        ][
        ]
    ]
]
```

Compiling to native code... 

**\* Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
**\* Where: form-struct 
**\* Near:  [append out switch/default type/1 [
char [to-bin8 any [value 0]] 
short [pad out 2 to-bin16 any [value 0]] 
int [pad out 4 to-bin32 any [value 0]] 
char! [to-bin8 any [value 0]] 
integer! [pad out 4 to-bin32 any [value 0]] 
decimal! [pad out 4 #{0000000000000000}]
]]



Comments:
--------------------------------------------------------------------------------

On 2013-02-12T20:33:32Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-13455845>

    Not reproductible after fixes in branch `fix-385`.

--------------------------------------------------------------------------------

On 2013-02-14T21:10:08Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-13578702>

    I will close this ticket if you have not reproduced it in the last days?

--------------------------------------------------------------------------------

On 2013-02-15T00:35:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/411#issuecomment-13587537>

    It's not certain it's related to #385, but fair enough. It may have been just a shift in the generated code, but we'd have to wait for a new case.

--------------------------------------------------------------------------------

On 2013-03-10T02:13:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/411#issuecomment-14674828>

    I'm still getting this now and then.

--------------------------------------------------------------------------------

On 2013-03-25T00:15:15Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-15372825>

    Do you still get it or can we close this ticket?

--------------------------------------------------------------------------------

On 2013-03-29T22:17:09Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-15663323>

    Any news about this issue?

--------------------------------------------------------------------------------

On 2013-04-01T17:15:21Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/411#issuecomment-15725115>

    I'm currently getting this failure on hello-GTK-world.red for Linux-ARM.

--------------------------------------------------------------------------------

On 2013-04-05T23:15:27Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/411#issuecomment-15985807>

    Now I'm getting it on GTK-input-field.red for Linux.

--------------------------------------------------------------------------------

On 2013-04-05T23:26:36Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-15986153>

    Does it work using a REBOL 2.7.6 version?

--------------------------------------------------------------------------------

On 2013-04-06T00:13:10Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/411#issuecomment-15987341>

    I suppose. It did in an earlier test.

--------------------------------------------------------------------------------

On 2013-04-23T19:09:14Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-16879583>

    I have reproduced the issue with 2.7.6 on Linux/x86. The cause of error is untracable from mezz level as it disappears when some change is done in %virtual-struct.r on the following line:
    
    ```
        type: select obj/__vs-spec name
    ```
    
    For some unknown reason, sometimes `select` is failing and return `none` while it shouldn't. It is probably a Rebol2 internal bug that we can't fix. It is not the first time I have heisenbugs with `select` but it was limited to application on hash! values so far only. Anyway, the fix I usually apply is replacing it by `second find`. That has worked well in the past for similar `select` heisenbugs.

--------------------------------------------------------------------------------

On 2013-04-23T19:11:59Z, dockimbel, commented:
<https://github.com/red/red/issues/411#issuecomment-16879734>

    I hope this workaround will fix the issue. I'm closing this ticket, please reopen it if the same compilation error reappears.

