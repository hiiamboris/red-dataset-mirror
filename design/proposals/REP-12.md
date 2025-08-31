
#12: WISH: possibility to enquire the element properties of vector! values
================================================================================
Issue is open, was reported by meijeru and has 12 comment(s).
[Wish]
<https://github.com/red/REP/issues/12>

This is based on Red issue Red/red#2527, now closed.

`vector!` values have an element type (`char! integer! percent!` or `float!`) and a bit-size (8 16 32 or 64). 
 (They may in future have an extra property: whether the integer elements are signed or unsigned.) Currently the only way to find the actual properties from a given vector value is to mold the value and parse the resulting string 😄
I can see two approaches: reflectors (let's say `type-of` and `size-of`) or pseudo-components (`.../type` and `.../size`, like with `image!` values).


Comments:
--------------------------------------------------------------------------------

On 2019-01-17T10:32:04Z, Oldes, commented:
<https://github.com/red/REP/issues/12#issuecomment-455123011>

    I think it would be good to use `query` to access such information not only from `vector!` datatype.
    It could work like:
    ```
    >> vec: make vector! [integer! 16 [1 2 3 4]]
    == make vector! [integer! 16 [1 2 3 4]]
    
    >> query/mode vec none
    == [type size length]
    
    >> query vec 'size
    == 16
    
    >> query vec [length type size]
    == [4 integer! 16]
    ```

--------------------------------------------------------------------------------

On 2019-01-17T13:36:29Z, Oldes, commented:
<https://github.com/red/REP/issues/12#issuecomment-455174091>

    Another way is to use `spec-of` and `reflect`.

--------------------------------------------------------------------------------

On 2019-01-17T16:27:42Z, meijeru, commented:
<https://github.com/red/REP/issues/12#issuecomment-455236171>

    I was indeed thinking more of `reflect`...

--------------------------------------------------------------------------------

On 2019-01-17T16:37:59Z, Oldes, commented:
<https://github.com/red/REP/issues/12#issuecomment-455240155>

    `reflect` is fine and of course should be the basic in this case... `query` is more flexible as it can be used to receive multiple results in any order.  

--------------------------------------------------------------------------------

On 2019-01-17T16:46:23Z, Oldes, commented:
<https://github.com/red/REP/issues/12#issuecomment-455243297>

    Using _accessors_ (like `/rgb` for `image!` value) is also not a bad idea. So many choices :-/

--------------------------------------------------------------------------------

On 2019-01-18T01:42:20Z, greggirwin, commented:
<https://github.com/red/REP/issues/12#issuecomment-455396838>

    In this case, I think `reflect` is more appropriate, taken as "looking inward". In that sense, though Carl clearly made a distinction, files could use `reflect` rather than `query`. The difference being that a `file!` may know about itself as a value, which differs from asking the OS about details it doesn't store itself. Both are actions, so there's no distinction there. 
    
    We can view the "inner information" rule as potentially leaking an abstraction, but it's easy to reason about, understand, and follow.

