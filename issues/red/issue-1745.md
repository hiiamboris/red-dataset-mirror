
#1745: last event/offset value of a face has values relative to its parent rather to itself
================================================================================
Issue is closed, was reported by Zamlox and has 2 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/1745>

```
view layout [
    below origin 0x0 space 0x0
    base 20x20 blue
    base 20x100 red all-over
        draw [pen black fill-pen black polygon 0x0 20x0 20x15 0x15]
        on-over [
            probe event/offset
            face/draw/6/y: event/offset/y
            face/draw/7/y: event/offset/y
            face/draw/8/y: event/offset/y + 15
            face/draw/9/y: event/offset/y + 15
        ]
    base 20x20 blue
]
```

I have noticed that when mouse is moved on the right side of red face, the last event/offset has an y value relative to window not to the red face (check the values prompted with probe in the above example), and because of that the black box is drawn much below as it should be.



Comments:
--------------------------------------------------------------------------------

On 2019-08-13T07:47:03Z, bitbegin, commented:
<https://github.com/red/red/issues/1745#issuecomment-520727632>

    fixed by #3985 

