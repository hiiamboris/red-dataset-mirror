
#5391: [Draw] Shapes can't use grouping
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5391>

**Describe the bug**

Docs state:
> Inside Draw code, commands can be arbitrarily grouped using blocks. Semantics remain unchanged, this is currently just a syntactic sugar allowing easier group manipulations of commands (notably group extraction/insertion/removal). Empty blocks are accepted.

However this is not true inside `shape`:
```
>> draw 1x1 [shape [[]]]
*** Script Error: invalid Draw dialect input at: [[]]
*** Where: draw-image
*** Near : draw 1x1 [...]
*** Stack: draw 
```

**Expected behavior**

If possible, shape should support grouping. If not, docs mention this.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4999 date: 27-Sep-2023/10:17:47 commit: #6ddd85f793e2e5421fac0155ce500e2d5600026b ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-06T15:22:38Z, dockimbel, commented:
<https://github.com/red/red/issues/5391#issuecomment-1750890127>

    I don't see any a priori reason to not support it.

