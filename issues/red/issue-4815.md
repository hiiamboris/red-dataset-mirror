
#4815: construct/with cannot be compiled
================================================================================
Issue is closed, was reported by endo64 and has 8 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4815>

**Describe the bug**
Compiling `construct/with` fails with `Stack overflow` error.

**To reproduce**
Save below file as `test.red`
```
Red []
obj: object [a: 1]
blk: [b: 2]
obj2: construct/with blk obj
```
Compile it
`> red -c -t MSDOS .\test.red`

```
...using libRedRT built on 29-Jan-2021/19:54:27
*** Red Compiler Internal Error: Internal Error : Stack overflow
*** Where: check-redefined
*** Near:  [if all [
pos: find get-obj-base name name
not all [
entry: local-bound? original
block? select entry/3 name
]
] [
pos/1: none
]
true
]
```


**Expected behavior**
No error.

**Platform version**
```
Red 0.6.4 for Windows built 24-Jan-2021/10:45:46+03:00 commit #48fca9c
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-30T17:31:23Z, endo64, commented:
<https://github.com/red/red/issues/4815#issuecomment-770248187>

    Note that I got different error message before
    ```
    *** Red Compiler Internal Error: Internal Error : Stack overflow
    *** Where: attempt
    *** Near:  [unless error? set/any 'value try]
    ```
    
    I changed absolutely nothing, I don't know why the error message changed 🙄

--------------------------------------------------------------------------------

On 2021-01-30T17:55:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/4815#issuecomment-770251571>

    `[unless error? set/any 'value try]` I'm getting with -r
    
    with -c it's still different
    ```
    *** Red Compiler Internal Error: Internal Error : Stack overflow
    *** Where: comp-construct
    *** Near:  [if all [
    path? pc/1
    not parse pc/1 [skip 2 [opt ['only (only?: yes) | 'with (with?: yes)]]]
    ] [
    throw-error "Invalid CONSTRUCT refinement"
    ]
    either
    ]
    ```

--------------------------------------------------------------------------------

On 2021-02-03T21:10:54Z, dockimbel, commented:
<https://github.com/red/red/issues/4815#issuecomment-772825858>

    Support for `construct` in the compiler is primitive, it needs extra work to support in all his possible usage patterns.

--------------------------------------------------------------------------------

On 2021-02-03T21:41:09Z, greggirwin, commented:
<https://github.com/red/red/issues/4815#issuecomment-772843133>

    Linked to this ticket from https://github.com/red/red/wiki/%5BNOTES%5D-Compiler-Limitations

