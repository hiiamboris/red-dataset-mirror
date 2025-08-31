
#50: multi-line comment cannot be used inside until loop
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/50>

code:

```
Red/System []
until [
  comment {my comment}
  1 = 1
]
```

compiler output:

```
-= Red/System Compiler =-
Compiling /c/code/red-system/test.reds ...
Script: "Red/System IA32 code emitter" (none)
*** Compilation Error: undefined symbol: comment
*** in: %/c/code/red-system/test.reds
*** at:  [
    comment "my comment" 1 = 1
]
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-23T21:27:19Z, meijeru, commented:
<https://github.com/red/red/issues/50#issuecomment-1224429>

    Such a comment is effectively only allowed at the first level in a program or function body. See comp-dialect.

--------------------------------------------------------------------------------

On 2011-05-24T03:44:33Z, PeterWAWood, commented:
<https://github.com/red/red/issues/50#issuecomment-1225879>

    The Red/System Specification (2.1) doesn't mention any restriction on the use of multi-line comments. Hence I raised this issue.

--------------------------------------------------------------------------------

On 2011-05-24T10:15:24Z, dockimbel, commented:
<https://github.com/red/red/issues/50#issuecomment-1227266>

    I guess there is no point in not allowing it at any position in the code.

--------------------------------------------------------------------------------

On 2011-05-24T10:41:03Z, dockimbel, commented:
<https://github.com/red/red/issues/50#issuecomment-1227366>

    Tested OK.

