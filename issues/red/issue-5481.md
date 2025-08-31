
#5481: Changing font size and LINE-SPACING in DRAW's RICH-TEXT "disalignes" the BACKDROP.
================================================================================
Issue is open, was reported by luce80 and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/5481>

**Describe the bug**
Changing font size and line-spacing in `draw`'s `rich-text` "disalignes" the `backdrop`.

**To reproduce**
```
view [
	rich-text 150x150 "abcdABCDEFGH"
		draw compose [
			pen red
			text 0x10 (rt: rtd-layout ["abcdABCDEFGH^/xyzXYZ"])
		]
		on-created [
			; change font size
			rt/font: make font! [size: 30]
			rt/line-spacing: 30 ; if ^^ then <<-- this disalignes highlighting
			; change font size again and color
			rt/data: [1x20 10 255.0.255 3x5 0.255.0 backdrop 164.200.255]
		]
]
```

**Expected behavior**
`backdrop` alignement should stay correct also for non-default line-spacing with non-default `font!` `size`.

**Screenshots**
![image](https://github.com/red/red/assets/17967405/60dfe70f-de83-4700-b997-2ed94b27632a)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 20 date: 14-Feb-2024/12:03:12 commit: #d3409baa77a4a38a12753f6ec4af53545d749d08 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```



