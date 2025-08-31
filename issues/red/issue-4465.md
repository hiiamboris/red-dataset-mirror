
#4465: [View] Face creation doesn't play well with auto-sync: off
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/4465>

**Describe the bug**
```
Red [needs: view]

system/view/auto-sync?: no
view/no-wait [p: panel []]
append p/pane make-face 'text
system/view/auto-sync?: yes
clear p/pane
; append p/pane make-face 'text
; clear p/pane
; show p
```
Run in debug console (CLI or GUI):
```
VIEW: WARNING: free null window handle!                              
*** Script Error: VIEW - invalid face type: none                     
*** Where: do                                                        
*** Stack: on-face-deep-change* show on-face-deep-change* cause-error
```

**Expected behavior**

No errors.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 21-May-2020/6:17:34+03:00 commit #398d733
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-25T04:05:43Z, qtxie, commented:
<https://github.com/red/red/issues/4465#issuecomment-633365259>

    It's better to finish all the pending actions before switching sync mode.
    ```
    system/view/auto-sync?: no
    view/no-wait [p: panel []]
    append p/pane make-face 'text
    show p    ;@@ <-- Do pending actions
    system/view/auto-sync?: yes
    clear p/pane
    ```

