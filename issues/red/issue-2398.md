
#2398: Creating a face inside an event handler fails
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2398>

`make`ing a copy of already defined face inside an event handler and adding it to the pane of window doesn't work (face doesn't appear on window) and gives access violation when the application ends.

Please execute the following code and press 1, two faces should appear but only one appears.

Please see the comments.

```
Red [
  Needs: 'View
]

f: make face! [
	type:		'base
	size:		10x10
	offset:		20x20
	color:		red
]

win: make face! [
	type:	'window
	size:	800x600
	pane:	reduce [f]   ;; <<< error happens only if base face is already in pane
	actors:	object [
		on-key: function [face event] [
			if event/key = #"1" [

				;if a face created here
				;it can be added to the pane
				;no error here

				h: make face! [
					type:		'base
					size:		10x10
					offset:		120x120
					color:		blue
				]
				append win/pane h
				;

				;but the following one doesn't appear on the window
				;and give access violation when the application ends

				g: make f [offset: 60x60 color: white]
				append win/pane g
			]
		]
	]
]

;following one also works, outside of event handler
;x: make f [offset: 160x160 color: teal]
;append win/pane x

view win

```


Comments:
--------------------------------------------------------------------------------

On 2017-02-19T01:36:06Z, qtxie, commented:
<https://github.com/red/red/issues/2398#issuecomment-280888695>

    When making an object! `a1` from an object! `a`, it will do a deep copy on `a`. 
    
    In the case above, after creating the window, face `f` associated with an OS window, the window handle store in `face/state`. When making `g` through `f`, `g` will associate with the same OS window.
    
    When closing the application, the view engine try to release the same window twice, it causes the crash.

--------------------------------------------------------------------------------

On 2017-02-19T03:03:57Z, qtxie, commented:
<https://github.com/red/red/issues/2398#issuecomment-280892195>

    For now, if we want to create many similar face, we should always make a face through a template face, or use `styles` in VID.
    
    We'll improve `make` on face in later versions.

