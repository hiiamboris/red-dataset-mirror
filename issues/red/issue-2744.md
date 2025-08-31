
#2744: [DRAW] image <image> <top-left> <top-right> <bottom-left> <bottom-right>
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
<https://github.com/red/red/issues/2744>

```Red
img: load %ld.jpeg 
view [ box 600x500 draw [ image img 10x10 500x10 10x400 500x400 ] ]
```
Not working. This bug is both on Windows and macOS.

On Windows, nothing shows up. On macOS, it flashes for 0.1 second and disappears.


Comments:
--------------------------------------------------------------------------------

On 2017-06-06T14:13:04Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2744#issuecomment-306498797>

    This ticket can be closed for now. In the document, it says that it's not implemented yet.

