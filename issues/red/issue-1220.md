
#1220: run time lexer uses subtly different rule for parsing  url! values than compile time lexer does
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1220>

In particular, the run time lexer relies on  the `integer-end` and `not-file-char` sets of characters and does not use the more obvious `not-url-char` set. Notably, the `integer-end` set contains `x` which has nothing to do with `url!` values. In general, detection of `url!` values should not be dependent on the lexical properties of integers or files.

Whether the end effect of the current definitions is still the same in both lexers is not easy to see from the source and it may be difficult to prove.



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T04:55:13Z, dockimbel, commented:
<https://github.com/red/red/issues/1220#issuecomment-179008264>

    Now, run-time lexer uses `not-url-char` too.

