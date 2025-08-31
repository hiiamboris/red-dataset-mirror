
#1860: WISH: size-spline
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[type.wish]
<https://github.com/red/red/issues/1860>

I need to know the offset and size that a spline takes, or I cannot set the right size of its face. Now my simple solution is to calculate the bounds of all the dots in the spline, then make the offset move upper-left 50x50, and make the size 100x100 bigger. This works most of the time, if the spline is not "to sharp". But still, I hope that I can have a better solution of this.

Many drawing APIs have something like getBounds to get the rectangle of a shape (including a path).



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T10:16:16Z, dockimbel, commented:
<https://github.com/red/red/issues/1860#issuecomment-226733614>

    @JenniferLee520 This is too specific need, so you need to implement the routine yourself, porting this code for example: http://stackoverflow.com/a/34882840/2081311
    
    We might add support for such function in the future, but probably as an optional module, not in the default View module.

--------------------------------------------------------------------------------

On 2016-06-17T11:55:29Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1860#issuecomment-226750713>

    OK. Thanks.

