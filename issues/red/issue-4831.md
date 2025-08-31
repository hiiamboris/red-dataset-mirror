
#4831: Removing a HANDLE! from FACE/PARENT/STATE breaks View system.
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4831>

**Describe the bug**
Removing a `handle!` value from `parent/state` block in a newly created `face!` makes View unusable.

**To reproduce**
```red
l: layout [] take l/parent/state
```
After that any attempt to use View results in:
```
*** Script Error: or does not allow none! for its value1 argument
*** Where: or
*** Stack: view show on-face-deep-change* eval-set-path  
```

And GUI console becomes unstable (cannot be closed, hangs if some of the menu bar options are selected).

**Expected behavior**
I expect View to be clever enough and protect sensitive fields of faces from corruption, e.g. via reactivity (see `system/locale/currencies` reactor as an example), or at least making it so that modifying a face field does not break the entire GUI engine.

**Platform version**
W10, 0187423.



