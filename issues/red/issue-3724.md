
#3724: [View] `screen/*/font` assignment breaks the code flow
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/3724>

**Describe the bug**

`system/screens/1/font: ...` executes scheduled events from inside the other code, messing code flow.

**To reproduce**

Here's a script that creates 2 identical faces and upon the creation of each face measures the size of a single character cell with the font used in that face. However, it forks from the measuring procedure at the moment of font assignment, leaving screen object in an unexpected state.

```
Red [Needs: View]

fonts: context [
	fixed: make font! [name: system/view/fonts/fixed size: 10]
	text: fixed
]

copy-font: function [f [object!]] [	also r: copy f  r/parent: r/state: none ]

determine-cell-size: function [font [object!]] [
	print ">>>>>>>>>>>>>> in determine-cell-size"
	if empty? t: "" [
		append/dup t (append append/dup "" #"x" 100 lf) 100
	]
	scr: system/view/screens/1
	f': copy-font font
	prin ["^/+++ scr/font at the time of assignment: +++"]
	? f'
	scr/font: f' 		;-- this line triggers another `on-created` event immediately!
	prin ["^/--- scr/font at the time of measurement: ---"]
	? scr/font
	print "*******************************"
	print ["text size is" sz: size-text/with scr t]
	print "*******************************"
	scr/font: none
	print "out of determine-cell-size <<<<<<<<<<<"
	reduce [1e-2 * sz/x  1e-2 * sz/y]
]

system/view/VID/styles/puddle: [
	default-actor: on-key
	template: [
		type: 'base
		color: glass
		size: 200x400
		font: copy fonts/text
		actors: [
			on-created: function [f] [
				probe determine-cell-size f/font
			]
		]
	]
] 

view/options [puddle puddle][offset: 0x0]
```

The output it produces:
```
>>>>>>>>>>>>>> in determine-cell-size

+++ scr/font at the time of assignment: +++
F' is an object! with the following words and values:
     name             string!       "Consolas"
     size             integer!      10
     style            none!         none
     angle            integer!      0
     color            none!         none
     anti-alias?      logic!        false
     shadow           none!         none
     state            none!         none
     parent           none!         none
     on-change*       function!     [word old new]
     on-deep-change*  function!     [owner word target action new index part]
>>>>>>>>>>>>>> in determine-cell-size

+++ scr/font at the time of assignment: +++
F' is an object! with the following words and values:
     name             string!       "Consolas"
     size             integer!      10
     style            none!         none
     angle            integer!      0
     color            none!         none
     anti-alias?      logic!        false
     shadow           none!         none
     state            none!         none
     parent           none!         none
     on-change*       function!     [word old new]
     on-deep-change*  function!     [owner word target action new index part]

--- scr/font at the time of measurement: ---
SCR/FONT is an object! with the following words and values:
     name             string!       "Consolas"
     size             integer!      10
     style            none!         none
     angle            integer!      0
     color            none!         none
     anti-alias?      logic!        false
     shadow           none!         none
     state            block!        length: 2  [handle! none]
     parent           block!        length: 1  [make object! [type: 'screen offset: 0x0 size: 15...
     on-change*       function!     [word old new]
     on-deep-change*  function!     [owner word target action new index part]
*******************************
text size is 730x1501
*******************************
out of determine-cell-size <<<<<<<<<<<
[7.3 15.01]

--- scr/font at the time of measurement: ---
SCR/FONT is a none! value: none
*******************************
text size is 581x1270
*******************************
out of determine-cell-size <<<<<<<<<<<
[5.81 12.7]
```
Note how it entered into another call of `determine-cell-size` from within the first one. And when it finished, the `scr/font` became `none` as left by that second invocation. Because of that, the resulting measurement becomes wrong.

**Expected behavior**

I expect these `on-created` events follow one another continuously.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-05T17:07:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/3724#issuecomment-595340104>

    Somewhat smaller ☻ snippet (the art of Reduction!):
    ```
    scr: system/view/screens/1
    view [
    	style puddle: base on-created [
    		print ["ON-CREATED for" mold/all face/state/1]
    		print "-> Assigning..."
    		scr/font: make font! []
    		print "<- Assigned!" ? scr/font
    		scr/font: none
    	]
    	puddle puddle
    ]
    ```
    Output (wrong):
    ```
    ON-CREATED for #[handle! 003C194Ah]
    -> Assigning...
    ON-CREATED for #[handle! 004118FEh]
    -> Assigning...
    <- Assigned!
    SCR/FONT is an object! with the following words and values:
         name             none!         none
         size             none!         none
         style            none!         none
         angle            integer!      0
         color            none!         none
         anti-alias?      logic!        false
         shadow           none!         none
         state            block!        length: 3  [handle! none none]
         parent           block!        length: 1  [make object! [type: 'screen offset: 0x0 ...
         on-change*       function!     [word old new]
         on-deep-change*  function!     [owner word target action new index part]
    
    <- Assigned!
    SCR/FONT is a none! value: none
    ```
    Expected:
    ```
    ON-CREATED for #[handle! 003C194Ah]
    -> Assigning...
    <- Assigned!
    SCR/FONT is an object! with the following words and values:
         name             none!         none
         size             none!         none
         style            none!         none
         angle            integer!      0
         color            none!         none
         anti-alias?      logic!        false
         shadow           none!         none
         state            block!        length: 3  [handle! none none]
         parent           block!        length: 1  [make object! [type: 'screen offset: 0x0 ...
         on-change*       function!     [word old new]
         on-deep-change*  function!     [owner word target action new index part]
    
    ON-CREATED for #[handle! 004118FEh]
    -> Assigning...
    <- Assigned!
    SCR/FONT is an object! with the following words and values:
         name             none!         none
         size             none!         none
         style            none!         none
         angle            integer!      0
         color            none!         none
         anti-alias?      logic!        false
         shadow           none!         none
         state            block!        length: 3  [handle! none none]
         parent           block!        length: 1  [make object! [type: 'screen offset: 0x0 ...
         on-change*       function!     [word old new]
         on-deep-change*  function!     [owner word target action new index part]
    
    ```

--------------------------------------------------------------------------------

On 2020-03-06T00:10:13Z, qtxie, commented:
<https://github.com/red/red/issues/3724#issuecomment-595508574>

    It's the `auto-sync` mode does things behind. Turns off it will make it work.
    ```
    scr: system/view/screens/1
    view [
    	style puddle: base on-created [
    		print ["ON-CREATED for" mold/all face/state/1]
    		print "-> Assigning..."
    		system/view/auto-sync?: no
    		scr/font: make font! []
    		print "<- Assigned!" ? scr/font
    		scr/font: none
    		system/view/auto-sync?: yes
    	]
    	puddle puddle
    ]
    ```

