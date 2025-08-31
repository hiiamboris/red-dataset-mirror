
#3287: [WISH] [R/S] add syntax to get pointer to a pointer
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [Red/System] [test.written] [type.task.wish]
<https://github.com/red/red/issues/3287>

Wish to get a pointer which point to a pointer.
### Code
```
Red/System []

test: func [
    p   [int-ptr!]
    pp  [int-ptr!]
][
    p: allocate 10
    pp: :p
]
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-08T11:28:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3287#issuecomment-1240589188>

    Implemented by commit https://github.com/red/red/commit/2107361c14270b4a3e47eb575416334572bebe8f.

