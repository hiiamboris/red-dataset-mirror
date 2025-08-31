
#5254: [VID] `cannot access handles in path face/handles` on rich-text styling
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5254>

**Describe the bug**
```
view [
    style r: rich-text
    r "qwertyuiop" 
]
```
Fails to show the window:
```
*** Script Error: cannot access handles in path face/handles
*** Where: eval-path
*** Near : spec: fetch-options face opts style spec 
*** Stack: view layout fetch-options size-text block?  
```

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


