
#2006: Wish: image! value indexing could be done by pair! value
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/2006>

Semantics would be like in R2 (row x column), but I would suggest 1-origin instead of the 0-origin that R2 has, which is presumably for faster computation. Even with 1-origin, a native implementation would be more efficient than what the Red programmer has to do now: compute the index into the image explicity from a given pair of coordinates.



Comments:
--------------------------------------------------------------------------------

On 2016-06-20T09:43:29Z, qtxie, commented:
<https://github.com/red/red/issues/2006#issuecomment-227096558>

    Implemented in commit d5ad3629c64a56569f72cd534326961d11ed3c8c.

