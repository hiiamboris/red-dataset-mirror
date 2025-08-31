
#3049: Access a layout/face while in construction
================================================================================
Issue is closed, was reported by rgchris and has 12 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3049>

Would like to be able to access the current layout/panel in situ to be able to assess it's current state.

For example:

```
fields: []

view [
    field 200 "Content"
    field 200 "More Content"
    do [
        foreach kid face/pane [
            append fields in kid 'text
        ]
    ]
    button [
        probe reduce fields
    ]
]
```

As to faces, a WITH feature that allows access to the face's internals would be useful as well.

```
fields: []

view  [
    field with [append fields quote 'name append fields 'text]
    field with [append fields quote 'city append fields 'text]
    button [probe reduce fields]
]
```

The aim would amongst other things be to assist in a few data-driven operations.


Comments:
--------------------------------------------------------------------------------

On 2017-09-21T17:05:49Z, greggirwin, commented:
<https://github.com/red/red/issues/3049#issuecomment-331220184>

    For the first part, it looks like you want an implicit `face` reference as the access method, correct? One issue, from a quick look at the code, is that the VID spec is processed, but the panel's pane is only set after that's all done. The working area is a local var in the `layout` func. So the `do` may be bound to the panel, or access it as in your example, but the faces aren't there yet. 

--------------------------------------------------------------------------------

On 2017-09-21T17:08:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3049#issuecomment-331220846>

    What does this wish look like if you reformulate it without the mechanism as the wish, but the feature need? e.g., *I want to "X Y Z" so I can build data driven apps that ...*

--------------------------------------------------------------------------------

On 2017-09-26T08:32:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3049#issuecomment-332126520>

    You can use `self` in `do [...]` blocks to refer to the parent panel object, as such blocks are bound to parent's panel object context. For the parent's `pane` access, it is indeed set at a later stage, though it should be possible to set it earlier without any side-effect on the processing.

--------------------------------------------------------------------------------

On 2017-09-26T08:33:45Z, dockimbel, commented:
<https://github.com/red/red/issues/3049#issuecomment-332126808>

    Please separate different wishes in different tickets.

--------------------------------------------------------------------------------

On 2017-09-26T08:55:41Z, dockimbel, commented:
<https://github.com/red/red/issues/3049#issuecomment-332132581>

    So the right code is:
    ```
    fields: []
    
    view [
        field 200 "Content"
        field 200 "More Content"
        do [
            foreach kid pane [
                append fields in kid 'text
            ]
        ]
        button [
            probe reduce fields
        ]
    ]
    ```
    
    An alternative version:
    ```
    view [
        field 200 "Content"
        field 200 "More Content"
        do [
        	fields: collect [foreach-face self [keep in face 'text]]
        ]
        button [
            probe reduce fields
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-09-26T09:00:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3049#issuecomment-332133959>

    `with` was a pending feature on my todo-list for VID, so I will add it also now.

