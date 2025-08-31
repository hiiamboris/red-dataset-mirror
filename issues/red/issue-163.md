
#163: "Intermediate locals" not handled correctly
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/163>

Red/System allows (or at least not forbids) nested function definitions. Thus the question arises how the innermost procedure can address the locals (or formal arguments) of an enclosing procedure. Inspection of the compiler/emitter suggests there is no provision for this at all, and the following program seems to prove it.

```
b: 1 f: func [/local b][b: 2 g: func [][print b] g] f
```

`f` calls `g` which should print 2, but it prints 1

Short of a considerable overhaul, the solution may be to forbid nested procedure definitions... This would not seem to be a great loss.



Comments:
--------------------------------------------------------------------------------

On 2012-01-05T16:12:04Z, dockimbel, commented:
<https://github.com/red/red/issues/163#issuecomment-3371795>

    Sorry for not answering earlier to this ticket.
    
    The nested function definition does not automatically imply a hierarchical relation between different function contexts. This syntax was intended just for making a function "private" and callable only from a given scope (different from global scoping). Accessing to variables between private contexts (like functions) was never planned nor allowed by the current implementation of Red/System.
    
    Not allowing such syntax might be better to avoid confusion from users, but it is not high-priority, so if someone else can make a minimal fix for that, I will accept it. It should not be complicated, just block `func` keyword compilation if already in a function (can be tested with `locals <> none`).

--------------------------------------------------------------------------------

On 2012-01-07T07:59:17Z, meijeru, commented:
<https://github.com/red/red/issues/163#issuecomment-3394680>

    It would indeed be better not to allow function definitions inside function bodies, to avoid misunderstandings. The effect of creating "private" names is minor, the more so since the same function name may not occur in more than one scope anyhow (globality of function names).

