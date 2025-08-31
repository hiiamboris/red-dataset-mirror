
#5253: [D2D] Bases can freeze the OS, destroy yer PC and kill yer friends
================================================================================
Issue is closed, was reported by hiiamboris and has 16 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5253>

**Describe the bug**

Well maybe not all of that, but OS freeze guaranteed.
I wonder if we can work around this bug to secure our programs.

**To reproduce**

### SAVE YOUR WORK BEFORE RUNNING THIS SCRIPT

```
Red [needs: view]
view/tight/no-wait [
    below
    b1: base 0.255.0.50
    b2: base 255.0.0
]
loop 5000 [
    b1/size/y: b2/offset/y: random 100
    loop 5 [do-events/no-wait]
]
```
# 🧨💥☠

Life expectancy ~3 seconds.


**Expected behavior**

Finishes without casualties.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-12-11T18:39:42Z, luce80, commented:
<https://github.com/red/red/issues/5253#issuecomment-1345626974>

    Just for fun ;) ... in this minimum reacting version it seems to me that detonation happens only if red box is dragged outside of the window, especially if I use a wide window.
    ```
    view [
    	below
    	base 0.255.0.50 react [face/size/y: b/offset/y - 20]
    	b: base 255.0.0 loose
    ]
    ```

--------------------------------------------------------------------------------

On 2022-12-12T07:18:10Z, qtxie, commented:
<https://github.com/red/red/issues/5253#issuecomment-1346003455>

    No problem when running inside Windows sandbox. So it seems like an issue with the hardware acceleration.

--------------------------------------------------------------------------------

On 2023-01-07T13:58:27Z, luce80, commented:
<https://github.com/red/red/issues/5253#issuecomment-1374490454>

    In this version detonation happens as soon as you resize the window, so it could be useful if the authors use a way to log the debug output to a file to see when it happens.
    **SAVE ALL YOUR WORK BERFORE RUNNING THIS SCRIPT**
    ```
    system/view/auto-sync?: off
    view/flags [
    	on-create [face/data: face/size]  ; init value
    	on-focus [face/data: face/size]  ; store old size
    	on-resizing [
    		siz: face/size - face/data    ; compute size difference
    		face/data: face/size          ; store new size
    		
    		b2/size: b2/size + (siz * 1x1)
    		if not system/view/auto-sync? [show face]
    	]
    
    	base 10x50 red 
    	b2: base 300x200 200.200.200.100 ; use also with [color: none]
    ] 'resize
    ```

--------------------------------------------------------------------------------

On 2023-01-07T15:22:35Z, luce80, commented:
<https://github.com/red/red/issues/5253#issuecomment-1374514436>

    The problem arises also for `rich-text` probably because it also accepts transparency :(

--------------------------------------------------------------------------------

On 2023-01-07T15:33:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5253#issuecomment-1374517683>

    Only `rich-text` and `base` are drawn by D2D.

--------------------------------------------------------------------------------

On 2024-05-08T08:57:28Z, qtxie, commented:
<https://github.com/red/red/issues/5253#issuecomment-2100095617>

    It seems that drawing too fast will crash D2D. Limit the refresh rate to 60 FPS, no freeze anymore on my Win11.

--------------------------------------------------------------------------------

On 2024-05-08T09:12:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/5253#issuecomment-2100124292>

    A kludge, no? :)

--------------------------------------------------------------------------------

On 2024-05-08T09:22:16Z, qtxie, commented:
<https://github.com/red/red/issues/5253#issuecomment-2100144147>

    Yes. Just tried on a laptop, works well.

