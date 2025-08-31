
#1694: Wrong refinemnent name returned in interpreter for non-existing refinement
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1694>

```
red>> f: func [x][x]
== func [x][x]
red>> f 3
== 3
red>> f/only 3
*** Script error: f has no refinement called f
*** Where: f
```

The error should be `Script error: f has no refinement called only`.



