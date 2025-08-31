
#443: FOREACH with block arguments is broken in a local context
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/443>

```
f: function [] [foreach [i j] [1 2 3 4] [print i]]
probe spec-of :f
probe do [i]
probe do [j]
```

outputs:

```
[/local i j]
none
none
3
4
```

while the expected output is:

```
[/local i j]
1
3
*** Error: word has no value!
unset
*** Error: word has no value!
unset
```



