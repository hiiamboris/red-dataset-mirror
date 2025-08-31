
#1702: "No loop to break" error in WHILE loop
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1702>

Unfortunately the code to demonstrate this issue is cca 60 lines, I haven’t managed to get it shorter.
There is `break` on line 31 that is in `while` loop, but it throws error `No loop to break` and exits console (back to bash, not to Red console):

```
Red[]

offset?: func [
    series1
    series2
] [
    (index? series2) - (index? series1)
]

cmp: context [
    shift-window: func [look-ahead-buffer positions][
        set look-ahead-buffer skip get look-ahead-buffer positions              
    ]
    match-length: func [a b /local start][
        start: a
        while [all [a/1 = b/1 not tail? a]][a: next a b: next b]
        probe offset? start a
    ]
    find-longest-match: func [
        search 
        data
        /local 
            pos len off length result
    ] [
        pos: data
        length: 0
        result: head insert insert clear [] 0 0
        while [pos: find/case/reverse pos first data] [
            if (len: match-length pos data) > length [
                if len > 15 [
                    break
                ]
                length: len
            ]
        ]
        result
    ]
    lz77: context [
        result: copy []
        compress: func [
            data [any-string!]
            /local
                look-ahead-buffer search-buffer position length
        ] [
            clear result
            look-ahead-buffer: data
            search-buffer: data
            while [not empty? look-ahead-buffer] [
                set [position length] find-longest-match search-buffer look-ahead-buffer
                shift-window 'look-ahead-buffer length + 1
            ]
        ]
    ]
]

cmp/lz77/compress "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-11T10:51:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1702#issuecomment-195316416>

    Here I get the following output:
    
    ```
    97
    *** Script error: invalid argument: 0
    *** Where: ctx197~find-longest-match
    *** Stack: compress while set ctx197~find-longest-match
    ```
    
    If I replace `break` with `return result`, it seems to work fine.

--------------------------------------------------------------------------------

On 2016-03-12T03:41:43Z, ghost, commented:
<https://github.com/red/red/issues/1702#issuecomment-195651524>

    @dockimbel  On windows 8.1, the above code produces
    
    ```
    97
    *** Throw error: no loop to break
    *** Where: break
    ```

--------------------------------------------------------------------------------

On 2016-03-12T07:38:56Z, xqlab, commented:
<https://github.com/red/red/issues/1702#issuecomment-195682496>

    It seems to work, if you replace the two ifs with one if all [..
    So probably an issue with the depth of nesting level.

