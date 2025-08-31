
#1208: %lexer.r accepts binary literal, %lexer.red does not
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1208>

Red programs with a binary literal (e.g. `#{FF}`) compile without protest, even thought the binary! datatype has not yet been implemented. The interpreter protests.



Comments:
--------------------------------------------------------------------------------

On 2015-06-07T08:38:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1208#issuecomment-109722279>

    That feature was introduced a long time ago as I wanted to have a way to both inline native binary code in Red/System programs and specify array of bytes in binary form instead of strings. Though, I have not implemented those features yet, and `binary!` support will be coming soon, so having compiler's lexer already supporting it is fine.

