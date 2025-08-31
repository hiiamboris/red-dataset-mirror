
#657: Lexer chokes on "^"" (string containing escaped ")
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/657>

This is because the treatment of escaped characters in line-strings (as opposed to single character literals) is postponed until after recognition of the closing ", and then it is too late! See load-string. Multi-line string recognition does not suffer from this.



