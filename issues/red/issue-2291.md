
#2291: size-text breaks down for uppercase letters
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.tested] [type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2291>

See the test program below. This accepts a text in a field face and inserts the same text in a draw block, together with a box whose size is computed by calling `size-text` on the field. It is important that the text-field and the draw text are in exactly the same font, of course. With lowercase letters the box encloses the text rather accurately. With more than 2 to 3 uppercase letters, the size is underestimated. I am using Windows 10 here.

```
Red []
text-font: make font! [size: 12 style: 'bold]
view [panel 400x400 [
    text-field: field 120 "" font text-font
    button "show" [
        size: size-text text-field
        change at drawing/draw 5 text-field/text
        change at drawing/draw 8 20x20 + size
    ]
    return
    drawing: base 200x200 
        draw [font text-font text 20x20 "" box 20x20 30x30]
        return button "quit" [quit]
]]
```



