
#4473: [View] Shadow faces appear when react is used during `on-create` or `init`
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[status.reviewed] [GUI]
<https://github.com/red/red/issues/4473>

Dunno if it's related to https://github.com/red/red/issues/4454 or not but possible

**Describe the bug**

Real face still reacts to events, but nothing I'm doing makes the shadow face disappear:
![](https://i.gyazo.com/93dae5de8805e3cd869bbdef142a788b.gif)

**To reproduce**
```
Red [needs: view]

view/no-wait/options [
	p: panel 400x400 purple [b: base 200x200 cyan]
 	on-create [
		react/link func [panel face] [
			[face/parent]
			panel/data: random 100
		] [face face/pane/1]
 	]
] [size: 420x420]
b/offset: 0x-100
b/size: 100x400
```

**Expected behavior**

Single controllable face
![](https://i.gyazo.com/90a4aa55a6c13033cef5ceb74a1c7841.png)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-May-2020/17:26:09+03:00
```

----
Here's another version (with `init`), FYI:
```
Red [needs: view]

extend system/view/VID/styles [
	my-panel: [
		template: [type: 'panel]
		init: [
			react/link func [panel face] [
				[face/parent]
				panel/data: random 100
			] [face face/pane/1]
		]
	]
]

view/no-wait/options [
	p: my-panel 400x400 purple [b: base 200x200 cyan]
] [size: 420x420]
b/offset: 0x-100
b/size: 100x400
```


Comments:
--------------------------------------------------------------------------------

On 2022-10-28T07:32:10Z, qtxie, commented:
<https://github.com/red/red/issues/4473#issuecomment-1294589269>

    > panel/data: random 100
    
    Should we throw an error here? 
    
    No issue when using react on `on-created`.
    ```
    view/no-wait/options [
    	p: panel 400x400 purple [b: base 200x200 cyan]
     	on-created [
    		react/link func [panel face] [
    			[face/parent]
    			panel/data: random 100
    		] [face face/pane/1]
     	]
    ] [size: 420x420]
    b/offset: 0x-100
    b/size: 100x400
    ```

--------------------------------------------------------------------------------

On 2022-10-28T18:30:07Z, greggirwin, commented:
<https://github.com/red/red/issues/4473#issuecomment-1295325187>

    If it can only ever be a block of faces, then an error makes sense.

--------------------------------------------------------------------------------

On 2022-10-28T18:42:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4473#issuecomment-1295335584>

    `pane` is a block of faces

--------------------------------------------------------------------------------

On 2022-10-29T12:26:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4473#issuecomment-1295821941>

    When `system/view/debug?` is turned on (only relevant part of the logs):
    ```
    show: panel  with?: true
    -- on-change event -- 
    	face : panel 
    	word : parent 
    	old  : object 
    	new  : none
    -- on-change event -- 
    	face : panel 
    	word : data 
    	old  : none 
    	new  : integer
    -- on-change event -- 
    	face : panel 
    	word : parent 
    	old  : none 
    	new  : object
    -- on-change event -- 
    	face : panel 
    	word : state 
    	old  : none 
    	new  : block
    show: base  with?: true
    -- on-change event -- 
    	face : base 
    	word : parent 
    	old  : object 
    	new  : none
    -- on-change event -- 
    	face : panel 
    	word : data 
    	old  : integer 
    	new  : integer
    show: panel  with?: false
    show: base  with?: true
    ```
    
    So it seems that the panel is built twice and the second time without linking it to a parent face, so it doesn't appear in the face tree (checked using `dump-face p/parent`).
    
    The issue is `show` been called recursively on the same face (the panel), while the face has not been fully set up yet. We should block `show` from allowing recursive calls on the same face (or at least until the face is fully set up, with a proper `/state` value).

--------------------------------------------------------------------------------

On 2023-01-07T17:37:33Z, luce80, commented:
<https://github.com/red/red/issues/4473#issuecomment-1374547150>

    Another example:
    ```
    view/flags [
        base: base "1" 50x200 255.100.100;.200
        at 200x100 text "2" 20x30 loose
          react later [base/size: face/offset - base/offset show base/parent]
    ] 'resize
    ```
    Try also to resize the window and with and without alpha channel.

--------------------------------------------------------------------------------

On 2023-01-07T18:02:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4473#issuecomment-1374553955>

    > Another example:
    
    Behavior described here :point_up: [January 7, 2023 1:05 PM](https://gitter.im/red/red/gui-branch?at=63b943f6378d512c184e4864) 

