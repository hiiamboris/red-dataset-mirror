
#2868: Compiler crash with using `get-word!` in `foreach`
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2868>

This code:
```Red
entry: [a b c]
digits: [1 2 3 4 5 6 7 8 9]

foreach :entry digits [
    print [a * 2 b * 3 c * 4]
]
```
Interpreted:
```Red
2 6 12
8 15 24
14 24 36
```
Compiled:
```Red
*** Red Compiler Internal Error: Script Error : add-symbol expected name argument of type: word
*** Where: comp-foreach
*** Near:  [add-symbol word: pc/1
add-global word
]
```
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-24T11:19:34Z, 9214, commented:
<https://github.com/red/red/issues/2868#issuecomment-317392631>

    though it compiles if wrapped up inside `collect`
    ```Red
    probe collect [
        entry: [a b c]
        digits: [1 2 3 4 5 6 7 8 9]
    
        foreach :entry digits [
            keep reduce [a * 100 b * 200 c * 300]
        ]
    ]
    ```

