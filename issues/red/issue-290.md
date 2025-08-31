
#290: Strange error when trying to compile an #enum
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/290>

```
#enum color! [a b c]
print #"^(0A)"

-= Red/System Compiler =-
Compiling tests/mytest.reds ...
*** Compilation Error: type mismatch on setting path: char/1
*** expected: [byte!]
*** found: [integer!]
*** in file: %runtime/utils.reds
*** in function: prin-byte
*** at line: 30
*** near: [
    char/1: c
    prin char
    c
]
```

I frankly don't understand where the prin-byte comes in during compilation?



Comments:
--------------------------------------------------------------------------------

On 2012-11-01T20:41:25Z, dockimbel, commented:
<https://github.com/red/red/issues/290#issuecomment-9995053>

    `print` is a variadic function that calls `_print` which itself calls `prin-byte`. Square brackets around variadic function's arguments can be omitted if there is a single argument.

--------------------------------------------------------------------------------

On 2012-11-02T12:53:00Z, meijeru, commented:
<https://github.com/red/red/issues/290#issuecomment-10013313>

    But why does the compiler reference a path-assignment, and a function that is not even directly called from the soure?

--------------------------------------------------------------------------------

On 2012-11-02T13:26:40Z, dockimbel, commented:
<https://github.com/red/red/issues/290#issuecomment-10014092>

    Looks like a compiler bug, probably a clash between the enumeration symbol `c` and the local variable `c` from `prin-byte`.

