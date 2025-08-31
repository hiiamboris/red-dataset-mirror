
#2769: [VIEW] Using 'PUT on the 'DRAW facet in a face doesn't trigger the redrawing.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/2769>

For changing the fill-pen color of a draw block, I code like this:
```Red 
put face/draw 'fill-pen 255.0.0.0
```
After running this, the draw block did change, but the view engine didn't redraw the face. But the following code is OK:
```Red 
face/draw/fill-pen: 255.0.0.0
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-09T03:59:57Z, dockimbel, commented:
<https://github.com/red/red/issues/2769#issuecomment-307289333>

    Code to reproduce it:
    ```
    view [
        base draw [fill-pen blue circle 40x40 30] on-down [put face/draw 'fill-pen 255.0.0.0]
    ]
    ```

