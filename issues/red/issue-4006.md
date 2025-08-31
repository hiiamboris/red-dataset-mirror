
#4006: Pen 'OFF in Draw PUSH block turns the Pen off after the PUSH block on MacOS
================================================================================
Issue is closed, was reported by rgchris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4006>

**Describe the bug**
When using `pen 'off` within a PUSH block, the pen is subsequently 'off following the PUSH block:

**To reproduce**
```
view [
    box 400x400 coal draw [
        pen red
        fill-pen green
        box 10x10 300x300
        push [
            pen off
            fill-pen blue
            box 30x30 320x320
        ]
        box 50x50 340x340
    ]
]
```

**Expected behavior**
I'd expect the third block to have a red border

**Screenshots**
![Screenshot](https://files.gitter.im/red/red/gui-branch/ITyM/thumb/image.png)

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 21-Aug-2019/17:19:11-04:00 commit #84f55a2
```



