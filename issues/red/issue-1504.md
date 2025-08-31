
#1504: Latest gui branch objects to 50%
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/1504>

Compiling a very simple GUI program:

```
** Syntax Error: Invalid integer -- 50%
** Near: (line 3) view [progress data 50%]
```

I find it very puzzling, since the lexer hasn't changed, I think!



Comments:
--------------------------------------------------------------------------------

On 2015-12-11T11:35:01Z, meijeru, commented:
<https://github.com/red/red/issues/1504#issuecomment-163916374>

    The gui branch doesn't like any percent! literal, even outside view [ ].

--------------------------------------------------------------------------------

On 2015-12-11T11:50:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1504#issuecomment-163920283>

    Works fine here both from compiler and interpreter.

--------------------------------------------------------------------------------

On 2015-12-11T12:17:43Z, meijeru, commented:
<https://github.com/red/red/issues/1504#issuecomment-163925133>

    Must be something else, I will continue to investigate but this issue is closed.

