
#306: mold of empty block consists of closing bracket only
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/306>

I compiled

```
s: mold [ ] print s/1
```

This gave the single character `]`

Mold of a non-empty block is OK, though.



