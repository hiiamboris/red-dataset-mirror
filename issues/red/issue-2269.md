
#2269: VID does not handle "blockable" font! (or para!) field reliably
================================================================================
Issue is closed, was reported by DideC and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2269>

In `font!` object, only `/style` field can be `none!`, a `word!` or a `block!`.
But the `system/view/VID/add-flag` function that handle the `word!` to `block!` transformation, does it for any field of the object it manipulate.
So unexpected results can occurs:

```
view [
    below
    text "Font default"
    text "Font 18" font-size 18
    text "Font 36" font-size 36
    f-t: text "Font 8, 18 and 36" font-size 8 font-size 18 font-size 24
   do [? f-t/font]
]
```

Even if it's not a "correct VID code", it is valid and does not produce errors.
`para!` object could also be affected.



Comments:
--------------------------------------------------------------------------------

On 2017-02-21T07:58:43Z, dockimbel, commented:
<https://github.com/red/red/issues/2269#issuecomment-281270714>

    @DideC Well done!

--------------------------------------------------------------------------------

On 2017-02-21T11:26:14Z, DideC, commented:
<https://github.com/red/red/issues/2269#issuecomment-281316622>

    Thanks. Not too hard aniway ;-)

