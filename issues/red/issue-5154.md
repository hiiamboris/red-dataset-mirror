
#5154: The panel (parent) size isn't set when the `size` command is seen
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5154>

**Describe the bug**

The size of the base face is preferred to be 500x500 rather than 100x100.
```
view [
    size 500x500
    base with [
        size: probe parent/size
    ]
]
```
Original reported on gitter: https://gitter.im/red/help?at=62bb7a2aef5ee44882f244ed

**Expected behavior**
The size of the base face is 500x500

**Platform version**
Red 0.6.4 (ed73e334d3284d3079b31206cd295483b46440b8) for Windows built 27-Jun-2022/8:35:02



