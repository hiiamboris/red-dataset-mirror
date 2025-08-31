
#9: Using structure member as argument to function crashes Red/System compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.tested]
<https://github.com/red/red/issues/9>

Using a member of a structure as an argument to a function crashes the compiler. Example script:

```
Red/System []

tf: func [
    i [integer!]
][
    i
]

s: struct [
    j [integer!]
]

s/j: 1

tf s/j
```

produces the following;

```
-= Red/System Compiler =-
Compiling /c/code/red-system/test.reds ...
Script: "Red/System IA32 code emitter" (none)
** Script Error: emit-push expected value argument of type: integer word block string
** Where: emit-call
** Near: emit-push arg
```



Comments:
--------------------------------------------------------------------------------

On 2011-04-07T01:57:31Z, PeterWAWood, commented:
<https://github.com/red/red/issues/9#issuecomment-967085>

    I also crashed the complier with a simple assignment of a structure member:
    
    Code: 
    Red/System []
    
    s: struct [
      j [integer!]
    ]
    
    s/j: 1
    k: s/j
    
    output:
    
    -= Red/System Compiler =-
    Compiling /c/code/red-system/test.reds ...
    Script: "Red/System IA32 code emitter" (none)
    *\* Script Error: insert expected count argument of type: number pair
    *\* Where: store-global
    *\* Near: insert/dup ptr null size

--------------------------------------------------------------------------------

On 2011-04-27T18:52:04Z, dockimbel, commented:
<https://github.com/red/red/issues/9#issuecomment-1066046>

    Bugs fixed by this commit: https://github.com/dockimbel/Red/commit/4e96eec3e4d8d79e72b3d77bcc290b6e8d635143

--------------------------------------------------------------------------------

On 2011-05-09T11:33:37Z, dockimbel, commented:
<https://github.com/red/red/issues/9#issuecomment-1122334>

    Tested OK.

