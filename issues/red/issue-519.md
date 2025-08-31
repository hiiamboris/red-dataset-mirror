
#519: COMPOSE and PRINT corrupt cascaded ROUTINE return type
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/519>

```
Red []

r1: routine [
    return:     [integer!]
][
    0
]
r2: routine [
    i           [integer!]
    /local      s
][
    s: "!"
    SET_RETURN ((string/load s  1 + length? s))
]

probe compose [(r2 r1)]
print [r2 r1]
probe reduce [r2 r1]
print r2 r1
```

[-148752644]
-148752628
["!"]
!



