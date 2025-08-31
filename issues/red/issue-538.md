
#538: red.r doesn't detect Red/System file
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/538>

A regression from #537:

```
Red/System []
```

-=== Red Compiler 0.3.3 ===- 

Compiling /home/kaj/Red/REBOL-3/examples/test.reds ...

Compiling to native code...
**\* Compilation Error: source is not a Red/System program 
**\* in file: %_**sys-global.reds 
*_\* at line: 1 
**\* near: []



