
#159: as-integer byte! reads integer instead of byte on assignment
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/159>

#158 is fixed now, but here is the next more complex:

```
a: as-byte 10h
b: as-byte 80h
c: as-integer a
print c
```

32784



