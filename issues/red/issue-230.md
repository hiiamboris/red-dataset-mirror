
#230: Compiler rejects pointer as function argument
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[Red/System]
<https://github.com/red/red/issues/230>

I'm not sure it this is a bug or a wish, but using the new syntax to get the address of a variable is not accepted as a function argument by the compiler.

If this is not allowed, the compiler error message is probably a bug.

Code

``` rebol
Red/System []

i: 10

add-one: func [
  pi [pointer! [integer!]]
][
  pi/value: pi/value + 1
]

add-one :i

either i = 11 [print ["correct" lf] ][ print ["incorrect" lf] ]

```

Output

```

-= Red/System Compiler =- 
Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compilation Error: function i not defined 
*** in file: %/Users/peter/VMShare/Code/Red-System/test.reds 
*** at line: 11 
*** near: [:i 
    either i = 11 [print ["correct" lf]] [print ["incorrect" lf]]
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-08-02T09:31:00Z, PeterWAWood, commented:
<https://github.com/red/red/issues/230#issuecomment-7450811>

    False alarm - running against V0.3.0 instead of master.

