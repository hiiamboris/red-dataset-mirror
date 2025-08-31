
#354: Wrong result in interpreter
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
<https://github.com/red/red/issues/354>

I don't know if this is a deep one, but it could be stack management. I stumbled on it by chance

```
red>> type? type?/word 1
== 1 ; should be word!
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-30T09:37:43Z, dockimbel, commented:
<https://github.com/red/red/issues/354#issuecomment-11762971>

    Refinements support is not implemented yet in the lexer, nor in the interpreter.

--------------------------------------------------------------------------------

On 2012-12-30T09:46:44Z, meijeru, commented:
<https://github.com/red/red/issues/354#issuecomment-11763014>

    Sorry for bothering you. My next one seems more serious, though.

--------------------------------------------------------------------------------

On 2012-12-30T09:47:17Z, dockimbel, commented:
<https://github.com/red/red/issues/354#issuecomment-11763017>

    No problem. Next one is already fixed. ;-)

