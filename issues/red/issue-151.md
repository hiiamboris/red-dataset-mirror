
#151: Expression start lost in complex expression ending with multiplication
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/151>

```
a: declare struct! [value [integer!]]
a/value: 0
p: as pointer! [byte!] a
print-hex as-integer p
print-newline
print-hex as-integer p +
    1 +
    (1 * 3)
```

804AEF2
3

Changing almost anything in the format of the last expression makes the problem go away.



Comments:
--------------------------------------------------------------------------------

On 2011-08-11T13:18:59Z, dockimbel, commented:
<https://github.com/red/red/issues/151#issuecomment-1781717>

    This bug reveals a flaw in the native code generated to store intermediary results of nested operations. This happens only when multiplication or division are used nested. This need a deep fix, like allocating a different register or using the stack to avoid clashes.

