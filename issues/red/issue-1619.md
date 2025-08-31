
#1619: wrap inverted for text face
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1619>

When clicking the "Wrap" button from the following code, the text is unwrapped, and wrapped when clicking "No Wrap":

```
longer: {The quick brown fox jumps over the lazy dog.}
view [
    f: text "Hello, World!" wrap
    return
    button "Wrap" [f/text: longer f/para/wrap?: yes]
    button "No Wrap" [f/text: longer f/para/wrap?: no]
]
```

Both in Windows XP and Windows 7.
All other faces seem to ignore `wrap?`.



Comments:
--------------------------------------------------------------------------------

On 2016-02-12T14:58:20Z, meijeru, commented:
<https://github.com/red/red/issues/1619#issuecomment-183362018>

    Same for Windows 10. The effect is even clearer if you adjust the size of the window to show the full text (default window size on W10 is too small).

--------------------------------------------------------------------------------

On 2017-02-16T09:16:17Z, dockimbel, commented:
<https://github.com/red/red/issues/1619#issuecomment-280276165>

    It works fine now.

