
#283: Pointer types may not have the synonyms int32! and uint8!, but synonym float64! is allowed
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [Red/System] [type.documentation]
<https://github.com/red/red/issues/283>

This is not very consistent. Either allow all synonyms or none, I would say.



Comments:
--------------------------------------------------------------------------------

On 2012-10-30T16:40:38Z, dockimbel, commented:
<https://github.com/red/red/issues/283#issuecomment-9912915>

    Support for these synonyms is experimental (not fully implemented) as we do not really need them for now. Once we get 64-bit integers, we might need to support int32! and int64!. Support for their unsigned counterparts is still questionable. So, until we really need them, I will remove their mention from the documentation (but leave them in the code).

