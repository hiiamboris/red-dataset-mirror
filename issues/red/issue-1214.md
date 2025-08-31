
#1214: The sets of #[...] literals accepted by compile time and run time lexer are different
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/1214>

The compile time lexer does not accept `#[op!]`, `#[get-path!]` and `#[routine!]`



Comments:
--------------------------------------------------------------------------------

On 2015-06-07T03:20:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1214#issuecomment-109680096>

    Construction syntax is not yet fully supported, the implementation will be changed and completed in a future release. It is unlikely that `op!` and `routine!` will be supported using such syntax.

