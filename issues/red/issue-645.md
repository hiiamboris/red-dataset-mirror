
#645: comment not followed by {string} gives strange error message
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/645>

In REBOL, comment may be followed by any valid expression; in Red, only a multi-line string is allowed. Inadvertent use of another expression gives the error message "undefined word comment" in the compiler instead of something like "multi-line string expected". In the interpreter comments are not foreseen (yet?).

Note that I do not take issue with the limitation to multi-line strings. 



Comments:
--------------------------------------------------------------------------------

On 2014-02-06T23:06:17Z, dockimbel, commented:
<https://github.com/red/red/issues/645#issuecomment-34385336>

    When compiled, multi-line comments are removed at lexer level, so no datatype checking is possible. Anyway, it is possible to enforce it at lexical level, so an improvement is possible there.

