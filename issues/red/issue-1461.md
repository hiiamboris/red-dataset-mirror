
#1461: transparency changes dragging behaviour of base face
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/1461>

When setting a `base`'s `options` to `[drag-on: 'down]`:
- If the `base`'s `color` has an opacity of `255`, it can be dragged outside the window (and out of sight).
- If the `base`'s opacity is set to anything below `255`, or if it's `color` isn't set but its `image` is instead:
  - The `base` cannot be dragged even partially outside the window.
  - The `base` is brought to the front of every other type of face, and in front of every fully opaic `base`.

The issue is the difference in behaviour.
- All other types of draggable faces can be dragged outside of the window (and out of sight).
- No other types of face's movement is restricted by transparency in the way `base` is.
- However, no other types of faces currently display any transparency either, though most display the other channels of `color`.



Comments:
--------------------------------------------------------------------------------

On 2015-11-23T07:36:47Z, qtxie, commented:
<https://github.com/red/red/issues/1461#issuecomment-158869825>

    _The base cannot be dragged even partially outside the window_
    This is how it is be implemented for now for simplicity. It would be improved later.
    
    _The base is brought to the front of every other type of face, and in front of every fully opaic base_
    It's the restriction in Windows version (prior to Win 8) which doesn't support making Layered windows as Child window. In those Windows version, we need to simulate the feature. When we use transparency in `base`, it's a **pop-up** layered window actually, so it's in front of any other faces.

--------------------------------------------------------------------------------

On 2016-01-17T03:02:21Z, qtxie, commented:
<https://github.com/red/red/issues/1461#issuecomment-172286247>

    _The base cannot be dragged even partially outside the window_
    It is solved now.
    
    _The base is brought to the front of every other type of face, and in front of every fully opaic base._
    It cannot be solved on Windows prior to version 8.

