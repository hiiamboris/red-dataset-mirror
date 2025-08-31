
#2351: Event/key is none on CapsLock
================================================================================
Issue is closed, was reported by ifgem and has 6 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/2351>

```
view [
    area on-key [probe event/key]
]
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-28T21:43:31Z, meijeru, commented:
<https://github.com/red/red/issues/2351#issuecomment-263403761>

    Shift, Ctrl and Alt give no event at all. Perhaps CapsLock should do the same?

--------------------------------------------------------------------------------

On 2016-11-29T07:01:13Z, qtxie, commented:
<https://github.com/red/red/issues/2351#issuecomment-263492448>

    I'm not sure if it's on purpose or a bug. Looks like in `on-key` event, we only get the `transalated key`.
    
    for example, if we type `ALT + 248` (pressing ALT, type 248, then release ALT), we get a `ø` character in the area and we get an `on-key` event with this character.
    
    To get the raw key code, we can use `on-key-down` event.

--------------------------------------------------------------------------------

On 2016-11-29T08:57:26Z, meijeru, commented:
<https://github.com/red/red/issues/2351#issuecomment-263512825>

    If I do that, I get `#"^T"` for my CapsLock which is `U+0014` or `DC4 (DEVICE CONTROL FOUR)`. It would be interesting to try all "special" keys this way. The results may not even be the same for all keyboard/OS combinations.

