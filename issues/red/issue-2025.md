
#2025: ptr/value bug in Red/Sys
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2025>

``` Red
buf: as int-ptr! allocate 8
buf/value: 1
buf: buf + 1
buf/value: 2
```

The result will be #{02 00 00 00  00 00 00 00}
It should be #{01 00 00 00  02 00 00 00}



Comments:
--------------------------------------------------------------------------------

On 2016-06-15T04:25:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2025#issuecomment-226084755>

    It works fine here using:
    
    ```
    Red/System []
    
    ;--test--: func [s [c-string!]][print-line s]
    ;--assert: func [v [logic!]][either v [print-line "OK"][print-line "`*** KO"]]
    
    buf: as int-ptr! allocate 8
    base: buf
    buf/value: 1
    buf: buf + 1
    buf/value: 2
    
    dump-hex4 base
    ```
    
    Compile in debug mode (`-d`) and run it:
    
    ```
    Hex dump from: 00721280h
    
    00721280: 00000001 00000002  4578E4E6 00007AB3  ■...■...µΣxE│z..
    00721290: 00723608 007200C4  446D6172 00617461  ■6r.─.r.ramData.
    007212A0: 676F7250 466D6172  73656C69 5C3A433D  ProgramFiles=C:\
    007212B0: 676F7250 206D6172  656C6946 78282073  Program Files (x
    007212C0: 00293638 676F7250  466D6172 73656C69  86).ProgramFiles
    007212D0: 36387828 3A433D29  6F72505C 6D617267  (x86)=C:\Program
    007212E0: 6C694620 28207365  29363878 6F725000   Files (x86).Pro
    007212F0: 6D617267 33343657  3A433D32 6F72505C  gramW6432=C:\Pro
    ```

