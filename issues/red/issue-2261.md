
#2261: new-line with negative value crashes
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2261>

Crash occurs only if /all refinement used.

```
red>> new-line/skip [1 2 3] true -1
== [
    1 2 3
]
red>> new-line/all/skip [1 2 3] true -1
*** Runtime Error 1: access violation
*** at: 004491AFh
```



