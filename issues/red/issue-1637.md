
#1637: WISH: options: [ drag-on: down drag-track: a-path-description ]
================================================================================
Issue is closed, was reported by JenniferLee520 and has 8 comment(s).
[status.built] [GUI] [type.task.wish]
<https://github.com/red/red/issues/1637>

The DRAG-TRACK option indicates the path, and the face can only be dragged on the path.



Comments:
--------------------------------------------------------------------------------

On 2020-07-18T16:32:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/1637#issuecomment-660507395>

    Such high level logic should be kept on Red level. No one's going to implement such path support in R/S, not for a few esoteric use cases.
    Specifying an axis (X, Y or both) and a constraint (a box or none) should suffice in most dragging cases.
    To make it fully customizable we can support a Red-level *constraint function*, that is being told "Mouse is at X,Y right now. Where do you wanna put the face at?" and it answers with new face coordinates or none to leave it alone.

--------------------------------------------------------------------------------

On 2020-07-18T23:22:09Z, greggirwin, commented:
<https://github.com/red/red/issues/1637#issuecomment-660556623>

    On drag-drop, it needs a full design as it is heavily used in modern UIs. You have draggable, drag-icon + [decal], drag-content, and drop-target (maybe more). Drop targets need a valid intersection with content type.

--------------------------------------------------------------------------------

On 2020-07-18T23:23:50Z, greggirwin, commented:
<https://github.com/red/red/issues/1637#issuecomment-660556770>

    But we should also think about this in the larger context of data transfer. Accessibility is one issue, IPC another. 

--------------------------------------------------------------------------------

On 2022-09-15T16:04:20Z, dockimbel, commented:
<https://github.com/red/red/issues/1637#issuecomment-1248305098>

    Implemented as a XY bouding box restricting dragging path: https://github.com/red/docs/blob/master/en/view.adoc#options-facet

