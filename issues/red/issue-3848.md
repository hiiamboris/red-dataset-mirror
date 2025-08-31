
#3848: PROBE FACE/PARENT interrupts FIELD / AREA event handling
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3848>

**Describe the bug**
Probing `parent` facet of `field` or `area` in event handler effectively prevents them from displaying the input.

**To reproduce**
```red
view [field on-key [probe face/parent]]
```

Note that this affects only scripts running from GUI console. Also, note that the above example works with `print` instead of `probe`  as expected, but not with `print mold`.

**Expected behavior**
Input field is updated as usual, `parent` face is probed and printed in the background.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Apr-2019/11:27:16+05:00 commit #fb18d4e
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-18T14:58:31Z, dockimbel, commented:
<https://github.com/red/red/issues/3848#issuecomment-484545393>

    I can reproduce it on W10.

