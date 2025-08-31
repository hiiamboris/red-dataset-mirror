
#229: Compiler error on bitwise not for byte! values
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/229>

The Red/System compiler gives an error on bitwise not for byte! values:

Code

``` rebol
Red/System []

not as byte! 0

```

Result

```

-= Red/System Compiler =- 
Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: argument type mismatch on calling: not 
*** expected: [not-set!], found: [byte!] 
*** in file: %/Users/peter/VMShare/Code/Red-System/test.reds 
*** at line: 3 
*** near: [
    not as byte! 0
]
```

I have commented out the byte! bitwise test group in not-test.reds until this is resolved.



