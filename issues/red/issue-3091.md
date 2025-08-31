
#3091: VIEW: modifying DRAW block inside WITH body does not cause any visual changes
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3091>

Fire up the snippet bellow and move the slider - as you can see, `draw` block is updated, but radius of a circle remains static:

```Red
view [
    b: base 
        with [draw: [fill-pen red circle 40x40 20]]
        react later [
            b/draw/5: to integer! 50 * s/data
            probe b/draw
        ]
    return
    s: slider 
]
```

However, I expect it to behave exactly as:
```Red
view [
    b: base 
        draw [fill-pen red circle 40x40 20]
        react later [
            b/draw/5: to integer! 50 * s/data
            probe b/draw
        ]
    return
    s: slider 
]
```

Perhaps it's related not only to `draw` block, but to any `series!` inside `with` body. Red version:
```Red
>> about
Red for Windows version 0.6.3 built 21-Oct-2017/23:57:00+05:00
```



Comments:
--------------------------------------------------------------------------------

On 2017-11-06T05:07:51Z, dockimbel, commented:
<https://github.com/red/red/issues/3091#issuecomment-342047906>

    Your second example has a typo, it should be `draw` instead of `draw:` in the VID block.

--------------------------------------------------------------------------------

On 2017-11-06T08:02:21Z, 9214, commented:
<https://github.com/red/red/issues/3091#issuecomment-342072849>

    @dockimbel your comment has a typo, it should be `has` instead of `as` in the 4th word :nerd_face: 

--------------------------------------------------------------------------------

On 2017-11-06T09:28:47Z, dockimbel, commented:
<https://github.com/red/red/issues/3091#issuecomment-342092199>

    Thanks, fixed! Making a typo while pointing out a typo... :roll_eyes: 

