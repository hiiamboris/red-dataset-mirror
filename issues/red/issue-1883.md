
#1883: Slider data facet does not scale up/down with slider's size
================================================================================
Issue is closed, was reported by ldci and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/1883>

When resizing a slider, data value is incorrectly updated. For example a slider initialised to 512 pixels in X size will send back data varying from 0.0 to 1.0. When resized to 1024 in X size data value only varies between 0.0 and 0.5 



Comments:
--------------------------------------------------------------------------------

On 2016-05-05T09:30:31Z, dockimbel, commented:
<https://github.com/red/red/issues/1883#issuecomment-217112036>

    Example code to reproduce it:
    
    ```
    view [
        size 400x100
        s: slider [probe s/data] return
        button "resize" [s/size/x: 300]
    ]
    ```

