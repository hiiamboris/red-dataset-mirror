
#1532: GROUP-BOX content needs bigger offset by default
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1532>

Currently, first face in `group-box` partly obfuscates the group-box’ title. Slighltly increasing default Y-offfset would help.

Example code:

```
win: layout [
    group-box "Some text" [
        button "Some text"
    ]
]
view win
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-25T08:47:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1532#issuecomment-317671821>

    Works fine since 0.6.3.

