
#2981: Function in object does not work properly
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2981>

This issue exits in interpreter and compiled code.
```red
Red []

f!: object [
    data: none
]

tips!: make f! [
    paint: function [data [block!]][
        probe data
    ]
]

tips: make tips! []
tips/paint [1 2 3]
```
This will print `none`, it should be `[1 2 3]`.


Comments:
--------------------------------------------------------------------------------

On 2017-08-17T16:26:07Z, greggirwin, commented:
<https://github.com/red/red/issues/2981#issuecomment-323124296>

    Also true if `func` is used, so not related to `function` collecting words.

--------------------------------------------------------------------------------

On 2017-09-14T08:44:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2981#issuecomment-329415785>

    It's a binding issue:
    ```
    >> context? second body-of :tips/paint
    == make object! [
        data: none
        paint: func [data [block!]][...
    
    >> context? second body-of :tips!/paint
    == func [data [block!]][probe data]
    ```

