
#3070: routine arguments treated different in interpreter and compiler
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3070>

The follow code will produce wrong result when remove the `do [ ... ]`.
```
Red []
routine1: routine [
    arg   [any-type!]
    /local
        a [red-integer!]
][
    ;a: as red-integer! arg
    probe as-integer arg
]

do [
    obj-a: object [
        show-me: func [][
            routine1 234
        ]
    ]
    
    obj-a/show-me
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-09T10:23:26Z, Oldes, commented:
<https://github.com/red/red/issues/3070#issuecomment-335118330>

    Could be related to https://github.com/red/red/issues/3067

