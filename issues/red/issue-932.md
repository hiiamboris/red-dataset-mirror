
#932: Multi-inherited context mix up methods
================================================================================
Issue is closed, was reported by WayneCui and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/932>

Both for interpreter and compiler:

```
p1: context [
    a: 1
    f: does [a]
]

p2: context [
    a: 2
    f: does [ print 100 ]
]

ch: make p1 p2

probe ch/f
```

Interpreter: 

1

Compiler:

2



Comments:
--------------------------------------------------------------------------------

On 2014-09-28T15:29:04Z, dockimbel, commented:
<https://github.com/red/red/issues/932#issuecomment-57088922>

    Issue for the interpreter has been fixed by commit: [cc9d8d99](https://github.com/red/red/commit/b3f5ac66af4655613551a98ee11612cfcc9d8d99).

