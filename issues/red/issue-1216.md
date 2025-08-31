
#1216: Run time lexer handles C1 control characters differently from compile time one
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1216>

In fact, the run time lexer does not define the C1 control characters (`U+0080 - U+009F`) at all, whereas the compile time lexer (which calls them C2 control characters) includes them in the rule for `control-char`, that has a significance for determining the end of "symbols". 



