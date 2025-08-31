
#3068: Function is not called when compiled
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3068>

The code below should output `"show obj-a"`, but show nothing when compiled.
```
Red []
obj-a!: object [
    a: none
    b: 1
    show-me: func [][
        probe "show obj-a"
    ]
]

this-is-a-long-ctx: context [
    obj1: object [
        aaa: make obj-a! []
        update: func [][
            aaa/show-me
        ]
    ]
]

func1: function [][
    obj: this-is-a-long-ctx/obj1      ;-- assign to a short name
    obj/update
]

func1
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-04T11:41:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3068#issuecomment-334129120>

    Wrapping in `do` works there:
    ```
    func1: function [][
        obj: this-is-a-long-ctx/obj1      ;-- assign to a short name
        do [obj/update]
    ]
    ```
    
    I will see if the compiler can be improved to handle such case.

--------------------------------------------------------------------------------

On 2017-10-04T12:15:14Z, qtxie, commented:
<https://github.com/red/red/issues/3068#issuecomment-334136184>

    Anyway the full path works fine, just a bit verbose.
    ```
    func1: function [][
        this-is-a-long-ctx/obj1/update
    ]
    ```

