
#291: Context names may still overlap with local variable names/formal args
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/291>

In a previous issue (now closed) I noted that context names may overlap with variable names. The clash with global variables has been repaired, but they can still be the same as local names:

```
f: func[a [integer!]][a: context [b: 1]]

-= Red/System Compiler =-
Compiling tests/mytest.reds ...

...compilation time:     703 ms
...linking time:         953 ms
...output file size:     15360 bytes
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-01T20:41:39Z, dockimbel, commented:
<https://github.com/red/red/issues/291#issuecomment-9995059>

    Good catch!

