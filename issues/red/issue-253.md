
#253: Red/System anonymous CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [type.wish] [Red/System]
<https://github.com/red/red/issues/253>

```
context []
```

**\* Compiler Internal Error: Script Error : Expected one of: word! - not: block! 
**\* Where: comp-context 
**\* Near:  [check-keywords name: to word! pc/-1]

I think anonymous contexts can be useful for application code that doesn't want to disturb other code, but doesn't need to be referenced outside itself.



Comments:
--------------------------------------------------------------------------------

On 2012-09-18T08:15:58Z, dockimbel, commented:
<https://github.com/red/red/issues/253#issuecomment-8644879>

    Anonymous context: why not, but it would probably be a very rarely used feature. Anyway, the current namespace handling implementation requires a name, so the only way to support it would be to generate some improbable name...but that's something the user can do itself. So, it won't be implemented in Red/System v1, but you can submit it  for Red/System v2 (the target compiler).
    
    I will fix the compiler internal error though.

