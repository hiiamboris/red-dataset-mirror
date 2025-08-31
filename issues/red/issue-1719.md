
#1719: maximizing a window generates a resize event, but the opposite (restore down) does not
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1719>

I think this is an omission.



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T10:53:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1719#issuecomment-226740335>

    I get those events when maximizing, then restoring a View window:
    
    ```
    event> type: resizing offset: 1920x1135 key: none flags: []
    event> type: resize offset: 1920x1135 key: none flags: []
    event> type: over offset: 965x512 key: none flags: []
    event> type: moving offset: 910x550 key: none flags: []
    event> type: resizing offset: 116x100 key: none flags: []
    event> type: over offset: -82x-545 key: none flags: [away]
    event> type: close offset: none key: none flags: []
    ```

--------------------------------------------------------------------------------

On 2016-06-17T11:02:59Z, meijeru, commented:
<https://github.com/red/red/issues/1719#issuecomment-226741924>

    Maybe solved by a commit in the meantime. WIll check again with a suitable program.

--------------------------------------------------------------------------------

On 2016-06-18T09:40:15Z, dockimbel, commented:
<https://github.com/red/red/issues/1719#issuecomment-226932719>

    The `resize` event is missing when restored, we only get the `resizing` one.

