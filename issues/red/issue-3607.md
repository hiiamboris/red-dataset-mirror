
#3607: [Regression] draw matrix transformations became a mess
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3607>

**Describe the bug**
Copying/transforming images with `draw .. [image ..]` is no longer possible.

Here's a *test* image **i** 4x4 pixels:
![](https://i.gyazo.com/89636aa59dcbd80020f98455159177ef.png)

Let's embed it into a bigger (8x8) image **i'**, shifting by 1x1 from the left top corner:
In the previous version:
![](https://i.gyazo.com/4f627dbce1012781ce2212b2dd57884b.png)

In the current version:
![](https://i.gyazo.com/039ec45eaf1bd0dba94c252afda48dbc.png)

Rotated clockwise it's even messier:
![](https://i.gyazo.com/b370698214646a79450d8e3e4f6f708b.png)

Obviously something has to do with miscalculation of the total size of the image (5x5 instead of 4x4)


**To Reproduce**
We'll need a helper function to be able to see pixel details:
```
inspect: function [i] [
	? (also i': make image! i/size * 20x20
	x: y: repeat y i/size/y [
		repeat x i/size/x [
			p: as-pair x y
			draw i' compose [
				line-width 1 pen (i/:p) fill-pen (i/:p)
				reset-matrix translate (20x20 * (p - 1x1))
				box 0x0 19x19
			]
		]
	])
]
```

To draw the original image
`inspect i: draw 4x4 [anti-alias off matrix [0 1 -1 0 3 0] pen red box 0x0 3x3 pen blue line 0x0 3x0]`

To make the embedded image
`inspect i': draw 8x8 [anti-alias off matrix [1 0 0 1 1 1] image i]` (as is)
`inspect i': draw 8x8 [anti-alias off matrix [0 1 -1 0 5 1] image i]` (rotated clockwise by 3 hours)


**Platform version(please complete the following information):**
The regression happened somewhere between Oct 16 and Oct 30 of 2018.
```
Red 0.6.4 for Windows built 22-Nov-2018/3:40:38+03:00 commit #755eb94
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-22T18:51:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3607#issuecomment-441103547>

    The regression was caused by commit https://github.com/red/red/commit/febc80259d991abbc50334a94775fb8b84f03c8f that tried to "fix" the issue https://github.com/red/red/issues/3504
    
    But the issue itself obviously resulted from the lack of attention or understanding of what one's doing, so the "fix" is wrong and should be rolled back.
    
    In the presented code (in that ticket) the image is 300x300 pixels and cannot be properly rotated with translate/rotate commands since that would require rotation origin point to be positioned on a pixel boundary (300.0x0.0) while in it's current implementation rotation happens around the pixel center, which is 300.5x0.5 for the presented code. Thus, the white line appears. Perfectly logical.
    
    @qtxie please revert the buggy fix. And I suggest we should add a test to prevent further regressions like this.

--------------------------------------------------------------------------------

On 2018-11-22T19:06:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3607#issuecomment-441105457>

    A test like this should do:
    ```
    --assert (draw 4x4 [
        anti-alias off
        matrix [0 1 -1 0 3 0]
        pen red box 0x0 3x3
        pen blue line 0x0 3x0
      ]) = i: make image! [4x4 #{
        FF0000FF0000FF00000000FF
        FF0000FFFFFFFFFFFF0000FF
        FF0000FFFFFFFFFFFF0000FF
        FF0000FF0000FF00000000FF
      }]
    --assert (draw 4x4 [matrix [0 1 -1 0 4 0] image i]) = make image! 4x4 [#{
        FF0000FF0000FF0000FF0000
        FF0000FFFFFFFFFFFFFF0000
        FF0000FFFFFFFFFFFFFF0000
        0000FF0000FF0000FF0000FF
      }]
    ```

--------------------------------------------------------------------------------

On 2018-11-23T03:36:00Z, qtxie, commented:
<https://github.com/red/red/issues/3607#issuecomment-441150458>

    @hiiamboris Indeed. You're right, thank you! :+1: 

--------------------------------------------------------------------------------

On 2018-11-23T03:39:55Z, qtxie, commented:
<https://github.com/red/red/issues/3607#issuecomment-441150795>

    I reverted the commit and reopen issue #3504.

--------------------------------------------------------------------------------

On 2018-11-23T23:43:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3607#issuecomment-441330263>

    Nice teamwork! I can't keep up with you guys. :^)

