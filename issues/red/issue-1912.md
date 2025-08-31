
#1912: applying random on series
================================================================================
Issue is closed, was reported by GerardSontag and has 2 comment(s).
<https://github.com/red/red/issues/1912>

red>> random/only {1 2 3 6 8 9}
== #" "                                               ; " " Is not part of the serie



Comments:
--------------------------------------------------------------------------------

On 2016-05-17T15:37:07Z, GerardSontag, commented:
<https://github.com/red/red/issues/1912#issuecomment-219757861>

    Must be:
    random/only [1 2 3]

