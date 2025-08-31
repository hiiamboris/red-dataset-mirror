
#5030: [Compiler] Crashes when function is defined inside a paren
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5030>

**Describe the bug**

Try to compile `-r` this script:
```
Red []
(f: does [])
(g: func [][])
```
`f`-line crashes it with:
```
*** Red Compiler Internal Error: Script Error : bind-function expected body argument of type: block
*** Where: comp-func
*** Near:  [bind-function body shadow
body-code: either
]
```
`g`-line with:
```
*** Red Compiler Internal Error: Script Error : check-spec expected spec argument of type: block
*** Where: comp-func
*** Near:  [set [symbols locals-nb flags] check-spec spec
add-function
]
```

**Expected behavior**

Successful compilation

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



