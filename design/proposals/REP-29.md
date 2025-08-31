
#29: FIND on any-block! (except hash!) series should allow a typeset! argument
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[Wish:Acccepted]
<https://github.com/red/REP/issues/29>

Currently one can find a value in a block by type (e.g. `find [1 "a" 2.0 #"b" 3% 4.5.6 #c] percent!` will give `[3% 4.5.6 #c]`.

It would be nice to be able to find by typeset, e.g. `find ["a" 2.0 'b 4.5.6 c: ] any-word!` would give `['b 4.5.6 c:]`



Comments:
--------------------------------------------------------------------------------

On 2018-12-12T10:05:50Z, meijeru, commented:
<https://github.com/red/REP/issues/29#issuecomment-446531914>

    I have got the following use case: to search for the first argument in a function spec block, one cannot do `find spec any-word!` but must do `any [find spec word! find spec lit-word! find spec get-word!]` which is order dependent: e.g. if the spec starts with a lit-word argument, this will not be found.

--------------------------------------------------------------------------------

On 2020-07-30T16:55:37Z, 9214, commented:
<https://github.com/red/REP/issues/29#issuecomment-666523298>

    Should be closed as granted by https://github.com/red/red/commit/f3400414.

