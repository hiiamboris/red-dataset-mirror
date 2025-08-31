
#1206: deleting one of two keys twice deletes both keys
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1206>

So far, I've only noticed this odd behaviour when starting with 2 keys. Delete one of them twice, and it deletes the other one:

```
red>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
red>> m/a: none
== none
red>> m
== #(
    b: 2
)
red>> m/a: none
== none
red>> m
== #()
```

It doesn't matter which one:

```
red>> m: #(a 1 b 2)
== #(
    a: 1
    b: 2
)
red>> m/b: none
== none
red>> m
== #(
    a: 1
)
red>> m/b: none
== none
red>> m
== #()
```



