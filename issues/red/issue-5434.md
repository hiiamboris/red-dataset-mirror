
#5434: `apply` is inconsistent on nullary funcs
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5434>

**Describe the bug**

Both calls are expected to be an error:
```
>> f: func [][] apply 'f [/x on 1 /y on 2]
>> f: func [/z][] apply 'f [/x on 1 /y on 2]
*** Script Error: f has no refinement called /x
*** Where: f
*** Near : apply 'f [/x on 1 /y on 2]
*** Stack: f  
```

**To reproduce**

`f: func [][] apply 'f [/x on 1 /y on 2]`

**Platform version**
```
Red 0.6.4 for Windows built 22-Nov-2023/17:24:25+03:00  commit #34f26df
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-25T17:49:05Z, greggirwin, commented:
<https://github.com/red/red/issues/5434#issuecomment-1826386128>

    Nice catch.

