
#1970: 'over events continue to be fired after a face has been dragged  (loose)
================================================================================
Issue is closed, was reported by SteeveGit and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1970>

In the console, run the following test:

```
system/view/debug?: yes
view/options [b: base red loose][size: 400x400]
system/view/debug?: no
```

Move the mouse over the red box. 
No 'over events are fired at that point (except when entering and leaving the box). 
Drag the red box a little, then release it.
You'll notice in the console that a lot of 'over events continue to be fired when the mouse is inside the red box.
It should not be.

The reason is, the facet face/flags is not cleared:
`red>> b/flags`
`== all-over

...FIX incoming...



Comments:
--------------------------------------------------------------------------------

On 2016-06-04T18:36:22Z, SteeveGit, commented:
<https://github.com/red/red/issues/1970#issuecomment-223771040>

    Don't be abused by the 2 first references of commits  (above), they've been deleted.

--------------------------------------------------------------------------------

On 2016-06-10T04:57:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1970#issuecomment-225093276>

    Agreed, the flag should be removed when the dragging stops.

