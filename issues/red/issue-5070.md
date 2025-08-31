
#5070: Compiler crash when putting function into a map
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [type.compiler]
<https://github.com/red/red/issues/5070>

**Describe the bug**

This script compiles and runs fine:
```
Red []

m: #()
m/1:       does [1]
m/(2):     does [2]
; m/key:     does [3]
; m/("s"):   does [4]
; m/(#"c"):  does [5]
put m 'key does [6]
put m "s"  does [7]
put m #"c" does [8]
?? m
```
But if you uncomment any of the commented lines you get smth like:
```
*** Red Compiler Internal Error: Script Error : Invalid path value: key
*** Where: comp-func
*** Near:  [objects/key: function!]
```

**Expected behavior**

Compiles.

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-14T15:55:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/5070#issuecomment-1039251877>

    Another case, same message: https://github.com/red/red/issues/4571

