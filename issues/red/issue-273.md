
#273: modulus on floats expects numbers
================================================================================
Issue is closed, was reported by nicolas42 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/273>

4.0 // 2.0

-= Red/System Compiler =-
Compiling tests/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
**\* Compilation Error: argument type mismatch on calling: //
**\* expected: [number!], found: [float!]
**\* in file: %tests/test.reds
**\* in function: main
**\* at line: 21
**\* near: [
    4.0 2.0
]

**\* Compilation Error: argument type mismatch on calling: //
**\* expected: [number!], found: [float!]



Comments:
--------------------------------------------------------------------------------

On 2012-10-11T14:22:51Z, dockimbel, commented:
<https://github.com/red/red/issues/273#issuecomment-9341632>

    Fix pushed to v0.3.0 branch, it can be propagated to master branch if you need it.

