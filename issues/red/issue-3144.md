
#3144: WISH: index? none returns none
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
<https://github.com/red/red/issues/3144>

### Expected behavior

`index? find "abcd" "ef"` -> `none`

### Actual behavior

`index? find "abcd" "ef"` -> *error message*

This extension of `index?` would be helpful for shortening lookups that are meant to yield an index or e.g. 0 if not found. We would be able to write:

`any [index? find "abcd" "ef" 0]`

Currently this has to be written as:

`either f: find "abcd" "ef" [index? f][0]`

which consumes an intermediate variable and is a bit more verbose.
There are precedents for built-in functions on series which yield `none` for `none`.


Comments:
--------------------------------------------------------------------------------

On 2017-12-15T18:32:13Z, greggirwin, commented:
<https://github.com/red/red/issues/3144#issuecomment-352078628>

    See also: https://github.com/red/red/issues/2618

--------------------------------------------------------------------------------

On 2017-12-16T05:23:39Z, dockimbel, commented:
<https://github.com/red/red/issues/3144#issuecomment-352162377>

    `0` is an invalid position in series (should yield an error in the future when trying to access it). So, it means you would test for a zero index value later in the code... in such case why not just rely on `find` returning `none` for this special case? In other words, substituting `0` for `none` in order to represent a special state does not bring any new feature, it just changes the representation to a non-standard Redbol value.
    
    > There are precedents for built-in functions on series which yield none for none.
    
    Yes, but the less of them we have, the better, as they lower the robustness of user code, by making some error cases passing silently. The goal of such none-transparency is to be able to chain calls and do nothing in case of `none`, avoiding an extra `either` construct. In the above case, it still requires an extra conditional construct (`any`), so that is not the same use-case as for other none-transparent functions (like `remove`).

--------------------------------------------------------------------------------

On 2017-12-16T15:46:16Z, meijeru, commented:
<https://github.com/red/red/issues/3144#issuecomment-352191294>

    In view of the discussion on Gitter I close the issue.

--------------------------------------------------------------------------------

On 2017-12-16T20:00:36Z, greggirwin, commented:
<https://github.com/red/red/issues/3144#issuecomment-352207432>

    Added note by Doc in gitter chat: 
    
    > ...a frequent usage of index? can usually be a code smell for non-idiomatic Redbol code. Series with their implicit index, can cover most needs already without having to extract and directly manipulate index values. That is something many/most Redbol newcomers are missing.

