
#4930: [Compiler] Namespaces clash between routine names and runtime library
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.waiting] [type.review]
<https://github.com/red/red/issues/4930>

**Describe the bug**

Routines are defined for access from Red-only code, and should only share names with other `system/words` content. However, if routine name uses any of the names used by Red runtime, compilation becomes impossible.

**To reproduce**

Example (originally an attempt to make an FP-like `map` routine, minified):
```
Red []
map: routine [x [any-type!] y [any-type!] return: [integer!]] [0]
probe map :length? ["abc" "de" "f"]
```
Compiled as `-c -d` works! Compiled as `-r -d`:
```
*** Compilation Error: undefined symbol: red/map
*** in file: %utils/preprocessor.r
*** at line: 1
*** near: [
    :map 11 false
    word/set
    stack/unwind
    stack/reset
    stack/mark-func ~probe
]
```

---
Now, using a bolder name (also a valid verb - `block some-process`):
```
Red []
block: routine [return: [integer!]] [0]
probe block
```
Compiled as `-r -d`:
```
*** Compilation Error: invalid path value: exec/block/push
*** in file: %/D/devel/red/red-src/red/2.red
*** in function: exec/f_routine
*** at line: 1
*** near: [
    word/push ~routines
    exec/block/push get-root 1138
    f_cause-error
    stack/unwind
    stack/unwind-last
]
```
---
Even bolder still (also a valid verb - `stack things`):
```
Red []
stack: routine [return: [integer!]] [0]
probe stack
```
Compiled as `-r -d`:
```
*** Compilation Error: invalid path value: exec/stack/mark-native
*** in file: %utils/preprocessor.r
*** at line: 1
*** near: [[return: [integer!]] [0]
    exec/stack/mark-native ~set
    word/push ~stack
    routine/push get-root
]
```

**Expected behavior**

I suppose routine names must be decorated somehow or put into another context during compilation, as this is quite limiting. All names should be valid, even if they break Red later at run time (e.g. `none` or `set`).

**Platform version**
```
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-21T13:19:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4930#issuecomment-884183989>

    > Routines are defined for access from Red-only code
    
    That is a wrong assumption, they are meant to be accessible from both Red and R/S (in case you write some valuable piece of R/S code that you want to use at both levels), that's why their names are not decorated, but left untouched. 
    
    TBH, I'm not sure how much that feature has been used, one should review some library code in red/code and the work of François on RedCV. I can't remember if we rely on it in the Red runtime itself.

--------------------------------------------------------------------------------

On 2021-07-21T14:29:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4930#issuecomment-884236366>

    I've found a workaround for now (aliasing):
    ```
    Red []
    map*: routine [x [any-type!] y [any-type!] return: [integer!]] [0]
    map: :map*
    probe map :length? ["abc" "de" "f"]
    ```
    This compiles fine.

--------------------------------------------------------------------------------

On 2021-07-23T17:08:33Z, dockimbel, commented:
<https://github.com/red/red/issues/4930#issuecomment-885778858>

    I'm closing this ticket as no changes are needed for now.

