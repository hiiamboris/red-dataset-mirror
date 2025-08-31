
#1589: crash on invalid float operation
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1589>

The following crashes in Windows XP and Windows 7:

```
red>> power -1 0.5

*** Runtime Error 9: float invalid operation
*** at: 7C812AEBh
```

[@PeterWAWood reports](https://gitter.im/red/red?at=56b327483bb131bb121b4582) that it doesn't crash on OS X:

```
red>> power -1 0.5
== 1.#NaN
```



