
#933: Compiled contexts mix up methods
================================================================================
Issue is closed, was reported by WayneCui and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/933>

Only with _compiler_ but not with _interpreter_.

```
p1: context [
    a: 1
    f: does [a]
]

ch: make p1 [a: 2 f: does [ print 100 ]]

probe ch/f
```

will output:

2

```
p1: context [
    a: 1
    f: does [a]
]

ch: make p1 [f: does [ print 100 ]]

probe ch/f
```

will output:

1



Comments:
--------------------------------------------------------------------------------

On 2014-09-15T02:21:44Z, dockimbel, commented:
<https://github.com/red/red/issues/933#issuecomment-55547956>

    Method redefinition is not yet supported in compiler.

--------------------------------------------------------------------------------

On 2014-09-16T08:35:46Z, qtxie, commented:
<https://github.com/red/red/issues/933#issuecomment-55712028>

    FYI. related issue #831 

--------------------------------------------------------------------------------

On 2014-09-29T17:48:19Z, dockimbel, commented:
<https://github.com/red/red/issues/933#issuecomment-57199975>

    This fix doesn't affect #831 as it concerns functions outside of an object's context (global words are processed differently). 

