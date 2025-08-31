
#2684: Inconsistency in terminology RGBA vs ARGB
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/2684>

The function which makes a 4-tuple out of 4 integers is called `as-rgba`, suggesting that transparency is the 4th and last byte of a pixel. The refinement of an image value which produces the binary sequence containing 4 bytes for each pixel is called `/argb` suggesting that the transparency byte is up front.

Which of the two suggests better the reality?


Comments:
--------------------------------------------------------------------------------

On 2017-06-15T01:29:28Z, qtxie, commented:
<https://github.com/red/red/issues/2684#issuecomment-308602980>

    I propose to use ARGB in all places. So we need to do the following change:
    1. 4-tuple value means ARGB instead of RGBA.
    2. rename function `as-rgba` to `as-argb`.

--------------------------------------------------------------------------------

On 2020-03-15T21:53:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/2684#issuecomment-599269792>

    I now believe it's all consistent. Tuple 1.2.3.4 is R=1 G=2 B=3 A=4, i.e. RGBA:
    ```
    >> as-rgba 1 2 3 4
    == 1.2.3.4
    ```
    `/argb` is not the order in which colors appear in the tuple, but the [ARGB order of encoding them into a binary](https://en.wikipedia.org/wiki/RGBA_color_model#ARGB_%28word-order%29)

