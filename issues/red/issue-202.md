
#202: string path index out of range access
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/202>

I think this should throw an error:

```
a: "123" print [a/7]
```



Comments:
--------------------------------------------------------------------------------

On 2012-01-31T16:25:33Z, dockimbel, commented:
<https://github.com/red/red/issues/202#issuecomment-3742201>

    This kind of error cannot be detected because c-string are zero-terminated sequence of bytes with no size encoding (in order to interface easily with C libraries). Once we get array support, we will be able to implement bound-checking.

