
#2498: WISH: make vector! [char! ...] should allow string for initialization
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2498>

If one wishes to initialize a vector of characters, one has to specify a block of character values, e.g. 
`[#"a" #"b" #"c"]`. It would save typing and be more intuitive to allow "abc" in this case.
Thus, instead of `make vector! [char! 8 [#"a" #"b" #"c"]]` one would have
 `make vector! [char! 8 ["abc"]]` 


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T13:37:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2498#issuecomment-523018565>

    Actually, it should be: `make vector! [char! 8 "abc"]`.

--------------------------------------------------------------------------------

On 2020-10-13T15:54:50Z, 9214, commented:
<https://github.com/red/red/issues/2498#issuecomment-707838528>

    What if vector unit and string unit differ from each other? E.g. one-byte element and UCS-4 string?

--------------------------------------------------------------------------------

On 2020-10-14T09:48:52Z, meijeru, commented:
<https://github.com/red/red/issues/2498#issuecomment-708291574>

    In that case, an error should be raised, OR (but I like that less) truncation should occur if needed.

--------------------------------------------------------------------------------

On 2020-10-14T11:16:43Z, 9214, commented:
<https://github.com/red/red/issues/2498#issuecomment-708335635>

    Should be consistent with https://github.com/red/red/issues/3734#issuecomment-674170781 either way.

