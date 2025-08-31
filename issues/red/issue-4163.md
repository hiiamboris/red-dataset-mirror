
#4163: [View] Freezes the OS (W7) under certain conditions
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/4163>

**Describe the bug**

Try this code:
```
Red []

system/view/VID/styles/ninja: [
	template: [
		type: 'base
		actors: [
			on-created: function [face][
				face/size: face/parent/size
				if take once [							;-- populate only once
					; append face/parent/pane
					insert tail face/parent/pane		;-- append is OK, insert tail is lagging!
						layout/only
							append/dup copy [] [ninja] 30	;-- increase the count for more lag
				]
			]
		]
	]
]

once: [1]
view [size 500x500 ninja]
```
I adjusted it to small lag (1-2 sec). If your PC is super powerful, increase `30` to something more, but be careful - system becomes totally unresponsive. Stops reacting to input, if sound is playing it stops too. Only the mouse pointer keeps moving.

And this is strange. It's not CPU load, since that won't affect the other processes. It's likely the abuse of some limited GDI resources or whatever. 

Try `append` instead of `insert tail` - and everything is OK. Try removing `face/size: face/parent/size` and it's OK again.

**Expected behavior**

May load the CPU, but should not affect the OS!

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-29T04:08:49Z, toomasv, commented:
<https://github.com/red/red/issues/4163#issuecomment-559653205>

    No problems on W10. Increased to 100, Tried insert and append. No noticeable changes.

--------------------------------------------------------------------------------

On 2019-11-29T10:16:05Z, qtxie, commented:
<https://github.com/red/red/issues/4163#issuecomment-559738409>

    No problems on W7 using default theme. OK. I see the lag when increased to 300. The GDI resources usage is normal in GDIView.  I suspect `update-layered-window` takes too much time. https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L1086
    
    There is no solid `color` in the template, the view engine will create a layered base face in this case. The layered base face is heavy on W7.

