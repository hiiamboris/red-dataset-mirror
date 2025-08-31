
#5057: Different clip regions do intersect only
================================================================================
Issue is open, was reported by toomasv and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/5057>

**Describe the bug**
Since Feb 2021 different clip regions in draw do intersect only, disregarding the defined mode. 

**To reproduce**
E.g. `view [box 101x101 draw [fill-pen brick clip 0x0 70x70 clip 50x50 100x100 xor box 0x0 100x100]]`

**Expected behavior**
This should draw xor-ed rectangles, but draws single intersected rectangle.

**Screenshots**
:point_up: [January 28, 2022 12:58 PM](https://gitter.im/red/red/gui-branch?at=61f3cc3be1a1264f0a7b2cd2)

**Platform version**
Please specify the operating system, Red version, and build date with Git commit.
```
>> about
Red 0.6.4 for Windows built 25-Jan-2022/10:24:52+02:00  commit #3903acf
```



Comments:
--------------------------------------------------------------------------------

On 2022-01-28T12:51:01Z, qtxie, commented:
<https://github.com/red/red/issues/5057#issuecomment-1024185156>

    It's a GDI+ only feature. We'll see how to implement it on other backends.

