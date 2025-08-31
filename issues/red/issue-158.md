
#158: as-integer byte! reads integer instead of byte
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/158>

```
a: as-byte 10h
b: as-byte 80h
print as-integer a
```

32784

The result is incorrect because the higher bits aren't masked. The read operation is also undesirable, because bytes are not integer aligned, and they may even be I/O addresses that are followed by unrelated I/O addresses that would trigger random hardware actions.



