
#4355: [View] Tardy resize events
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/4355>

**Describe the bug**

Resizable windows report an overdue value of their size, which hurts user experience.

![](https://i.gyazo.com/0c4b90af1581f4d510b73080911f9b4e.gif)

**To reproduce**

1. Run this code: `view/flags [panel gold [] react [face/size: probe face/parent/size - 20x20 wait 0.3]] 'resize`
Tip: `wait 0.3` here imitates a slow window update process that is triggered by the resizing
2. Try dragging the window border fast then stop
3. Watch it not updating the size until you release the mouse button (see the probe output, as on the video)

**Expected behavior**

Window *reported size* (here `face/parent/size`) should try to stay up to date with it's *displayed size* while user resizes the window.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2023-08-02T11:18:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4355#issuecomment-1662024354>

    Related links:
    https://stackoverflow.com/questions/3102074/win32-my-application-freezes-while-the-user-resizes-the-window/3103130#3103130
    https://sourceforge.net/p/win32loopl/code/ci/default/tree/how%20it%20works.txt

