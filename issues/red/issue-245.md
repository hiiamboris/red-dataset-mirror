
#245: Multiple struct members with identical name allowed
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/245>

```
a: declare struct! [
    b [integer!]
    b [byte!]
]

a/b: 123
print a/b
```

Compiles with no error and outputs 123.

It should raise a compilation error on `b` name being used more than once in the struct definition.



