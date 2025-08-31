
#1923: BREAK in FORALL doesn't keep block's index
================================================================================
Issue is closed, was reported by x8x and has 4 comment(s).
[status.built] [status.tested] [type.bug] [type.review]
<https://github.com/red/red/issues/1923>

rebol:

```
  a: [1 2 3] forall a [if a/1 = 2 [break]]
  a
;   [2 3]
```

red:

```
  a: [1 2 3] forall a [if a/1 = 2 [break]]
  a
;   [1 2 3]
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-22T11:51:59Z, dockimbel, commented:
<https://github.com/red/red/issues/1923#issuecomment-220828363>

    As a side-note, that code compiled is crashing.

--------------------------------------------------------------------------------

On 2016-05-22T12:08:40Z, dockimbel, commented:
<https://github.com/red/red/issues/1923#issuecomment-220828968>

    The crash on compiled version has been fixed also.

