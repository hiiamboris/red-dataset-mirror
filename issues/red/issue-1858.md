
#1858: Crash occurred on recursive call without an exit condition
================================================================================
Issue is closed, was reported by Zamlox and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/1858>

Console crashes when recursive call made without having a condition to exit recursive call.

```
f1: func [][f1]
f1
```

```
*** Error: call stack overflow!


*** Runtime Error 98: assertion failed
*** in file: /D/Work/Red/source/red/runtime/natives.reds
*** at line: 1652

*** Runtime Error 1: access violation
*** in file: /D/Work/Red/source/red/system/runtime/debug.reds
*** at line: 70
***
***   stack: __print-debug-stack 004470D3h
***   stack: ***-on-quit 98 4485331
***   stack: red/natives/handle-thrown-error
***   stack: ctx257~try-do 003DCBF4h
***   stack: red/_function/call 027FB554h 003DCBF4h
***   stack: red/interpreter/eval-code 027FB554h 0281266Ch 028126BCh true 00000000h 00000000h 027FB554h
***   stack: red/interpreter/eval-expression 0281265Ch 028126BCh false true
***   stack: red/interpreter/eval-arguments 0281D580h 0281264Ch 028126BCh 0281262Ch 028126D0h
***   stack: red/interpreter/eval-code 0281D580h 0281263Ch 028126BCh true 0281262Ch 028126D0h 0281D580h
***   stack: red/interpreter/eval-path 0281262Ch 0281263Ch 028126BCh false false false false
***   stack: red/interpreter/eval-expression 0281263Ch 028126BCh false false
***   stack: red/interpreter/eval 02783AF0h true
***   stack: red/natives/unless* false
***   stack: red/interpreter/eval-arguments 0281DE80h 02812508h 02812528h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0281DE80h 028124D8h 02812528h false 00000000h 00000000h 0281DE80h
***   stack: red/interpreter/eval-expression 028124D8h 02812528h false false
***   stack: red/interpreter/eval 02783AD0h true
***   stack: red/natives/do* true -1
***   stack: ctx257~eval-command 003DCBF4h
***   stack: ctx257~run 003DCBF4h
***   stack: ctx257~launch 003DCBF4h
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-27T05:16:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1858#issuecomment-214972020>

    Good catch, this looks like a regression.

--------------------------------------------------------------------------------

On 2019-05-23T20:49:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/1858#issuecomment-495379672>

    Regardless of PR #3894 acceptance this issue has to be reopened. With the proposed fix I get (mind the flags):
    ```
    > red -r -e -d issue-1858.red & issue-1858.exe
    root size: 2167, root max: 4138, cycles: 0, before: 1088908, after: 1052828
    root size: 2167, root max: 4138, cycles: 1, before: 1086948, after: 1085788
    root size: 2167, root max: 4138, cycles: 2, before: 1086884, after: 1086884
                                                                                                                                                                                                                    *** Runtime Error 19: stack error or overflow
    *** in file: /D/devel/red/red-src/red/runtime/interpreter.reds
    *** at line: 1015
    ***
    ***   stack: red/interpreter/eval-expression 034DD4A4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC154h 034DD440h
    ***   stack: red/_function/call 026DC154h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC154h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC144h 034DD440h
    ***   stack: red/_function/call 026DC144h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC144h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC134h 034DD440h
    ***   stack: red/_function/call 026DC134h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC134h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC124h 034DD440h
    ***   stack: red/_function/call 026DC124h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC124h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC114h 034DD440h
    ***   stack: red/_function/call 026DC114h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC114h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC104h 034DD440h
    ***   stack: red/_function/call 026DC104h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC104h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC0F4h 034DD440h
    ***   stack: red/_function/call 026DC0F4h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC0F4h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    ***   stack: red/interpreter/eval-expression 034DD4B4h 034DD4B4h false false false
    ***   stack: red/interpreter/eval 034DD440h true
    ***   stack: red/interpreter/eval-function 026DC0E4h 034DD440h
    ***   stack: red/_function/call 026DC0E4h 006C3884h
    ***   stack: red/interpreter/eval-code 026DC0E4h 034DD4B4h 034DD4B4h false 00000000h 00000000h 027D1784h
    
    > red -r -d issue-1858.red & issue-1858.exe
    root size: 2169, root max: 4140, cycles: 0, before: 1088772, after: 1052732
    root size: 2169, root max: 4140, cycles: 1, before: 1086940, after: 1085780
    root size: 2169, root max: 4140, cycles: 2, before: 1086788, after: 1086788
    
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/red/runtime/natives.reds
    *** at line: 1882
    ***
    ***   stack: red/natives/handle-thrown-error
    ***   stack: red/natives/handle-thrown-error
    
    > red -r issue-1858.red & issue-1858.exe
    
    *** Runtime Error 1: access violation
    *** at: 004363FEh
    ```
    
    Without the fix - only the first (`-r -e -d`) failure. Probably because it's more aggressively cleaning the stack up or something.

