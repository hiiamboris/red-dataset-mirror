
#1563: issues with `selected` when window changes focus
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1563>

#### Issue A: `selected` not updated

Example 1:

```
view [field]
```

If the resulting field is clicked in, and the window loses focus and is brought back again, the field loses focus and must be clicked in again.

Example 2:

```
l: layout [
    a: field "a"
    b: field "b"
]
l/selected: a
view l
```

If field `b` is clicked in, and the window loses focus and is brought back again **by using Alt-Tab** or **by selecting it from the taskbar** field `a` has the cursor in it instead of field `b`.
If field `b` is clicked in, and the window is closed, `probe l/selected` indicates that field `a` is still selected.
#### Issue B: selected face loses focus if window clicked into focus

In Example 2, if the window loses focus and is brought back again **by clicking on the window**, no field has the cursor in it, regardless of which one had it before.

Both issues apply to both `field` and `area` in both Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T02:30:01Z, qtxie, commented:
<https://github.com/red/red/issues/1563#issuecomment-178321232>

    Issue B should be fixed in latest commit.

--------------------------------------------------------------------------------

On 2016-02-22T08:46:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1563#issuecomment-187075579>

    Issue A and B working fine now.

