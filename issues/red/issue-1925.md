
#1925: Recursive object causes compiler internal error
================================================================================
Issue is open, was reported by philipyi and has 2 comment(s).
[status.deferred] [type.bug] [type.compiler]
<https://github.com/red/red/issues/1925>

The following code causes
 "Red Compiler Internal Error: Internal Error : No more global variable space"

```
test!: object [
    clone: func [
        /local ret [test!]
    ][
        ret: make test! []
        ;initialize ret here, in real application
        ret
    ]
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-26T02:12:25Z, philipyi, commented:
<https://github.com/red/red/issues/1925#issuecomment-221759792>

    Replacing make test! []
    with system/words/make test! []
    compiles fine !!

