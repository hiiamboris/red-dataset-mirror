
#46: logical and with byte! as second operand crashes compiler
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/46>

The logical operations should take bytes as well as integers. However, a byte as second operand yields:

```
** Script Error: to-bin32 expected v argument of type: integer
** Where: emit-bitwise-op
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-24T10:05:18Z, dockimbel, commented:
<https://github.com/red/red/issues/46#issuecomment-1227221>

    Tested OK.

