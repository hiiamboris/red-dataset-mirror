
#4457: face/selected too big will close the window
================================================================================
Issue is closed, was reported by luce80 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4457>

**Describe the bug**
There seems to be a "low" limit to selection in a field.

**To reproduce**
```
>> view [field "a" with [selected: 1x100000]] ; ok
>> view [field "a" with [selected: 1x1000000]] ; closes window immediatly
```

**Expected behavior**
Window should not close. All text should be selected or an error indicating a limit was exceeded or "out of range" reached.

**Platform version (please complete the following information)**
```
Windows 7
Red 0.6.4 for Windows built 20-May-2020/4:33:15+02:00 commit #053dece
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-20T14:56:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4457#issuecomment-631527323>

    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red-master/runtime/datatypes/string.reds
    *** at line: 1380
    ***
    ***   stack: red/string/sniff-chars 02E91000h 02F08AC8h 1 0018F984h 0018F980h
    ***   stack: gui/adjust-selection 02E197F0h 0018F9ACh 0018F9A8h 1
    ***   stack: gui/select-text 004D0C5Ah 02E197F0h
    ***   stack: gui/change-selection 004D0C5Ah 02E19890h 02E197F0h
    ***   stack: gui/OS-make-view 029EA754h 7015686
    ***   stack: ctx||454~make-view 029EA754h 029EA764h
    ***   stack: show
    ***   stack: show
    ***   stack: view
    ***   stack: red/_function/call 029EA404h 00383884h
    ***   stack: red/interpreter/eval-code 029EA404h 02E14198h 02E14198h false 00000000h 00000000h 02AE1090h
    ***   stack: red/interpreter/eval-expression 02E14188h 02E14198h false false false
    ***   stack: red/interpreter/eval 029EA3E4h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||551~try-do 003F027Ch
    ***   stack: ctx||551~do-command 003F027Ch
    ***   stack: ctx||551~eval-command 003F027Ch
    ***   stack: ctx||551~run 003F027Ch
    ***   stack: ctx||551~launch 003F027Ch
    ***   stack: ctx||584~launch 003EF538h
    ```

