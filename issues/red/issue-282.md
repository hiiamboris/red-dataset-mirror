
#282: Context names live in a namespace of their own, and they have preference over other names
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/282>

If is allowed to write

```
c: "HELLO"
c: context [b: 2]
b: 1
print c/b
```

This yields 2, not `L`, because when analyzing `c/b`, the compiler gives preference to the interpretation "qualified name from namespace `c` " over "indexed string variable"



Comments:
--------------------------------------------------------------------------------

On 2012-10-30T16:35:57Z, dockimbel, commented:
<https://github.com/red/red/issues/282#issuecomment-9912734>

    A check to prevent collision between context name and global variable seems to be missing.

