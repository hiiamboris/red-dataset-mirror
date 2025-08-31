
#5425: `to-image` produces garbage when window is minimized
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5425>

**Describe the bug**

I want to access the `camera` image, but without the window popping up, so I can adjust screen brightness automatically. No luck.

Simple test script `1.red`:
`Red [] view [base cyan rate 1 on-time [? (to image! face) unview]]`

| When I run it normally | When I run it as `start/min red 1.red` |
|-|-|
| ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/MY9oLzP.png) | ![](https://link.storjshare.io/raw/jxfnjjold7d4xtoupll4mp7ychkq/img/6pURDnp.png) |

**Expected behavior**

`to-image` producing the same result on faces regardless of the window size

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5037 date: 30-Oct-2023/8:45:38 commit: #377b5ed3f38a7eb027243c70b68061f5c9fe8f99 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-13T07:42:00Z, qtxie, commented:
<https://github.com/red/red/issues/5425#issuecomment-1807609544>

    It looks like a limitation of the `PrintWindow` API on Windows. 
    
    On macOS, the `camera` face updates its `/image` facet periodically. You can access `/image` facet to get the latest image. We can support it on Windows.

--------------------------------------------------------------------------------

On 2023-11-13T08:04:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5425#issuecomment-1807635471>

    > We can support it on Windows.
    
    Would be nice.

--------------------------------------------------------------------------------

On 2023-11-13T08:06:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/5425#issuecomment-1807637139>

    > It looks like a limitation of the `PrintWindow` API on Windows
    
    You sure? I find it strange that it captures the non-client area, even though it's not displayed either.

--------------------------------------------------------------------------------

On 2024-05-15T08:11:13Z, qtxie, commented:
<https://github.com/red/red/issues/5425#issuecomment-2111854774>

    It should work now on Windows on commit 535cc3dd05f0be9bb87fb034c49acba9f2d3e493.
    
    ```
    view win: layout [
        title "Red Camera"
        origin 10x10 space 10x10
        cam: camera 1x1  ;--non visible camera just to get back image 
        return
        canvas: base 320x240 black on-time [
            canvas/text: form now/time 
            canvas/image: to image! cam
        ] font-color green font-size 12
        return
        cam-list: drop-list 220 on-create [face/data: cam/data]
        toggle 90 "Start" false [
            either cam/selected [
                cam/selected: none
                canvas/rate: none
                canvas/image: none
                face/text: "Start"
            ][
                cam/selected: cam-list/selected
                canvas/rate: 0:0:0.04;  max 1/25 fps in ms
                face/text: "Stop"
            ]
        ]
        do [
            cam-list/selected: 1 canvas/rate: none 
            canvas/para: make para! [align: 'right v-align: 'bottom] 
            cam/visible?: no
        ]
    ]
    ```

--------------------------------------------------------------------------------

On 2024-05-18T20:27:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5425#issuecomment-2118995557>

    This works for me now: `Red [] view [camera select 1 rate 1 on-time [? (to image! face/image) unview]]`  when run as `start/min red 1.red`
    Can't the original code be supported as well?

--------------------------------------------------------------------------------

On 2024-05-19T01:00:44Z, qtxie, commented:
<https://github.com/red/red/issues/5425#issuecomment-2119047927>

    @hiiamboris Works on `base` face now.

