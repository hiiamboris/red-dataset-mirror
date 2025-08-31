
#5313: RED Crash on Prin loop with LF
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5313>

This script crashes RED:

```
data: copy []
loop 200 [
	append data copy "alksjlfakjsf"
]
forall data [
	prin [data/1 lf]
	print [data/1 lf]
]
```

RED & PLATFORM VERSION 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4668 date: 17-Apr-2023/12:25:59 commit: #59eaf9a634c8ce701748068629d25594086ca044 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]



Comments:
--------------------------------------------------------------------------------

On 2023-05-04T22:30:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5313#issuecomment-1535489440>

    I can't reproduce on `Red 0.6.4 for Windows built 9-Apr-2023/6:24:34+03:00  commit #d36108e`

--------------------------------------------------------------------------------

On 2023-05-05T07:19:30Z, qtxie, commented:
<https://github.com/red/red/issues/5313#issuecomment-1535831097>

    I can't reproduce on `red-view-04may23-0f4e76ba9.exe` and `red-04may23-0f4e76ba9.exe`.

--------------------------------------------------------------------------------

On 2023-05-05T07:48:11Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5313#issuecomment-1535866961>

    It happens when the script is run from command line from the editor (Ultra Edit here). When typed inside the consolle, it works.
    

--------------------------------------------------------------------------------

On 2023-05-05T09:18:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5313#issuecomment-1535971617>

    So looks like UE bug. No issues when stream is redirected into a file.

--------------------------------------------------------------------------------

On 2023-05-05T09:22:17Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5313#issuecomment-1535976352>

    Run the script from cmd:
    
    ```
    red prj-test/gui-bug.r
    ```
    
    And the consolle will hang and close without printing anything  (RED VIEW here)
    

--------------------------------------------------------------------------------

On 2023-05-05T11:04:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5313#issuecomment-1536089819>

    Reproduced in GUI console:
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/block.reds
    *** at line: 490
    ***
    ***   stack: red/block/mold-each 05803AF8h 03304704h false false true 03304744h 34 0
    ***   stack: red/block/mold 05803AF8h 03304704h false false true 03304744h 34 0
    ***   stack: red/actions/mold 05803AF8h 03304704h false false true 03304744h 35 0
    ***   stack: red/block/mold-each 0E6C00F8h 03304704h true false true 03304744h 35 0
    ***   stack: red/block/mold 0E6C00F8h 03304704h true false true 03304744h 40 0
    ***   stack: red/actions/mold 0E6C00F8h 03304704h true false true 03304744h 40 0
    ***   stack: red/error/form 033046F4h 03304704h 033046E4h 25
    ***   stack: red/actions/form 033046F4h 03304704h 033046E4h 2147483647
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/do-print false true
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 03304924h
    ***   stack: red/fire 0 00FA679Ch
    ***   stack: red/integer/do-math 0
    ***   stack: red/integer/add
    ***   stack: red/actions/add*
    ***   stack: ctx||656~scroll-lines 04D6FDB0h
    ***   stack: ctx||656~reset-top 04D6FDB0h
    ***   stack: ctx||656~calc-top 04D6FDB0h
    ***   stack: ctx||656~add-line 04D6FDB0h
    ***   stack: ctx||656~add-lines 04D6FDB0h
    ***   stack: ctx||656~vprint 04D6FDB0h
    ***   stack: red-print-gui 033046F4h true
    ***   stack: red/dyn-print/red-print 033046F4h true
    ***   stack: red/natives/do-print false true
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 03304924h
    ***   stack: red/fire 0 00FA6A5Ch
    ***   stack: red/integer/do-math 0
    ***   stack: red/integer/add
    ***   stack: red/actions/add*
    ***   stack: ctx||656~scroll-lines 04D6FDB0h
    ***   stack: ctx||656~reset-top 04D6FDB0h
    ***   stack: ctx||656~calc-top 04D6FDB0h
    ***   stack: ctx||656~add-line 04D6FDB0h
    ***   stack: ctx||656~add-lines 04D6FDB0h
    ***   stack: ctx||656~vprint 04D6FDB0h
    ***   stack: red-print-gui 033046F4h true
    ***   stack: red/dyn-print/red-print 033046F4h true
    ***   stack: red/natives/do-print false true
    ```

