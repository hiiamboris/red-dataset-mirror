
#4031: [R/S] Regression on compiling set-paths on literal array of floats
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4031>

```
Red/System []

a: [1e-16 1e-32 1e-64 1e-128 0.0]
a/5: 9007199254740992.0 * 9007199254740992e-256
```
when compiled, gives a compilation error:
```
*** Compilation Error: type mismatch on setting path: a/5
*** expected: [integer!]
*** found: [float!]
*** in file: %/C/Dev/Red/system/tests/test2.reds
*** at line: 4
*** near: [
    a/5: * 9.00719925474099E+15 9.00719925474099E-241
```


