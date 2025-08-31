
#5346: [R/S] `keep` in float32! type casting always result in wrong values.
================================================================================
Issue is open, was reported by dockimbel and has 2 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/5346>

```
a: as-float32 keep 40800000h
probe a

i: 40A00000h
a: as-float32 keep i
probe a
```
outputs:
```
1.08213e+009.0
1.#NaN
```
Expected result is:
```
4.0
5.0
```

Platforms: All.


Comments:
--------------------------------------------------------------------------------

On 2023-07-13T16:48:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5346#issuecomment-1634570351>

    After spending about two hours on trying to properly support it, I don't think the current toolchain code can support that extended type casting mode (as it was a late addition). So I might consider rather replacing it with an intrinsic function.

