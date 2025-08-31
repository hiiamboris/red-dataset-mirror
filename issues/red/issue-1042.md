
#1042: Compiler error for function power
================================================================================
Issue is closed, was reported by iArnold and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1042>

Red []

varia: 0
print power -1 varia

varia: 1
print power -1 varia

> > do/args %red.r "-c  % .. /test/power.red"

-=== Red Compiler 0.5.0 ===-

Compiling /C/ .. /test/power.red ...
...compilation time : 496 ms

Compiling to native code...
**\* Compilation Error: undefined symbol: ts606
**\* in file: %/C/ .. /test/power.red
**\* in function: exec/f_modulo
**\* at line: 1
**\* near: [ts606 0 stack/arguments
    ~b: type-check ts606 1 ~a
]



