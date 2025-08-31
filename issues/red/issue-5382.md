
#5382: [VID] Slider data is ignored
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written] [GUI]
<https://github.com/red/red/issues/5382>

**Describe the bug**

`data` facet has no effect on `slider` in VID, only works after face creation:

| `view [slider data 0.5]` | `view [slider on-created [face/data: 0.5]]` |
|-|-|
| ![](https://i.gyazo.com/176f2cddf23e6cfe52459381a6893581.png) | ![](https://i.gyazo.com/1c29e0e48e6e985a918bee41f749cf94.png) |

Scroller has the same issue but it's in such sorry state that I don't know even how to make it work.

**To reproduce**

`view [slider data 0.5]`

**Expected behavior**

As `view [slider on-created [face/data: 0.5]]`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4950 date: 2-Sep-2023/9:39:49 commit: #004d71b71ff3e82c9ad3e199860c61adee158223 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-10T11:38:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5382#issuecomment-1712790529>

    It's caused by a R/S level bug:
    
    ```
    Red/System []
    
    m: as float32! 150
    pos: declare struct! [value [float!]]
    pos/value: 0.5
    f: m * as float32! pos/value
    ?? f
    ```
    gives: `1.#NaN`.
    
    Without the type-casting to `float32!`, it gives the right answer: `75`.

--------------------------------------------------------------------------------

On 2023-09-10T11:42:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5382#issuecomment-1712791428>

    Also I don't find a way to init it with no-sync on:
    `view/no-sync [slider on-created [face/data: 0.5]]` doesn't work.

--------------------------------------------------------------------------------

On 2023-09-10T11:44:47Z, dockimbel, commented:
<https://github.com/red/red/issues/5382#issuecomment-1712791804>

    `view/no-sync [slider on-created [face/data: 0.5 show face]]`

