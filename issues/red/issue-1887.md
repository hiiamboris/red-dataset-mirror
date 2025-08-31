
#1887: Compiler inserts a CR in literal strings line-endings
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1887>

When the following code is in a file with Windows (CR LF) endings:

```
Red []

s: {a
b}

probe s
```

The interpreter gives `"a^/b"` while the compiled executable gives `"a^M^/b"`.



