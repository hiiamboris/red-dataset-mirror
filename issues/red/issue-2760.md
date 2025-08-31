
#2760: [Windows VID] IMAGE blocks mouse events
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2760>

When the following RedGUI window is partially covered by other windows, click on the image in the RedGUI window will not bring it to the top (as the active window). I guess that's because the mouse events are blocked.
```Red
view [ image 300x300 %red-logo.png ]
```
This bug is only on Windows, not on macOS. I am using Windows 10.


