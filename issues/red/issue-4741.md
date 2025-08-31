
#4741: [Windows] DRAW scale 0 0 works as 1 1
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/4741>

**Describe the bug**

Using [`explore`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/explore.red):
```
explore draw 10x10 [translate 3x3 scale 1 1 [fill-pen black circle 20x20 20]]
explore draw 10x10 [translate 3x3 scale 0.1 0.1 [fill-pen black circle 20x20 20]]
explore draw 10x10 [translate 3x3 scale 0.01 0.01 [fill-pen black circle 20x20 20]]
explore draw 10x10 [translate 3x3 scale 0 0 [fill-pen black circle 20x20 20]]
```
We get:

| OS | 100% | 10% | 1% | 0% |
|---|---|---|---|---|
| Windows | ![](https://i.gyazo.com/fa6e8cfb1d55b5281e56b7dd843b932f.png) | ![](https://i.gyazo.com/651ffcba1f041b3feb4487fd9ec408df.png) | ![](https://i.gyazo.com/a87ad00354c0560fbfb31c0b78da6097.png) | ![](https://i.gyazo.com/74f0b2b77959b99ecd5d93ef1d92da09.png) |
| Linux | ![](https://i.gyazo.com/8a2962be02489f18b08f132c712d410a.png) | ![](https://i.gyazo.com/22b27e5983cf3e92fdd83545d556df0a.png) | ![](https://i.gyazo.com/a1efeae717ee19f3e269a28bf4d388b9.png) | ![](https://i.gyazo.com/d26b98d39c18023b29404fef214f42c0.png) |

As can be seen, on Windows `scale 0 0` falls back to `1 1`.

**Expected behavior**

Nothing should be drawn.

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-29T02:54:52Z, qtxie, commented:
<https://github.com/red/red/issues/4741#issuecomment-929782296>

    Seems it's fixed on the current D2D backend.

--------------------------------------------------------------------------------

On 2021-09-29T07:32:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/4741#issuecomment-929916273>

    Seems so.

