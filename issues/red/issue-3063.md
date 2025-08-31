
#3063: function call is ignored in object when compiled
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3063>

```
Red []

obj-a!: object [
    a: none
    b: 1
    show-me: func [][
        probe "show obj-a"
    ]
]

ctx1: context [
    obj1: object [
        aaa: make obj-a! []
        update: func [][
            probe aaa/b
            aaa/show-me
        ]
    ]

    init: func [][
        obj1/update
    ]
]

ctx1/init
```
The code above should output: 
```
1
"show obj-a"
```
But it only outputs `1` when compiled.


Comments:
--------------------------------------------------------------------------------

On 2017-10-01T22:41:36Z, qtxie, commented:
<https://github.com/red/red/issues/3063#issuecomment-333412293>

    The code below will crash when I wrapping `aaa/show-me` in `do [...]`.
    ```
    routine1: routine [
        obj [object!]
        /local
            a [red-string!]
            n [integer!]
    ][
        n: -1
        a: as red-string! object/get-values obj
        probe ["In routine1, type of obj/a: " TYPE_OF(a)]
        probe ["obj/a: " unicode/to-utf8 a :n]
    ]
    
    obj-a!: object [
        a: none
        b: 1
        show-me: func [][
            probe "show obj-a"
            routine1 self
        ]
    ]
    
    ctx1: context [
        obj1: object [
            aaa: make obj-a! []
            update: func [][
                aaa/a: "X"
                probe aaa/a
                do [aaa/show-me]
            ]
        ]
    
        init: func [][
            obj1/update
        ]
    ]
    
    ctx1/init
    ```

--------------------------------------------------------------------------------

On 2017-10-04T10:42:41Z, qtxie, commented:
<https://github.com/red/red/issues/3063#issuecomment-334117300>

    The second code still crashes.

