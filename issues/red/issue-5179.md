
#5179: console hangs when closing window with Win11 taskbar
================================================================================
Issue is closed, was reported by luce80 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/5179>

**Describe the bug**
console hangs when closing window with Win11 taskbar

**To reproduce**
A strange thing happens on Win11.
* open gui-console
* `do` a script that opens a window
* go to another window (not console nor script)
* close the script window using the thumbnail that appears hovering on the task bar
* when you go back to console it is as if the script did not finished

**Expected behavior**
Control returns to the console prompt.

**Platform version**
```
>> about
Red 0.6.4 for Windows built 14-Aug-2022/9:23:14+02:00  commit #4eb8ad8
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-18T13:06:19Z, dockimbel, commented:
<https://github.com/red/red/issues/5179#issuecomment-1219470345>

    I can reproduce it.
    
    @qtxie It seems after those steps, the GUI console window is receiving an infinite number of WM_PAINT messages.

