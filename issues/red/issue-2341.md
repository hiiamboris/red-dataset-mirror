
#2341: Error message for AS has the two types in the wrong order
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2341>

```
red>> as string! [1 2]
*** Script Error: cannot coerce string! to block!
*** Where: as
```
This should be `cannot coerce block! to string!` if you ask me.


