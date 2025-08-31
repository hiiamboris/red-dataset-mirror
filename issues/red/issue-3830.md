
#3830: Scrollable flag doesn't work for drop-list and drop-down faces
================================================================================
Issue is closed, was reported by DVL333 and has 6 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/3830>

**Describe the bug**
Scrollable flag doesn't work for drop-list and drop-down faces - a vertical scroll-bar can't be enabled manually for these faces. 

**To reproduce**
```
dlist: make face! [type: 'drop-list size: 100x50 offset: 10x10 
    data: ["Line1" "Line2" "Line3" "Line4" "Line5" "Line6" "Line7" "Line8" "Line9" "Line10"]
    selected: 2 flags: 'scrollable]
append p: [] dlist
view make face! [type: 'window size: 120x90 pane: p]
```

**Expected behavior**
According to the documentation a vertical scroll-bar must be enabled.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Mar-2019/13:11:08+03:00 commit #e6c96aa
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-08T14:00:50Z, qtxie, commented:
<https://github.com/red/red/issues/3830#issuecomment-490497490>

    It has not been implemented. I don't why it's in the document.

--------------------------------------------------------------------------------

On 2019-05-09T00:21:21Z, greggirwin, commented:
<https://github.com/red/red/issues/3830#issuecomment-490697862>

    It was mentioned in chat that `scrollable` was the way to do it, and I could have sworn there was an example somewhere, but it doesn't work and I can't find an example, so we should add a `TBD` to the docs for it @gltewalt.

--------------------------------------------------------------------------------

On 2019-05-15T14:13:03Z, dockimbel, commented:
<https://github.com/red/red/issues/3830#issuecomment-492672201>

    `scrollable` flag is not the way to do it. A drop-list calculates automatically if a scrollbar should be displayed or not depending on the number of visible rows compared to the total number of rows. There is no option for now to set the number of visible rows in lists. You can open a wish for that.

