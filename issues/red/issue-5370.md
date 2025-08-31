
#5370: [Draw] `box` command doesn't accept floating point radius
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/5370>

**Describe the bug**
```
>> draw 1x1 [box 0x0 10x10 0]
== make image! [1x1 #{404040}]
>> draw 1x1 [box 0x0 10x10 0.0]
*** Script Error: invalid Draw dialect input at: [0.0]
*** Where: draw-image
*** Near : draw 1x1 [box 0x0 10x10 0.0]
*** Stack: draw  
```

**To reproduce**

`draw 1x1 [box 0x0 10x10 0.0]`

**Expected behavior**

No error

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4938 date: 18-Aug-2023/14:57:04 commit: #4fc17a45ce35de21a7546698902600080fd1d98e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


