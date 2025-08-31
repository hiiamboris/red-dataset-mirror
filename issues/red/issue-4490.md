
#4490: [View] Stack overflow when one forgets to copy the font
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4490>

**Describe the bug**

It takes some effort to track the source of this bug:
```
view/no-wait [p: panel bold [b: base]]
b/font: p/font             ;) <- forgot to copy
change p/pane copy p/pane
```

```
*** Internal Error: stack overflow
*** Where: show
*** Stack: on-face-deep-change* show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show show update-font-faces show 
```

**Expected behavior**

View should copy the font automatically when it belongs to other face. Or multiple faces should work with a shared font.

And no cryptic overflows ;)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Jun-2020/18:03:42
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-02T09:09:16Z, dockimbel, commented:
<https://github.com/red/red/issues/4490#issuecomment-637404453>

    Multiple faces should work with a shared font.

