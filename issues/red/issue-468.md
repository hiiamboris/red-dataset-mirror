
#468: Code in parentheses gives error in routine!
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/468>

The following code (which compiles under Red/System) gives an error when compiled as a routine!

Code

```

Red []

r: routine [
    /local
    b               [byte!]
    cp              [integer!]
][
    cp: 1
    b: as byte! (cp >>> 6)              
]
```

Compiler output

```
-= Red Compiler =- 
Compiling /Users/peter/VMShare/Code/Red/test2.red ...

...compilation time:     123 ms

Compiling to native code... 

*** Compilation Error: more than one expression found in parentheses 
*** in file: %/Users/peter/VMShare/Code/Red/test2.red 
*** in function: exec/r
*** at line: 126 
*** near: (>>> 6)
```



