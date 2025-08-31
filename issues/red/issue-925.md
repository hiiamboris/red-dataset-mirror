
#925: Compiled file can't reference members with SELF in methods
================================================================================
Issue is closed, was reported by WayneCui and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/925>

```
p1: object [
    a: 1
    b: 2
    c: does [ make self [a: 10]]
    d: does [ p1/b ]
    e: does [ self/b ]
]


probe p1/c
probe p1/d
probe p1/e
```

output:

```
make object! [
    a: 10
    b: 2
    e: func [][self/b]
    f: func [][make self [a: 10]]
    g: func [][p1/b]
]

2
*** Error: word has no value!

*** Script error: action 42 not defined for type: 2
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-12T09:56:01Z, dockimbel, commented:
<https://github.com/red/red/issues/925#issuecomment-55382623>

    SELF used in paths is not supported for now.

