
#2480: Comment + Newline + EOF = Syntax Error
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2480>

A commented line followed by a newline at the end of file causes a syntax error.

```
Red []

print "Hello, World!"

;this is a comment

```

This gives:

```
*** Syntax Error: invalid value at ";this is a comment"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-15T09:03:48Z, dockimbel, commented:
<https://github.com/red/red/issues/2480#issuecomment-286680698>

    Issue was only in runtime lexer (aka `load`).

