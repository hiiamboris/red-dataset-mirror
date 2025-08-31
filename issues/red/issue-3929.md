
#3929: [R/S] Undefined get-word in a literal array crashes the compiler
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3929>

The following code:
```
Red/System []

a: [0 :b]
```
crashes the compiler instead of returning an error.


