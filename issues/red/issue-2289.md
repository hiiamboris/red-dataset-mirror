
#2289: Control characters in a text-field are not translated
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/2289>

I put a text containing `^/` (newline) in a text field and checked the contents by printing `to binary!` of these contents. There is no translation to a control character, it is stored as `#{5E2F}` instead of `#{0A}`. Same for `^-` (tab) and `^@` to `^_`. Is this a limitation of View, or of the underlying OS?



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T11:24:06Z, qtxie, commented:
<https://github.com/red/red/issues/2289#issuecomment-280839407>

    The text field and area are general edit widget. It treats its contents as plain text, no language awareness.

