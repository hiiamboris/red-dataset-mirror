
#552: Incorrect native code generation on complex math expression
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/552>

The following code produces a wrong result:

```
pos: as byte-ptr! "test"
cp: 0
probe pos/value
pos/value: pos/value + as-byte 1 << (cp and 7)
probe pos/value
```

outputs:

```
t
t
```

instead of:

```
t
u
```



