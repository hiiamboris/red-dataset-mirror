
#5226: "Where:" field in error reports leaves no clue sometimes
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5226>

**Describe the bug**

This code:
```
m: #()
x: none
m/:x: reduce [on off none]
```
Outputs:
```
*** Script Error: none! type is not allowed here
*** Where: set-path
*** Near : none
*** Stack:
```
Go figure.
`none` is a very common token, searching for it in bigger code is out of the question.
`set-path`.. what set-path?
`not allowed here` where?

**Expected behavior**
```
*** Where: m/:x:
*** Near : reduce [on off none]
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4532 date: 6-Oct-2022/6:24:41 commit: #0657e2239680d6071a4f22f467031deeb0fd9f2d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-10-13T12:55:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/5226#issuecomment-1277564915>

    See also #5225 

--------------------------------------------------------------------------------

On 2022-10-17T20:10:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5226#issuecomment-1281429354>

    Error reporting improved, but `Where:` part can't be improved as the path is not stored on the Red stack, so `set-path` is the best we can get for now (until the work on unified stack). 
    
    ```
    >> m/:x: reduce [on off none]
    *** Script Error: cannot access none! in path m/:x:
    *** Where: set-path
    *** Near : none
    *** Stack:  
    ```

