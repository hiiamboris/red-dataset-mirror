
#530: reduce/into corrupts unset! function! result
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/530>

```
Red []

f: function [
    s
][
    probe first reduce x: [do s]
]
g: function [
    s
][
    probe first reduce/into x: [do s] []
]
probe f [()]
probe g [()]
```

unset
unset
unset
[]



