
#3114: face takes 2 times to update
================================================================================
Issue is closed, was reported by githubnyn and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3114>

### Expected behavior
 face should be updated on the first click
### Actual behavior
you need to click on the face twice in order to update it and bring it to the front
### Red version and build date, operating system with version
red version 0.6.3 - MacOS 10.13.1

```
move-to-top: func [face][move find face/parent/pane face tail face/parent/pane]

win: layout [
    a1: base 200x200 gold loose
    on-down [move-to-top face]
    pad -100x0
    a2: base 200x200 brick loose
    on-down [move-to-top face]
    pad -50x0
    a2: base 200x200 loose
    on-down [move-to-top face]
]
view win

```


Comments:
--------------------------------------------------------------------------------

On 2017-11-20T08:00:07Z, meijeru, commented:
<https://github.com/red/red/issues/3114#issuecomment-345618107>

    Two faces are given the name `a2` ???

