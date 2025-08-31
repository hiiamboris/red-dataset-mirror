
#4226: [View] FIELD is not draggable on macOS
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[type.bug] [GUI] [GUI.macOS]
<https://github.com/red/red/issues/4226>

**Describe the bug**

`field` face with `loose` flag either jump outside of view area when clicked on or fails to be properly initialized.

**To reproduce**

```red
>> view [field loose]
*** Script Error: path face/state/4 is not valid for none! type
*** Where: drag-offset
*** Stack: view show show do-safe 
```

Culprits are `mouseEntered` and `mouseDown` ([here](https://github.com/red/red/blob/master/modules/view/backends/macOS/classes.reds#L199)); this issue also affects calendar widget https://github.com/red/red/pull/4225.

**Expected behavior**

I expect face to be dragged as usual.

**Platform version**

10.14 Mojave.
```
Red 0.6.4 for macOS built 6-Jan-2020/7:55:51-08:00 commit #c97604c
```



