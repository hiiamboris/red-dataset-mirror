
#5051: Children of `base` face do not show up
================================================================================
Issue is closed, was reported by toomasv and has 14 comment(s).
[status.wontfix] [GUI]
<https://github.com/red/red/issues/5051>

**Describe the bug**
Faces in pane of `base` face are not shown, although they are present.

**To reproduce**
E.g. Enter following in console:
```
view lay: layout [base 200x100 with [pane: layout/only [button "OK" [print "hi"] base brick loose]]]
```
Nothing shows up, although clicking on base where button should be, buttons' on-click actor fires, and dragging invisibvle brick base out of its parents' area and back again makes it visible.

**Expected behavior**
As it was before February 2021. See below

**Screenshots**
[![base-regression](https://toomasv.red/images/Errors/base-colors.gif)](https://toomasv.red/images/Errors/base-colors.gif)

**Platform version**
```
>> about
Red 0.6.4 for Windows built 18-Jan-2022/23:46:09+02:00  commit #6557e9b
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-25T08:28:13Z, qtxie, commented:
<https://github.com/red/red/issues/5051#issuecomment-1020925967>

    FYI. The base face can only show base faces in its `pane` in current Direct2D backend.

--------------------------------------------------------------------------------

On 2022-01-25T09:39:33Z, toomasv, commented:
<https://github.com/red/red/issues/5051#issuecomment-1020990434>

    Ok, thanks!

--------------------------------------------------------------------------------

On 2022-01-25T09:44:55Z, qtxie, commented:
<https://github.com/red/red/issues/5051#issuecomment-1020994897>

    @toomasv As a workaround, Use `panel` as parent face if possible or use the GDI+ backend.
    ```
    Red [
    	Title:	 "Red GUI App"
    	Needs:	 View
    	Config:	 [draw-engine: 'GDI+]
    ]
    ```

--------------------------------------------------------------------------------

On 2022-01-25T09:49:12Z, toomasv, commented:
<https://github.com/red/red/issues/5051#issuecomment-1020998669>

    @qtxie Good, thank you!

--------------------------------------------------------------------------------

On 2022-01-25T09:55:43Z, qtxie, commented:
<https://github.com/red/red/issues/5051#issuecomment-1021004956>

    There are some issues when using base face as parent face since the beginning. Even the GDI+ backend has some issues. For example, it doesn't work properly when using semi-transparent base face as child face of a base face. The only reliable way is put only base faces inside base face.

--------------------------------------------------------------------------------

On 2022-01-25T20:02:38Z, greggirwin, commented:
<https://github.com/red/red/issues/5051#issuecomment-1021559576>

    Something good to note in the wiki: https://github.com/red/red/wiki/%5BHOWTO%5D-VID-and-View-(GUI)-hints-and-tips
    
    We should encourage people strongly to use panels, rather than base faces as containers.

--------------------------------------------------------------------------------

On 2022-08-18T02:49:19Z, qtxie, commented:
<https://github.com/red/red/issues/5051#issuecomment-1218960789>

    Close it now as it won't be fixed in the native GUI backend.

