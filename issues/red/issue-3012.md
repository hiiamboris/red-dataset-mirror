
#3012: Black color is not rendered when 'black word is used in draw blocks
================================================================================
Issue is closed, was reported by sylvievathoux and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3012>

Tested on macOS Sierra:
```
view [base 300x300 draw [fill-pen black box 20x20 280x280]]
```
doesn't render the black filling. Any other rebol-color works, and any tuple does too,except 0.0.0!


