
#89: Too aggressive hex literals parsing
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/89>

The following code:

```
OemToChar: 123
```

wrongly produces the following compilation error:

```
** User Error: Invalid hex literal: Char: 123
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T19:24:47Z, dockimbel, commented:
<https://github.com/red/red/issues/89#issuecomment-1336576>

    Tested OK.

