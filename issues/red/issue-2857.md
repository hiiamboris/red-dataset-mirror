
#2857: setting image/alpha, /rgb and /argb to a value other than binary should give error
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2857>

There is no check on the type of the value supplied for setting these components of an image.


Comments:
--------------------------------------------------------------------------------

On 2017-07-11T02:49:46Z, qtxie, commented:
<https://github.com/red/red/issues/2857#issuecomment-314308015>

    Will give error now. We also support **tuple!** and **integer!** to set image color.

--------------------------------------------------------------------------------

On 2018-11-28T20:39:03Z, gltewalt, commented:
<https://github.com/red/red/issues/2857#issuecomment-442596329>

    Error is given on the first attempt, but second attempt crashes GUI console.
    
    Example:
    ```
    >> i: make image! 1x1
    == make image! [1x1 #{FFFFFF}]
    
    >> i/rgb
    == #{FFFFFF}
    
    >> i/rgb: "hodl"
    *** Script Error: invalid argument: "hodl"
    *** Where: set-path
    *** Stack: 
    
    img/rgb: "hodl"
    
    **CRASH**
    ```

--------------------------------------------------------------------------------

On 2018-11-28T21:44:24Z, endo64, commented:
<https://github.com/red/red/issues/2857#issuecomment-442615948>

    After setting any of `rgb`, `argb`, `alpha` to a string crash happens when first access to the image.
    
    ```
    i: make image! 1x1
    i/alpha: "test"
    i ; crash
    ```

