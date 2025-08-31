
#664: Compiler generates call to interpreter in one case. Why?
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/664>

If a path! value contains a paren! value as selector, e.g. a/(i), the whole combination is dispatched to interpreter/eval-path instead of being compiled into "normal" runtime calls. It seems odd that this particular case is singled out for this treatment. One may fear it creates problems of maintainability.



Comments:
--------------------------------------------------------------------------------

On 2014-01-22T20:30:56Z, meijeru, commented:
<https://github.com/red/red/issues/664#issuecomment-33064378>

    This was based on a partial analysis. I withdraw the issue.

