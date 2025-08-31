
#1451: transparency smashes base ball through a window
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1451>

In `tests/vid.red`, the “ball” `base` changes position when given an opacity less than `255`. Sometimes, it gets drawn partially or fully outside the window!
For example, when changing line 39 from:

```
    base 50x50 draw [fill-pen blue circle 25x25 15]
```

to:

```
    base 255.0.0.128 50x50 draw [fill-pen blue circle 25x25 15]
```

Windows 7 does this:
![outside windows 7](https://cloud.githubusercontent.com/assets/7657453/11205199/857f13c2-8d51-11e5-9200-58e0d8ff7b75.png)
When moving the "VID test" window, the face moves along side it.

Windows XP does this:
![outside windows xp](https://cloud.githubusercontent.com/assets/7657453/11205219/c841b020-8d51-11e5-9041-59ee475e25cb.png)

Setting the `color` to `red`, `255.0.0` or even `255.0.0.255` gives the expected behaviour, but any other opacity and the position changes to that strange place, regardless of the RGB color. It has been partially outside the window in Windows XP as well, but I can't reproduce it. It only goes to that place over the `slider` with the values I've tried since.

Doing the same to the "ok" `base` on line 26 seems to make it disappear.



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T15:51:59Z, WiseGenius, commented:
<https://github.com/red/red/issues/1451#issuecomment-157410878>

    This issue is now resolved.

