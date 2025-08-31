
#553: QUOTE function doesn't work as expected
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/553>

QUOTE does not handle get-words arguments correctly:

From the compiler:

```
b: 23
probe quote b
probe quote :b
```

will crash the compiler.

From the interpreter:

```
red>> b: 23
== 23
red>> quote b
== b
red>> quote :b
== 23
```

The expected result for the last entry is `:b`.



