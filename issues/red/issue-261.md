
#261: red/platform/prin missing on Linux and Syllable
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[type.bug] [status.resolved] [Red/System]
<https://github.com/red/red/issues/261>

```
-= Red Compiler =- 
Compiling /resources/Red/tests/hello.red ...

...compilation time:     215 ms

Compiling to native code... 

*** Compilation Error: undefined symbol: red/platform/prin 
*** in file: %runtime/utils.reds 
*** in function: prin-byte
*** at line: 30 
*** near: [red/platform/prin char 
    c
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-10-25T17:33:58Z, dockimbel, commented:
<https://github.com/red/red/issues/261#issuecomment-9786561>

    I'm closing this ticket and opening a new one to document the include-related problem (issue #277).

