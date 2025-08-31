
#2957: TEXT-LIST does not honor the requested height.
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/2957>

In the following example, the text-list should be taller:
```
view layout [
    tab-panel [    
        " Tab 1 " [
            panel olive [
                panel gold [
                    h5 "Header 1" return
                    text-list 200x400 data [  ]
                ]
                panel papaya [
                    h5 "Header 2" return
                    area 800x400
                ]    
            ] 
        ]    
    ]
]
```


