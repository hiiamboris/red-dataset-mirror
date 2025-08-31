
#4087: [CRASH] Overlapping memory copy in `change` func
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4087>

**Describe the bug**

Debug console builds crash on this:
```
>> change/part s: "" s s

*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/red/system/runtime/libc.reds
*** at line: 161
***
***   stack: copy-memory 00000062h 0041B3A6h 0
***   stack: copy-memory 02DB0C98h 02DB0C98h 0
***   stack: red/_series/change 02AC15D4h 02AC15E4h 02AC15F4h false 02AC15C4h
***   stack: red/actions/change 02AC15D4h 02AC15E4h 02AC15F4h false 02AC15C4h
***   stack: red/actions/change* 2 -1 -1
***   stack: red/interpreter/eval-arguments 02BBF9D4h 02DB0B4Ch 02DB0B4Ch 02DB0AFCh 02DB0C44h
***   stack: red/interpreter/eval-code 02BBF9D4h 02DB0B0Ch 02DB0B4Ch true 02DB0AFCh 02DB0C44h 02BBF9D4h
***   stack: red/interpreter/eval-path 02DB0AFCh 02DB0B0Ch 02DB0B4Ch false false false false
***   stack: red/interpreter/eval-expression 02DB0B0Ch 02DB0B4Ch false false false
***   stack: red/interpreter/eval 02AC15A4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||513~try-do 003F0934h
***   stack: ctx||513~do-command 003F0934h
***   stack: ctx||513~eval-command 003F0934h
***   stack: ctx||513~run 003F0934h
***   stack: ctx||513~launch 003F0934h
***   stack: ctx||530~launch 003F0488h
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-28T19:02:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/4087#issuecomment-605504616>

    Even simpler way to reproduce it:
    ```
    b: [a b c]
    change b b
    ```
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/red/system/runtime/libc.reds
    *** at line: 161
    ***
    ***   stack: copy-memory 00000062h 0041DE71h 0
    ***   stack: copy-memory 02C4AEC8h 02C4AEC8h 48
    ***   stack: red/_series/change 028015F4h 02801604h 028015E4h false 028015E4h
    ***   stack: red/actions/change 028015F4h 02801604h 028015E4h false 028015E4h
    ***   stack: red/actions/change* -1 -1 -1
    ***   stack: red/interpreter/eval-arguments 028FF9E0h 02C4A828h 02C4A828h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 028FF9E0h 02C4A808h 02C4A828h false 00000000h 00000000h 028FF9E0h
    ***   stack: red/interpreter/eval-expression 02C4A808h 02C4A828h false false false
    ***   stack: red/interpreter/eval 028015C4h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||534~try-do 003F0794h
    ***   stack: ctx||534~launch 003F0794h
    ***   stack: ctx||552~launch 003F02DCh
    ```

