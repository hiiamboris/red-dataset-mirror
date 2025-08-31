
#3048: Setting multiple face values does not update display
================================================================================
Issue is closed, was reported by rgchris and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3048>

I have the following code:

```
view also ui: layout [
    below
    field 200 "Field"

    button "Button 1" [
        set list-of-fields/1 "Button 1"
    ]

    button "Button 2" [
        set list-of-fields ["Button 2"]
        probe face/parent/pane/1/text
    ]
]

list-of-fields: reduce [in ui/pane/1 'text]
```

On clicking the first button, the display is updated correctly. However, on clicking the second button the display does not change despite the appropriate text value having been set.


Comments:
--------------------------------------------------------------------------------

On 2017-10-11T11:09:20Z, dockimbel, commented:
<https://github.com/red/red/issues/3048#issuecomment-335775825>

    `set` does the object events checking for single word setting, multiple words setting should too.

