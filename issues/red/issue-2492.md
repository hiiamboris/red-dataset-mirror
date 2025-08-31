
#2492: compile-time and run-time lexer differ in acceptance of whitespace
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/2492>

`%lexer.r` accepts `U+0085` (newline) whereas `%lexer.red` does not!

BTW all code points > U+00A0 which have Unicode property `WSpace=Y` are for the moment excluded from whitespace (the corresponding code is commented out), and also U+000B, U+000C (no code foreseen)


Comments:
--------------------------------------------------------------------------------

On 2019-08-20T14:02:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2492#issuecomment-523029582>

    The inclusion or non-inclusion of all variants of unicode whitespaces has not been decided yet.

