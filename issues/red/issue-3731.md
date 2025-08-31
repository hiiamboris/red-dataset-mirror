
#3731: [View/React] Seemingly simple react structure isn't working
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/3731>

**Describe the bug**

It's just one of weird bugs of react I encountered, but this one was easy enough to isolate.
I have a layout:
```
w: window [
  p*: panel [
    p1: panel [field]
    p2: panel [field]
  ]
]
```
And a map of reactions to be triggered on window resize:
```
w/size/y => p*/size/y => p1/size/y + p2/size/y
                         p1/size  => p2/offset
```
And it *often* fails.

**To reproduce**

Here's the sample code:
```
Red [Needs: View]

system/view/VID/styles/panel2: [
	template: [
		type: 'panel  color: cyan  size: 200x400
		actors: [
			on-created: function [face] [
				face/pane: reduce [make-face 'field]
				; face/pane: reduce [make-face 'base]
				react/link function [fa pa] [
					fa/size/y: pa/size/y
					print ["panels size" pa/size "=> single panel size" fa/size]
				] [face face/parent]
			]
		]
	]
]

view/tight/flags [
	panels: panel 400x400 magenta [at 0x0 panel2 panel2] with [
		actors: object [
			on-created: func [face] [
				react/link func [pan wnd] [
					pan/size/y: wnd/size/y
					print ["window size" wnd/size "=> panels size" pan/size]
				] [face face/parent]
				react/link func [f1 f2] [
					f2/offset: f1/size * 1x0 + 10x0
					; f2/offset/x: f1/size/x + 10
					print ["left panel size" f1/size "=> right panel offset" f2/offset]
				] [face/pane/1 face/pane/2]
			]
		]
	]
] [resize]
```

**To see it in action:**
1. **Manually** resize the window - it will stretch the panels to the window height, albeit somewhat lagging
2. **Maximize** it with the MAX button, or with Win+Up, or Win+Right or Win+Left - the panels stay of the same size and no reactions are triggered!

Note that some seemingly absurd actions - _like replacing some lines with those commented below_ - will also make it work fine.
Note also that the same (2) sometimes (depending on some more absurd changes) will work fine if performed without (1), so it's advised to follow the instruction.


**Screenshots**

Tiny panel in full screen window:
![](https://i.gyazo.com/b4aa21a3e508f671ecad0f6e23ba1561.png)

**Expected behavior**

 After maximizing the window the panel should reach it's bottom immediately.
![](https://i.gyazo.com/933b60c54be615ff77c66ba9a0403b4f.png)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



