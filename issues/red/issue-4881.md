
#4881: Severe UI lag in some events, notably ON-OVER and ON-KEY*
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[GUI]
<https://github.com/red/red/issues/4881>

**Describe the bug**

It is common to use on-over event to scroll some face's content.
However once the complexity of such on-over handler exceeds some 6-7ms margin, window never gets redrawn.
Which is very annoying.

**To reproduce**

This is an exploratory script:
```
Red []

wait': function [dt] [
	t: now/precise + (0:0:1 * dt)
	until [positive? difference now/precise t]
]

refresh: does [
	x: now/time/precise / 5
	x: to 1 400 * (x/second % 1)
	b/draw: compose [pen off fill-pen purple box (as-pair x - 50 0) (as-pair x + 50 200)]
]

recompute: does [
	wait' period			;-- 7ms+ computation
	refresh					;-- UI update
	; do-events/no-wait		;-- an attempt to push that update to screen (failed)
]

view [
	on-moving [recompute]
	on-resizing [recompute]
	b: base focus loose cyan 400x200
	rate 70 on-time [recompute]
	on-key [recompute] on-key-down [recompute] on-key-up [recompute]
	; on-key [print "KEY" recompute] on-key-down [print "DOWN" recompute] on-key-up [print "UP" recompute]
	on-wheel [recompute]
	all-over on-over [recompute]
	on-drag [recompute]
	return slider 300 react [
		period: 0.5 * face/data * face/data
		t/text: rejoin [to 1 period * 1000 " ms"]
		set-focus b
	] t: text 90
	do [self/flags: 'resize]
]
```

What you can try:
1. Drag the slider to adjust the computation time
2. Move the pointer around or drag the base - at 6-7ms the UI blocks and won't refresh until you stop what you're doing
3. Hold down any key - it will start blocking at some delay depending on the key repeat rate set in your OS. At 30 keys/sec UI seems to freeze at 13+ ms (1000ms / 30times / 2events). At 50 keys/sec - it freezes for me even without a delay (0 ms).
4. Roll the wheel
5. Resize the window or move it
6. Observe the 70 fps timer effect on the lag

`time`, `wheel`, `sizing`, `moving` events seem to never block the UI, while `key*`, `over` and `drag` block it very soon.

`do-events/no-wait` in some situations can be used to update the actual window, but in this situation it's useless and risky of stack overflows. And also rearranges events, e.g. `key-down` will fire repeatedly, but `key` events will be delayed until after `key-up`.

**Expected behavior**

1. We need a way to force a window (or face) update. That should regardless of any delays provide enough visual feedback.
2. View should to be smart enough to redraw the window every once in a while, not waiting for the whole event queue to become empty. Which should also solve the GUI console printing problem https://github.com/red/red/issues/2627. E.g. no updates in 30ms or longer? - force an update.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-16T17:35:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4881#issuecomment-821330357>

    That was for Windows. On GTK things are different.
    1. Most events are responsive
    2. Keyboard lags hard regardless of the delay chosen, but still updates the view every second. (I only tested at 50 keys/sec setting)
    3. Timer event totally hangs when you scroll the slider to 11 ms or above. Can't even close the program normally
    
    So for GTK backend my expectation is:
    - adaptable timer event
    - more responsive update when holding a key
    
    `moving` event doesn't seem implemented there, so not tested.
    
    <details>
    <summary>Slightly modified script for GTK backend</summary>
    
    ```
    Red []
    
    wait': function [dt] [
    	t: now/precise + (0:0:1 * dt)
    	until [positive? difference now/precise t]
    ]
    
    refresh: does [
    	x: now/time/precise / 5
    	x: to 1 400 * (x/second % 1)
    	b/draw: compose [pen off fill-pen purple box (as-pair x - 50 0) (as-pair x + 50 200)]
    ]
    
    recompute: does [
    	wait' period			;-- 7ms+ computation
    	refresh					;-- UI update
    	; do-events/no-wait		;-- an attempt to push that update to screen (failed)
    ]
    
    view [
    	on-moving [recompute]
    	on-resizing [recompute]
    	b: base loose cyan 400x200
    	rate 70 on-time [recompute]
    	on-key [recompute] on-key-down [recompute] on-key-up [recompute]
    	; on-key [print "KEY" recompute] on-key-down [print "DOWN" recompute] on-key-up [print "UP" recompute]
    	on-wheel [recompute]
    	all-over on-over [recompute]
    	on-drag [recompute]
    	return slider 300 focus react [
    		period: 0.5 * face/data * face/data
    		t/text: rejoin [to 1 period * 1000 " ms"]
    		set-focus b
    	]
    	on-key [recompute] on-key-down [recompute] on-key-up [recompute]
    	t: text 90
    	do [self/flags: 'resize]
    ]
    ```
    </details>

--------------------------------------------------------------------------------

On 2021-04-16T19:18:24Z, greggirwin, commented:
<https://github.com/red/red/issues/4881#issuecomment-821510673>

    I can get to higher delays on Win10 here, but the lag gets worse and worse. 
    
    Thanks, as usual, for the excellent demo script. Should help @qtxie and @dockimbel enormously.

--------------------------------------------------------------------------------

On 2021-04-16T19:20:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4881#issuecomment-821511579>

    A big part of this, which we may not be able to solve right now, is single-threadedness and the event loop. 

--------------------------------------------------------------------------------

On 2022-05-02T18:14:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4881#issuecomment-1115207731>

    GTK timer issue is quite serious it seems. Prevents `over` events from being registered, with bigger lag prevents even `drawing` events, so the window never gets drawn (just a black box).

