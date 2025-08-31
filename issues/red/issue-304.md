
#304: Red lexer stumbles on literals denoting whitespace chars
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/304>

```
c: #"^(0A)"

-= Red Compiler =-
Compiling red/tests/mytest.red ...
[
    stack/mark _set
    word/push _c
    char/push 0
    word/set
    stack/unwind
    ------------| "c: #'00000000"
]
```

Likewise for `09` and `0D` - the rest is OK



Comments:
--------------------------------------------------------------------------------

On 2012-11-14T15:20:53Z, dockimbel, commented:
<https://github.com/red/red/issues/304#issuecomment-10369713>

    That would be the second or third time that I will be fixing this issue. I guess it is time to put it in the lexer tests. :-)

