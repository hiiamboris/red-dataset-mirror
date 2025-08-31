
#4807: Unview a window via dropdown crashes
================================================================================
Issue is closed, was reported by mikeyaunish and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4807>

**Describe the bug**
Red program and console crash when attempting to close window via a dropdown.

**To reproduce**
Steps to reproduce the behavior:
1. Run this: 
```
lay2: [
    text "window2" 
    drop-down "<select>" data [ "close-window" ] on-select [ unview/only win2 ] return
    button "close window" [ unview/only win2 ]
]
lay1: [
    text "window1" 
    drop-down "<select>" data [ "close-window" ] on-select [ unview/only win1 ] return
    button "close window" [ unview/only win1 ]
] 
view [
    button "window1" [
        view/no-wait/options win1: layout lay1
        [ offset: 200x612 ]    
    ]        
    button "window2" [
        view/no-wait/options win2: layout lay2
        [ offset: 405x612 ]
    ]
]
```
2. Click on 'window1' 
3. Click on <select> dropdown 
4. Select 'close-window'
5. Program crashes

**Expected Behaviour**
The program shouldn't crash, as illustrated if you open 'window2' and select the 'close-window' dropdown


**Platform Version**

```
Red 0.6.4 for Windows built 8-Jan-2021/16:47:49-07:00 commit #db2c060
```


Comments:
--------------------------------------------------------------------------------

On 2021-01-22T01:29:41Z, mikeyaunish, commented:
<https://github.com/red/red/issues/4807#issuecomment-765052289>

    Expected Behavior and Platform Version aren't formatting correctly in this ticket???

--------------------------------------------------------------------------------

On 2021-01-22T08:16:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4807#issuecomment-765224926>

    stack trace:
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
    *** at line: 148
    ***
    ***   stack: gui/get-node-facet 00000000h 0
    ***   stack: gui/get-facet 0019FBDCh 0
    ***   stack: gui/make-event 0019FBDCh 0 26
    ***   stack: gui/process-command-event 001A0916h 273 65536 657862
    ***   stack: gui/WndProc 001A0916h 273 65536 657862```
    
    `drop-list` crashes too, following the same scenario
    out of ~15 tests, once I didn't have a crash but a silent quit

