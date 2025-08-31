
#1249: Run time lexer accepts {#"^^}, compile time lexer does not
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1249>

Another issue thrown up by trying to compile a REBOL program (in this case `%system/loader.r`) wih the Red compiler. The expression `{#"^^}` occurs at line 203 in the source. When submitting this expressiion on its own to the compiler, the error  message is:

```
Compiling /C/Projects/Red/programs/test.red ...
*** Syntax Error: Invalid string! value
*** line: 15
*** at: {{#"^^^^}}
```



