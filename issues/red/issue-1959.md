
#1959: Curious: PUT not defined on string!
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.review]
<https://github.com/red/red/issues/1959>

The more curious, because it is inherited from `string!` by `file!`and `url!` but the action inherited is `null`.



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T14:08:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1959#issuecomment-226778356>

    `put` is not defined for strings as the key/value concept is not a good match for strings. That said, we might add it in the future if the need for it arises.

--------------------------------------------------------------------------------

On 2016-06-17T16:23:35Z, meijeru, commented:
<https://github.com/red/red/issues/1959#issuecomment-226815007>

    If it is not appropriate for strings than _a fortiori_ it should not be appropriate for files and urls. Therefore the inheritance can be removed.

