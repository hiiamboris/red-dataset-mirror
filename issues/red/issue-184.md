
#184: Latest lexer changes make integers unrecognizable
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/184>

Submitting even a single digit gives error:

```
*** Syntax Error: Invalid word! value
```

while a signed number, eg `-5` is recognized as a word. This is the more curious since integer-rule precedes word-rule in the grammar.



Comments:
--------------------------------------------------------------------------------

On 2011-10-20T21:17:21Z, dockimbel, commented:
<https://github.com/red/red/issues/184#issuecomment-2474541>

    I guess you are referring to a case like: `{Red [] 123}` where the integer value is not followed by any other character. In such case, the lexer is not able to correctly determine the integer ending. This can be fixed easily by taking the `end` marker into account into the integer parsing rule.

