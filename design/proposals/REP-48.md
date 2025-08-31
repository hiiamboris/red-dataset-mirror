
#48: WISH: sorting records on multiple items
================================================================================
Issue is open, was reported by meijeru and has 12 comment(s).
<https://github.com/red/REP/issues/48>

`sort` works on blocks representing "records" with the `/skip` refinement. It has a `/compare` refinement with an `integer!`  argument which indicates the position of the component within the record, on which to sort. If one wants to sort on multiple components, in a hierarchical fashion, it would be good to have a `block!` argument to `/compare` with the positions of the components on which to sort, in the order of importance -- sort first on this component, and when they are equal, sort on that component, etc.


Comments:
--------------------------------------------------------------------------------

On 2019-05-18T23:21:24Z, endo64, commented:
<https://github.com/red/REP/issues/48#issuecomment-493714141>

    What does current `/compare` with a `block!`?

--------------------------------------------------------------------------------

On 2019-05-19T07:43:20Z, meijeru, commented:
<https://github.com/red/REP/issues/48#issuecomment-493734710>

    @endo64 It gives an error message, even though `block!` is in the typespec.

--------------------------------------------------------------------------------

On 2019-05-19T19:16:00Z, greggirwin, commented:
<https://github.com/red/REP/issues/48#issuecomment-493783537>

    We can add "TBD" to the `/compare` doc string. 

--------------------------------------------------------------------------------

On 2019-06-16T21:49:03Z, endo64, commented:
<https://github.com/red/REP/issues/48#issuecomment-502488593>

    `sort/compare` with block as a comparator doesn't work on R2 too, and no effect the result on R3, o I can't see the use.

--------------------------------------------------------------------------------

On 2019-06-17T00:29:40Z, greggirwin, commented:
<https://github.com/red/REP/issues/48#issuecomment-502498988>

    Seems OK in R2 @endo64, but I'm a bit foggy right now.
    ```
    >> n-blk: [1 2 3  3 2 1  2 3 2]
    == [1 2 3   3 2 1   2 3 2]
    >> sort/skip/compare n-blk 3 [3]
    == [3 2 1   2 3 2   1 2 3]
    >> sort/skip/compare n-blk 3 [2]
    == [3 2 1   1 2 3   2 3 2]
    >> sort/skip/compare n-blk 3 [2 3]
    == [3 2 1   1 2 3   2 3 2]
    >> sort/skip/compare/reverse n-blk 3 [2 3]
    == [2 3 2   1 2 3   3 2 1]
    
    >> n-blks: [[1 2 3][ 3 2 1][2 3 2]]
    == [[1 2 3] [3 2 1] [2 3 2]]
    >> sort/compare n-blks [3]
    == [[3 2 1] [2 3 2] [1 2 3]]
    >> sort/compare n-blks [2]
    == [[3 2 1] [1 2 3] [2 3 2]]
    >> sort/compare n-blks [2 3]
    == [[3 2 1] [1 2 3] [2 3 2]]
    >> sort/compare/reverse n-blks [2 3]
    == [[2 3 2] [1 2 3] [3 2 1]]
    ```

--------------------------------------------------------------------------------

On 2019-06-17T06:34:01Z, meijeru, commented:
<https://github.com/red/REP/issues/48#issuecomment-502552647>

    It *does* indeed work in R2, and is useful. I have several applications that use it.

