
#3541: A nested named object could collide with a globally named functions
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3541>

Given the following unit test:
```
Red []
f: does [throw 10 --assert no]
g: does [f --assert no]
--assert 10 = catch [g]
ro5-o: make object! [f: make object! []]
```

### Expected behavior
Outputs: `OK`.
### Actual behavior
Outputs:
```
KO
KO
```
### Steps to reproduce the problem
Compile the code in dev mode (`-c`) and run it.

### Red and platform version
All platforms.



