
#2234: Removing key from MAP! also removes last key from KEYS-OF
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2234>

Same with last value from VALUES-OF, I just wanted to keep the description shorter.

```
red>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
red>> keys-of m 
== [a b]
red>> m/a: none
== none
red>> keys-of m 
== []
red>> head keys-of m 
== []
red>> values-of m
== []
```

But the `b` is still in `m`:

```
red>> m/b
== 2
red>> m
== #(
    b: 2
)
```

With more keys:

```
red>> m: #(a 1 b 2 c 3 d 4 e 5 f 6 g 7 h 8)
== #(
    a: 1
    b: 2
    c: 3
    d: 4
    e: 5
    f: 6
    g:...
red>> m/c: none
== none
red>> keys-of m
== [a b d e f g]
red>> values-of m
== [1 2 4 5 6 7]
```



