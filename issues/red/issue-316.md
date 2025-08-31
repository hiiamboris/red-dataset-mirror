
#316: Compiler is not properly reset after finding a compilation error
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/316>

When compiling Red/System code from the compiler, after finding an error in a source program the compiler will give invalid error or crash:

First test.reds

``` rebol
Red/System []

f: func [a [integer!]][1]
print f 1
```

Second test.reds

``` rebol
Red/System []

f: func [a [integer!] return: [integer!]][1]
print f 1
```

Output - Windows 7

```
>> do/args %rsc.r %../../../Code/Red-System/test.reds
Script: "Red/System compiler wrapper" (none)

-= Red/System Compiler =-
Compiling ../../../Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: return type missing in function: f
*** in file: %Code/Red-System/test.reds
*** at line: 4
*** near: [f 1]
>> do/args %rsc.r %../../../Code/Red-System/test.reds
Script: "Red/System compiler wrapper" (none)

-= Red/System Compiler =-
Compiling ../../../Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compiler Internal Error: Script Error : Out of range or past end
*** Where: resolve-path-head
*** Near:  [second either head? path [
compiler/resolve-type path/1
]]

```

Output - OS X

```
-= Red/System Compiler =- 
Compiling ../../../Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: return type missing in function: f 
*** in file: %Code/Red-System/test.reds 
*** at line: 4 
*** near: [f 1]
>> do/args %rsc.r %../../../Code/Red-System/test.reds
Script: "Red/System compiler wrapper" (none)

-= Red/System Compiler =- 
Compiling ../../../Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: type mismatch on setting path: system/args-list 
*** expected: [str-array!] 
*** found: [struct! [
        item [c-string!]
    ]] 
*** in file: %runtime/darwin.reds 
*** at line: 36 
*** near: [
    system/args-list: as str-array! system/stack/top 
    system/env-vars: system/args-list + system/args-count
]
```

The workaround is to quit the REBOL session and re-start it.



