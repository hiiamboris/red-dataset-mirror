
#5092: Red Compiler crashes when function lacks argument
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5092>

**Describe the bug**
```
Red []

#system [
    fn: func [x [integer!]][probe x]
    fn
]
```
Compiling:
```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : emit-push expected value argument of type: char logic integer word block string tag path get-word object decimal issue
*** Where: emit-argument
*** Near:  [forall list [
expr: list/1
if block? unbox/deep expr [comp-expression expr yes]
if object? expr [cast expr]
if type <> 'inline [
either all [types not tag? expr block? types/1 'value = last types/1] [
emitter/push-struct expr resolve-aliased types/1
] [
emitter/target/emit-argument expr fspec
]
]
if types [types: skip types -2]
]]
```

**Expected behavior**

`*** Compilation Error: fn is missing an argument` like in R/S scripts

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-04T18:01:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5092#issuecomment-1059393670>

    See also https://github.com/red/red/issues/5091 could be related

--------------------------------------------------------------------------------

On 2022-03-04T18:04:09Z, dockimbel, commented:
<https://github.com/red/red/issues/5092#issuecomment-1059395723>

    I think this one is just missing a simple check for reaching tail of a block while trying to fetch a required argument, should be an easy fix.

--------------------------------------------------------------------------------

On 2022-03-08T07:39:19Z, planetsizecpu, commented:
<https://github.com/red/red/issues/5092#issuecomment-1061492645>

    Last automatic build of 03-06-2022 gave me this:
    
    ```
    PS C:\redlang> .\red
    Compiling compression library...
    Compiling Red GUI console...
    *** Compilation Error: missing argument
    *** in file: %/C/ProgramData/Red/GUI/gui-console.red
    *** in function: exec/f_ctx||272~on-change*
    *** at line: 1
    *** near: [true
        #script %/C/ProgramData/Red/GUI/gui-console.red
    ]
    ```
    But I can't determine if it is related to #5092 or #5091

--------------------------------------------------------------------------------

On 2022-03-08T17:47:24Z, dockimbel, commented:
<https://github.com/red/red/issues/5092#issuecomment-1062041196>

    Regression should be fixed now.

--------------------------------------------------------------------------------

On 2022-03-09T14:41:12Z, planetsizecpu, commented:
<https://github.com/red/red/issues/5092#issuecomment-1062990991>

    Yes, now the console works as normal, thx guys.

