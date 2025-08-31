
#1259: negate on bitsets does not work
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/1259>

According to the code, it should have the same effect as complement. However, it does nothing:

```
red>> negate charset "abc"
== make bitset! #{00000000000000000000000070}
red>> charset "abc"
== make bitset! #{00000000000000000000000070}
```



Comments:
--------------------------------------------------------------------------------

On 2015-07-24T11:31:01Z, meijeru, commented:
<https://github.com/red/red/issues/1259#issuecomment-124491501>

    The commit has been merged; the issue can therefore be closed.

