
#2782: [View] on-wheel speed is different on macOS and Windows
================================================================================
Issue is open, was reported by JenniferLee520 and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/2782>

On Windows and macOS, on-wheel has very different speed.
```Red
view [
    size 500x500 
    base 400x100 red "use wheel to move the red box" on-wheel [ 
        face/offset: as-pair face/offset/x face/offset/y + probe event/picked 
    ]
]
```


