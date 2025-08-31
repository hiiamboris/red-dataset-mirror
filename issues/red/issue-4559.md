
#4559: crash on recursive PRINT
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4559>

**Describe the bug**
Unhatched quine becomes death, the destroyer of worlds.

**To reproduce**
```red
print data: [print 'data print data]
```
```red
data
data
...
data
*** Script Error: none type is not allowed here
*** Where: +
*** Stack: to-integer
*** Script Error: none type is not allowed here
*** Where: +
*** Stack: to-integer
...
*** Script Error: none type is not allowed here
*** Where: +
*** Stack: to-integer

*** Runtime Error 19: stack error or overflow
*** Cannot determine source file/line info.
***
```

**Expected behavior**
```red
*** Internal Error: stack overflow
*** Where: print
*** Stack: 
```

**Platform version**
W10,  b452716



Comments:
--------------------------------------------------------------------------------

On 2020-06-29T19:31:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4559#issuecomment-651315627>

    Also https://github.com/red/red/issues/4323

