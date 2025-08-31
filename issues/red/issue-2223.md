
#2223: Current state not always restored after nested PUSH commands
================================================================================
Issue is closed, was reported by Zamlox and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2223>

with following code:

```
view [
    base 200x200
    draw [
        push [
            translate 20x20 line-width 1 
            push [
                translate 30x30 pen blue line-width 1 box 0x0 50x50
            ]
            push [
                pen green
                box 0x0 80x80
            ]
        ]
        push [
            pen red box 0x0 100x100
        ]
    ]
]
```

red rectangle is translated by 20x20. It should be drawn at 0x0



