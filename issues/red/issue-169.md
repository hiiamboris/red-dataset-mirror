
#169: Can't return NULL from EITHER with cast in other branch
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/169>

```
s!: alias struct! [x [integer!]]

x: function [
    return:             [s!]
][
    either true [
        as s! 0
    ][
        null
    ]
]
```

**\* Compilation Error: wrong return type in function: x
**\* expected: [s!], found: [none]

The return spec doesn't seem to do anything.



Comments:
--------------------------------------------------------------------------------

On 2011-09-06T21:14:05Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/169#issuecomment-2022405>

    Actually,
    
    ```
    if true [
        null
    ]
    ```
    
    does the same, in which case the return spec is used.

--------------------------------------------------------------------------------

On 2011-09-06T21:17:39Z, dockimbel, commented:
<https://github.com/red/red/issues/169#issuecomment-2022461>

    The compiler does not do dead-code elimination, so the forced `true` has no effect on the compiler front-end. The compiler chokes because it cannot assign a datatype to `null` when nested in `either`. I will see if the compiler can be made smarter for this specific case.

--------------------------------------------------------------------------------

On 2011-09-06T21:22:52Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/169#issuecomment-2022522>

    I didn't expect TRUE to change the situation; I just needed to put something there to strip the case down.

--------------------------------------------------------------------------------

On 2011-09-06T21:40:32Z, dockimbel, commented:
<https://github.com/red/red/issues/169#issuecomment-2022698>

    `if`cannot be used to return a value, only `either` can do that (given that its two code branches return same or compatible datatypes).

