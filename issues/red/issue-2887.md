
#2887: WISH: browse should accept a file! value also
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2887>

Currently, only `url!` values are allowed. I don't know whether the OS functions called are simply accepting files in addition to urls, or whether a `file://` protocol should be prepended in those calls. Either way, I don't see anything html-specific in the `browse` code (`%environment/routines.reds`).


Comments:
--------------------------------------------------------------------------------

On 2017-07-15T07:40:33Z, qtxie, commented:
<https://github.com/red/red/issues/2887#issuecomment-315517008>

    Now we can browse a folder or a file:
    ```
    browse %/d/
    browse %/d/red/usage.txt
    ```

