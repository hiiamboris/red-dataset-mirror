
#2938: Console dies quietly on missing button caption
================================================================================
Issue is closed, was reported by ghost and has 22 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2938>

When I create a style like this:
     style nbtn:     button      font [ style: [bold] size: 10 ]

And then use it in a script pasted into the console, but without supplying a caption for the button, the console quietly shuts down without any error reporting.


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T03:21:25Z, dockimbel, commented:
<https://github.com/red/red/issues/2938#issuecomment-318546642>

    Could you please provide a complete source code or the full step-by-step way with all the required information to reproduce the issue?

--------------------------------------------------------------------------------

On 2017-07-28T17:01:52Z, ghost, commented:
<https://github.com/red/red/issues/2938#issuecomment-318708381>

    I can run the code below w/o any issues - if I remove the caption from, say, the b_edit button and re-run, the console dies quietly.
    
    ```
    Red [needs: 'view]
        
    lookup-form: compose/deep layout [
    
    	title "Lookups maintenance"
    
    	style lbl:      text        100 right font [ size: 10 ] pewter
    	style lbl2:     text        right font [ size: 10 ]
    	style fld:      field       font [ style: [bold] size: 10 ]
    	style drd:      drop-down   font [ style: [bold] size: 10 ]
    	style nbtn:     button      font [ style: [bold] size: 10 ] 25x25
    	style btn:      button      font [ size: 10 ] 50x25
    	
    	tp: tab-panel [
    	
    		" Form view" [  
    			backdrop silver
    			h5 "Lookups" silver return
    			
    			panel pewter [
    				lbl "ID"        	f_id:       fld 100 return
    				lbl "Type"      	f_type:     drd 120 data [ "Genders" "Salutations" "Countries" "Currencies" ] return
    				lbl "Description"   f_desc:     fld 488 return 
    				lbl "Display order" f_disp:     fld 50
    			] 
    			return
    
    			db-nav: panel [
    				space 2x2
    				b_first:  nbtn "|<"
    				b_prev:   nbtn "<"
    				b_next:   nbtn ">"
    				b_last:   nbtn ">|"           pad 10x0
    				b_new:    btn  "New"
    				b_edit:   btn  "Edit"
    				b_del:    btn  "Delete"
    				b_canc:   btn  "Cancel"       pad 10x0
    						  lbl2 "Records" 50   pad  5x0
    				recs:     fld  70 hint "0"    pad 10x0
    				b_help:   btn  "Help"
    				b_save:   btn  "Save"
    			] 
    		]
    		
    		"List view" [ 
    			backdrop silver
    		]
    	] 
    ] 
    
    view lookup-form
    ```

--------------------------------------------------------------------------------

On 2017-07-28T17:25:09Z, ghost, commented:
<https://github.com/red/red/issues/2938#issuecomment-318713918>

    This is 0.63 on Windows 10 Professional.

--------------------------------------------------------------------------------

On 2017-07-28T18:11:04Z, dockimbel, commented:
<https://github.com/red/red/issues/2938#issuecomment-318725010>

    Testing on Win7, your code works fine, with and without `"edit"` label on the button. Will test on Win10 tomorrow. This is how I tested it:
    
    1. Paste your code in a Red GUI console, run it, works fine.
    2. Close the window, remove the `"edit"` label from the source code, paste the new source, run it, works fine.

--------------------------------------------------------------------------------

On 2017-07-28T19:13:50Z, ghost, commented:
<https://github.com/red/red/issues/2938#issuecomment-318739209>

    Need to correct Win version - it's Enterprise as shown:
    ![mypc](https://user-images.githubusercontent.com/17860443/28732797-2dc2585e-738e-11e7-94a8-daf885409e68.png)

--------------------------------------------------------------------------------

On 2017-07-28T19:16:24Z, ghost, commented:
<https://github.com/red/red/issues/2938#issuecomment-318739738>

    Just to be clear: The caption needs to be removed entirely for bug to show, not just set to "" - like so:
    
    				b_edit:   btn 

--------------------------------------------------------------------------------

On 2017-07-28T19:20:19Z, ghost, commented:
<https://github.com/red/red/issues/2938#issuecomment-318740523>

    Also: I see a split second flash of the expected window before the console disappears. It does not just hide, but terminates as verified via Task Manager.

--------------------------------------------------------------------------------

On 2017-07-29T00:04:35Z, ghost, commented:
<https://github.com/red/red/issues/2938#issuecomment-318787877>

    Just tried this on another PC @ home under Windows 10 Home - identical failure

--------------------------------------------------------------------------------

On 2017-07-29T11:55:20Z, dockimbel, commented:
<https://github.com/red/red/issues/2938#issuecomment-318825552>

    I can reproduce the issue on Win 10.

--------------------------------------------------------------------------------

On 2017-07-29T12:06:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2938#issuecomment-318826593>

    @qtxie Please check if my fix is correct (should be) and if the macOS backend requires a similar fix.

--------------------------------------------------------------------------------

On 2017-07-29T12:07:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2938#issuecomment-318826680>

    @kpeters58 It should be fixed now. You can download the newest automated build for Windows from our [Download page](http://www.red-lang.org/p/download.html).

