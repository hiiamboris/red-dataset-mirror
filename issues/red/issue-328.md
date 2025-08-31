
#328: Error reporting: source file not indicated at first (?) error
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/328>

My source file, `%mytest.red`, contained the single word `x`. The compiler rightly protests, but it says the error occurred in file `%boot.red`

```
x
-= Red Compiler =-
Compiling red/tests/mytest.red ...
*** Compilation Error: undefined word x
*** in file: %red/boot.red
*** near: [
    x
]
```



