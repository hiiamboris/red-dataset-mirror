
#5157: Dead code
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5157>

Looks that this piece of code is never evaluated:
https://github.com/red/red/blob/ed73e334d3284d3079b31206cd295483b46440b8/runtime/datatypes/block.reds#L1040-L1047

because `any-blk?` is already handled above:
https://github.com/red/red/blob/ed73e334d3284d3079b31206cd295483b46440b8/runtime/datatypes/block.reds#L950-L953


Comments:
--------------------------------------------------------------------------------

On 2022-07-03T19:19:22Z, Oldes, commented:
<https://github.com/red/red/issues/5157#issuecomment-1173156815>

    It was introduced by this commit: https://github.com/red/red/commit/e9877c6769845618e9214fd45e6b5068e92a6b55

