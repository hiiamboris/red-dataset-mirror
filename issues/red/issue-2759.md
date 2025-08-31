
#2759: [macOS GUI] Base with Image got wrong z-order when rendering
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2759>

1. In the following code, replace %red-logo.png with any local image file.
2. Run the code. 
3. Move mouse to the bigger stack, and use mouse wheel to move it up. 

The yellow belt should not be covered by the bigger stack. This bug is on macOS.

```Red
Red []

view [
    size 300x350
    at 0x50 content: panel white 300x300 [
        origin 0x0
        image %red-logo.png 300x300 

    ]
    on-wheel [
        y: content/offset/y + (2 * event/picked)
        either y > 50 [ 
            content/offset: 0x50
        ] [
            content/offset: as-pair 0 y
        ]
    ]
    at 0x0 panel yellow 800x50 [
        image %red-logo.png 40x40
        text "yellow belt should be on top" 
    ]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-06-16T06:13:33Z, qtxie, commented:
<https://github.com/red/red/issues/2759#issuecomment-308942392>

    Should be fixed by this commit: 2204aa56eed5d88ee16da2fbbf4ef70709e7800c

