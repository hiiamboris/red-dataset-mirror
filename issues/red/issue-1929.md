
#1929: Variables are defined in vid will get a compile error when use them directly
================================================================================
Issue is closed, was reported by red-eco and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1929>

dlst1 is defined in vid.
use dlst1/data is both OK in interpret and compile,
but use dlst1 directly will get a compile error "undefined word dlst1".

```
Red [
    title: "Weather"
    Needs: 'View     ;https://github.com/red/red/wiki/Red-View-Graphic-System
]

face-main1: layout [
    title "show a data tree in drop-list"
    dlst1: drop-list 100 [fn-get-data face dlst2]
    dlst2: drop-list 100 [fn-get-data face dlst3]
    dlst3: drop-list 100
    return
    txt-all-str: text ""
]

fn-get-data: function [dlst next-dlst][
    next-dlst/data: pick dlst/data dlst/selected * 2
    next-dlst/selected: 1
    do-actor next-dlst none 'change
    fn-test-compile-error reduce [dlst1 dlst2 dlst3] ; interpret OK, but compile Error
]

fn-test-compile-error: function [blk][
    ;foreach dlst blk [
    ;    unless none? dlst/selected [
    ;        txt-all-str/text: append make string! 0 reduce [txt-all-str/text " / " dlst/data/(dlst/selected * 2)]
    ;    ]
    ;]
]

data-tree: [
    "A" [
        "a6" [
            "61" "62"
        ]
        "a7" [
            "73" "74" "75"
        ]
        "a8" [
            "88" "89"
        ]
    ]
    "B" [
        "b4" [
            "41" "42" "43"
        ]
        "b5" [
            "51"
        ]
    ]
]

dlst1/data: data-tree
dlst1/selected: 1
do-actor dlst1 none 'change
view face-main1
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-23T10:01:24Z, dockimbel, commented:
<https://github.com/red/red/issues/1929#issuecomment-220938380>

    Words set in a VID block (or any other dialect or unevaluated block) are invisible for the compiler. So, he's will rightly report an error on `dlst1/data`, because the word has not been defined before. Two solutions exists for that:
    
    1) (Recommended) Define your VID (or other _invisible_ words) before you use them. In the above case:
    
    ```
    Red [
        title: "Weather"
        Needs: 'View     ;https://github.com/red/red/wiki/Red-View-Graphic-System
    ]
    
    dlst1: dlst2: dlst3: none
    ...
    ```
    
    2) Disable the strict words checking mode in the compiler, using a compilation config option in the header:
    
    ```
    Red [
        Title: "Weather"
        Needs: 'View
        Config: [red-strict-check?: no]
    ]
    ...
    ```
    
    Disabling this checking means that the compiler will not report any other "undefined word" anywhere else, so use it at your own risks.

