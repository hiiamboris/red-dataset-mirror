
#1495: a progress bar and a slider with the same size specified, are not equally sized on screen
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.reviewed] [GUI] [type.task.wish]
<https://github.com/red/red/issues/1495>

the slider is slightly smaller



Comments:
--------------------------------------------------------------------------------

On 2020-03-21T18:00:58Z, 9214, commented:
<https://github.com/red/red/issues/1495#issuecomment-602080255>

    @meijeru do you happen to remember which platform was that? W7?
    
    I don't think pixel-perfect match of visual widget's sizes is worth pursuing; at least from my experience, there's a hard cap on padding and margins on all the supported backends.

--------------------------------------------------------------------------------

On 2020-03-21T20:19:45Z, meijeru, commented:
<https://github.com/red/red/issues/1495#issuecomment-602098727>

    I have only W10 -- it is on that platform that I noticed it. The difference is very visible to the naked eye.

--------------------------------------------------------------------------------

On 2020-03-21T20:26:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/1495#issuecomment-602099748>

    W7:
    ![](https://i.gyazo.com/42b1e5adc3260a819e7d5b8715aeddb3.png)
    It's pixel-perfect actually and the internal padding is added by the OS for whatever aesthetic reason, maybe simply for the sliding bob to fit into the designated rectangle.

--------------------------------------------------------------------------------

On 2020-03-21T20:51:54Z, meijeru, commented:
<https://github.com/red/red/issues/1495#issuecomment-602103165>

    As seen in the nice picture above, the slider is INSIDE the space allocated to the widget, so the end points are not extending to the edges of the progress bar. If one does not have a frame around them, it just looks like the slider is narrower. I close this issue.

