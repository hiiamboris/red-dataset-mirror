
#3031: Wish color requester
================================================================================
Issue is closed, was reported by planetsizecpu and has 6 comment(s).
[type.wish]
<https://github.com/red/red/issues/3031>

Hi folks!

At this moment I would like to have a color requester like the others of "request-file" etc.
so it may return the user selected color from palette. I have seen at past some examples done in Red
so maybe is a easy wish. We may call it simply "request-color"

THX


Comments:
--------------------------------------------------------------------------------

On 2017-10-25T18:02:32Z, greggirwin, commented:
<https://github.com/red/red/issues/3031#issuecomment-339417946>

    Here's a basic one you can play with (based on some work @honix did):
    ```
    	set 'request-color func [
    		/size sz [pair!]
    		/title titl [string!]
    		/local palette res dn?
    	][
    		sz: any [sz 150x150]
    		palette: make image! sz
    		draw palette compose [
    			pen off
    			fill-pen linear red orange yellow green aqua blue purple
    			box 0x0 (sz)
    			fill-pen linear white transparent black 0x0 (as-pair 0 sz/y)
    			box 0x0 (sz)
    		]
    		view/flags compose [
    			title (any [ titl ""])
    			; The mouse down check here is because the window may pop up directly
    			; over the mouse, and get focus. Hence, it gets a mouse up event, even
    			; though they didn't mouse down on the color palette.
    			image palette on-down [dn?: true] on-up [
    				if dn? [
    					res: pick palette event/offset
    					unview
    				]
    			]
    		][modal popup] ; no-buttons
    		res
    	]
    ```

--------------------------------------------------------------------------------

On 2017-10-26T11:18:28Z, planetsizecpu, commented:
<https://github.com/red/red/issues/3031#issuecomment-339633811>

    @greggirwin thx, I added this func to my forms.red script while wait for red's built-in func

--------------------------------------------------------------------------------

On 2018-04-25T06:33:36Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3031#issuecomment-384175508>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

