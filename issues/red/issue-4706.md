
#4706: Linux->Windows cross-compilation doesn't work
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4706>

**Describe the bug**

Wanted to explore this opportunity because apparently R2 for Linux compiles about ~10% faster than R2 for Windows...
```
-=== Red Compiler 0.6.4 ===-

Compiling /home/test/1/3.red ...
...compilation time : 901 ms

Target: MSDOS

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : int-ptr! has no value
*** Where: none
*** Near:  [file-sum: make struct! int-ptr! [0]]
```

**To reproduce**

1. `echo Red [] print \"windows\">3.red`
2. `red -r -e -t MSDOS 3.red`
(or -t Windows but that requires needs: view in the header)

**Expected behavior**

Compiles.

**Platform version**
```
Red 0.6.4 for Linux built 1-Nov-2020/23:51:29+03:00 commit #2d05900
```



