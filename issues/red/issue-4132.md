
#4132: PicoSheets demo crash
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/4132>

**Describe the bug**
[PicoSheets demo](https://gist.github.com/dockimbel/b0a413342dc39568696207412a2ef5e7) (unfolded version) segfaults under trivial conditions.

**To reproduce**
Enter any formula in any cell (e.g. `=A1`). Now, click on any other cell.
```
*** Runtime Error 1: access violation
*** in file: .../datatypes/context.reds
*** at line: 339
***
***   stack: red/_context/get 02F12F28h
***   stack: red/parser/process 02CC1110h 02BA01B4h 0 0 02BA0194h
***   stack: red/natives/parse* false -1 0 -1
***   stack: red/interpreter/eval-arguments 02CA0664h 02F12D54h 02F12DB4h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02CA0664h 02F12D24h 02F12DB4h false 00000000h 00000000h 02CA0664h
***   stack: red/interpreter/eval-expression 02F12D24h 02F12DB4h false false false
***   stack: red/interpreter/eval 02BA0184h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 02C9F8C4h 02F12B04h 02F12B04h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02C9F8C4h 02F12AC4h 02F12B04h false 00000000h 00000000h 02C9F8C4h
***   stack: red/interpreter/eval-expression 02F12AC4h 02F12B04h false false false
***   stack: red/interpreter/eval 02F12990h true
***   stack: red/interpreter/eval-function 02BA00F4h 02F12990h
***   stack: red/_function/call 02BA00F4h 00E222D0h
***   stack: red/interpreter/eval-code 02BA00F4h 02E6FCD8h 02E6FCD8h false 00000000h 00000000h 02BA0054h
***   stack: red/interpreter/eval-expression 02E6FCB8h 02E6FCD8h false false false
***   stack: red/interpreter/eval 02BA00E4h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments 02CA04B4h 02E6FC94h 02E6FC94h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02CA04B4h 02E6FC84h 02E6FC94h false 00000000h 00000000h 02CA04B4h
***   stack: red/interpreter/eval-expression 02E6FC84h 02E6FC94h false false false
***   stack: red/interpreter/eval 02BA00C4h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake 00E237C4h
***   stack: gui/make-event 0019FE80h 0 18
***   stack: gui/process-command-event 001B0BE0h 273 33554432 3082796
***   stack: gui/WndProc 001B0BE0h 273 33554432 3082796
```

**Expected behavior**
No crash, demo continues to work.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 16-Nov-2019/9:02:29+01:00 commit #e40b68a
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-16T14:46:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4132#issuecomment-554643824>

    Can't reproduce the described behavior on W7 w/ Red 0.6.4 for Windows built 4-Nov-2019/15:52:35+03:00
    
    But it does not calculate anything:
    ![](https://i.gyazo.com/3bee6dc79fa8012f3b978db521babb81.png)
    
    And crashes when I'm trying to close it (only with a formula):
    ```
    *** Runtime Error 95: no CATCH for THROW
    *** in file: common.reds
    *** at line: 269
    ***
    ***   stack: ***-uncaught-exception
    ***   stack: ***-uncaught-exception
    ```

