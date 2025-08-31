
#927: OBJECT can't create an object in a function
================================================================================
Issue is closed, was reported by WayneCui and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/927>

Only for compiler:

```
f: does [
    object [
        a: 1
        g: does [a]
    ]
]

probe obj: f
probe obj/g

obj: object [
    a: 1
    f: does [a]
]
probe obj/a
probe obj/f
```

output:

```
[a: 1 g: does [a]]
does
1
1
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-14T01:02:56Z, WayneCui, commented:
<https://github.com/red/red/issues/927#issuecomment-55512057>

    Only for OBJECT, CONTEXT or MAKE OBJECT! is fine.
    
    ```
    f: does [
        context [    ;or make object! [...]
            a: 1
            g: does [a]
        ]
    ]
    
    probe obj: f
    probe obj/g
    ```
    
    output:
    
    ```
    make object! [
        a: 1
        g: func [][a]
    ]
    func [][a]
    ```
    
    This is the intended behavior.

--------------------------------------------------------------------------------

On 2014-09-15T03:39:21Z, dockimbel, commented:
<https://github.com/red/red/issues/927#issuecomment-55550267>

    The `object: :context` expression in %boot.red is not seen by the compiler as the creation of a new function, hence the passive processing of `object` as just a word!.

