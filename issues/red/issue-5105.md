
#5105: [Windows] Click on a transparent `box` produces two suspicious `on-over` events
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5105>

**Describe the bug**

👆

**To reproduce**
```
view [box 150x150 on-over [print ['box event/type event/offset]]]
```
1. Hover onto the box
2. Click on it: release of LMB prints two lines, e.g.:
```
box over 90x38
box over 100x48
```
One obviously doesn't even subtract face's offset.

**Expected behavior**

No events.

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
```

Related: GTK has different issues: https://github.com/red/red/issues/4743
Haven't tested on Mac


Comments:
--------------------------------------------------------------------------------

On 2022-09-13T09:12:35Z, qtxie, commented:
<https://github.com/red/red/issues/5105#issuecomment-1245123927>

    Related issue #4801, issue #1833.

--------------------------------------------------------------------------------

On 2022-09-14T01:55:36Z, qtxie, commented:
<https://github.com/red/red/issues/5105#issuecomment-1246132128>

    FYI, no `on-over` event will be sent to a transparent face. Actually all the mouse events will pass through the transparent part of a face. See issue #1833.

