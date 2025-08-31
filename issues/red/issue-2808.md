
#2808: REPLACE/ALL can hang Red
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2808>

This code
```
>> replace/all "a^/s^/d^/" newline ""
```

hangs Red. Works fine in Rebol.


