
#2774: [VID] 'Layout doesn't honor 'size setting in some circumstances
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2774>

If I set the size to 400x400, it won't work.
```Red
view [ size 400x400 backdrop %pix-720x464.jpg ]
```
If I set the size to 800x800, it works.
```Red
view [ size 800x800 backdrop %pix-720x464.jpg ]
```
This bug is both on Windows and macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-12T13:30:30Z, geekyi, commented:
<https://github.com/red/red/issues/2774#issuecomment-307789585>

    So this is a wish? What I understand your question is:
    
    ## Expectation
    Size of window is whatever is `size` set to, always
    
    ## Actual
    If `backdrop` image is set and is larger, the minimum size of window is that of the backdrop
    
    Right now, `size` behaves like a minimum size. The current behavior seems logical. Only problem is, it would be a bit inconvenient resizing the *backdrop* image at the beginning

--------------------------------------------------------------------------------

On 2017-06-12T13:37:30Z, geekyi, commented:
<https://github.com/red/red/issues/2774#issuecomment-307791589>

    I can still resize afterwards:
    ```red
    img: make image! [300x200]
    view/no-wait atest: layout [ size 10x10 backdrop img]
    ; afterwards
    atest/size: 110x100
    ```

