
#2323: TO BINARY! <image> gives wrong result
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2323>

```
red>> i: make image! 2x2
== make image! [2x2 #{FFFFFFFFFFFFFFFFFFFFFFFF}]
red>> to binary! i
== #{00000000}
```

Is Red perhaps picking the A component here?



