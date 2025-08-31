
#97: Unexpected compiler crash
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/97>

I was testing the precedence of typecasting w.r.t  infix operators and got this:

```
t: as logic! 1 - 1 
*** Compiler Internal Error: Script Error : Out of range or past end
*** Where: signed?
*** Near:  ['signed = third any [find datatypes type [- -]]]
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-16T16:40:53Z, dockimbel, commented:
<https://github.com/red/red/issues/97#issuecomment-1382450>

    Tested OK.

