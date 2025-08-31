
#1955: WISH: Allow logic! as argument for PEN in DRAW
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/1955>

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



Comments:
--------------------------------------------------------------------------------

On 2018-04-25T04:44:51Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1955#issuecomment-384159255>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

