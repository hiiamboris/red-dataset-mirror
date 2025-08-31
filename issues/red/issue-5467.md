
#5467: Moving to a screen with different DPI distorts buttons
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 30 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/5467>

**Describe the bug**
If you move a window with buttons to a secondary screen with different DPI and resolution, the buttons on the right are distorted
 
**To reproduce**

Run this code and drag the window on the other monitor

```

data-container: [
	"a" "b" "c" "d"
]

view [
	;--- Focus Area
	;
	style note: Area 400x150 "" wrap on-down [last-focused-area: face] on-mid-down [
		
		last-focused-area: face
		
	]  
	style aname: Text "" 100x20

	
	below
	area-focus: note 400x80 with [extra: make object! [note-name: none myname: none label-face:  notes-container: none] ]


	area1: note 400x500 with [extra: make object! [note-name: none myname: none label-face: notes-container: none] ]
	
	return
	
	area2: note 400x250 with [extra: make object! [note-name: none myname: none label-face: notes-container: none] ]

	area3: note with [extra: make object! [note-name: none myname: none label-face: notes-container: none] ]
	
	
	area4: note with [extra: make object! [note-name: none myname: none label-face:  notes-container: none] ]

	return

	search-field: field "" 180x20 on-key []
	tl1: text-list data data-container 180x600 on-change [
	]	


	return

	

	return
	
	panel 140x700 [
		below
		pad 0x150
		
		button "Focus" [
		]
		
		button "search" [
			
		]
		
		button "Show sections" [
		]
		
		;TBD 
		Button "Filter" [

			view [
			]
		]
		
		
		button "Copy Procedure" [

		]


		button "Select Scheme"
		button "Edit Schemes" [
		]
		
		Button "reload"

		Button "Disable/enable" [

		]

		button "Select Notes" [

		]

		button "Load" [
		]
		button "save" [
		]

		button "quit" [
		]
		
		button "Add date" [
		]


	]
]
```
**Platform version**
```
RED: [ branch: "master" tag: #v0.6.4 ahead: 5087 date: 14-Jan-2024/8:37:32 commit: #7e50e5d36ac35668c5e8d43f15af804318af6570 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22621 ]
```



Comments:
--------------------------------------------------------------------------------

On 2024-01-15T21:15:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892772010>

    And [again](https://github.com/red/red/issues/5465#issuecomment-1892751122) :)

--------------------------------------------------------------------------------

On 2024-01-15T21:25:21Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892780056>

    As written, I have tried rebuilding the GUI with a version that triggers the problem with no success. I have removed all the inner code and gave you the skeleton to see the bug. I think I did my best

--------------------------------------------------------------------------------

On 2024-01-15T22:09:12Z, greggirwin, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892815540>

    Rather than stripping down, start with nothing and add to see where the problem appears. e.g. the `extra` stuff shouldn't matter, nor the number of buttons in the panel. e.g. does this do the same thing?
    ```
    view [
    	style note: Area 400x150 "" wrap
    	style aname: Text "" 100x20
    
    	below
    
    	area-focus: note 400x80
    	return
    	search-field: field "" 180x20
    
    	return
    	
    	panel 140x700 [
    		below
    		pad 0x150
    		button "Focus" []
    	]
    ]
    ```
    How about this?
    ```
    view [
    	button "OK"	
    	panel [button "Focus"]
    ]
    ```
    This?
    ```
    view [button "OK"]
    ```
    And include a screenshot to show the exact distortion ocurring.

--------------------------------------------------------------------------------

On 2024-01-15T22:50:21Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892844692>

    @greggirwin 
    
    I have already made simple and complex layouts but the bug has not triggered. Hereis the screenshot
    
    ![Distorsione_Note_manager](https://github.com/red/red/assets/1828237/ac018616-e7c7-43d4-93fe-1df373d6f45d)

--------------------------------------------------------------------------------

On 2024-01-15T22:51:25Z, greggirwin, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892845634>

    Sorry to make another request, but can you show the normal version as well, assuming the wide buttons are the distorted part?

--------------------------------------------------------------------------------

On 2024-01-15T22:52:25Z, greggirwin, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892846312>

    Key to the issue seems to be text with a space or other special char.

--------------------------------------------------------------------------------

On 2024-01-15T22:55:09Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892848174>

    Here is the normal version
    
    ![No_Distortion](https://github.com/red/red/assets/1828237/f24245d1-6f8d-45bc-8db9-32182dd52fac)

--------------------------------------------------------------------------------

On 2024-01-15T22:57:10Z, greggirwin, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892849485>

    Thanks. Now you can probably eliminate all the extra buttons, leaving just one of each, affected and not. And just one `note` face should be enough I imagine.

--------------------------------------------------------------------------------

On 2024-01-15T22:59:45Z, greggirwin, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892851025>

    And see if it happens when buttons aren't in a panel.

--------------------------------------------------------------------------------

On 2024-01-15T23:00:54Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892852037>

    This is the normal view
    
    ![Regular](https://github.com/red/red/assets/1828237/5e34b704-5334-494f-bb6c-865a96296d6b)

--------------------------------------------------------------------------------

On 2024-01-15T23:07:37Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892857441>

    Here it is:
    
    ```
    view [
    
    		button "Show sections" [
    		]
    		
    		Button "Filter" [
    			
    		]
    		
    		
    		button "Copy Procedure" [
    
    		]
    
    ]
    ```

--------------------------------------------------------------------------------

On 2024-01-15T23:26:28Z, greggirwin, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892868438>

    Thanks! Does this do it as well?
    ```
    view [
    	button "Show sections"
    	button "Filter"
    	button "Copy Procedure"
    ]
    ```
    Removes button actions and case difference. They shouldn't matter, but...

--------------------------------------------------------------------------------

On 2024-01-15T23:32:20Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1892871928>

    > view [
    > 	button "Show sections"
    > 	button "Filter"
    > 	button "Copy Procedure"
    > ]
    
    It does it too. However I have found the cause: it is the longer text which triggers the resizing. Buttons with text longer than the shorter button are distorted once you move them to the secondary screen with different resolution and DPI

--------------------------------------------------------------------------------

On 2024-01-16T07:12:54Z, qtxie, commented:
<https://github.com/red/red/issues/5467#issuecomment-1893181106>

    Pushed a fix. I haven't found a secondary screen to do test it. @GiuseppeChillemi Please check the latest version of Red.

--------------------------------------------------------------------------------

On 2024-01-16T15:07:44Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5467#issuecomment-1893936963>

    I confirm it has been fixed.
    Thank you!
    

