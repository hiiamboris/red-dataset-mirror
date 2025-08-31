
#401: SETting a reference broken in compiler
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/401>

```
Red []

set 'x 'y
set x 1
probe y
do [set x 1]
probe y
```

unset
1



