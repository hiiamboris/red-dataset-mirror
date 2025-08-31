
#3847: [draw][text] text size in draw is different when face color is specified
================================================================================
Issue is closed, was reported by Palaing and has 8 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3847>

**Describe the bug**
When you make a base face! with some text in the draw facet, and display it, the text size is different according to whether a "color" facet has been speficied or not in the face.

**To reproduce**
Steps to reproduce the behavior:
1. with the following code:
```
	l: layout [size 200x200]
	f3: make face![
		type: 'base
		offset: 0x0
		size: 160x160
		draw: [text 0x0 "Hi there"]
	]
	append l/pane f3
	view l
```
You get this:
![image](https://user-images.githubusercontent.com/344813/56292174-fa72f480-6126-11e9-8906-93c90f4eec71.png)
2. With the following code (added `color: snow`):
```
	l: layout [size 200x200]
	f3: make face![
		type: 'base
		offset: 0x0
		size: 160x160
		color: snow
		draw: [text 0x0 "Hi there"]
	]
	append l/pane f3
	view l
```
you get this instead:
![image](https://user-images.githubusercontent.com/344813/56292523-a3215400-6127-11e9-8bcc-7fe5e69653fe.png)

**Expected behavior**
Text size should not have changed

**Screenshots**
see above

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-Apr-2019/8:27:16+02:00 commit #fb18d4e
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-17T17:18:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/3847#issuecomment-484182544>

    On my W7 I get the second result in both cases. Same build.

--------------------------------------------------------------------------------

On 2019-04-18T11:02:07Z, meijeru, commented:
<https://github.com/red/red/issues/3847#issuecomment-484455146>

    On W10 I get same size text, but in second case it is **bold**. I use 1-Apr build #4922546

--------------------------------------------------------------------------------

On 2020-02-25T21:28:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/3847#issuecomment-591078114>

    As there have been changes to draw and it should no longer use face's font... is this issue still relevant?

--------------------------------------------------------------------------------

On 2020-02-26T20:40:41Z, Palaing, commented:
<https://github.com/red/red/issues/3847#issuecomment-591632410>

    Issue solved indeed with red-21feb20-3c68ef12.exe

