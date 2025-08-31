
#2562: Possible bug in the window's view engine ?
================================================================================
Issue is closed, was reported by ericguedespinto and has 10 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2562>

Hello

I am playing with a naive implementation of a treelist and when I run it in win and macos I get very different results. I am composing my cells from a data object, including background color, and while on macos it works fine, in win the cells are displayed without color, even though the composed objects are similar. 
Could this be a bug in the view engine on win?

```
Red [
	Author: Erique Guedes Pinto
	Needs: 'View
]

o: context [
	first: context [
		type: 'area
		behavior: [
			on-unfocus: does [ print "unfocus" ]
		]
	]
	second: context [
		visual: [ 
			color: red 
		]
		options: [ opened ]
		behavior: [ 
			on-down: does [ 
				either find options 'opened [
					remove options find options 'opened
				] [
					append options 'opened
				]
				populate o ofs
			] 
		]
		children: context [
			first: context [
				visual: [ 
					text: "1º exemplo"
					color: gold 
				]
				behavior: [ 
					on-down: does [ print "down" ] 
					on-up: does [ print "up" ] 
				]
			]
		]
	]
	third: context [
		type: 'field
		visual: [ 
			color: blue 
		]
		behavior: [
			on-unfocus: does [ print "unfocus" ]
		]
	]
]

ofs: 0x0
top-ofs: 0x0
l: layout [b: box snow 200x200 on-wheel [
		top-ofs: ofs + to-pair reduce [ 0 event/picked * 5 ]
		ofs: top-ofs
		populate o ofs
	]
]
b/pane: copy []
populate: func [{populates a layout with cells}
	obj [object!] 	{object containing the data to populate de layout
					keys:	type: type of VID face (if none then 'text)
							visual: list of visual VID keywords
							behavior: list of behavior objects (actors)
							option: miscelanous flags}
	ident [pair!] 	{indentation pair}
	/local entry-type visual behavior children opts ] [
	ofs: ofs + ident
	opts: null
	if obj = o [ 
		b/pane: copy [] 
	]
	foreach e words-of obj [
		entry: get in obj e
		entry-type: either in entry 'type [ 
			get in entry 'type
		] [ 
			'text 
		]
		text-widget: copy [ 
			type: 	entry-type 
			text: 	to-string e 
			size: 	100x20 
			offset: ofs
		]
		either in entry 'visual [ 
			visual: get in entry 'visual
		] [
			visual: copy []
		]
		either in entry 'behavior [ 
			behavior: append copy [ actors: ] context compose [ (get in entry 'behavior )] 
		] [
			behavior: copy []
		]
		append b/pane probe compose [ (make face! append append text-widget visual behavior) ]
		ofs: ofs + 0x20			
		if in entry 'options [ opts: get in entry 'options ]
		if all [ in entry 'children attempt [ find opts 'opened ] ] [
			children: get in entry 'children 
			populate children 20x0
			ofs: ofs - 20x0
		]
	]
	if obj = o [ 
		ofs: top-ofs
	]
]

populate o ofs

view l
```

![macos red](https://cloud.githubusercontent.com/assets/1077843/24956259/caba3a28-1f7e-11e7-9b45-9a898185eb0d.jpeg)
![win red](https://cloud.githubusercontent.com/assets/1077843/24956260/caba43d8-1f7e-11e7-81f0-37f845af3243.jpeg)




Comments:
--------------------------------------------------------------------------------

On 2017-04-12T14:29:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2562#issuecomment-293595464>

    You are using a `box` type to group child faces, that is not its purpose. You should use `panel` instead for that (see the panel [documentation](https://doc.red-lang.org/en/view.html#_panel)) and you will get proper look then.
    
    @qtxie It seems the `base` face on Windows could be extended to handle the same messages as `panel` when the `pane` is not empty. Would it work?

--------------------------------------------------------------------------------

On 2017-04-12T16:18:15Z, ericguedespinto, commented:
<https://github.com/red/red/issues/2562#issuecomment-293630788>

    You are right, of course... so much to learn.
    Works perfectly with a panel.

--------------------------------------------------------------------------------

On 2017-04-13T00:53:54Z, qtxie, commented:
<https://github.com/red/red/issues/2562#issuecomment-293747182>

    @dockimbel Yes. It's possible.

--------------------------------------------------------------------------------

On 2019-01-16T22:04:41Z, endo64, commented:
<https://github.com/red/red/issues/2562#issuecomment-454961619>

    This can be closed I think, @greggirwin ?

--------------------------------------------------------------------------------

On 2019-01-18T06:40:04Z, greggirwin, commented:
<https://github.com/red/red/issues/2562#issuecomment-455443399>

    Agreed. Thanks for continuing to find tickets we can close @endo64, it's very helpful.

