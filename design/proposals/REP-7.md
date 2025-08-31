
#7: WISH: Allow logic! as argument for PEN in DRAW
================================================================================
Issue is open, was reported by rebolek and has 0 comment(s).
[Wish]
<https://github.com/red/REP/issues/7>

PEN in DRAW can be `off` for no pen:

```
red>> view [image 100x100 draw [pen red fill-pen off box 10x10 90x90]]
```

However, this `off` is keyword, not logic! value, so following is not possible:

```
red>> view compose/deep [image 100x100 draw [pen red fill-pen (off) box 10x10 90x90]]
*** Script error: invalid Draw dialect input at: [false box 10x10 90x90]
*** Where: ?
```

As documented above with `pen red`, PEN does already evaluate words with tuple! value, so doing the same for logic! would be consistent here.


See https://github.com/red/red/issues/1955 for reference.


