
#1187: %lexer.r does not seem to handle line numbers correctly
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.review]
<https://github.com/red/red/issues/1187>

From inspection of the program text, I fail to see that line break positions are registered correctly.
The parsing rule is

```
    ws: [
    pos: #"^/" (
        if count? [
            line: line + 1 
            append/only lines to block! stack/tail?
        ]
    )
| ...
```

and this does not insert anything sensible in to the `lines` array. Thus `add-line-markers` has nothing useful to do. Are the line break positions ever used??



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T14:17:10Z, dockimbel, commented:
<https://github.com/red/red/issues/1187#issuecomment-107193278>

    Right, the line break positions implementation was started and not completed so far. We plan to add support line breaks position both in static and runtime lexers soon (to be able to pass them to runtime blocks and preserve as much as possible the original source layout).

