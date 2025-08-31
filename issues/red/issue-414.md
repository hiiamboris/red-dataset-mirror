
#414: Interpreter corrupts argument passing
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/414>

```
Red []

r: routine [
    a [integer!]
    b [integer!]
][
    ?? a
    ?? b
]
f: function [
    /p
        q
    return: [integer!]
][
    a: 1
    b: 2
    r a b
]
do [f]
```

a: 1
b: 1



