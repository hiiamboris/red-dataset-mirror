
#3838: Custom tab of the Tab-panel can't be selected on start
================================================================================
Issue is closed, was reported by DVL333 and has 6 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/3838>

**Describe the bug**
If set `selected` attribute for the tab-panel an appropriate tab won't be selected after creation

**To reproduce**
```
pnl1: make face! [type: 'panel]
pnl2: make face! [type: 'panel]
pnl3: make face! [type: 'panel]

repend tp: [] [pnl1 pnl2 pnl3]
tpnl: make face! [type: 'tab-panel size: 180x80 offset: 10x10 
    data: ["Tab1" "Tab2" "Tab3"] selected: 2 pane: tp]
repend p: [] [tpnl]

view make face! [type: 'window size: 200x120 pane: p]
```
**Expected behavior**
Proper tab must be selected on start (tab "Tab2" from the example)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Mar-2019/13:11:08+03:00 commit #e6c96aa
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-06T10:24:43Z, 9214, commented:
<https://github.com/red/red/issues/3838#issuecomment-480493001>

    In general, try to minimize your examples and make the case visually obvious, e.g.:
    
    ```red
    view [tab-panel 100x50 data ["a" "b"] with [selected: 2]]
    ```
    
    Constructing tree of faces by hand is cool and all, but it's hard to follow, and most of information in it is redundant and doesn't help to identify the bug.

--------------------------------------------------------------------------------

On 2019-04-18T20:55:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3838#issuecomment-484686740>

    This is a duplicate of ticket #2792. This is (surprisingly) a complex issue to solve on Windows. There is a [dedicated branch](https://github.com/red/red/tree/uni-tab-panel) that was started to redesign the way tab-panels are handled, but still unfinished.

--------------------------------------------------------------------------------

On 2019-05-15T14:28:58Z, dockimbel, commented:
<https://github.com/red/red/issues/3838#issuecomment-492678864>

    Closing this ticket, as it is a duplicate.

