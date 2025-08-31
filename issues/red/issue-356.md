
#356: empty true block for if gives error in interpreter
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/356>

```
red>> if true []
==
*** Script error: action 6 not defined for type: 0
```

same holds for `unless`, and for true/false blocks in `either`
if  the selected block in `switch` is empty, the value of the selector is returned
in all of these cases, R2 and R3 return `unset!`
the compiled Red code does not give an error, but not `unset!` either, so this is something more fundamental, probably  



Comments:
--------------------------------------------------------------------------------

On 2012-12-30T17:16:21Z, meijeru, commented:
<https://github.com/red/red/issues/356#issuecomment-11766525>

    Should I make a separate issue for the compiler?

--------------------------------------------------------------------------------

On 2012-12-31T08:17:07Z, dockimbel, commented:
<https://github.com/red/red/issues/356#issuecomment-11773916>

    Yes please.

