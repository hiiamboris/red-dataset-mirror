
#3693: [View] actors format inconsistency between VID and make-face
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3693>

**Describe the bug**
VID expects actors to be a `block!`
while make-face (and make face!) expect an `object!`
This requires a manual workaround to turn that block into an object.

**To reproduce**
```
Red []

system/view/VID/styles/square: [
	template: [
		type: 'base
		color: green
		size: 100x100
		actors: [
			on-created: func [f e] [print "Created!"]
		]
	]
]

view/options [
	square
	with [
		actors: make actors [
			on-down: func [f e /local f2] [
				print "Clicked!"
				append f/parent/pane f2: make-face/offset 'square f/offset + 110x0
				? f/actors
				? f2/actors
			]
		]
	]
] [size: 400x150]
```

After clicking on the face:
![](https://i.gyazo.com/751380cded808ca418ea97bfb61da41f.png)

As you can see, `make-face` made a face with a useless `block!` actors facet that does not trigger anything - no second "Created!" message, and unclickable.

**Expected behavior**
`make-face` should be able to understand the template format used by VID

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Dec-2018/5:42:09+03:00 commit #6968dad
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-31T23:26:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3693#issuecomment-450698750>

    We probably need @dockimbel to weigh in on this, from a design standpoint. `Make-face`'s `/spec` refinement may be for this purpose (see example below), though making a complete face from a style *seems* more convenient. I don't know if we want to say that `make-face` understands VID by deault, if its intent is to be a thin wrapper over `make face!`. It's a good question and discovery in any case.
    ```
    system/view/VID/styles/square: [
    	template: [
    		type: 'base
    		color: green
    		size: 100x100
    		actors: [
    			on-created: func [f e] [print "Created!"]
    		]
    	]
    ]
    
    view/options [
    	square
    	with [
    		actors: make actors [
    			on-down: func [f e /local f2] [
    				print "Clicked!"
    ; This makes it work, and is flexible, but is not concise or convenient.
    				append f/parent/pane f2: make-face/offset/spec 'square f/offset + 110x0 system/view/VID/styles/square/template
    				? f/actors
    				? f2/actors
    			]
    		]
    	]
    ] [size: 400x150]
    ```

--------------------------------------------------------------------------------

On 2019-01-03T10:52:59Z, dockimbel, commented:
<https://github.com/red/red/issues/3693#issuecomment-451110667>

    I agree that the base behavior of `make-face` (without `/spec` refinement) is not satisfying as the face is not entirely constructed as a full instance of the argument style.

--------------------------------------------------------------------------------

On 2019-01-03T11:06:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3693#issuecomment-451113535>

    Your example can now be simplified a bit, as actors are properly merged between template styles and instanciated ones (feature added today):
    ```
    system/view/VID/styles/square: [
    	template: [
    		type: 'base
    		color: green
    		size: 100x100
    		actors: [
    			on-created: func [f e] [print "Created!"]
    		]
    	]
    ]
    
    down-handler: func [f e /local f2] [
    	print "Clicked!"
    	append f/parent/pane f2: make-face/offset 'square f/offset + 110x0
    	? f/actors
    	? f2/actors
    ]
    
    view/options [square on-down :down-handler] [size: 400x150]
    ```

