
#404: GETting a reference broken in compiler
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/404>

This is the pendant to #401.

```
Red []

x: 'y
y: 1
probe x
probe get 'x
probe get x
probe do [get x]
```

y
y
y
1



