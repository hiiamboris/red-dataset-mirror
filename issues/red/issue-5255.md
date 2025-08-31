
#5255: [VID] Wrong paddings in tab-panel
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5255>

Discussed here: :point_up: [December 8, 2022 7:57 PM](https://gitter.im/red/red/gui-branch?at=6392179489c38775e751433d)

**Describe the bug**

`tab-panel` is supposed to size itself to the `base`'s size.
```
view [tab-panel magenta ["1" [origin 0x0 base cyan]]]
```
![](https://i.gyazo.com/0a3a3a174c0b1120e801ebd716f3f33a.png)

My observation:
<img width=300 src=https://i.gyazo.com/88274a973a65d0d056f4043df22a7231.png />

**Expected behavior**

No magenta bands around.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-12-15T16:41:09Z, greggirwin, commented:
<https://github.com/red/red/issues/5255#issuecomment-1353375606>

    Duped. Right, there's no way to work around this right now.

