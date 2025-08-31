
#838: print does not output any characters after a null-byte in a string
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/838>

Code

```
Red[]
print "a^(00)b^(00)"
```

Result

```
Schulz:Red peter$ ./test
a
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-30T12:36:54Z, Oldes, commented:
<https://github.com/red/red/issues/838#issuecomment-44645774>

    It's duplicate of #829

--------------------------------------------------------------------------------

On 2014-05-30T12:50:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/838#issuecomment-44646828>

    Closed as duplicate.

