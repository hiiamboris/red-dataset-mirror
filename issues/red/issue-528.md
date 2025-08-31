
#528: EITHER corrupts pointer arithmetic
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/528>

```
Red/System []

s: system/args-list + either yes [0] [1]
print-wide [system/args-list s]
```

FFCBF074 FEFBB194

Oddly, I can't reproduce this with a pointer of my own.



Comments:
--------------------------------------------------------------------------------

On 2013-09-14T14:19:56Z, dockimbel, commented:
<https://github.com/red/red/issues/528#issuecomment-24447513>

    This case is a bug, but in general case, watch out when using EITHER return value in an expression, it is less flexible in Red/System than Red, and using EITHER as an argument to a multiple arity function call will lead to runtime crashes, especially on ARM. So far, it seems that using it as math operand is safe though. This EITHER issue was referenced in a long-lasting ticket, but I can't find it anymore...(can only find #192, which is also related)

--------------------------------------------------------------------------------

On 2013-09-14T22:11:14Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/528#issuecomment-24460256>

    I think #192 was the only similar ticket, but as you said, this is a different issue.

