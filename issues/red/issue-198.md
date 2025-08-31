
#198: Using Until within Switch statement raises compiler error
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/198>

Using until within a switch statement raises a compiler error. See the following example:

Code

``` rebol
Red/System []
print ["started" lf]

f: func [
  i               [integer!]
  s               [c-string!]
  return:         [integer!]
  /local
  divisor         [integer!]
][
  divisor: 0

  switch i [
    0 [
      return 0
    ]
    -2147483648 [
      return 0
    ]
    default [
      until [
        divisor = 0
      ]
    ]
  ]
  0
]

s: "       "
f 1 s
print [s lf]

print ["finished" lf]

```

Output

```
-= Red/System Compiler =-
Compiling /Users/peter/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compiler Internal Error: Script Error : size-of? expected type argument of type: word block
*** Where: get-width
*** Near:  [emitter/size-of? value: case [
type [operand]
'else [
value: first compiler/get-type operand
either value = 'any-pointer! ['pointer!] [value]
]
]
value
]

```

I have made a note to add this to add this as a test in switch-test.reds but can't do so just now.



