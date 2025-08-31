
#45: multiplication with byte! as second operand crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/45>

One can multiply (divide, take modulo of) integers and bytes in any combination. The result has the type of the left operand. However when multiplying with a byte! as second operand, the power-of-two optimization plays havoc.

```
** Script Error: power-of-2? expected n argument of type: integer
** Where: emit-math-op
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-24T10:04:52Z, dockimbel, commented:
<https://github.com/red/red/issues/45#issuecomment-1227217>

    Tested OK.

