
#1960: PUT not defined on series!, vector! and binary!
================================================================================
Issue is open, was reported by meijeru and has 2 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/1960>

The only series-like datatypes on which PUT is defined are `block!` and its relatives.



Comments:
--------------------------------------------------------------------------------

On 2017-02-16T11:46:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1960#issuecomment-280309650>

    PUT exists:
    1. for setting key/value couples
    2. to be the modifying counter-part for SELECT.
    
    First item is only meaningful for any-block! series, but SELECT is defined for all series types, so we could allow that for the sake of symmetry.

