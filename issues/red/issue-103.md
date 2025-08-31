
#103: Local logic! in prin-int leaks as global function!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/103>

```
n: func [return: [logic!]] [no]
```

Leads to:

```
*** Compilation Error: attempt to redefine existing function name: n 
*** in file: %runtime/common.reds 
*** in function: prin-int
*** at:  [
    n: 0 > i 
    if n [i: 0 - i] 
    c:
]
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-24T03:14:12Z, PeterWAWood, commented:
<https://github.com/red/red/issues/103#issuecomment-1429984>

    The erroneous behaviour appears to happen with any clash between function names and local variables eg
    
    ```
    Red/System []
    
    f: func [
      /local
      f1 [integer!]
    ][
      f1: 1  
    ]
    
    f1: does [print "hello"]
    ```
    
    produces:
    
    ```
    -= Red/System Compiler =-
    Compiling /c/code/red-system/test.reds ...
    Script: "Red/System IA32 code emitter" (none)
    *** Compilation Error: attempt to redefine existing function name
    *** in file: %/c/code/red-system/test.reds
    *** in function: f
    *** at:  [
        f1: 1
    ]
    ```
    
    I will write up a test case.

--------------------------------------------------------------------------------

On 2011-06-24T08:25:19Z, dockimbel, commented:
<https://github.com/red/red/issues/103#issuecomment-1431036>

    Tested OK.

