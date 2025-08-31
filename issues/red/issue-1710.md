
#1710: Improve compiler error report in R/S
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1710>

```
Red/System []

bad-error-msg: func [/local a [logic!]][
    if a: true [0]
]

bad-error-msg
```

When compiling, it reports this errror which is confused.

```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use path on set-word! value 
*** Where: comp-if 
*** Near:  [emitter/branch/over/on chunk expr/1 
emitter/merge chunk
] 
```

Also `either` has the same problem. But `unless` can be compiled and also works!



