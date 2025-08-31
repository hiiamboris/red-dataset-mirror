
#4440: `break` after `try` can't see the loop
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4440>

**Describe the bug**
```
forever [try/all [1] break]
*** Throw Error: no loop to break
*** Where: break
*** Stack:
```

**Expected behavior**

Should break out of it

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-May-2020/14:18:13+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-27T15:59:10Z, dockimbel, commented:
<https://github.com/red/red/issues/4440#issuecomment-1259713985>

    Cannot reproduce the issue anymore.

