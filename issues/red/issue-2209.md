
#2209: MAP! comparison is wrong after removing a key
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2209>

```
red>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
red>> equal? m #(a 1 b 2)
== true
red>> m/a: none
== none
red>> probe m
#(
    b: 2
)
== #(
    b: 2
)
red>> equal? m #(b: 2)
== false
```

Should return `true` IMO.



