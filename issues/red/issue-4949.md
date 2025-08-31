
#4949: Doc of map wrong
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
<https://github.com/red/red/issues/4949>

There is following proposition in map [documentation](https://github.com/red/docs/blob/master/en/datatypes/map.adoc):

>Trying to access a key not defined in a map will:
>* produce an error if the path syntax is used.
>* return a none value if select is used.

No error is produced in either case, only `none` is returned.

Correct would be something like:

"Trying to access a key not defined in a map will return a `none` value."


Comments:
--------------------------------------------------------------------------------

On 2021-08-15T19:26:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4949#issuecomment-899098682>

    Should this be in https://github.com/red/docs/issues ?

--------------------------------------------------------------------------------

On 2021-08-16T04:45:46Z, toomasv, commented:
<https://github.com/red/red/issues/4949#issuecomment-899210485>

    Ah, yes, sorry!

