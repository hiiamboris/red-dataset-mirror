
#5596: [View, Regression] Rich-text face display is broken
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5596>

**Describe the bug**

```
>> view [rich-text 100x100 "hi"]

*** Script Error: old has no value
*** Where: all
*** Near : if all [old <> new image? old] [system/view]
*** Stack: view layout 
```

**Expected behavior**

Was working in 27/02 build, not in 01/03

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 428 date: 2-Mar-2025/1:52:26 commit: #c7a9191cfcf54959f4fab999cc8186bdb6ac6efc ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2025-03-02T05:50:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/5596#issuecomment-2692572850>

    https://github.com/red/red/commit/e9a02e5e52c350ab2553d730edd7677fcef99e5c most certainly

