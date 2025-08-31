
#1517: wish: function or other facility to discover the size of an image
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/1517>

The size of an image (width x height) is stored with the image. However, short of molding/forming the image one cannot discover this property. I see two possibilities: a function `size` which yields a `pair!` value, or two "fields" `/x` and `/y` like for a `pair!` value



Comments:
--------------------------------------------------------------------------------

On 2015-12-22T20:34:11Z, meijeru, commented:
<https://github.com/red/red/issues/1517#issuecomment-166723487>

    I discovered that `/size` gives the required result. Issue closed. 

