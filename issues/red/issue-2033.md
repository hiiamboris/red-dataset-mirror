
#2033: Strange error on interpreting %analog-clock.red with latest build
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2033>

The error obtained is

```
*** Script error: invalid function definition: "radius"
*** Where: func
```

The culprit is the function definition

```
degree-to-xy: func [rad "radius" deg "degrees"] [
    as-pair (rad * sine deg) (rad * negate cosine deg)
]
```

This must be a regression caused by the fix for #2027.



