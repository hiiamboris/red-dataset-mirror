
#5278: Inexplicable reactive code
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5278>

:point_up: [February 3, 2023 4:11 AM](https://gitter.im/red/red/welcome?at=63dc5f5a747c6938e1fcc68d)

**Describe the bug**

The code below is supposed to set `text` faces to one of two strings according to the radio button states. However where's `true` crawling in from?
![](https://i.gyazo.com/2182f784ebfc9e7e521c21f488553350.gif)

**To reproduce**
```
view[
r1: radio "r1" return 
r2: radio "r2" return
text react [face/text: either r1/data ["r1 yes"]["r1 no"]]
text react [face/text: either r2/data ["r2 yes"]["r2 no"]]
]
```

**Expected behavior**

- `text` faces having one of two predefined values
- after initial click, one of radio buttons should be "on" during all subsequent clicks

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4629 date: 28-Jan-2023/11:28:13 commit: #ec0c31279023590e285fb2e1869380670ee0239f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-02-07T17:22:54Z, dockimbel, commented:
<https://github.com/red/red/issues/5278#issuecomment-1421152315>

    The issue is caused by the internal single-event implementation we currently have. The fix is a simple one but does not address the root cause. The next iteration on View and `event!` implementation should account for  the generation of new events from within event handlers.

--------------------------------------------------------------------------------

On 2023-02-07T17:25:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/5278#issuecomment-1421156008>

    might be relevant then: https://github.com/red/red/issues/3823 https://github.com/red/red/issues/5124

