
#484: Copying bytes to memory allocated to a pointer in a structure give incorrect results
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/484>

When assigning individual bytes from memory allocated to a structure member to memory allocated to another structure member, the value is not correctly copied. 

This example shows the result of such copying when the byte-ptr! which holds the address of the memory is part of a structure and when it is not:

Code

```
Red/System []

print ["memory allocated as part of structure" lf]

LTM-MP-int!: alias struct! [
    used            [integer!]
    alloc           [integer!]
    sign            [integer!]
    mp-digit        [byte-ptr!]
]

mp1: declare LTM-MP-int!
mp2: declare LTM-MP-int!

mp1/mp-digit: allocate 10
mp2/mp-digit: allocate 10

bp1: mp1/mp-digit
bp2: mp2/mp-digit

i: 1
until [
    bp1/value: as byte! 1
    bp2/value: as byte! 0
    bp1: bp1 + 1
    bp2: bp2 + 1
    i: i + 1
    i > 10
]

i: 1
until [
    print ["Source " as integer! mp1/mp-digit/value lf]
    print ["Target before assignment " as integer! mp2/mp-digit/value lf]
    mp2/mp-digit/value: mp1/mp-digit/value
    print ["Target after assignment " as integer! mp2/mp-digit/value lf]
    mp1/mp-digit: mp1/mp-digit + 1
    mp2/mp-digit: mp2/mp-digit + 1
    i: i + 1
    i > 10
]

print ["memory allocated to 'root' variable" lf]

a: declare byte-ptr!
b: declare byte-ptr!
a: allocate 10
b: allocate 10
ai: a
bi: b

i: 1
until [
    ai/value: as byte! 1
    bi/value: as byte! 0
    ai: ai + 1
    bi: bi + 1
    i: i + 1
    i > 10
]

i: 1
until [
    print ["Source " as integer! a/value lf]
    print ["Target before assignment " as integer! b/value lf]
    b/value: a/value
    print ["Target after assignment " as integer! b/value lf]
    a: a + 1
    b: b + 1
    i: i + 1
    i > 10
]
```

Output

```
-= Red/System Compiler =- 
Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
Script: "Red/System Mach-O format emitter" (none)

...compilation time:     119 ms
...linking time:         6 ms
...output file size:     20480 bytes
...output file name:     builds/test
memory allocated as part of structure
Source 1
Target before assignment 0
Target after assignment 96
Source 1
Target before assignment 0
Target after assignment 97
Source 1
Target before assignment 0
Target after assignment 98
Source 1
Target before assignment 0
Target after assignment 99
Source 1
Target before assignment 0
Target after assignment 100
Source 1
Target before assignment 0
Target after assignment 101
Source 1
Target before assignment 0
Target after assignment 102
Source 1
Target before assignment 0
Target after assignment 103
Source 1
Target before assignment 0
Target after assignment 104
Source 1
Target before assignment 0
Target after assignment 105
memory allocated to 'root' variable
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
Source 1
Target before assignment 0
Target after assignment 1
```



Comments:
--------------------------------------------------------------------------------

On 2013-06-01T11:24:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/484#issuecomment-18787439>

    This may well be a different symptom of the bug in Issue #483 as the same workaround can be applied.

--------------------------------------------------------------------------------

On 2013-06-01T22:25:49Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/484#issuecomment-18798173>

    That looks like an important path setting bug. I don't think it's the same as #483, because that's a compile time limitation.

--------------------------------------------------------------------------------

On 2013-06-05T17:51:20Z, dockimbel, commented:
<https://github.com/red/red/issues/484#issuecomment-18994855>

    This commit introduces regressions in Red runtime code that are not caught by Red/System tests suite.

