
#5441: [View] `pane` changes on non-shown face remain undetected
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/5441>

**Describe the bug**

This creates troubles for my sole user of `scrollpanel` style:
- `init` sets reactions before `do` or `on-create`
- reactions cause by `do` or `on-create` are skipped, leading to the state loss
- only since `on-created` reactions start to work

When `pane` is modified from inside `view [do [...]]` or `on-create`, I can't detect that.

**To reproduce**

Run this:
```
Red [needs: view]

system/view/VID/styles/test: [
	template: [
		default-actor: 'on-click
		type:  'panel
		size:  200x200
		color: cyan
	]
	init: [react [
		print ["pane size=" n: length? p: self/pane]
		if n > 0 [dump-face last p]
	]]
]
view [
	t: test [] loose rate 1
	on-create	[print "def" append t/pane layout/only [at 20x30 text "def"]]
	; on-created	[print "ghi" append t/pane layout/only [at 30x50 text "ghi"]]
	; on-time		[print "jkl" append t/pane layout/only [at 40x70 text "jkl"]]
	do			[print "abc" append t/pane layout/only [at 10x10 text "abc"]]
]
```
Output does not reflect 2 faces in the pane:
```
pane size= 0
abc
def
```
If you uncomment (any of) commented lines, those changes will be seen:
```
pane size= 0
abc
def
ghi
pane size= 2
 Type: text Style: text Offset: (20, 30) Size: 80x23 Color: none Text: "def"
pane size= 3
 Type: text Style: text Offset: (30, 50) Size: 80x23 Color: none Text: "ghi"
jkl
pane size= 3
 Type: text Style: text Offset: (30, 50) Size: 80x23 Color: none Text: "ghi"
pane size= 4
 Type: text Style: text Offset: (40, 70) Size: 80x23 Color: none Text: "jkl"
```

**Expected behavior**

Reactions detecting changes.
Also ideally one event per change, not two.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5060 date: 22-Nov-2023/14:24:25 commit: #34f26dff0dfc467b9df7862f59c5220c5f508110 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


