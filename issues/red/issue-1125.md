
#1125: mold/all does not (yet) encode series offset
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/1125>

The blog article announcing 0.5.3 states that one of the pros of `mold/all` is that it can encode series offsets. I take this to mean e.g. (like in R2 and R3) the following:
`mold/all next [1 2 3]` gives `#[block! [1 2 3] 2]`
Unfortunately, so far,
`mold/all next [1 2 3]` gives simply  `[2 3]`

Will the Rebol-like behaviour be provided in some future release? 



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T01:52:40Z, dockimbel, commented:
<https://github.com/red/red/issues/1125#issuecomment-96873155>

    Most probably yes.

