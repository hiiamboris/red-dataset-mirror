
#559: Compiler doesn't QUOTE set-word!s
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/559>

red>> quote x/y:
== x/y:
red>> quote x:
== x:

```
Red []

quote x/y:
quote x:
```

-=== Red Compiler 0.4.0 ===- 

**\* Compilation Error: comp-literal: unsupported type x: 
**\* near: [x:]



