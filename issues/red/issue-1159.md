
#1159: Compiler issue when auto collecting local variables in function
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1159>

``` rebol
Red []

f: function [
    /a
    /b
][
    if a [b: true]
]
```

returns error:

```
Compiling to native code...
*** Compilation Error: local variable ~local used before being initialized! 
*** in file: %/red/test.red 
*** in function: exec/f_f
*** at line: 1 
*** near: [~local ts133 1 ~a + 1 
    ~local: ~b
]
```

while using `func` instead of `function`compiles fine.

``` rebol
Red []

f: func [
    /a
    /b
][
    if a [b: true]
]
```



