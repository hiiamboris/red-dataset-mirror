
#1205: Minor code redundancy
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1205>

Is there interest in remarks of the following type:

in the body of `parse*` in `%runtime/natives.reds` the local variable `rule`is set but not used

```
if part <= 0 [
    rule: as red-block! stack/arguments + 1
....
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-05T10:06:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1205#issuecomment-109247547>

    Thanks for reporting it. I think Red/System compiler could be easily improved to warn users in such cases.

