
#2299: Draw dialect - Image key color error
================================================================================
Issue is closed, was reported by Rebol2Red and has 4 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/2299>

view [base 400x400 transparent draw [image picture 0x0 100x0 0x100 100x100 255.255.255]]

*** Script Error: invalid Draw dialect input at: [picture 0x0 100x0 0x100 100x100 255.255.255]
*** Where: ???


Comments:
--------------------------------------------------------------------------------

On 2016-11-03T19:25:40Z, meijeru, commented:
<https://github.com/red/red/issues/2299#issuecomment-258248321>

    I read in the [documentation](https://doc.red-lang.org/gui/Draw.html#image):
    
    ```
    Four points mode is not yet implemented.
    It will allow to stretch the image using 4 arbitrary-positioned edges.
    ```

--------------------------------------------------------------------------------

On 2016-11-06T01:07:51Z, Rebol2Red, commented:
<https://github.com/red/red/issues/2299#issuecomment-258653346>

    @qtxie, It works now, Thank you very much for fixing this!

