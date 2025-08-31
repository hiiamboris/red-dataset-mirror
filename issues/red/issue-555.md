
#555: Using logic literal values with bitwise operators crashes the compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/555>

[ true and true ] crashes the compiler on the parse branch and gives a compilation error on the main branch

Code

```
Red/System []
 true and true
```

Output (parse branch)

```
-=== Red Compiler 0.4.0 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Invalid argument: none 
*** Where: emit-integer-operation 
*** Near:  [switch to path! reduce [a b]] 
```

The same code gives a compilation error under the master branch:

```
Compiling to native code...
*** Compilation Error: argument type mismatch on calling: and 
*** expected: [number!], found: [logic!] 
*** in file: %/Users/peter/VMShare/Code/Red-System/test.reds 
*** at line: 2 
*** near: [and 
    true true
]
```



