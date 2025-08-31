
#928: Nested contexts mix up fields
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/928>

```
Red []

o: object [
    a: 1

    c: context [
        b: 2

        f: does [print a]
    ]
]
o/c/f
```

Compiler:

2

Interpreter:

**\* Error: word has no value!
**\* Error: word has no value!

**\* Script error: action 7 not defined for type: 2



Comments:
--------------------------------------------------------------------------------

On 2014-09-13T03:59:07Z, dockimbel, commented:
<https://github.com/red/red/issues/928#issuecomment-55480980>

    This is a recently introduced regression.

