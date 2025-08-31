
#1920: IMAGE can be drawn outside of window
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/1920>

It’s possible to draw outside of window (at least with `image` widget). This code:

```
view [
    size 200x50 
    text "Image outside of window:" 
    at 210x0 
    image %icons/10.Folder.png
]
```

produces this result:

![image-outside](https://cloud.githubusercontent.com/assets/660267/15420817/08a5960a-1e6f-11e6-96dc-7953119e5fac.png)



Comments:
--------------------------------------------------------------------------------

On 2016-05-25T07:27:40Z, iArnold, commented:
<https://github.com/red/red/issues/1920#issuecomment-221494514>

    This is a feature I use for creating a nice flash screen for my applications! Please do not fix this.

--------------------------------------------------------------------------------

On 2016-05-27T09:38:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1920#issuecomment-222104179>

    This is a bug we need to fix. Proper support for transparent windows will come in the future.

--------------------------------------------------------------------------------

On 2016-05-27T09:39:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1920#issuecomment-222104327>

    Here is another example of image not clipped by the window:
    
    ```
    view [
        size 300x500
        image 300x500 draw [line 0x0 300x500 line 0x500 300x0]
    ]
    ```

