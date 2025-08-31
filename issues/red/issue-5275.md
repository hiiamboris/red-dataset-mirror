
#5275: [View] set-focus fails on tab-panel
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.wish] [GUI]
<https://github.com/red/red/issues/5275>

**Describe the bug**

There's a `focus` keyword on `b` and a `set-focus` call, but shown window has `"a"` pane visible:
```
view [
	tab-panel 200 ["a" [button "A"] "b" [b: button focus "B"] "c" [button "C"]]
	on-created [set-focus b]
]
```
![](https://i.gyazo.com/f7bba077115c7067e88da1ca051e847b.gif)

Manual `/selected` change works fine - `"b"` pane is shown:
```
view [
	tab-panel 200 ["a" [button "A"] "b" [b: button "B"] "c" [button "C"]]
	on-created [b/parent/selected: 1 b/parent/parent/selected: 2]
]
```

**Expected behavior**

Both `focus` and `set-focus` should show the panel containing the given face
Looks closely related to: https://github.com/red/red/issues/3808 and https://github.com/red/red/issues/4818

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-01-28T18:25:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5275#issuecomment-1407457684>

    `set-focus` is supposed to put the focus on a visible face, not control which panel should be visible/hidden.

--------------------------------------------------------------------------------

On 2023-01-28T19:22:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5275#issuecomment-1407468413>

    I think focused face should always be visible. I don't know of any scenario where that doesn't hold. Focus eats keyboard events and user is supposed to observe the result of those events (e.g. field input).
    
    Another similar case I've had is a scrollable panel: when focusing a face, it should scroll to that face. Just mentioning it for comparison.

