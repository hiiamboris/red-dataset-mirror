
#127: Built-in PRINT functions should use C library
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/127>

PRINT and friends are currently implemented as syscalls. When they are mixed with printing functions from the C library, this works very confusing, because the C library does buffering, which the built-in functions disregard.

When Red uses the C library, the built-in printing functions should also go through it.



