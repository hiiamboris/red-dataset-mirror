
#4729: Image scaling & matrix bugs
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.reviewed] [type.review] [status.wontfix]
<https://github.com/red/red/issues/4729>

This is a followup on https://github.com/red/red/pull/4054 where tests dwim5 and dwim6 were failing.

**Describe the bug**

On a Mac 10.14 VM matrix rotation produces meaningless result.

This is the original image:
![](https://i.gyazo.com/6a060d9ea90751a1964abf872b0a677b.png)
Produced as: 
```
	i: make image! [4x4 #{
		FF0000 FF0000 FF0000 0000FF
		FF0000 FFFFFF FFFFFF 0000FF
		FF0000 FFFFFF FFFFFF 0000FF
		FF0000 FF0000 FF0000 0000FF
	}]
```

Now we rotate it clockwise by switching axes: X->Y, Y->4-X: `i-cw: draw 4x4 [matrix [0 1 -1 0 4 0] image i]`
What we get:

| Windows | Mac |
| --- | --- |
| ![](https://i.gyazo.com/76ac6b513ecdb0d9b37e1103b786615b.png) | ![](https://i.gyazo.com/0572e6ac47f437fd55b527f3c122ce59.png) |

Where is the extra Red pixel coming from on Mac??
You'd think this some glitch on image edge, but no, same thing with 2x2 borders: `i-cw8: draw 8x8 [matrix [0 1 -1 0 6 2] image i]` looks like:
![](https://i.gyazo.com/3ee8f28d992554c63f4aa36f392a92e5.png)

Counter-clockwise rotation also produces an unexpected red pixel: `i-ccw: draw 4x4 [matrix [0 -1 1 0 0 4] image i]`
![](https://i.gyazo.com/34838c316242d1609935397fdacc9c57.png)

However, this rotation works fine on the same Mac:

| Original | Rotated counter-clockwise |
| --- | --- |
| ![](https://i.gyazo.com/76ac6b513ecdb0d9b37e1103b786615b.png) | ![](https://i.gyazo.com/6a060d9ea90751a1964abf872b0a677b.png) |

So, looks like Macos 10.14 rotation algorithm produces random glitches at certain pixel locations. Macos 10.9 didn't have this bug.

Let's try scaling by 20, `i20: draw 80x80 [scale 20 20 image i]`:
![](https://i.gyazo.com/163ebaeae826333763746080f57b74d8.png)
Taking a closer look, I can see that both scaling operations are buggy:
| Windows | Mac | GTK |
| ---| ---| ---| 
| ![](https://i.gyazo.com/bb33faceaa1cf2b28b5cf6763b4242b2.png) | ![](https://i.gyazo.com/cb8fa5ad80ea56d53884115c35007511.png) | ![](https://i.gyazo.com/e42bcafa04057a5a4ea493188333abaf.png) | 
| This is off by half a pixel (see https://github.com/red/red/issues/3504) | What kind of scaling is this??? I must congratulate Macos developers on their success! Way to go dudes! | The expected result |


**To reproduce**
```
i: make image! [4x4 #{FF0000 FF0000 FF0000 0000FF	FF0000 FFFFFF FFFFFF 0000FF	FF0000 FFFFFF FFFFFF 0000FF	FF0000 FF0000 FF0000 0000FF}]
i-cw: draw 4x4 [matrix [0 1 -1 0 4 0] image i]
i-ccw: draw 4x4 [matrix [0 -1 1 0 0 4] image i]
i20: draw 80x80 [scale 20 20 image i]
```
You may wanna use [`explore` mezz](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/explore.red) to zoom in. Clone the whole repo for it to load dependencies.

**Expected behavior**

1. Lossless rotation. Not satisfied on Mac currently.
2. Predictable scaling. Only GTK is OK currently. Windows code should not shift the image by -0.5x-0.5 (but this is addressed by https://github.com/red/red/issues/3504), on Mac we probably should consider some other transform algorithms.
3. Ideally, consistent scaling output. Right now Mac reflects edge pixels from the border, while other platforms treat pixels 'outside' the image as white.

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-18T23:51:22Z, qtxie, commented:
<https://github.com/red/red/issues/4729#issuecomment-730030070>

    I don't think we can fix it unless use an opensource graphic engine.

--------------------------------------------------------------------------------

On 2020-11-22T05:29:09Z, dander, commented:
<https://github.com/red/red/issues/4729#issuecomment-731701178>

    Is it possible this effect has something to do with [subpixel positions](https://en.wikipedia.org/wiki/Pixel#Subpixels)? If that were so, maybe changing the colors might change how the distortion occurs. I don't have a Mac to test it.

--------------------------------------------------------------------------------

On 2022-09-07T04:13:57Z, qtxie, commented:
<https://github.com/red/red/issues/4729#issuecomment-1238887113>

    Those are issues of the OS drawing libraries. We'll have to live with it.

--------------------------------------------------------------------------------

On 2022-09-07T07:15:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4729#issuecomment-1239001397>

    @qtxie if there's no lossless rotation in the OS API, how do I rotate things, e.g. in Retris? Pixel by pixel on Red level?

--------------------------------------------------------------------------------

On 2022-09-07T13:38:29Z, qtxie, commented:
<https://github.com/red/red/issues/4729#issuecomment-1239403589>

    Those matrix APIs are for manipulating the graphic context. Not for image. You should use functions which manipulate the image directly. You'll need to write them yourself for now, no those functions included in Red.

