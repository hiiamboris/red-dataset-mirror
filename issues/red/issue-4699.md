
#4699: [Compiler] Cryptic internal error with /self refinement
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4699>

**Describe the bug**

`1.red`:
```
Red []
f: func [/self] [print "ok"]
f
```

`red -c 1.red`:
```
-=== Red Compiler 0.6.4 ===-

Compiling <...>\2.red ...
...using libRedRT built on 16-Oct-2020/15:01:20
*** Red Compiler Internal Error: Script Error : bind-function expected shadow argument of type: object
*** Where: comp-func
*** Near:  [bind-function body shadow
body-code: either
]
```

**Expected behavior**

Either a descriptive error or working code.

**Platform version**
```
Red 0.6.4 for Windows built 28-Aug-2020/14:24:38+03:00 commit #586f267
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-15T15:42:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4699#issuecomment-799522895>

    duplicate of https://github.com/red/red/issues/2614
    but that issue needs new title, as this is no more a cross-compilation or view problem

