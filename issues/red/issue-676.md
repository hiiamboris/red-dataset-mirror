
#676: Tokenizer does not know #[ ] construct
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/676>

This is a limitation, not only on the interpreter, but also on the load native, since that (temporarily?) uses tokenizer/scan. It means, e.g. that type? load "true" is word!, not logic!. 



Comments:
--------------------------------------------------------------------------------

On 2014-02-12T12:26:18Z, dockimbel, commented:
<https://github.com/red/red/issues/676#issuecomment-34863823>

    This is a limitation of the current runtime lexer which was meant to be temporary. It will be soon replaced by a totally different implementation that will be fully Unicode-aware and on par with the compiler's lexer. 
    
    The construction syntax #[] support will be then fully added to both lexers (the compiler's lexer support for it is currently very limited).

