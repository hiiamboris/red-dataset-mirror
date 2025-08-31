
#2311: Crash when performing AND on bitsets
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2311>

The following works fine:
```
b: make bitset! 16
b and #{} ; == #{0000}
```
But the following crashes the interpreter:
```
b: make bitset! 128
b and #{} ; => console closes without message
```

Mind you, these computations may make little sense, but there is no reason why the longer one should crash when the shorter one works fine.


