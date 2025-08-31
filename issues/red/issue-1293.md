
#1293: Object paths nested in other objects can crash the compiler
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1293>

```
Red []
o1: context [
    val: 1
]

o2: context [
    v: o1/val
]
```

crashes the Red compiler with:

```
Red Compiler Internal Error: Script Error : Invalid path value: o1
Where: emit-deep-check 
Near: [objects/o2/o1]
```



Comments:
--------------------------------------------------------------------------------

On 2015-07-28T15:15:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1293#issuecomment-125647943>

    Fixed in `gui` branch.

