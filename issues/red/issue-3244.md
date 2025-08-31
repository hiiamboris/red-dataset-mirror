
#3244: The Camera face don't show video
================================================================================
Issue is open, was reported by DVL333 and has 28 comment(s).
[status.deferred] [GUI]
<https://github.com/red/red/issues/3244>

### Expected behavior
That script is executed:
`view [camera with [selected: 1] ]`
It's expected to get video from Camera.
### Actual behavior
Instead of video from Camera a blue rectangle is shown.
In some cases (very rare) video begins to show, but only 1-2 sec and then it's interrupted and blue rectangle is shown again.
### Steps to reproduce the problem
See above
### Red version and build date, operating system with version.
Windows7 Ultimate 64bit, Red - version 0.6.3 built 3-Mar-2018/2:02:48+03:00



Comments:
--------------------------------------------------------------------------------

On 2018-03-05T04:33:36Z, gltewalt, commented:
<https://github.com/red/red/issues/3244#issuecomment-370307292>

    Also get a access violation if my Lenovo webcam program is running before I try `camera` in Red.
    
    https://imgur.com/lWxUGZA

--------------------------------------------------------------------------------

On 2018-03-05T06:04:45Z, dockimbel, commented:
<https://github.com/red/red/issues/3244#issuecomment-370318801>

    Works fine on:
    * Win7 Ultimate 64-bit/Desktop + cheap USB webcam
    * Win7 Ultimate 64-bit/Bootcamp on MacBook with integrated webcam
    
    So no regression.

--------------------------------------------------------------------------------

On 2018-03-05T08:05:30Z, DVL333, commented:
<https://github.com/red/red/issues/3244#issuecomment-370338880>

    I also have Lenovo laptops (tested on two different Lenovo laptops with integrated cameras).

--------------------------------------------------------------------------------

On 2018-03-05T08:32:32Z, qtxie, commented:
<https://github.com/red/red/issues/3244#issuecomment-370344794>

    Thanks. The camera has some glitch with best performance setting. I'll do more investigation.

--------------------------------------------------------------------------------

On 2018-03-05T09:06:15Z, qtxie, commented:
<https://github.com/red/red/issues/3244#issuecomment-370353225>

    @DVL333 @gltewalt Does it this app work on your computer? [SimpleCapture-exe.zip](https://github.com/red/red/files/1780148/SimpleCapture-exe.zip)

--------------------------------------------------------------------------------

On 2018-03-05T18:06:18Z, DVL333, commented:
<https://github.com/red/red/issues/3244#issuecomment-370509020>

    2 qtxie:
    Yes, it works!

--------------------------------------------------------------------------------

On 2018-03-05T18:55:21Z, toomasv, commented:
<https://github.com/red/red/issues/3244#issuecomment-370524187>

    `view [camera with [selected: 1] ]` works on W10 March 3 build, but little bit stretched on y axes. `SimpleCapture-exe.zip` works well too.

--------------------------------------------------------------------------------

On 2018-03-06T02:43:29Z, qtxie, commented:
<https://github.com/red/red/issues/3244#issuecomment-370642755>

    Good. So maybe I should use Media Foundation instead of DirectShow.

--------------------------------------------------------------------------------

On 2018-04-01T19:05:37Z, gltewalt, commented:
<https://github.com/red/red/issues/3244#issuecomment-377809060>

    SimpleCapture didn't work on my computer.

--------------------------------------------------------------------------------

On 2019-10-11T11:50:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3244#issuecomment-541031913>

    Tried on two cams (1 real, 1 virtual), W8. Both work OK in Red.
    SimpleCapture crashes after some small time.

--------------------------------------------------------------------------------

On 2019-10-11T20:33:47Z, DVL333, commented:
<https://github.com/red/red/issues/3244#issuecomment-541214368>

    I tried too - this code works now (on the same laptop).

--------------------------------------------------------------------------------

On 2019-10-13T17:55:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3244#issuecomment-541440991>

    Should we close this and open a new ticket for the crash @hiiamboris gets?

--------------------------------------------------------------------------------

On 2019-10-13T18:04:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/3244#issuecomment-541441945>

    Let's wait for @gltewalt to confirm if he still has crashes.

--------------------------------------------------------------------------------

On 2019-10-14T14:47:15Z, endo64, commented:
<https://github.com/red/red/issues/3244#issuecomment-541723053>

    It works for me on Win10 x64 desktop, with Logitech USB camera.

