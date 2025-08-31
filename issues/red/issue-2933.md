
#2933: Function in object! can not be called when compiled
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2933>

```
Red []
obj!: object [
    init: function [][
        probe "init object"
    ]
]
ctx: context [
    a: 1
    extra: make obj! []

    launch: func [][
        probe "start launch"
        extra/init
        probe "end launch"
    ]
]
ctx/launch
```
Compiles the code and run, will print:
```
"start launch"
"end launch"
```


