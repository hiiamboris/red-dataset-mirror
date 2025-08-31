
#1322: R/S local get-word wrongly resolved as context word
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/1322>

```
Red/System []

bad: context [
    pen: 123

    system-func: func [pen [int-ptr!]][
        pen/value: 33
    ]

    change-pen: func [
        /local
            pen      [integer!]
    ][
        pen: 0
        system-func :pen
    ]

    ?? pen
    change-pen
    ?? pen
]
```

Outputs:

```
pen: 123
pen: 33          ;-- should be 123
```



