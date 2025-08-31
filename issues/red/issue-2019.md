
#2019: Division of float struct field by literal float value can give wrong result
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/2019>

```
Red/System []

s: declare struct! [time [float!]]
s/time: 3E9
probe s/time / 1E6
```

gives: `0.0003333333333333333` instead of `3000.0`.



