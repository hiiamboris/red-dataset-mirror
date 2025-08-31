
#2793: [View] When a tab-panel has too many tabs, macOS hides some of them, Windows 10 goes nuts.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2793>

When a tab-panel has too many tabs, macOS hides some of them (from our access), and Windows 10 goes nuts (high-frequency flickering). Both are not good. Try the following code
```Red
view [ 
    tab-panel [ 
        "P1" [ base red ] 
        "p2" [ base green ] 
        "p3" [ base blue ] 
        "p4" [ base purple ] 
    ] 
]
```


