
#1213: Compile time lexer allows empty tuple element, run time lexer does not
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1213>

The literal `1.2..4` is accepted as `1.2.0.4` by the compile time lexer, and refused by the run time one.



