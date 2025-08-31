
#4850: Progess bar does not dynamically respond to being resized
================================================================================
Issue is closed, was reported by dsunanda and has 0 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/4850>



**Describe the bug**
Progress bars do not seem to dynamically adapt to being resized.

 
**To reproduce**
   view/no-wait [p: progress 200x20 data 0.5]
    p/size: 400x20

P is now showing 25% complete. Seems to be no way to force View to recognize the change.


**Expected behavior**

P should still be showing 50% complete

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Platform version**

```
Red 0.6.4 for Windows built 9-Mar-2021/9:08:43 commit #c4d9b0a
```

**Hiiamboris added this note on Gitter:**

I see 2 bugs:

after doubling the size (200 -> 400), the range multiplied by 6 (1.0 -> 6.0)

p/data: integer does nothing

**Tested on**

Windows 9-Mar-2021 build


