
#4778: [View] Flicker of text in a panel, and auto-sync trouble
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4778>

**Describe the bug**

I need a text label to resize with the text and do that with `auto-sync?: off` because I'm updating multiple faces inside a panel and it'll be best if I show the whole panel once only. This is a mockup code that only handles the label itself:
```
system/view/auto-sync?: off
view [
	panel [			;-- less flicker if no panel
		below
		t: text cyan brown 200x25
		b: base blue 200x200 "hover around" all-over on-over [
			t/text: copy/part "this text flickers way too much" event/offset/x / 2
			;-- I HAVE to set size to max & show the face, else `size-text` never gets wider than current width
			t/size/x: 200
			show t
			;-- set face size to that of the text
			t/size: size-text t
			show t/parent
		]
	]
]
```
My first issue is that **(1)** for `size-text` to work I have to *show* the face with a bigger size first. Otherwise `size-text` always returns `x < face/size/x`. So with `auto-sync?: off` that means two `show` calls.
As you can see it doesn't work out very well:
![](https://i.gyazo.com/b14e38626af2cdf86dcd5956dbab7bd4.gif)

If I set `auto-sync?` to `true` and let other things flicker, then I can get rid of the extra `show` call (magic!), but **(2)** the flicker is still there:
```
view [
	panel [			;-- less flicker if no panel
		below
		t: text cyan brown 200x25
		b: base blue 200x200 "hover around" all-over on-over [
			;-- LOW flicker
			; t/text: copy/part "this text flickers way too much" event/offset/x / 4 + 50
			; t/text: copy/part "this text flickers way too much" event/offset/x / 4
			;-- HUGE flicker
			t/text: "this text flickers way too much"
			; t/text: copy "this text flickers way too much"
			; t/text: copy/part "this text flickers way too much" 100
			; t/text: copy/part "this text flickers way too much" event/offset/x / 2
			t/size: 200x25
			t/size: size-text t
		]
	]
]
```
This is how it looks like:
![](https://i.gyazo.com/3b3e7192601f1af224da3fb2b28e3604.gif)

Further study also shows that some `copy/part` lengths are better than others even if both a longer than the initial string! (try commented out lines). Moreso, copy with smaller length is better than no copy at all. This I can't explain ;) But I can't record that, because recording forces flicker to appear again. When not recording - small flicker.

Real code with more faces behaves even worse - label may never show until you stop hovering (regardless of `auto-sync?` on or off state):
![](https://i.gyazo.com/3c9d1c8306262d007b5ebea2ea828dad.gif)

**Expected behavior**

(1) `size-text` should have some refinement that turns off accounting of face size and doesn't wrap or crop it. See also https://github.com/red/red/issues/4179
(2) Such amount of flicker is unacceptable and should be dealt with. See also https://github.com/red/red/issues/1990 but there it's a battle for much less.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
W10
```



