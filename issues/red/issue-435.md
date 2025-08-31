
#435: SETting local corrupts compilation
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/435>

```
Red []

f: function [] [
    x: 0
    if set 'x 0 [
    ]
]
```

...

```
f: has [x] [
    if set 'x 0 [
    ]
]
```

-= Red Compiler =- 
**\* Compilation Error: expected a block for IF-BODY instead of integer! value 
**\* near: [0 []]



