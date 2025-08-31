
#4602: face request-file action alters other faces' action
================================================================================
Issue is closed, was reported by Palaing and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4602>

**Describe the bug**
On windows with red-23jul20-171adb6f4.exe, with the following code:
```
view [box white [request-file] box blue [print "ok"]]
```
after clicking the white box once, the blue box and gui windows buttons (close/maximize/minimize...) all trigger the white box action (request-file).

**To reproduce**
1. type/paste above code in console
2. Click on white box
3. Select a file OR click Cancel (whatever)
4. Click the blue box or any of the windows title bar buttons (close/maximize/minimize) 
5. a request-file dialog opens again.

**Expected behavior**
Clicking the blue box should print "ok".
Clicking the window title bar buttons should respectively close/maximize/minimize window

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 23-Jul-2020/21:50:28+02:00 commit #171adb6
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-04T18:33:03Z, meijeru, commented:
<https://github.com/red/red/issues/4602#issuecomment-668757332>

    Offhand, sounds like a missing `copy`.

