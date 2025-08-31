
#4061: [View] Crash & Regression: `do-event` loop stops when calling `unview`
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/4061>

**To reproduce**

1) Run this code from the console:
```
view [
    base 300x400 on-alt-down [
        view/options [ base ][ actors: object [on-unfocus: func [f e] [unview/only f]] ]
    ]
]
```
2) Right-click on the main window so there appears another window
3) Left-click on the main window to trigger `unfocus` event of that window
4) Observe that the event loop has stopped and _console prompt is active_ (in CLI console this also stops the main window from reacting to any events)
5) If console was built with the `-d` flag, this message also pops up in the log:
`VIEW: WARNING: free null window handle!`

This is a regression. It didn't happen yet on September 14, 2019 build.

**Part two**

Using the same code, change the event to `on-created`:
```
view [
    base 300x400 on-alt-down [
        view/options [ base ][ actors: object [on-created: func [f e] [unview/only f]] ]
    ]
]
```
It crashes after the right-click:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 130
***
***   stack: gui/get-face-values 007011B8h
***   stack: gui/update-layered-window 007011B8h 00000000h 00000000h 00000000h -1
***   stack: gui/OS-show-window 7344568
***   stack: ctx||411~show-window 02971944h
***   stack: show
***   stack: view
***   stack: red/_function/call 02971784h 00393884h
***   stack: red/interpreter/eval-code 02971784h 02C6D7C0h 02C6D7C0h true 02C6D790h 02C6D7D4h 02A71074h
***   stack: red/interpreter/eval-path 02C6D790h 02C6D7A0h 02C6D7C0h false false false false
***   stack: red/interpreter/eval-expression 02C6D7A0h 02C6D7C0h false false false
***   stack: red/interpreter/eval 02C6D72Ch true
***   stack: red/interpreter/eval-function 02971754h 02C6D72Ch
***   stack: red/_function/call 02971754h 021F1DB8h
***   stack: red/interpreter/eval-code 02971754h 02BB9570h 02BB9570h false 00000000h 00000000h 029716B4h
***   stack: red/interpreter/eval-expression 02BB9550h 02BB9570h false false false
***   stack: red/interpreter/eval 02971744h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments 02A704B4h 02BB952Ch 02BB952Ch 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A704B4h 02BB951Ch 02BB952Ch false 00000000h 00000000h 02A704B4h
***   stack: red/interpreter/eval-expression 02BB951Ch 02BB952Ch false false false
***   stack: red/interpreter/eval 02971724h true
***   stack: red/natives/try* true 0
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake 021F32ACh
***   stack: gui/make-event 0018FCBCh 8388608 5
***   stack: gui/process 0018FCBCh
***   stack: gui/do-events false
***   stack: ctx||411~do-event-loop false
***   stack: do-events
***   stack: view
***   stack: red/_function/call 02971514h 00393884h
***   stack: red/interpreter/eval-code 02971514h 02C60868h 02C60868h false 00000000h 00000000h 02A71074h
***   stack: red/interpreter/eval-expression 02C60858h 02C60868h false false false
***   stack: red/interpreter/eval 029714F4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||513~try-do 021F0934h
***   stack: ctx||513~launch 021F0934h
***   stack: ctx||530~launch 021F0488h
```
This part is not a regression, crashes every build I've tried so far.

**Expected behavior**

Shouldn't crash. Shouldn't interrupt the event loop.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-07T13:34:01Z, bitbegin, commented:
<https://github.com/red/red/issues/4061#issuecomment-539013476>

    Can't reproduce `case 1` and `case 2`. 
    If after `case 2`, close the window, the console will crash after seconds:
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/red/red/modules/view/backends/windows/gui.reds
    *** at line: 130
    ***
    ***   stack: gui/get-face-values FFFFFFFFh
    ***   stack: gui/get-facets 0019FBD0h
    ***   stack: gui/show-context-menu 0019FBD0h 1260 722
    ***   stack: gui/process 0019FBD0h
    ***   stack: gui/do-events false
    ***   stack: ctx||411~do-event-loop false
    ***   stack: do-events
    ***   stack: view
    ***   stack: red/_function/call 02882B44h 00A43884h
    ***   stack: red/interpreter/eval-code 02882B44h 02D04324h 02D04324h false 00000000h 00000000h 02A81074h
    ***   stack: red/interpreter/eval-expression 02D04314h 02D04324h false false false
    ***   stack: red/interpreter/eval 02882B24h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||503~try-do 00B70544h
    ***   stack: ctx||503~do-command 00B70544h
    ***   stack: ctx||503~eval-command 00B70544h
    ***   stack: ctx||503~run 00B70544h
    ***   stack: ctx||503~launch 00B70544h
    ***   stack: ctx||535~launch 00B6F80Ch
    ```

