
#2258: Cannot use PATH! as source for an image in DRAW
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/2258>

```
red>> avatars
== #(
    greggirwin: make image! [60x60 #{
2F2E2D2C2B2A242321161511151411151410100F0B0D0D090A0A05080904
0707020606
red>> view layout [image 100x100 draw [image avatars/greggirwin 0x0]]
*** Script Error: invalid Draw dialect input at: [avatars/greggirwin 0x0]
*** Where: ???
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-20T16:41:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2258#issuecomment-449060323>

    It is unlikely that this feature will be supported:
    1. Processing paths is expensive, so a bad fit for Draw dialect that's optimized for performance.
    2. It is trivial to work around that using selective evaluation (compose) .

--------------------------------------------------------------------------------

On 2018-12-20T17:36:14Z, greggirwin, commented:
<https://github.com/red/red/issues/2258#issuecomment-449077283>

    Note added to draw image docs.

