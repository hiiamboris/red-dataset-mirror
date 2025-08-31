
#4323: [Regression] [CRASH] on stack overflow
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [type.bug] [status.resolved]
<https://github.com/red/red/issues/4323>

**Describe the bug**

This is okay:
```
>> c: 0 f: does [c: c + 1 do [f]] try [f] print c
1322
```

Without `do` it should return a beautiful `1984` (see https://github.com/red/red/issues/3524#issuecomment-427523321), but...
```
>> c: 0 f: does [c: c + 1 f] try [f] print c

*** Runtime Error 19: stack error or overflow
*** in file: /D/devel/red/red-src/red/runtime/interpreter.reds
*** at line: 943
***
***   stack: red/interpreter/eval-expression 0353A120h 0353A140h true true false
***   stack: red/interpreter/eval-infix 02CDB9E0h 0353A120h 0353A140h true
***   stack: red/interpreter/eval-expression 0353A110h 0353A140h false true false
***   stack: red/interpreter/eval-expression 0353A100h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A01234h 0353A088h
***   stack: red/_function/call 02A01234h 003C3884h
***   stack: red/interpreter/eval-code 02A01234h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A01224h 0353A088h
***   stack: red/_function/call 02A01224h 003C3884h
***   stack: red/interpreter/eval-code 02A01224h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A01214h 0353A088h
***   stack: red/_function/call 02A01214h 003C3884h
***   stack: red/interpreter/eval-code 02A01214h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A01204h 0353A088h
***   stack: red/_function/call 02A01204h 003C3884h
***   stack: red/interpreter/eval-code 02A01204h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A011F4h 0353A088h
***   stack: red/_function/call 02A011F4h 003C3884h
***   stack: red/interpreter/eval-code 02A011F4h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A011E4h 0353A088h
***   stack: red/_function/call 02A011E4h 003C3884h
***   stack: red/interpreter/eval-code 02A011E4h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
***   stack: red/interpreter/eval-function 02A011D4h 0353A088h
***   stack: red/_function/call 02A011D4h 003C3884h
***   stack: red/interpreter/eval-code 02A011D4h 0353A140h 0353A140h false 00000000h 00000000h 02CDC4A0h
***   stack: red/interpreter/eval-expression 0353A140h 0353A140h false false false
***   stack: red/interpreter/eval 0353A088h true
```

**Expected behavior**

No crash using 2nd snippet.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-17T20:20:55Z, 9214, commented:
<https://github.com/red/red/issues/4323#issuecomment-600278175>

    https://github.com/red/red/issues/3058, https://github.com/red/red/issues/1858

--------------------------------------------------------------------------------

On 2021-01-14T14:29:56Z, rebolek, commented:
<https://github.com/red/red/issues/4323#issuecomment-760231925>

    On Linux it returns 3970 without a crash.

--------------------------------------------------------------------------------

On 2021-04-14T17:01:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4323#issuecomment-819673337>

    Another crash scenario:
    ```
    Red []
    f: does [f]
    view [base rate 99 on-time [f] base rate 1 on-time [unview]]
    ```
    Result (after 1 second):
    ```
    f f f f f f f f f f f f f f f f f f f f f
    f f f f f f f f f f f f f f f f f f f f f
    f f f f f f f f f f do-actor do-safe f f f
     f f f f f f f f f f f f f f f f f f f f f
     f f f f f f f f f f f f f f f f f f f f f
     f f f f f f f f f f f f f f f f f f f f f
     f f
    
    *** Runtime Error 95: no CATCH for THROW
    *** in file: common.reds
    *** at line: 281
    ***
    ***   stack: ***-uncaught-exception
    ***   stack: ***-uncaught-exception
    ```
    What's suspicious is that `do-actor` seemingly fires without unwinding the previous stack of `f`s.

--------------------------------------------------------------------------------

On 2022-08-15T14:10:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4323#issuecomment-1215058420>

    Can't reproduce those issues with current version.

--------------------------------------------------------------------------------

On 2022-08-15T16:08:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4323#issuecomment-1215255264>

    Neither do I since 30-sep-2021 build.
    Although seen some random no-cat-for-throw crashes recently in june-2022 build, so I suppose the bug just migrated somewhere else.

