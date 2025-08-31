
#2453: Negative values in 16bit integer vector are changed to positive
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2453>

```
red>> v: make vector! [integer! 16 [-1]]
== make vector! [integer! 16 [65535]]
```

Also, in R3 you can decide wether `vector!` is signed or unsigned, but that’s not possible in Red. It seems useful feature to me.


