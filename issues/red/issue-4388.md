
#4388: [View] `show` draws outdated window content when resizing
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4388>

**Describe the bug**
![](https://i.gyazo.com/de95397319f30a1874d2846c0ff097e4.png)
![](https://i.gyazo.com/32c9bdba833ac8a91238c46d8befcec8.png)

Notice the glitches: on the 1st shot, there's `rightght` junk, on the 2nd `center` and `right` are doubled

**To reproduce**

1. Run this script
```
Red [needs: view]

resize: func [face] [
	unless face/parent/state [exit]
	system/view/auto-sync?: no
	face/size/x: face/parent/size/x - 20
	system/view/auto-sync?: yes
	show face/parent
]
r: [resize face face/parent/size]
view/flags [
	below
	text #608 #FD4 "left"   left   react r
	text #608 #FD4 "center" center react r
	text #608 #FD4 "right"  right  react r
] 'resize
```
2. Maximize the window
3. Observe
4. ~~???~~
5. ~~Profit!~~

Comments on the code: `system/view/auto-sync?` flipping is used in real world code to update *a lot* of faces, and then `show window` is supposed to update them all in one go. Here it's just one face for simplicity.

@qtxie am I misusing something?

**Expected behavior**

Text properly rendered without doubling.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



