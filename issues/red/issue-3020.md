
#3020: Specify width of a text face in VID results in its height not being properly calculated
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3020>

If the width of a text face is specified in VID, the height of the face is incorrectly calculated.

Example:
```text
view [
    size 232x300
    across
        text "Font-Size 24"  font-size 24
    return
    text "Font-Size 24" 230 font-size 24
]
```
Produces:
[Windows](https://files.gitter.im/red/bugs/81ei/thumb/Windows.png)
[macOS](https://files.gitter.im/red/bugs/yXTM/thumb/macOS.png)


