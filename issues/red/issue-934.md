
#934: Compiler can't wrap existing functions anymore
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/934>

```
Red []

print*: :print
print: does []
```

-=== Red Compiler 0.4.3 ===- 

**\* Red Compiler Internal Error: Script Error : Value out of range: 2 
**\* Where: check-func-name 
**\* Near:  [pos/2: new]

This is a regression since the modification for #927.



Comments:
--------------------------------------------------------------------------------

On 2014-10-23T16:23:32Z, dockimbel, commented:
<https://github.com/red/red/issues/934#issuecomment-60266152>

    This issue has been fixed by recent commits. As per commit [952aa192](https://github.com/red/red/commit/055f0183a82377afbd0445811be36ac2952aa192), the issue cannot be reproduced.

