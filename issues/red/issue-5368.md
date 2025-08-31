
#5368: [View, Regression] `size-text` reports inaccurate results
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5368>

**Describe the bug**

Must be one of the `- 0.5` hacks left somewhere in the code.

There should be no wrapping here:
```
r: rtd-layout ["https://codeberg.org/hiiamboris/red-spaces"]
r/size: none
r/size: probe size-text r
; r/size: 0.49 + probe size-text r      ;) DOESN'T WORK
; r/size: 0.5 + probe size-text r       ;) WORKS
? (draw 300x100 compose [text 0x0 (r)])
```
It however shows: ![](https://i.gyazo.com/cb70c4d9491ff851e27e600f895f55af.png)

**Expected behavior**

Rendering on result returned from `size-text` with no `size` set should never wrap. 
![](https://i.gyazo.com/9ca25d547f4d42317c2afd4be8e3b13f.png)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4923 date: 11-Aug-2023/2:27:21 commit: #baa93a6dca8ad51f0a3e81ea49a475d542c2b43c ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-08-14T02:54:52Z, qtxie, commented:
<https://github.com/red/red/issues/5368#issuecomment-1676597669>

    It works fine on Win11.

