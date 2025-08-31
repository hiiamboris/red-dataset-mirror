
#4454: [View] Oddities of event processing during initialization (only?)
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4454>

**Describe the bug**

For some reason, face may not process deep change events before it's created.

I am creating six faces here that should be identical. But each one is initialized differently, leading to glitches. First 2 faces are wrong here, and console log shows no size update events for them:

![](https://i.gyazo.com/3d7cd61521fd90639b4af1ce4ef494e3.png)

**To reproduce**
```
Red []
extend system/view/VID/styles [
	cell: [
		template: [type: 'panel color: gold]
		init: [react/link func [base cell] [base/size: probe cell/size] [face/pane/1 face]]
	]
	column1: [
		template: [type: 'panel]
		init: [c1c/size/x: 180]
	]
	column2: [
		template: [
			type: 'panel
			actors: [on-create: func [_][c2c/size/x: 180]]
		]
	]
	column3: [
		template: [
			type: 'panel
			actors: [on-created: func [_][c3c/size/x: 180]]
		]
	]
	column4: [
		template: [type: 'panel]
		init: [c4c/size: as-pair 180 c4c/size/y]
	]
	column5: [
		template: [
			type: 'panel
			actors: [on-create: func [_][c5c/size: as-pair 180 c5c/size/y]]
		]
	]
	column6: [
		template: [
			type: 'panel
			actors: [on-created: func [_][c6c/size: as-pair 180 c6c/size/y]]
		]
	]
]

view [
	c1: column1 purple [c1c: cell 40x40 [base teal]] 200x100
	c2: column2 purple [c2c: cell 40x40 [base teal]] 200x100
	c3: column3 purple [c3c: cell 40x40 [base teal]] 200x100
	return
	c4: column4 purple [c4c: cell 40x40 [base teal]] 200x100
	c5: column5 purple [c5c: cell 40x40 [base teal]] 200x100
	c6: column6 purple [c6c: cell 40x40 [base teal]] 200x100
]
```

Notice the differences: 1 & 4 use `init`, 2 & 5 use `on-create`, 3 & 6 use `on-created`.
1,2,3 assign only `x` component of `size`, while 4,5,6 assign the whole `size`, but not changing the `y` of it. 

**Expected behavior**

I expect that reaction defined in `cell` style should fire for all 6 faces, but it fires only for 4.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 13-May-2020/14:18:02+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-27T21:02:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/4454#issuecomment-634937855>

    Here's another version and I suspect it belongs to this issue as well.
    ```
    Red []
    
    extend system/view/VID/styles [
        yourbase: [
            template: [
                type: 'base
                size: 100x100
            ]
            init: [make-face 'base]     ;) remove this an it'll work!
        ]
    ]
    
    view [
        s: yourbase blue 400x300 react [
            print "IT WORKS!"
            probe s/size
            ; probe face/size           ;) this will work!
        ]
        return button "CLICK ME" [s/size: random 400x300]
    ]
    ```
    For some reason it does not make the reaction at all.
    
    Expected to print `IT WORKS!` when window shows, and then after each click. `face/size` works, `s/size` doesn't. If I remove `make-face` from `init`, `s/size` starts working. If I place `make-face` into the `spec`, it's still working.

--------------------------------------------------------------------------------

On 2020-05-27T21:04:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4454#issuecomment-634938781>

    That also paints `make-face` as likely culprit.

