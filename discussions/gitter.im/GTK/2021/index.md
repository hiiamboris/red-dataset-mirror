# Archived messages from: [gitter.im/red/GTK](/gitter.im/red/GTK/) from year: 2021

## Wednesday 20th January, 2021

Respectech

[19:34](#msg600885bd6244ee14509f9dc7)I brought my PinePhone to work today. Is it possible to run the Red console on Linux-ARM?

[19:34](#msg600885d76b20cf7730c89e38)Or is it only possible to compile on a different platform and run the compiled script on Linux ARM?

greggirwin

[19:41](#msg60088787cf8b82773442b6ad)I don't know if that's been tested. If you use Red for Linux ARM it should work AFAIK. That is, put Red for ARM on the system and the first time you run it, it should build the console locally for that platform.

Respectech

[20:00](#msg60088bf7ac653a0802cf58b0)Is there an automated build for Red-ARM/GTK?

[20:01](#msg60088bfd36db01248a8eedc0)Can't find it on red-lang.org

greggirwin

[20:01](#msg60088c2aa2354e44ac98767c)Maybe not. You might need to cross compile that first.

Respectech

[20:02](#msg60088c518816425540dc6ab5)Wasn't somebody auto-building Red-ARM/GTK and linking to it from a site? I can't seem to find that.

greggirwin

[20:11](#msg60088e776b20cf7730c8b7e4)@Rebolek was keeping historical builds, but I'm not sure if he was building for ARM.

## Sunday 31st January, 2021

snotbubble

[09:18](#msg601675cea0246860dc204e05)having an issue with resizing image containers, not sure if its GTK or red...

```
Red [
	needs 'view
]
view/flags  [
	ip: panel papaya [
		p: image 300x300 [
			g: load request-file/filter ["png" "*.png" "jpg" "*.jpg"]

; get image y of x
			rr: round (300.0 * (g/size/y / g/size/x))
			
; attempt to scale image container, but gets cut-off
			p/size/y: to-integer rr
			p/image: g
			
;attempt to scale panel (should this be automatic?), but it gets cut-off
			;ip/size/y = ip/size/y + (300 - rr)
		]
	]
] [ modal resize ]
```

result:  
!\[noresize](https://raw.githubusercontent.com/snotbubble/fulltardie2/master/image\_vs\_size.png)

ldci

[09:54](#msg60167e6f32e01b4f7165a814)@snotbubble The best way is to use actors for resizing

```
#!/usr/local/bin/red
Red [
]
mainWin: layout [
	title "Resizing Image"
	f: field "256x256"
	button "Quit" [quit] return
	canvas: base 256x256 %lena.png
]


view/flags/options mainWin [resize] [
    actors: object [
        on-resizing: function [face [object!] event [event!]][
            win: face
            canvas/size: win/size - 20x60
            f/text: form canvas/size
        ]
    ]
]
```

snotbubble

[10:30](#msg601686aa9fa6765ef8eaed69)Thanks François,  
it turned out to be a typo, used `=` instead of `:` when resizing the container panel.

ldci

[11:23](#msg6016933eae4b9b27c18d186b)@snotbubble A more complete version.

```
#!/usr/local/bin/red
Red [
	Title:   "Resize test"
	Author:  "Francois Jouen"
	File: 	 %resize3.red
	Needs:	 'View
]

_offset: 0x0

loadImage: does [
	tmp: request-file/filter ["png" "*.png" "jpg" "*.jpg"]
	if not none? tmp [
		_offset: canvas/offset + 10
		img: load tmp
		canvas/size: img/size
		mainWin/size: _offset + img/size
		f/text: form canvas/size
		canvas/image:  img
	]
]

mainWin: layout [
	title "Resizing Image"
	button "Load Image" [loadImage]
	f: field 70 "256x256"
	button "Quit" [quit] return
	canvas: base 256x256 black
]

;--resize event processing
view/flags/options mainWin [resize] [
    actors: object [
        on-resizing: function [face [object!] event [event!]][
            win: face
            canvas/size: win/size - _offset
            f/text: form canvas/size
        ]
    ]
]
```

[11:24](#msg6016938a4f7d1b68e51fb9b0)@snotbubble To be tested with GTK:)

[11:27](#msg6016943aaa6a6f319df590a7)@snotbubble replace `tmp: request-file/filter ["Image Files" "*.png;*.jpg; *.bmp"]`

## Monday 8th February, 2021

snotbubble

[02:39](#msg6020a46c84e66b7f7edbe174)having trouble writing data to a drop-down list, is this the right way to do it?

```
Red [ needs 'view ]
view [ 
	drop-down 180x30 "" select 2 data["two" "four" "eight"]  on-enter [
		append face/data face/text
	]
]
```

greggirwin

[04:18](#msg6020bba64f7d1b68e53ab5e0)It works for me on WIn10, updating the data facet. But `select` only works for `drop-list` of the two `drop-*` styles. @qtxie might be able to say why.

snotbubble

[07:17](#msg6020e596aa6a6f319d111156)also doing this with droplist replaces and appends the last item in face/data instead of just append, if the last item is selected. In this case eight:

```
Red [ needs 'view ]
view [ 
	d: drop-list 180x30 select 2 data["two" "four" "eight"] [f/text: pick face/data face/selected ]
	f: field 180x30 on-enter [
		append d/data face/text
		d/selected: (length? d/data)
		probe d/data
	]
]
```

## Tuesday 9th February, 2021

qtxie

[02:35](#msg6021f4ecaa6a6f319d13df62)&gt; It works for me on WIn10, updating the data facet. But `select` only works for `drop-list` of the two `drop-*` styles. @qtxie might be able to say why.

[02:36](#msg6021f52432e01b4f7183cca8)I can reproduce it. Will check why it doesn't work for `drop-down`.

[02:37](#msg6021f55232e01b4f7183cd3c)@snotbubble Works on Win10. So it's a bug on GTK backend.

## Monday 15th February, 2021

snotbubble

[10:35](#msg602a4e889403f11bb5842b7f)Is there a way to limit window resizing? eg: minimum size of 500x300. want to avoid these errors: `Gtk-CRITICAL **: 21:33:14.063: gtk_widget_set_size_request: assertion 'width >= -1' failed`

greggirwin

[16:54](#msg602aa72f7ba8124e5468b184)I don't think we support those APIs yet. I know Windows has them, but I don't know about other OSs. Right now you have to catch the resize event and handle it yourself. If the assertion happens before that, we'd need to look into it.

## Monday 8th March, 2021

snotbubble

[06:25](#msg6045c34095e23446e41d203f)on-down event for panel is triggered by clicking on contained faces (a field in this case), is there a way to disable this behavior?

```
Red [ needs 'view ]
view [
	panel 120x120 with [ extra: [name: "panel_1" id: 1 ] ] [ field 80x30 "edit" ] on-down [ print "panel selected: " probe face/extra/name ]
]
```

toomasv

[06:42](#msg6045c757457d6b4a94ae1a16)Just don't use events on panel:

```
view [panel 120x120 extra [name: "panel_1" id: 1] [field 80x30 "edit" on-down [print "hit field"]]]
```

[06:48](#msg6045c8c7d2619a4f2e2dce11)Another way is to use `done` in corresponding actors of contained faces to prevent these from bubbling up:

```
view [
   panel 120x120 extra [name: "panel_1" id: 1 ] [
      field 80x30 "edit" on-down ['done]
   ] on-down [ print "panel selected: " probe face/extra/name]
]
```

snotbubble

[07:24](#msg6045d137a3a2f04f1fdf1461)`on-down ['done]` is preventing text selection in this case. Also need to use events on panel to update ui elsewhere.

toomasv

[07:38](#msg6045d45d823b6654d28f0698)Preventing text selection may be a bug. On W10 it doesn’t.

snotbubble

[08:14](#msg6045dce5457d6b4a94ae4b34)ok sent

## Wednesday 17th March, 2021

rebred

[16:44](#msg6052320588edaa1eb8c1ba2a)i am on linux ubuntu 18.04.03 LTS

```
root@ubuntu-2gb-nbg1-1:/usr/local/bin# lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.3 LTS
Release:	18.04
Codename:	bionic

root@ubuntu-2gb-nbg1-1:/usr/local/bin# ls
red-064.dms  red2019.dms  red.dms
root@ubuntu-2gb-nbg1-1:/usr/local/bin# red.dms 
Unable to init server: Could not connect: Connection refused

(console-2021-3-16-29645:1717): Gtk-WARNING **: 17:43:54.824: cannot open display: 
root@ubuntu-2gb-nbg1-1:/usr/local/bin#
```

Red 0.6.4 works correctly. When I try to run

```
red-16mar21-0051dff08
```

(I renamed red.dms) it gives me error above  
It's a remote server without a monitor connected to it

Respectech

[18:05](#msg605244def07ffa1eb549b99b)GTK needs a GUI. If your machine isn't running a desktop, then that may be an issue. If it is running a desktop, you may have to export DISPLAY, something like this: `export DISPLAY=:0`

greggirwin

[18:46](#msg60524e6ac1e10242c5a647a3)R2 had similar issues if no X-Windows system was available.

## Saturday 20th March, 2021

qtxie

[09:14](#msg6055bcd93b9278255bc044ca)@rebred You can try to use `red.dms --no-view` in this case. Don't forget to delete the old caches (folder `~/.red`) before running this command.

## Monday 29th March, 2021

rebred

[21:12](#msg606242b8f8add214d802e35c)@qtxie it worked ! thanks a lot!!

## Sunday 11st April, 2021

snotbubble

[05:13](#msg6072856246a93d4a19bbd0b8)strange gtk error:

```
Red [ needs 'view ]
getpanel: function [ md ] [ compose/deep [ panel 55x55 30.30.30 with [ offset: (md) ] [] ] ]
view [ 
    panel 400x600 [] on-down [ 
		probe event/offset
		append face/pane layout/only getpanel event/offset
	]
]
```

returns:

```
(console-2021-3-28-10126:39690): Gtk-CRITICAL **: 15:12:40.593: gtk_widget_grab_focus: assertion 'GTK_IS_WIDGET (widget)' failed
```

any idea what could be causing this?

loziniak

[10:12](#msg6072cb92b9e6de24d62a8ab7)i encounter it very often, and don't know what's causing this. anyway, I didn't notice any harm from it :-)

snotbubble

[11:21](#msg6072dbc51f84d71853adef24)@loziniak in this case it's blocking any further interaction. Started happening after an allocation crash that could be prevented by `wait 1` before appending to a panel/face... think I'll just restart, its been acting weird all day.

greggirwin

[20:54](#msg60736211969f8b38ee712953)If anyone knows GTK well, @qtxie could use a lieutenant to help with issues.

## Monday 12nd April, 2021

qtxie

[07:26](#msg6073f61fa2ac0d38e7aeaba5)@snotbubble Pushed a fix. Though there is another issue in `layout/only`, it also sets the offset to `10x10`.

```
>> get in first layout/only getpanel 200x200 'offset
== 10x10
```

snotbubble

[10:06](#msg60741ba6a2ac0d38e7af127c)@qtxie got it thanks! Now for the actual problem:

```
Red [ needs 'view ]
getpanel: function [ i bgc ] [ 
	compose/deep [ panel 200x55 30.30.30 loose with [ color: (bgc) ] extra [ idx: (i) ] [ ] draw [] ]
]
view [
    aa: panel 400x600 [ text "click to add panel" ] on-down [ 
		clear face/pane
		repeat n 10 [
		    rc: to-tuple reduce [ (min 80 random 120)  (min 80 random 120) (min 80 random 120) ] 
			append face/pane layout/only getpanel n rc	
		]
		foreach-face face [
			unless none? face/extra/idx [
				face/offset/y: to-integer ((face/extra/idx - 1) * (face/size/y + 10)) + 10
			]
		]
	]
]
```

click repeatedly in the panel bg...

```
*** Runtime Error 1: access violation
*** at: 0807FDE3h
```

its almost certainly the empty `draw []` that's causing it

is there a safer way to make panels with empty draws? I'm using it to draw/clear a highlight border on select.

loziniak

[12:27](#msg60743cc706e2e024e84b0808)Hi! I can't run Red on headless Linux. Despite having `libgtk-3-0:i386` installed, I get an error:

```
$ ./red-12apr21-630069f9e --no-view --cli
Unable to init server: Could not connect: Connection refused

(console-2021-4-12-26611:12814): Gtk-WARNING **: 14:27:35.576: cannot open display:
```

Oldes

[22:11](#msg6074c5a9ae90f3684078af0f)What about compiling cli version without view module?

## Tuesday 13th April, 2021

qtxie

[02:58](#msg607508d0a2ac0d38e7b18a0c)@loziniak You may need to delete the cache to trigger the compilation.

```
$ rm ~/.red/console-*
$ ./red-12apr21-54b646f22 --no-view
```

[03:02](#msg607509b146a93d4a19c1cdb5)@snotbubble I can reproduce the crash in release mode, but not in debug mode. Seems related to GC. If it's caused by empty `draw []`, then `view [panel draw []]` should make it crashes.

[03:17](#msg60750d2e46a93d4a19c1d687)@snotbubble Add `recycle/off` before running the script will fix it.

[07:07](#msg607543381f84d71853b3d210)It also crashes on Windows. After several hours debugging, no luck to find out what's wrong. Recorded as an issue: https://github.com/red/red/issues/4876

snotbubble

[11:04](#msg60757aa8ae90f368407a706b)@qtxie awesome works fine now with `recycle/off`

will keep an eye on the memory usage, but doesn't look too bad when making/destroying faces.

## Tuesday 21st September, 2021

ldci

[09:49](#msg6149aac24c7be06b79cce4ce)\[!\[image.png](https://files.gitter.im/5c31dc1cd73408ce4fb3c75a/YiSA/thumb/image.png)](https://files.gitter.im/5c31dc1cd73408ce4fb3c75a/YiSA/image.png)

[09:50](#msg6149aac8f3449e13a4852f16)Hi GTK Team: some positive tests for using Red on Raspberry PI OS.Just a problem for loading files.  
Any idea?

qtxie

[13:17](#msg6149db8067e789189c0dd89b)@ldci `request-file` doesn't work or it works but has warning?

ldci

[13:23](#msg6149dce763dca81891705095)@qtxie It worls alone but not inside function such as openImage: does \[tmp: request-file unless none? tmp \[img: load temp]]

qtxie

[13:57](#msg6149e4c963dca8189170621d)OK. I'll have a look at it.

ldci

[13:57](#msg6149e4c95cfd665e52394297)@qtxie This code works on Linux but not with Raspeberry PI OS

```
#!/usr/local/bin/red
Red [
	Title:   "Draw tests "
	Needs:	 'View
]

img: make image! reduce [512x512 white]

loadImage: does [
	tmp: request-file
	unless none? tmp [
		img: load tmp
		canvas/image: img
	]
]

view win: layout [
		title "Image Tests"
		button "Load" 		[loadImage ]
		button 60 "Quit" 	[Quit]
		return 
		canvas: base 512x512 img
]
```

## Wednesday 22nd September, 2021

ldci

[11:21](#msg614b11b95b92082de1b66d48)@qtxie After PI. OS update always a warning but code is running:)
