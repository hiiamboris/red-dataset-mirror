
#2283: Non-bold text in draw does not appear when saved to an image file
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2283>

I have a base face with a draw block that contains text in non-bold style. When I invoke `draw` on the draw block of the face, in order to create a value of type image! and I save this image as a .jpg file using `save/as`, the text is lost. It does appear when the font is bold. I have not been able to determine whether the loss occurs in invoking `draw` or when saving (calling the codec). 



Comments:
--------------------------------------------------------------------------------

On 2016-10-23T00:35:44Z, qtxie, commented:
<https://github.com/red/red/issues/2283#issuecomment-255562422>

    Would you please provide the steps to reproduce the issue ? 
    
    I try this one and it works fine.
    
    ```
    save/as %draw-text.jpg draw 100x50 [text 10x10 "Hello"] 'jpeg
    ```

--------------------------------------------------------------------------------

On 2016-10-23T12:56:43Z, meijeru, commented:
<https://github.com/red/red/issues/2283#issuecomment-255587138>

    The default font used in the above example is bold(er). If you create a non-bold font, it becomes invisible.
    
    ```
        text-font: make font! [size: 12]
        save/as %draw-text.jpg draw 100x50 [font text-font text 10x10 "Hello"] 'jpeg
    ```

--------------------------------------------------------------------------------

On 2016-10-28T09:32:07Z, qtxie, commented:
<https://github.com/red/red/issues/2283#issuecomment-256877565>

    @meijeru It works fine on my Win 7 64bit box. Which OS version are you using?

--------------------------------------------------------------------------------

On 2016-10-28T09:35:17Z, meijeru, commented:
<https://github.com/red/red/issues/2283#issuecomment-256878169>

    I am using Windows 10. Does the `make font! [size: 12]` make the trouble or did you use my example literally?

--------------------------------------------------------------------------------

On 2016-10-28T09:44:02Z, qtxie, commented:
<https://github.com/red/red/issues/2283#issuecomment-256879890>

    Comfirmed it on Windows 10.  When give the font a name, then it works.

