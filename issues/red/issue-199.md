
#199: if test inside switch default clause gives compiler error
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/199>

An if test inside the default clause of a switch statement causes a compiler error:

Code:

``` rebol

Red/System []
print ["started" lf]

dm: 12
dd: 31

switch dm [
    2 [
      if dd > 29 [print [8 lf]]
    ]
    4 6 9 11 [
      if dd > 30 [print [8 lf]]
    ]
    default [
      if dd > 31 [print [0 lf]]
    ]
]

print [0 lf]

print ["finished" lf]

```

Compiler output:

```
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

This code compiles and runs correctly:

``` rebol

Red/System []
print ["started" lf]

dm: 12
dd: 31

switch dm [
    2 [
      if dd > 29 [print [8 lf]]
    ]
    4 6 9 11 [
      if dd > 30 [print [8 lf]]
    ]
    default [
      print [0 lf]
    ]
]

print [0 lf]

print ["finished" lf]

```



Comments:
--------------------------------------------------------------------------------

On 2012-01-16T10:02:58Z, dockimbel, commented:
<https://github.com/red/red/issues/199#issuecomment-3508486>

    This code compiles and runs fine here. I cannot reproduce the issue. Are you sure you have pulled the #198 bug fix? (It is in `master` branch only for now).

--------------------------------------------------------------------------------

On 2012-01-16T12:19:14Z, PeterWAWood, commented:
<https://github.com/red/red/issues/199#issuecomment-3509932>

    Sorry I must have run my test with the float-partial branch checked out. As you say it is fine with the master branch.
    
    On 16 Jan 2012, at 18:02, Nenad Rakocevic wrote:
    
    > This code compiles and runs fine here. I cannot reproduce the issue. Are you sure you have pulled the #198 bug fix? (It is in `master` branch only for now).
    > 
    > ---
    > 
    > Reply to this email directly or view it on GitHub:
    > https://github.com/dockimbel/Red/issues/199#issuecomment-3508486

