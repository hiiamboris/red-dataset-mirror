
#303: Red compiler: natives/lesser-or-equal?* could call on natives/compare with reverse set to yes
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/303>

Likewise for `greater-or equal?*`. The `reverse` refinement on `compare` is only used for `not-equal?*` which seems a waste.



Comments:
--------------------------------------------------------------------------------

On 2012-11-14T15:21:16Z, dockimbel, commented:
<https://github.com/red/red/issues/303#issuecomment-10369724>

    Agreed.

--------------------------------------------------------------------------------

On 2012-11-24T15:43:01Z, dockimbel, commented:
<https://github.com/red/red/issues/303#issuecomment-10678841>

    Actually, I think it would be better to let pass all the COMP_\* actions to the datatype and let each datatype decide how to process them optimally.

