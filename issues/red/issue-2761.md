
#2761: [macOS VID] "across middle" and "space"
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2761>

In the following code, replace %red-logo.png with any local image file. After running it, you will see that "across middle" and space between components are not working well on macOS. But on Windows, no problem.

```Red
view [
    panel black 800x50 [
        origin 5x5
        across middle
        image %red-logo.png 40x40
        button "AAA" 
        button "BBB"
        button "CCC"        
    ]
]
```


