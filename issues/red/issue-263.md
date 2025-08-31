
#263: Casting byte values to integer! not recognized by bitshift operators
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/263>

The following code crashes the compiler:

```
Red/System [ ]

p1: as byte-ptr! "test"
a: (as-integer p1/value) << 8
print a
```



