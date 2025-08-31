
#1329: AND~ OR~ and XOR~ do not allow binary! for their argument type
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1329>

These actions ARE defined by `%runtime/datatypes/binary.reds`, but the definition in `%environment/actions.red` omits `binary!` from the spec.

```
red>> and~ #{01} #{FF}
*** Script error: and~ does not allow binary for its value1 argument
*** Where: and~
```

Curiously, the infix operator `and` which has the same argument spec as `and~` DOES allow binary arguments, but always seems to yield the first argument as result, regardless of the second argument.



