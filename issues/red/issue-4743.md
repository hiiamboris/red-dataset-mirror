
#4743: [GTK & Mac] Transparent surfaces are eating events
================================================================================
Issue is closed, was reported by hiiamboris and has 18 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4743>

**Describe the bug**

`view [backdrop red box 100x100 on-down [probe "down"]]`
click anywhere on the box
`box` should not react to clicks (at least it's transparent parts when something is drawn on it), but it does

**Platform version**
```
Red 0.6.4 for Linux built 1-Nov-2020/23:51:29+03:00 commit #2d05900
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-06T12:34:51Z, 9214, commented:
<https://github.com/red/red/issues/4743#issuecomment-739496615>

    https://github.com/red/red/issues/1931

--------------------------------------------------------------------------------

On 2020-12-07T02:28:12Z, qtxie, commented:
<https://github.com/red/red/issues/4743#issuecomment-739625361>

    That's another issue cannot be solved without changing the low-level GUI engine, which we cannot as it's closed source on macOS.

--------------------------------------------------------------------------------

On 2020-12-07T09:29:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4743#issuecomment-739794087>

    Can't we just check the pixel color and kick the event further from one face into another, in our own code?

--------------------------------------------------------------------------------

On 2020-12-07T14:47:17Z, qtxie, commented:
<https://github.com/red/red/issues/4743#issuecomment-739963725>

    It will be very costly if no low-level API to do the checking.

--------------------------------------------------------------------------------

On 2020-12-07T15:10:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4743#issuecomment-739977997>

    Don't we have cached images of each face?

--------------------------------------------------------------------------------

On 2020-12-07T21:59:43Z, greggirwin, commented:
<https://github.com/red/red/issues/4743#issuecomment-740205581>

    > Can't we just check the pixel color 
    
    What it the pixel color matches the one underneath?

--------------------------------------------------------------------------------

On 2020-12-08T06:29:46Z, qtxie, commented:
<https://github.com/red/red/issues/4743#issuecomment-740410253>

    > Don't we have cached images of each face?
    
    No, we don't. There should be an OS API to get the bitmap of a face. Then we'll need to get the face under the current face, pass the event to it. If no API to get the face, we'll have to enumerate the face tree to check the bounding box and the z-order. Not an easy fix but it's possible.

--------------------------------------------------------------------------------

On 2020-12-08T08:03:25Z, qtxie, commented:
<https://github.com/red/red/issues/4743#issuecomment-740454231>

    We already have some related code to handle it on macOS. The fix is much easier than I thought. 
    For GTK backend, @bitbegin had spent quite some time on this issue, seems no easy fix.

--------------------------------------------------------------------------------

On 2022-09-14T09:17:08Z, qtxie, commented:
<https://github.com/red/red/issues/4743#issuecomment-1246477783>

    > Can't we just check the pixel color and kick the event further from one face into another, in our own code?
    
    I've been searching for a solution for GTK. Seems the only way is to create a pixbuf for the transparent face, then we can check the pixel color under the mouse.

