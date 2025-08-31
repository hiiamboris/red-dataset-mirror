
#5274: Argument error messages are not helpful for `function!` values
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/5274>

**Describe the bug**

This code misses an argument in `f` call:
```
f: func [x [string!]] [
	[some code and]
	[some more code and]
	[some more code]
	[not that big huh?]
]
do reduce [:f]
```
But the error message says:
```
*** Script Error: func [x [integer!]][[some code and] [some more code and] [some more code] [not t
*** Where: do
*** Near : func [x [integer!]][[some code and] [some ] ] 
*** Stack:
```
Which *totally* loses the point (`is missing its b argument`) and leaves one wondering what did it want to say.
Same happens for:
```
do reduce [:f 1]   ;) wrong argument type
```

**Expected behavior**

The message should not be truncated, only function body should be.
Issue is also related to the lack of clear design intent behind value formatters: https://github.com/red/REP/issues/134

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-01-28T18:30:15Z, dockimbel, commented:
<https://github.com/red/red/issues/5274#issuecomment-1407458668>

    `do <function!>` is a variable-arity expression, which is something we thought should be eliminated from the language semantics (following the fixed-arity downgrade done on `make` in R3). It has not been blocked yet in the interpreter until we make a final decision on it.
    
    The rationale for that change in R3 was to make the language more suitable for static analysis and avoid potential hard-to-read expressions for users. I'm not sure how much that rationale is sound (especially the first part of it).

--------------------------------------------------------------------------------

On 2023-01-28T19:23:48Z, hiiamboris, commented:
<https://github.com/red/red/issues/5274#issuecomment-1407468626>

    Note the `reduce` call.

--------------------------------------------------------------------------------

On 2023-02-21T17:14:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5274#issuecomment-1438831840>

    You're right, I've overlooked it, it's not a variable-arity case.

--------------------------------------------------------------------------------

On 2023-06-20T15:25:35Z, dockimbel, commented:
<https://github.com/red/red/issues/5274#issuecomment-1599012325>

    As a side-note, probing the error object can be helpful in such cases:
    
    ```
    >> probe try reduce [:f]
    make error! [
        code: 304
        type: 'script
        id: 'no-arg
        arg1: func [x [string!]][
            [some code and] 
            [some more code and] 
            [some more code] 
            [not that big huh?]
        ]
        arg2: 'x
        arg3: none
        near: [func [x [string!]][
            [some code and] 
            [some more code and] 
            [some more code] 
            [not that big huh?]
        ]]
        where: 'try
        stack: 87433948
    ]
    ```

