
#2034: Script error in VID when setting field/data to a block
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2034>

```
Red [title: "Toggle" needs: 'view]
a1: "Alternative 1"
a2: "Alternative 2"
view [
    title: "Toggle"
    below
    t: text 80x20 "Two alternatives"
    f1: field 80x20 data [random [a1 a2]]
    f2: field 80x20 data [random [a2 a1]]
    button 80x20 "Toggle" [
        either f1/text = a1 [f1/text: a2] [f1/text: a1]
        either f1/text = a1 [f2/text: a2] [f2/text: a1]
    ]
]
```



