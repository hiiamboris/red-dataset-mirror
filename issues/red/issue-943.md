
#943: Block! after optional argument specification shadows the next argument.
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/943>

A block! value after an optional argument in a function's spec will shadow following arguments.

```
Red []
do [
    bar: func [/with a [block!] b][?? a ?? b]
    bar/with 5 6
]
```

will output

```
a: 5
b: none
```

instead of

```
a: 5
b: 6
```



