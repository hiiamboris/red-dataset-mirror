
#1184: equal?  and lesser? behave differently when invoked with no arguments
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1184>

In the interpreter:

```
red>>equal?
== true

red>>lesser?
*** Internal error: reserved for future use (or not yet implemented)
*** Where: lesser?
```

Both behaviours seem inappropriate. The first one is shared by strict-equal? and not-equal?, the second one by the other inequality testing functions.



Comments:
--------------------------------------------------------------------------------

On 2015-05-27T15:59:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1184#issuecomment-105975248>

    Good catch. The injection of `unset` values (which is causing this behavior) should be more restricted. It will now happen only if the spec argument is a `lit-word!` and if it accepts `unset!` values.

