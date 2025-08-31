
#49: #include doesn't seem to accept absolute file paths
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/49>

Code:

```
Red/System []
#include %/c/Red/red-system/tests/quick-test/quick-test.reds
```

Compiler output:

```
-= Red/System Compiler =-
Compiling /c/code/red-system/test.reds ...
Script: "Red/System IA32 code emitter" (none)
** User Error: Include File Access Error: /c/Red/red-system/tests/quick-test/quick-test.reds
** Near: make error! reform ["Include File Access Error:" file]
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-24T10:13:33Z, dockimbel, commented:
<https://github.com/red/red/issues/49#issuecomment-1227258>

    Tested OK.

