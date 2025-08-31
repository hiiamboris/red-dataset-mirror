
#3801: view image crash on macOS
================================================================================
Issue is open, was reported by ralfwenske and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3801>

**Describe the bug**
Inside  `forever` loop `view/no-wait image` crashes after 34 iterations. 
Image memory is not recycled.
A user reported that on W7 this crash does not happen.

When `recycle/off` is set iteration runs (probably) until memory is exhausted.

**To reproduce**
To encounter crash run this (on OSX):
```
Red [Needs:	View] 
;recycle/off
img: make image! 600x400
count: 0
forever [
  view/no-wait 
    compose [image  (img)]
  wait 0.1 unview
  count: count + 1 print count
]
```

**Expected behavior**
App to run until memory is exhausted.
(Once recycling of `view image` works it is expected to run `forever`)

**Screenshots**
```
33
34

*** Runtime Error 1: access violation
*** at: 000C9F01h
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 5-Mar-2019/7:09:36+10:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-05T05:26:43Z, 9214, commented:
<https://github.com/red/red/issues/3801#issuecomment-469543230>

    Possibly related to https://github.com/red/red/issues/3769.

--------------------------------------------------------------------------------

On 2019-03-21T17:15:02Z, qtxie, commented:
<https://github.com/red/red/issues/3801#issuecomment-475322484>

    On Windows, the crash is caused by the WM_DESTROY event was sent to the native handle after the face object been recycled.

