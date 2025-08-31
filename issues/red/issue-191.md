
#191: #define including < crashes compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/191>

The following program crashes the compiler

``` REBOL
Red/System []

#define more-than-one? [1 <]

if more-than-one? 2 [print "more than one"]

```

The complier output is

```
-= Red/System Compiler =- 
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Loading Error: syntax error during LOAD phase: make object! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: "tag"
    arg2: "<"
    arg3: none
    near: "(line 3) #L 3 #define more-than-one? [1 <]"
    where: none
] 
*** in file: %runtime/BSD.reds 
*** at line: 185 
*** near: []
```



Comments:
--------------------------------------------------------------------------------

On 2011-12-28T12:07:07Z, dockimbel, commented:
<https://github.com/red/red/issues/191#issuecomment-3290251>

    This is a known issue with REBOL lexer. The workaround for this is to put a space after the `<` character. So this version compiles fine:
    
    ```
    Red/System []
    
    #define more-than-one? [1 < ]
    
    if more-than-one? 2 [print "more than one"]
    ```

