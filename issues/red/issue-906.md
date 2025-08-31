
#906: random on series values works "in place" - is this intentional?
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/906>

When you randomize a block (paren, path) or string (file, url), the original gets changed; if this is intentional, it should be documented. I know that in REBOL, `sort` works this way, but `random` does NOT.

Incidentally, I commented on the original commit for `random` to the effect that this function makes little sense for files and urls.



Comments:
--------------------------------------------------------------------------------

On 2014-08-23T15:44:36Z, dockimbel, commented:
<https://github.com/red/red/issues/906#issuecomment-53156471>

    Agreed, it should COPY the series before shuffling it.
    
    For file! and url!, same remark as for paths, if the operation could result in a syntactically invalid value, RANDOM action should not be allowed.

--------------------------------------------------------------------------------

On 2014-08-23T16:10:43Z, meijeru, commented:
<https://github.com/red/red/issues/906#issuecomment-53157252>

    By the way, random in R3  does work "in place", in contrast to R2 !?!

