
#1680: keys-of won't work when compiled in function
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1680>

The following code will interpret, compile and run.

```
Red []

keys-of #(1 2)
```

But if that same `keys-of #(1 2)` is inside a function, and the function is called:

```
Red []

f: func [][
    keys-of #(1 2)
    none
]

f
```

... it will interpret and compile, but when the executable is run:

```
*** Internal error: reserved for future use (or not yet implemented)
*** Where: reflect
*** Stack: f keys-of reflect
```



