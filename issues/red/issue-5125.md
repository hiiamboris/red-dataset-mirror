
#5125: [View] Crash when destoying face during it's creation
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5125>

**Describe the bug**
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 140
***
***   stack: gui/get-face-values 009A179Eh
***   stack: gui/get-selected-handle 009A179Eh
***   stack: gui/set-selected-focus 009A179Eh
***   stack: gui/OS-show-window 10098590
***   stack: ctx||454~show-window 0329C7DCh
***   stack: show
***   stack: view
***   stack: red/_function/call 0329C60Ch 011F3884h 057B8500h 0
***   stack: red/interpreter/eval-code 04BB1AD8h 057B8520h 057B8520h 0329C5ECh false 00000000h 00000000h 04BB1AD8h
***   stack: red/interpreter/eval-expression 057B8510h 057B8520h 0329C5ECh false false false
***   stack: red/interpreter/eval 0329C5ECh true
***   stack: red/natives/catch* true 1
***   stack: ctx||558~try-do 01221A88h
***   stack: ctx||558~launch 01221A88h
***   stack: ctx||577~launch 0122149Ch
```

**To reproduce**

Run this code from any console:
```
append system/view/handlers func [face event] [
	if find [resizing resize moving drawing] event/type [unview]
]
view [base]
```

**Expected behavior**

No crash

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```
see also https://github.com/red/red/issues/4061


Comments:
--------------------------------------------------------------------------------

On 2022-04-15T18:24:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5125#issuecomment-1100277914>

    Less catastrophic scenario: 
    ```
    >> view [base on-create [unview]]
    *** Script Error: path element > 1 < does not apply to none! type
    *** Where: eval-path
    *** Near : none
    *** Stack: view show show  
    ```
    Expected: new window is not shown, no errors.

--------------------------------------------------------------------------------

On 2022-04-15T18:27:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5125#issuecomment-1100279080>

    Alternative crash case:
    ```
    >> view [base on-drawing [unview]]
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/modules/view/backends/windows/draw.reds
    *** at line: 341
    ***
    ***   stack: gui/draw-end 00547204h 00900AB0h false false true
    ***   stack: gui/BaseWndProc 00900AB0h 15 0 0
    ```
    (that's all the stack trace! for some reason)

