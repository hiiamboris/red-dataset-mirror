
#403: "Return:" in func spec corrupts local variables
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/403>

```
Red []

f: func [
    a       [block!]
    return: [block!]
    /local  b x
][
    b: copy []

    either block? x: a/1 [
        append/only b  f x
    ][
        append b x
    ]
    b
]
probe f [1]
probe f [[2]]
probe f [[[3]]]
```

[1]
[2]
[3]



Comments:
--------------------------------------------------------------------------------

On 2013-02-05T19:02:25Z, dockimbel, commented:
<https://github.com/red/red/issues/403#issuecomment-13145529>

    If `return: [block!]` line is commented, the code runs fine.

