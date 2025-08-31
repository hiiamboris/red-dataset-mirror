
#5452: [View] Wrong /offset in move event
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5452>

**Describe the bug**

Continuation of https://github.com/red/red/issues/5407 :
Reported `event/offset` does not align with resulting `face/offset`.

**To reproduce**

1. Run this:
```
view/flags [size 200x200 on-move [?? event/offset] on-moving [?? event/offset] on-resize [?? face/offset ?? face/size]] 'resize
```
2. Maximize the window, or stick it to the size with Win+Up/Win+Left/Win+Right.
3. Observe that `event/offset` is bigger than `face/offset`:
```
event/offset: (647.3333, 30)        <-- this should be (640, 0)
face/offset: (640, 0)
face/size: 200x200
face/offset: (640, 0)
face/size: 625x642
```

**Expected behavior**

`face/offset` having the same value as next `face/offset`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5076 date: 30-Dec-2023/14:13:04 commit: #f8f255970835423b7be5c0c34f5fa697a0002233 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


