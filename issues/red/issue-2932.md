
#2932: Compilation Error: word update-scroller not defined in system/view/platform/update-scroller
================================================================================
Issue is closed, was reported by retsyo and has 10 comment(s).
<https://github.com/red/red/issues/2932>

Win7 64bits, antivirus software is disabled.

I have downloaded 3 latest binary files (http://static.red-lang.org/dl/auto/win/red-latest.zip) these days for windows. However only one can run

```bash
E:\prg\Rebol\red_lang>del /Q "C:\Users\All Users\Red\*.*"

E:\prg\Rebol\red_lang>red-26jul17-7506e51.exe
Compiling Red GUI console...
*** Compilation Error: word update-scroller not defined in system/view/platform/
update-scroller
*** in file: C:\ProgramData\Red\red-console.red
*** near: [
    system/view/platform/update-scroller self (index? in self word) - 1
]

E:\prg\Rebol\red_lang>del /Q "C:\Users\All Users\Red\*.*"

E:\prg\Rebol\red_lang>red-25jul17-64f1d4f.exe
Compiling Red GUI console...
*** Compilation Error: word update-scroller not defined in system/view/platform/
update-scroller
*** in file: C:\ProgramData\Red\red-console.red
*** near: [
    system/view/platform/update-scroller self (index? in self word) - 1
]

E:\prg\Rebol\red_lang>del /Q "C:\Users\All Users\Red\*.*"

E:\prg\Rebol\red_lang>red-23jul16-e730f28.exe              <-- this launches without problem
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-27T08:44:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2932#issuecomment-318299042>

    Could you list the content of the `C:\ProgramData\Red\` folder between each attempt? It really looks like a access right issue with that folder on your platform.

--------------------------------------------------------------------------------

On 2017-07-27T12:55:05Z, retsyo, commented:
<https://github.com/red/red/issues/2932#issuecomment-318353349>

    `Avira realtime protection` is disabled.
    Is this still https://github.com/red/red/issues/2399 ?
    
    ```bash
    E:\prg\Rebol\red_lang>del /Q "C:\Users\All Users\Red\*.*"
    
    E:\prg\Rebol\red_lang>dir "C:\Users\All Users\Red\"
     Volume in drive C has no label.
     Volume Serial Number is 9A60-B31F
    
     Directory of C:\Users\All Users\Red
    
    2017/07/27  20:47    <DIR>          .
    2017/07/27  20:47    <DIR>          ..
                   0 File(s)              0 bytes
                   2 Dir(s)     842,190,848 bytes free
    
    E:\prg\Rebol\red_lang>red-26jul17-7506e51.exe
    Compiling compression library...
    Compiling Red GUI console...
    *** Compilation Error: word update-scroller not defined in system/view/platform/
    update-scroller
    *** in file: C:\ProgramData\Red\red-console.red
    *** near: [
        system/view/platform/update-scroller self (index? in self word) - 1
    ]
    
    E:\prg\Rebol\red_lang>dir "C:\Users\All Users\Red\"
     Volume in drive C has no label.
     Volume Serial Number is 9A60-B31F
    
     Directory of C:\Users\All Users\Red
    
    2017/07/27  20:48    <DIR>          .
    2017/07/27  20:48    <DIR>          ..
    2017/07/27  20:48             4,132 auto-complete.red
    2017/07/27  20:48            30,720 crush-2017-7-26-10919.dll
    2017/07/27  20:48             7,213 engine.red
    2017/07/27  20:48            18,658 help.red
    2017/07/27  20:48            13,025 input.red
    2017/07/27  20:48            10,629 POSIX.reds
    2017/07/27  20:48             9,028 red-console.red
    2017/07/27  20:48            33,290 terminal.reds
    2017/07/27  20:48             5,990 wcwidth.reds
    2017/07/27  20:48             8,764 win32.reds
    2017/07/27  20:48            13,981 windows.reds
                  11 File(s)        155,430 bytes
                   2 Dir(s)     841,793,536 bytes free
                   
                   
    E:\prg\Rebol\red_lang>del /Q "C:\Users\All Users\Red\*.*"
    
    E:\prg\Rebol\red_lang>dir "C:\Users\All Users\Red\"
     Volume in drive C has no label.
     Volume Serial Number is 9A60-B31F
    
     Directory of C:\Users\All Users\Red
    
    2017/07/27  20:49    <DIR>          .
    2017/07/27  20:49    <DIR>          ..
                   0 File(s)              0 bytes
                   2 Dir(s)     841,900,032 bytes free
    
    E:\prg\Rebol\red_lang>red-23jul16-e730f28.exe          <--- this works
    Compiling compression library...
    Compiling Red GUI console...
    
    E:\prg\Rebol\red_lang>dir "C:\Users\All Users\Red\"
     Volume in drive C has no label.
     Volume Serial Number is 9A60-B31F
    
     Directory of C:\Users\All Users\Red
    
    2017/07/27  20:50    <DIR>          .
    2017/07/27  20:50    <DIR>          ..
    2017/07/27  20:50               189 console-cfg.red
    2017/07/27  20:49            29,696 crush-2016-7-23-56070.dll
    2017/07/27  20:50           769,536 gui-console-2016-7-23-56070.exe
                   3 File(s)        799,421 bytes
                   2 Dir(s)     839,159,808 bytes free                              
    ```

--------------------------------------------------------------------------------

On 2019-10-07T15:37:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/2932#issuecomment-539073182>

    This still relevant?

--------------------------------------------------------------------------------

On 2020-03-21T19:56:18Z, 9214, commented:
<https://github.com/red/red/issues/2932#issuecomment-602095466>

    ↑ ping.

--------------------------------------------------------------------------------

On 2020-07-15T10:42:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/2932#issuecomment-658694429>

    I'm closing this as OP doesn't answer and didn't provide a way to reproduce the issue. Besides, it still looks like an AV problem on OP's side. Not the first time I see reports of "disabled" AVs that were not. For AV issues see [this wiki](https://github.com/red/red/wiki/%5BNOTE%5D-Anti-virus-false-positives) and [this issue](https://github.com/red/red/issues/3263)

