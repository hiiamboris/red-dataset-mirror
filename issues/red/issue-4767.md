
#4767: Function get redefined in compiled code
================================================================================
Issue is open, was reported by qtxie and has 2 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4767>

**Describe the bug**
The following code print `true` when interpreted, print `false` when compiled.
```
Red []
f: does [throw 10 probe no]
g: does [f probe no]
probe 10 = catch [g]
f: "abc"
```

**Expected behavior**
Printing true.

**Platform version**
commit 52a25648812316b56bbeb169a6ae19c7e51542de



Comments:
--------------------------------------------------------------------------------

On 2022-09-18T11:03:36Z, dockimbel, commented:
<https://github.com/red/red/issues/4767#issuecomment-1250245146>

    In compiled code, words assigned to functions are not allowed to be reuse for referring other datatypes.

