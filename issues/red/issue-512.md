
#512: CASE doesn't support non-literal in compiler
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/512>

This is the continuation of #502.

```
Red []

x: 0
print case [
    yes x
]
```

true

red>> x: 0
== 0
red>> print case [
[   yes x
[   ]
0



