
#2527: WISH: possibility to enquire the element properties of vector! values
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/2527>

`vector!` values have an element type (`char! integer! percent!` or `float!`) and a bit-size (8 16 32 or 64). Currently the only way to find these properties from a given value is to `mold` the value and parse the resulting string 😄 
I can see two approaches: reflectors (let's say `type-of` and `size-of`) or pseudo-components (`.../type` and `.../size`, like with `image!`)


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T05:09:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2527#issuecomment-384162305>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

