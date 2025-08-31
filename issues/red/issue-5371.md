
#5371: [Draw] Buggy `fill-pen pattern` offset
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5371>

**Describe the bug**
```
? (draw 100x100 [
	fill-pen pattern 30x30 [box 1x1 9x9]
	box 0x0 100x100
])
```
![](https://i.gyazo.com/19575bff6afdf7aa5992335622b00951.png)
Horizontal offset is correct, but vertical is weird.


**Expected behavior**

Vertical pattern offset same as horizontal.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4940 date: 25-Aug-2023/1:07:38 commit: #10f54d613a1c78ab9f0638b0bc940f95330b5318 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-08-28T11:14:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5371#issuecomment-1695509221>

    By the way on GTK the result is no pattern appearing at all. Worth a separate ticket?

--------------------------------------------------------------------------------

On 2023-08-28T17:34:53Z, greggirwin, commented:
<https://github.com/red/red/issues/5371#issuecomment-1696080709>

    Is it off by 1 px (less vertically)? Hard to tell here once I zoom in on it, with anti-aliasing.

