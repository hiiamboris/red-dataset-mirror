
#5513: [Regression] More aftershocks from #5253
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5513>

**Describe the bug**

Coming from https://github.com/red/red/commit/5195586f4fbba248092a11893476d76717e4491e#commitcomment-143298002 , a quick breakage scenario:
```
view collect [
	repeat y 8 [
		repeat x 8 [
			keep [
				base white 60x60 rate 67 on-time [
					t: 6 * pick now/precise 'second
					face/draw: compose [
						line 30x30 (30 * ((1,1) + as-point2D negate sine t cosine t))
					]
				]
			]
		]
		keep 'return
	]
]
```

**Expected behavior**

Should be realtime, but it's 1 frame per second per base :)

**Screenshots**

In red-view-07mar24-5a39a7a32:

<img width=400 src=https://github.com/red/red/assets/25307049/4d8e8f3b-d882-4bb4-8ed5-385cb5098e10 />

In red-view-19jun24-5195586f4:

<img width=400 src=https://github.com/red/red/assets/25307049/dbdfb165-71b1-4436-8df7-f6d3e823fd0a />

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 167 date: 19-Jun-2024/9:28:23 commit: #5195586f4fbba248092a11893476d76717e4491e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-06-19T12:14:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5513#issuecomment-2178548259>

    I also wonder if the fix for #5253  actually avoids the OS freeze or reduces the chance of it by the factor proportional to the fps reduction.

--------------------------------------------------------------------------------

On 2024-06-19T12:16:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5513#issuecomment-2178553318>

    On `font-gc` branch, it's realtime! Though, it's 129 commits behind master... So definitely a regression.
    
    ![5513](https://github.com/red/red/assets/411393/bc9cb73b-cf6b-4ddb-be13-70cf2ca2903d)

--------------------------------------------------------------------------------

On 2024-06-19T12:18:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5513#issuecomment-2178559703>

    > On `font-gc` branch, it's realtime!
    
    Does that branch include the fix for #5253 ?

--------------------------------------------------------------------------------

On 2024-06-19T12:20:46Z, dockimbel, commented:
<https://github.com/red/red/issues/5513#issuecomment-2178565281>

    Nope.

--------------------------------------------------------------------------------

On 2024-06-19T12:50:13Z, qtxie, commented:
<https://github.com/red/red/issues/5513#issuecomment-2178640152>

    Hmm, I just realize that it won't cause freeze if all the base faces are non-transparent (without fix for issue #5253). 

--------------------------------------------------------------------------------

On 2024-06-19T13:55:40Z, qtxie, commented:
<https://github.com/red/red/issues/5513#issuecomment-2178784838>

    Pushed a new fix. Though we still have this slowness if mix normal base faces and semi-transparent base faces together. It's better than freeze the OS.

