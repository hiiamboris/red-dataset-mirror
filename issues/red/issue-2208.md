
#2208: CASE/ALL return NONE when interpreted
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2208>

```
case/all [true [1]]
```

Rebol and compiled Red returns 1, interpreted Red returns `none` (but the code is executed, only the return value is wrong).



