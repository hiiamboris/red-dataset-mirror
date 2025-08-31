
#2956: DUMP-FACE should show type and new style info
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/2956>

Currently uses `face/type` for Style info. Not sure if `attempt` is the best solution for a face without options (which is the case for Window types). 
```
dump-face: func [
    {Display debugging info about a face and its children} 
    face [object!] "Face to analyze" 
    /local depth f
][
    depth: "" 
    print [
        depth "Type:" face/type "Style:" attempt[face/options/style] "Offset:" face/offset
        "Size:" face/size "Text:" if face/text [mold/part face/text 20]
    ] 
    append depth "    " 
    if block? face/pane [foreach f face/pane [dump-face f]] 
    remove/part depth 4 
    face
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-08-02T07:24:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2956#issuecomment-319590637>

    Using `attempt` is fine. You can also use something like `all [fo: face/options fo/styles]` if you prefer.

--------------------------------------------------------------------------------

On 2017-08-02T15:42:53Z, greggirwin, commented:
<https://github.com/red/red/issues/2956#issuecomment-319712022>

    OK. I went with `if` since the case was simple. My only concern about `attempt` is from bad R2 experiences where, more than once, it would cause memory leaks for me.

