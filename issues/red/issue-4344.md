
#4344: [View] Layered windows fail to update their size erratically
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4344>

**Describe the bug**

![](https://i.gyazo.com/9b6b462c7c00fcc692c3a72bd7ec4955.gif)
The script below is supposed to adapt the tooltip size to it's given text. Sometimes I run it and it works stably. Other times I run it and it's enough to move the mouse around 2-3 times for it to stop updating the size (see how it truncated after a few moves).

Window size seems to matter: if tooltip, during `face/size: 700x50` does not fit the window (considering it's current offset) - it seems to always update correctly.

**To reproduce**

1. Run the provided script
2. Move the pointer from left to right so that it crosses the right base
3. Watch the tooltip text when it enters the left base: it should contain all text including "END"
```
Red [needs: view]

AYB: #(
	"all your base 1" "title 1 title 1 title 1 title 1 title 1 END"
	"all your base 2" "title 2 title 2 END"
)

view/flags collect [
	keep [size 1200x400 space 1x1]
	foreach [key _] AYB [
		keep compose [
			base 400x400 white black (key)
			all-over on-over [
				if :saved <> AYB/(face/text) [		;-- avoid bug #4342
					saved: tooltip/text: AYB/(face/text)
				]
				tooltip/offset: event/offset + face/offset
			]
		]
	]
	keep [
		at 0x0 tooltip: box 1x1 font-color blue font-size 10 react [
			face/text							;-- define the reactive source
			face/size: 700x50					;-- make enough space that size-text doesn't trim
			probe face/size: size-text face		;-- set the proper size
		]
	]
] 'resize

quit
```

**Expected behavior**

Size should always update correctly. Changing `box` to `base` fixes it.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 14-Mar-2020/16:44:55+03:00
W7
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-18T08:01:50Z, qtxie, commented:
<https://github.com/red/red/issues/4344#issuecomment-600478048>

    It hard to guess what's wrong there. Sometimes it works. Seems related to how fast you move the mouse.

