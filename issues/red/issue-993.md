
#993: Another case of SWITCH + path crashing
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/993>

```
Red []

f: func [
    o [object!]
    /local a
][
    switch a: type? o/x [
        integer! [
            print "?"
        ]
    ]
]

f object [
    x: 0
]
```

Will output: 

```
*** Script error: action 42 not defined for type: 7
```



Comments:
--------------------------------------------------------------------------------

On 2014-11-24T08:04:32Z, dockimbel, commented:
<https://github.com/red/red/issues/993#issuecomment-64161755>

    Cause: arity calculation in compiler code for deferred call is wrong.

