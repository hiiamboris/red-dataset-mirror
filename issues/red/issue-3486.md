
#3486: Smooth cubic bezier `curv` (in `shape` dialect) after another `curv` not smooth
================================================================================
Issue is open, was reported by toomasv and has 20 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3486>

### Expected behavior
`curv` after another `curv` should join smoothly.
### Actual behavior
Second `curv` joins in sharp angle.
### Steps to reproduce the problem
Problem is at 6th point below:
```
view [
   at 0x0 box 500x500 draw [
      shape [
         move 0x250 
         curve 50x100 100x300 150x250 
         curv 250x300 300x250 
         curv 400x300 450x250 
         move 0x250
      ] 
      text 10x240 "1" circle 0x250 4 
      text 60x90 "2" circle 50x100 4 
      text 110x290 "3" circle 100x300 4 
      text 160x240 "4" circle 150x250 4 
      text 260x290 "5" circle 250x300 4 
      text 310x240 "6" circle 300x250 4 
      text 410x290 "7" circle 400x300 4 
      text 460x240 "8" circle 450x250 4
   ]
]
```
[![bezier-bug](http://vooglaid.ee/red/smooth-bezier-bug.png)](http://vooglaid.ee/red/smooth-bezier-bug.png)
However, at point 4 `curv` joins smoothly to the preceding `curve`.
Same is true for `'curv`:
```
view [
   at 0x0 box 500x500 
   draw [
      shape [
         move 0x250 
         'curve 50x-150 100x50 150x0 
         'curv 100x50 150x0 
         'curv 100x50 150x0 
         move 0x250
      ] 
      text 10x240 "1" circle 0x250 4 
      text 60x90 "2" circle 50x100 4 
      text 110x290 "3" circle 100x300 4 
      text 160x240 "4" circle 150x250 4 
      text 260x290 "5" circle 250x300 4 
      text 310x240 "6" circle 300x250 4 
      text 410x290 "7" circle 400x300 4 
      text 460x240 "8" circle 450x250 4
   ]
]
```
### Red and platform version
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 794 date: 17-Jul-2018/8:52:28 commit: #f1ec0e8e964afe132ad297ad77ceacb04be2c390 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```


Comments:
--------------------------------------------------------------------------------

On 2020-03-09T20:13:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/3486#issuecomment-596756281>

    **Regressed.**
    `Red 0.6.3 for Windows built 16-Sep-2018/8:12:03+03:00 commit #09de884`:
    ![](https://i.gyazo.com/4df336f71102157cbb2ccf670fae3350.png)
    `Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211`:
    ![](https://i.gyazo.com/234be5e33925e063eca724f77ec8ff15.png)

--------------------------------------------------------------------------------

On 2020-03-09T20:31:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/3486#issuecomment-596764011>

    ```
    img: draw 250x250 [
    	scale 0.5 0.5
    	line-width 10
    	shape [
    		move 10x10
    		curv 0x500 250x250 250x490 490x250 
    		move 10x10
    	] 
    ]
    view [image img]
    ```
    
    | 16-Sep-2018/8:12:03+03:00 commit #09de884 | 27-Feb-2020/6:07:00+03:00 commit #bf15211 |
    | --- | --- |
    | ![](https://i.gyazo.com/621b85a23e1f2f0474322fb339c8b98c.png) | ![](https://i.gyazo.com/a572d180619e2198f21b1f7e7503fa48.png) |
    

--------------------------------------------------------------------------------

On 2020-03-09T20:44:58Z, greggirwin, commented:
<https://github.com/red/red/issues/3486#issuecomment-596770150>

    Including graphic examples helps sooo much with tickets like this. Thanks.

--------------------------------------------------------------------------------

On 2020-03-10T04:10:27Z, qtxie, commented:
<https://github.com/red/red/issues/3486#issuecomment-596892528>

    The fixed was reverted somehow. 😓 

--------------------------------------------------------------------------------

On 2021-02-27T18:18:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/3486#issuecomment-787114054>

    Say what you will, but to my eye it's still not working.
    
    This snippet requires [explore](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/explore.red) and dependencies.
    ```
    do %explore.red
    
    p: [0x0 3x3 20x5 40x0 50x5 42x10]
    bxs: collect [foreach xy p [keep reduce ['box xy - 1 xy + 1]]]
    i: draw 100x50 probe compose/deep [
    	; pen red shape [move (take p) curv (take/part p 3) curv (p) move 0x0]		;) 1
    	; pen red shape [curve (take/part p 3) curv (p)]								;) 2
    	pen red shape [curve (p) move 0x0]											;) 3
    
    	pen blue (bxs)
    ]
    
    explore i
    ```
    
    Results:
    
    | Variant | Win | Mac | GTK |
    | --- | ---| ---| --- |
    | 1 | ![](https://i.gyazo.com/e80d63d2bc61bb724234cda8512998d8.png) | ![](https://i.gyazo.com/ae88055063901051d1e7d5f2809f1c5e.png) | ![](https://i.gyazo.com/0cede8486f8e5c65bfd726c0f9c06b9c.png) |
    | 2 | ![](https://i.gyazo.com/7f358f5073e3dde89c92dd5acb31f207.png) | ![](https://i.gyazo.com/227e7aa804625cb0be8ea8456c5925df.png) | ![](https://i.gyazo.com/2a9014d3cc650318ef5106d29e055c4d.png) |
    | 3 | ![](https://i.gyazo.com/c507006cdfb73c3b7809e1d86de34406.png) | ![](https://i.gyazo.com/f0a22eb05607971764f3cbd55a303b79.png) | ![](https://i.gyazo.com/e270c68a592091f3a18f707fc20de5e6.png) |
    | Comments | [IMMA FIRIN MAH LAZER!!](https://knowyourmeme.com/memes/shoop-da-whoop) | 1. Missed 4th point <br>2. Missed last point <br>3. Missed 3 last points | Same issues as on Mac but closes 2nd curve |
    
    That 4th point is missed can be proven by changing it from `40x0` to `40x-100` - same curve.
    
    **Expected**
    1. Consistent results across backends
    2. No points ignored
    3. No shooting aboard the spaceship
    
    **Version**
    `Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423`
    `Red 0.6.4 for Linux built 8-Jan-2021/20:01:04`
    And 1-Feb-2021 on Mac

--------------------------------------------------------------------------------

On 2021-05-11T19:44:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/3486#issuecomment-839068111>

    Versions 1 & 2 still firin lazers for me @qtxie 
    
    Also `spline` draws spiky nonsense:
    `view [image draw [pen red line-width 2 spline 10x90 50x60 50x20 50x60 90x90]]`
    ![](https://i.gyazo.com/9b9d8f8920baab37528f3a5d650ebb76.png)

--------------------------------------------------------------------------------

On 2021-05-12T02:00:02Z, qtxie, commented:
<https://github.com/red/red/issues/3486#issuecomment-839374441>

    @hiiamboris There is a syntax error in versions1 & 2. `curv` expects even number of coordinates. We have the following options:
    1. Check it at runtime and throw an error.
    2. Ignore the third coordinate silently.
    3. Static checking by using a tool or compiling draw dialect to byte code.
    ```
    pen red shape [move 0x0 curv 3x3 20x5 40x0 curv 50x5 42x10 move 0x0]
    ```
    
    BTW, SVG also gives wrong result.

--------------------------------------------------------------------------------

On 2021-05-12T06:17:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/3486#issuecomment-839489174>

    Since the docs give no clue, can you explain why even number? I did a software cubic spline interpolation once, and I have no idea why this limitation. It should just draw the curve thru all the specified points, no matter their number.

--------------------------------------------------------------------------------

On 2021-05-12T07:26:46Z, qtxie, commented:
<https://github.com/red/red/issues/3486#issuecomment-839532582>

    A cubic Bézier segment is defined by a start point, an end point, and two control points. `Curv` expects a control point and an end point. The SVG docs has more details: https://www.w3.org/TR/SVG11/paths.html#PathDataCurveCommands

--------------------------------------------------------------------------------

On 2021-05-12T09:48:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3486#issuecomment-839635571>

    OK then I propose:
    - throw a Draw error when number of points is unexpected
    - document the proper usage of Shape's curv/curve in https://w.red-lang.org/en/draw/#draw-commands
    - ~~fix `spline` as B-spline isn't supposed to be spiky~~ (on a second thought, looks like I a limitation of quadratic spline, since 3 points I specified lie in the same vertical line, nevermind)
    
    Also I am wondering, why don't we have a `spline` equivalent inside Shape subdialect? Not that I need it badly, just seems to me as a deficiency of shapes.

