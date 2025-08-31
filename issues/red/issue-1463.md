
#1463: some faces lose dragging connection
================================================================================
Issue is open, was reported by WiseGenius and has 8 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/1463>

Unlike other draggable faces, each of the following types of faces stop following the mouse cursor when it loses visual connection (when it's dragged under another face or outside the window, or when it's dragged too quickly):
- tab-panel
- group-box
- camera
- panel
- progress
- slider
- drop-list*
- drop-down*

When the cursor returns, the face continues to move.
If the mouse button was released while disconnected, the face doesn't register the `up` and when it's reunited with the cursor it will resume following the cursor until it's clicked again.
Additionally:
- `tab-panel` (which can only be dragged by its tab) doesn't recover well from this disconnection and can jump to unpredictable places.
- `group-box` hardly drags at all.
- `drop-list` and `drop-down` can visually detach from their data list and leave it behind when dragging. When they are dragged under their data list, the dragging is stopped.
- When `drop-list` and `drop-down` detach, they don't belong on the above list. But when they don't detach, they have the same dragging issues as the others.



Comments:
--------------------------------------------------------------------------------

On 2020-03-21T17:45:02Z, 9214, commented:
<https://github.com/red/red/issues/1463#issuecomment-602078135>

    https://github.com/red/red/issues/3677 https://github.com/red/red/issues/4226 https://github.com/red/red/issues/4239 https://github.com/red/red/issues/3677 https://github.com/red/red/issues/1862

--------------------------------------------------------------------------------

On 2020-07-18T16:19:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/1463#issuecomment-660505583>

    `loose` needs a new design. I can't imagine where it is useful as it is.
    
    Sometimes there's a need to: when user clicks on a face, create an image for him to drag into another face. This is not possible with the current model, as the click was not on that face. A workaround with almost-transparent layer over the face, but it raises so many problems it's never worth pursuing it.
    
    Sometimes you want a separator between 2 panels draggable *along a single axis* - you can't do it with the current model. Again, you need an ugly workaround. Which works sometimes, sometimes triggers other bugs (like https://github.com/red/red/issues/4479), when it becomes impossible to achieve the desired behavior. https://github.com/red/red/issues/1637 relates, but is also a dubious design.

--------------------------------------------------------------------------------

On 2023-11-05T11:45:31Z, dockimbel, commented:
<https://github.com/red/red/issues/1463#issuecomment-1793713669>

    All the mentioned controls can be dragged now, though some visual glitches can occur in controls that are not designed to be dragged (like slider, progres, camera, drop-*).
    
    > Sometimes there's a need to: when user clicks on a face, create an image for him to drag into another face. This is not possible with the current model, 
    
    Would be worth trying again with the current code.
    
    > Sometimes you want a separator between 2 panels draggable along a single axis - you can't do it with the current model
    
    A bounding box can be defined now for constraining the dragging movements.

--------------------------------------------------------------------------------

On 2023-11-05T12:18:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/1463#issuecomment-1793720967>

    > > Sometimes there's a need to: when user clicks on a face, create an image for him to drag into another face. This is not possible with the current model,
    > 
    > Would be worth trying again with the current code.
    
    Trying but it's not cooperating:
    ```
    view [
    	b1: base cyan "🐿" on-down [
    		sqrl: make-face/spec 'box [
    			font-size 30 "🐿" on-up [
    				if (distance? face b2) <= 40 [b2/text: face/text]
    				remove find/same face/parent/pane face
    			]
    		]
    		sqrl/options: compose [drag-on: down bounds: (object [min: 10x10 max: 100x10])]
    		sqrl/offset: 10x10
    		append face/parent/pane sqrl
    	]
    	b2: base magenta "🎯"
    ]
    ```
    For this to work I would need to somehow transfer the dragging event into another face under View's nose.

