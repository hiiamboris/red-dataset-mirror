
#3765: [CRASH] on `focus` being set inside `layout`
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3765>

**Describe the bug**

`view [do [layout [button focus]]]`

```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 227
***
***   stack: gui/get-face-handle 00000062h
***   stack: gui/get-face-handle 02C5A7A0h
***   stack: gui/OS-show-window 13577346
***   stack: ctx371~show-window 029005A4h
***   stack: show
***   stack: view
***   stack: red/_function/call 029003E4h 00803884h
***   stack: red/interpreter/eval-code 029003E4h 02C57668h 02C57668h false 00000000h 00000000h 02A00FE4h
***   stack: red/interpreter/eval-expression 02C57658h 02C57668h false false false
***   stack: red/interpreter/eval 029003C4h true
***   stack: red/natives/catch* true 1
***   stack: ctx473~try-do 00821C88h
***   stack: ctx473~launch 00821C88h
```

The script provided obviously is nonsensical. The initial bug was discovered by running [this project](https://github.com/schwarzbox/EmptyCore) which crashed on Windows, but apparently not on Mac. In that code a new layout was being generated from within the View block and assigned to a pane. I just removed everything incidental to the crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Jan-2019/6:49:24+03:00 commit #702ec38
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-01T13:22:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/3765#issuecomment-459720759>

    Could be related to https://github.com/red/red/issues/3753

