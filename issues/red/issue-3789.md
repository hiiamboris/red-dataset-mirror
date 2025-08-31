
#3789: [Draw] `qcurv` doesn't work, at all
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3789>

**Describe the bug**

What do the docs say:
![](https://i.gyazo.com/d3884c1a599fe7bec562098c8c3ead3f.png)

So, essentially, `qcurv`, in contrast to other shape curve functions, can only accept one point (1).
Let's try it in 3 different ways...
```
view [
	base 250x250 draw [		; feeding a single point
		scale 10 10 pen linear cyan purple 
		shape [move 5x5 qcurv 20x5 qcurv 20x20 qcurv 5x20 qcurv 5x5 move 5x5]
	] 
	base 250x250 draw [		; feeding pairs of points
		scale 10 10 pen linear cyan purple 
		shape [move 5x5 qcurv 20x5 20x20 qcurv 5x20 5x5 move 5x5]
	] 
	base 250x250 draw [		; feeding a bunch
		scale 10 10 pen linear cyan purple 
		shape [move 5x5 qcurv 20x5 20x20 5x20 5x5 move 5x5]
	] 
]
```
![](https://i.gyazo.com/51f6d577bc3944cca442a5326440527c.png)
Some nice smoothing (2) ☻

**Expected behavior**

(1) bug in the docs - should accept multiple points
(2) behavior of R2 is desired - here's the R2 script version and the R2 result:
```
view layout [
	across
	box 250x250 effect [draw [
		scale 10 10 pen red
		shape [move 5x5 qcurv 20x5 qcurv 20x20 qcurv 5x20 qcurv 5x5 move 5x5]
	]]
	box 250x250 effect [draw [
		scale 10 10 pen red
		shape [move 5x5 qcurv 20x5 20x20 qcurv 5x20 5x5 move 5x5]
	]]
	box 250x250 effect [draw [
		scale 10 10 pen red
		shape [move 5x5 qcurv 20x5 20x20 5x20 5x5 move 5x5]
	]]
]
```
![](https://i.gyazo.com/711a1584fec8062158ffa43719ec7e85.png)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-21T21:57:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3789#issuecomment-466183515>

    There actually is one scenario where it does work, albeit only once. After `qcurve`.
    ```
    view [
    	base 250x250 draw [
    		scale 10 10 pen linear cyan purple 
    		shape [move 5x5 qcurve 20x5 20x20 qcurv 5x20 qcurv 5x5]
    	] 
    	base 250x250 draw [
    		scale 10 10 pen linear cyan purple 
    		shape [move 5x5 qcurve 20x5 20x20 qcurv 5x20 5x5]
    	] 
    ]
    ```
    ![](https://i.gyazo.com/7c6a00d05b5e2a766c09acb302c94904.png)
    
    While the same code in R2 - `qcurv` can continue the curve indefinitely:
    ```
    view layout [
    	across
    	box 250x250 effect [draw [
    		scale 10 10 pen red
    		shape [move 5x5 qcurve 20x5 20x20 qcurv 5x20 5x5]
    	]]
    	box 250x250 effect [draw [
    		scale 10 10 pen red
    		shape [move 5x5 qcurve 20x5 20x20 qcurv 5x20 qcurv 5x5]
    	]]
    ]
    ```
    ![](https://i.gyazo.com/5e283c4111073ed3d0a59630e3553a87.png)

