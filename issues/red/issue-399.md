
#399: Blocks not bound to function context
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/399>

```
Red []

x: 1

f: function [
][
    x: 2
    b: [x]
    probe do b
]
f
```

1

Does this require the full object! implementation?



Comments:
--------------------------------------------------------------------------------

On 2013-01-31T12:09:06Z, dockimbel, commented:
<https://github.com/red/red/issues/399#issuecomment-12939632>

    No, it's just missing a context binding pass on the body block.

--------------------------------------------------------------------------------

On 2013-02-08T23:24:45Z, dockimbel, commented:
<https://github.com/red/red/issues/399#issuecomment-13319904>

    Fixed by commit [2841ca38](https://github.com/dockimbel/Red/commit/2841ca38d26e70c2e5d124a573aa3733e4366e93) in branch `lex-scope`.

