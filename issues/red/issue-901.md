
#901: PRINT does not ignore UNSET values.
================================================================================
Issue is closed, was reported by hostilefork and has 4 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/901>

Red, like Rebol, will silently squelch unsets in COMPOSE (for example):

```
red> compose [10 (print "Hello") 20]
Hello
== [10 20]
```

In Rebol, this applies to PRINT as well.  In Red, the word "unset" appears:

```
red> print [10 (print "Hello") 20]
Hello
10 unset 20
```

I believe the preferable output in that case would be Rebol's output:

```
Hello
10 20
```

(I know this seems nitpicky but I am trying to build a new philosophy of PRINT, and you have asked for _complete_ proposals, so it's easiest to start with the "hopefully this is an agreement" parts in building that.)



Comments:
--------------------------------------------------------------------------------

On 2014-08-23T04:54:18Z, dockimbel, commented:
<https://github.com/red/red/issues/901#issuecomment-53142821>

    Agreed. The difference comes from the way FORM (which is used internally by PRINT) processes unset! values. I see no reason not to have the same behavior as Rebol in this case.

--------------------------------------------------------------------------------

On 2019-05-17T20:48:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/901#issuecomment-493594840>

    I think this has been fixed in Red 0.6.2. `form ()` now produces `""`, consistent with R3.

