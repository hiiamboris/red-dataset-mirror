
#272: Wrong returned logic value when EITHER is at function's body tail
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/272>

The following piece of code will print `true` when `false` is expected.

```
foo: func [return: [logic!]][
    either true [
        1 = 3
    ][
        false
    ]
]

print foo
```



