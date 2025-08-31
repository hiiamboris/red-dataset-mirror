
#3530: LOOSE with a PANEL is erractic
================================================================================
Issue is open, was reported by dsunanda and has 28 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3530>

### Expected behavior

I'd hope for smooth movement when setting a PANEL as LOOSE

### Actual behavior

I am finding it very laggy. Movement is unreliable - and it sometimes acts as if the Left Mouse button is stuck down.

### Steps to reproduce the problem

In this code, the BLUE box can be dragged freely, while the RED box is a UI nightmare.

    unview/all
    view/no-wait [
        across
        box loose 100x100 blue
	    return
	    panel loose [box 100x100 red]
	]
### Red and platform version
Red for Windows version 0.6.3 built 8-Dec-2017/19:35:20. Win 10


Comments:
--------------------------------------------------------------------------------

On 2018-09-05T20:07:48Z, greggirwin, commented:
<https://github.com/red/red/issues/3530#issuecomment-418864346>

    Reproduced on Win10 here. `tab-panel` does the same, so maybe the OS and container faces have an issue.

--------------------------------------------------------------------------------

On 2018-09-05T21:34:11Z, endo64, commented:
<https://github.com/red/red/issues/3530#issuecomment-418889040>

    If you move the panel in vertical direction dragging is smooth, lag happens when mouse pointer moves on to red box (which is another face)
    
    Try this one:
    ```
    view [
    	size 500x500
        across
        box loose 100x100 blue
        return
        panel loose red [size 100x100]
    ]
    ```

--------------------------------------------------------------------------------

On 2018-09-05T23:12:08Z, dsunanda, commented:
<https://github.com/red/red/issues/3530#issuecomment-418910777>

    Thanks for the quick replies -- glad to know it's not just me, Gregg.
    
    Endo - thanks. Your example does seem to scroll smoothly. But any internal structure in the PANEL seems to be erratic (a word I can occasionally spell correctly) - e.g. this with two text boxes  in the panel
    
    unview/all
    view/no-wait [
    	size 500x500
        across
        box loose 100x100 blue
        return
        panel red loose [text green 100x100 "hello" text yellow 100x100 "Bye"]
    ]
    
    The real-world usage case is using a loose panel to create a dragable image with a caption.

--------------------------------------------------------------------------------

On 2018-09-06T09:00:32Z, endo64, commented:
<https://github.com/red/red/issues/3530#issuecomment-419019550>

    Issue is not related to panel and tab-panel but to all inner faces:
    
    Try this exampe, click somewhere blue that is very close to red and move mouse and overlap pointer onto red area during dragging, then lag happens:
    
    ```
    view/no-wait [
    	size 500x500
    	b1: box loose 200x200 blue
    ]
    layout [at 50x50 b2: box 100x100 red]
    b1/pane: reduce [b2]
    do-events
    ```

--------------------------------------------------------------------------------

On 2018-09-25T18:46:34Z, dsunanda, commented:
<https://github.com/red/red/issues/3530#issuecomment-424457591>

    As a matter of interest (and may be offering a clue to what is going wrong), I have a work-around that produces smoothly draggable panels / inner faces.
    
    The basic idea is to have an invisible LOOSE panel sitting above the structure. When that moves, you move the underlying structure to match. Adapting Endo04's example:
    
        view/no-wait [
            	size 500x500
    	    b1: box 200x200 blue    ;; NOT LOOSE
    	                        ;; NEXT LINE ADDED FOR BASIC WORKAROUND
    	    at 102x72 box loose 0.0.0.254 200x200 on-drag [b1/offset: face/offset]
        ]
        layout [at 50x50 b2: box 100x100 red]
        b1/pane: reduce [b2]
        do-events
    
    (I have a half-way decent STYLE that uses ON-CREATED to resize itself, and latch into the correct PANE and Z-axis position (so as to not obstruct clickable buttons etc), but the one-line version above shows the basic idea. And it drags around just fine)

--------------------------------------------------------------------------------

On 2018-09-28T22:05:50Z, greggirwin, commented:
<https://github.com/red/red/issues/3530#issuecomment-425579071>

    Nice workaround @dsunanda!

--------------------------------------------------------------------------------

On 2018-12-13T16:20:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3530#issuecomment-447028936>

    @qtxie Do we use the special API for moving panel's child window all at once when panel's offset is changed?

--------------------------------------------------------------------------------

On 2018-12-14T01:22:41Z, qtxie, commented:
<https://github.com/red/red/issues/3530#issuecomment-447180440>

    @dockimbel When moving a parent window, all of its child windows will be moved together. No need special API for it.
    As @endo64 shows, the lagging happens when the mouse move into an inner face. In this case, the container (panel) cannot receive mouse events, which cause the issue.

--------------------------------------------------------------------------------

On 2019-01-17T13:48:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/3530#issuecomment-455177781>

    There's even more to panel/base dragging! Embedded shutter effect!
    `view [panel 400x400 [base 100x100 loose]]`
    ![](https://i.gyazo.com/b83952623d78cfb1a9aa5bd28ac88673.gif)

--------------------------------------------------------------------------------

On 2019-01-18T02:31:23Z, greggirwin, commented:
<https://github.com/red/red/issues/3530#issuecomment-455405888>

    Wow! You have a knack for finding the strangest things.

--------------------------------------------------------------------------------

On 2019-01-18T22:29:18Z, endo64, commented:
<https://github.com/red/red/issues/3530#issuecomment-455708783>

    It doesn't happen on my `Red 0.6.4 for Windows built 11-Jan-2019/5:18:27+03:00 commit #5e37a10`

--------------------------------------------------------------------------------

On 2019-09-10T21:10:18Z, qtxie, commented:
<https://github.com/red/red/issues/3530#issuecomment-530121215>

    It works fine on Win10 now. I'll check on Win7 tomorrow.

--------------------------------------------------------------------------------

On 2019-09-12T17:04:05Z, qtxie, commented:
<https://github.com/red/red/issues/3530#issuecomment-530916472>

    Works on Win7 too. So I close it.

--------------------------------------------------------------------------------

On 2019-11-28T21:08:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/3530#issuecomment-559603270>

    @qtxie shutter effect still happens on W7 `view [panel 400x400 [base 100x100 loose]]`
    
    And the original sample sometimes stops moving for no apparent reason:
    ![](https://i.gyazo.com/dc0d198a8d77ba4c1f06df7f92052d28.gif)
    (while recording this I never released LMB)
    ```
    >> about
    Red 0.6.4 for Windows built 27-Nov-2019/10:17:45+03:00 commit #b2aafe6
    ```
    
    Could it be related to https://github.com/red/red/issues/1463 ?

