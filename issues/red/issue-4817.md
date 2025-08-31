
#4817: R/S: Compilation Error: undefined with -с -e
================================================================================
Issue is closed, was reported by bubnenkoff and has 16 comment(s).
[status.resolved] [type.design]
<https://github.com/red/red/issues/4817>

**Describe the bug**
Impossible to compile R/S code placed outside main file with `-c -e`

**To reproduce**
create two files:
app.red:
```
Red []
#include %foo.reds

view [button [probe get-pid]]
```
foo.reds:
```
Red []

#system [
    #import [
           "kernel32.dll" stdcall [
               process-id?: "GetCurrentProcessId" [
                   return: [integer!]
               ]
        ] 
    ]
    _pid: func[return: [integer!]] [return process-id?]
]

get-pid: routine [ return: [integer!] /local pid [integer!] ] [
        pid: _pid
        return pid
    ]
```
Try co compile it with flags: `-c -e`    

**Expected behavior**
Getting error:
```
PS D:\test> C:\red\red.exe -c -e .\app.red

-=== Red Compiler 0.6.4 ===-

Compiling D:\test\app.red ...
...using libRedRT built on 14-Jan-2021/16:23:03
...compilation time : 28 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: _pid
*** in file: %/D/test/app.red
*** in function: exec/get-pid
*** at line: 353
*** near: [_pid
    return pid
]
```

**Platform version**
```
Red 0.6.4 for Windows built 15-Dec-2020/18:58:53+03:00 commit #708c7c2
```

See this post https://gitter.im/red/red/system?at=601999fbae4b9b27c19543aa


Comments:
--------------------------------------------------------------------------------

On 2021-02-03T09:43:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4817#issuecomment-772374246>

    I asked to open this issue because though it's understandable that `-e` turns `#include` into `do` after which we lose all R/S code of the included file for the compiler, and it rightfully complains about undefined words. It raises an important design question for *proper* `#include` design.
    
    The collection grows:
    #4422 #4390 #4422 #4249 #4139 #4128 #3921 #3550 #3464 #2484 red/REP#56

--------------------------------------------------------------------------------

On 2021-02-03T18:47:37Z, dockimbel, commented:
<https://github.com/red/red/issues/4817#issuecomment-772735087>

    @hiiamboris It would be better to open an umbrella _epic_ issue to gather all the related tickets. There was an "epic" mode in Github to handle that (not sure it's still present).

--------------------------------------------------------------------------------

On 2021-02-03T18:49:34Z, dockimbel, commented:
<https://github.com/red/red/issues/4817#issuecomment-772736272>

    ```
    PS D:\test> C:\red\red.exe -c -e .\app.red
    
    -=== Red Compiler 0.6.4 ===-
    
    Compiling D:\test\app.red ...
    ...using libRedRT built on 14-Jan-2021/16:23:03
    ...compilation time : 28 ms
    ```
    
    Those two compilation flags are incompatible. `-c` means _compile_ in dev mode using libRedRT", while `-e` means _encapsulate_ the Red code without compilation. Both result in an executable but using different models (compiled code vs interpreted code).

--------------------------------------------------------------------------------

On 2021-02-03T19:20:20Z, greggirwin, commented:
<https://github.com/red/red/issues/4817#issuecomment-772755716>

    I still want a linter for things we know are not supported or just poor practices. I think this falls into that category. In this case, the CLI can easily say those flags are incompatible. But it's an interesting question as well, because `-e` could mean to encap everything it can, but R/S elements would still have to be compiled. Saves escaping with `do` when not using `-e`.

--------------------------------------------------------------------------------

On 2021-02-09T07:38:31Z, endo64, commented:
<https://github.com/red/red/issues/4817#issuecomment-775737169>

    Shouldn't compiler complain about `routine` when `-e` used?
    
    @bubnenkoff `foo.reds` file extension is `reds` but the header inside is not `Red/System`

--------------------------------------------------------------------------------

On 2021-07-29T16:30:00Z, dockimbel, commented:
<https://github.com/red/red/issues/4817#issuecomment-889291378>

    > Shouldn't compiler complain about routine when -e used?
    
    The compiler is smart enough to extract routines declared in global space and compile them ahead of time, then link them to the encapped Red code.

--------------------------------------------------------------------------------

On 2021-07-29T16:37:02Z, dockimbel, commented:
<https://github.com/red/red/issues/4817#issuecomment-889295839>

    The following version of the above code works fine when compiled with `-e` only:
    
    %foo.red
    ```
    Red []
    #system [
        #import [
               "kernel32.dll" stdcall [
                   process-id?: "GetCurrentProcessId" [
                       return: [integer!]
                   ]
            ] 
        ]
        _pid: func[return: [integer!]] [process-id?]
    ]
    
    get-pid: routine [ return: [integer!] ] [
        _pid
    ]
    ```
    %app.red
    ```
    Red []
    #include %foo.red
    
    view [button "PID?" [probe get-pid]]
    ```

--------------------------------------------------------------------------------

On 2021-07-29T16:38:59Z, dockimbel, commented:
<https://github.com/red/red/issues/4817#issuecomment-889297029>

    BTW, the %foo.red code could be further simplified:
    ```
    Red []
    #system [
        #import [
               "kernel32.dll" stdcall [
                   process-id?: "GetCurrentProcessId" [return: [integer!]]
            ] 
        ]
        _pid: process-id?
    ]
    
    get-pid: routine [ return: [integer!] ] [ _pid ]
    ```

