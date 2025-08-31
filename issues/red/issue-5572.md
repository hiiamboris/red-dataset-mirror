
#5572: [ARM] Conversion of integer! to float32! then float! leads to invalid result
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5572>

```
Red/System []

x: as float32! 2
?? x
probe as-float x
```
outputs
```
x: 2.0
1.401298731601288e-44
```

On all ARM platforms.


