
#24: Bug in set-width (?)
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/24>

I was trying to write my own (primitive) version of the 'form function, and hit on the following bug, when compiling 

```
red/system []
i: 3
s: "          "
s/1: as byte! ((i // 10) + 48)
print s
```

Result:

```
** Script Error: size-of? expected type argument of type: word
** Where: set-width
** Near: width: emitter/size-of? operand-type? operand
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-01T10:58:59Z, dockimbel, commented:
<https://github.com/red/red/issues/24#issuecomment-1082984>

    Looking into it right now.

--------------------------------------------------------------------------------

On 2011-05-01T11:12:34Z, dockimbel, commented:
<https://github.com/red/red/issues/24#issuecomment-1083004>

    Fixed in commit: https://github.com/dockimbel/Red/commit/ed4f1eab64afcb4b5918219944f1069cb1ce7ba8

--------------------------------------------------------------------------------

On 2011-05-09T11:42:36Z, dockimbel, commented:
<https://github.com/red/red/issues/24#issuecomment-1122366>

    Tested OK.

