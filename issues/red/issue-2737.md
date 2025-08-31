
#2737: [VID] DISABLED and LOOSE
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2737>

Using DISABLED and LOOSE on the same face will cause different behaviors on macOS and Windows. On macOS, the face still can be dragged. On Windows, it cannot. 

```Red
view [ box red 20x20 loose disabled box green 20x20 ]
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-03T02:49:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2737#issuecomment-305945841>

    A `disabled` face receives no event, so it should not be draggable, Windows is correct, macOS version needs fixing.

--------------------------------------------------------------------------------

On 2017-06-12T00:33:27Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2737#issuecomment-307667386>

    Also see #2787 

