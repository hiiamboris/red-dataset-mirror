
#5507: New fix for area does not work with WRAP
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 26 comment(s).
[status.built] [type.review] [GUI]
<https://github.com/red/red/issues/5507>


**Describe the bug**
Use WRAP and the slowness returns. It happens at each key press too.

**To reproduce**

Run this code:

```
base-text: "abcdefghijklmnopqrstuvzABCDEFGHIJKLMNOPQRSTUVZ1234567890!"


text-size: 2048 * 1048 / (length? base-text)

area-text-x: copy ""


repeat idx text-size [

	base-text: random base-text 
	;append area-text-x rejoin [copy/part base-text random length? base-text lf]
	append area-text-x rejoin [base-text lf]

	 
]

view [
	
	a1: area area-text-x 500x500 wrap with [flags: 'no-sync]

]
```

**Platform version**
Red commit: b26ec93





Comments:
--------------------------------------------------------------------------------

On 2024-05-26T16:25:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132277353>

    It's a known limitation. Wrapping mode requires rendering each line internally for measuring the size of the bounding box, and that for each key stroke! I doubt that can be improved performance-wise. Wrapping mode is not usable for huge content like that in `area` style.
    
    @qtxie Do you see any better way than the current one?

--------------------------------------------------------------------------------

On 2024-05-26T18:17:27Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132305343>

    I have seen similar situations solved recalculating just the areas interested from the change and keeping all the other calculated parts. I don't know if here it could apply.
    
    
    
    
    
    

--------------------------------------------------------------------------------

On 2024-05-26T18:42:39Z, dockimbel, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132342833>

    In the native View backends, we don't manage the widgets, the OS does. So for `area`, we don't (and won't) maintain internally heavy data structures for rendering purposes.
    
    I think it can be solved in different way, just providing a way to disable the scrollbars auto-activation feature, that will give you back the wanted performance, but the area would loose the ability to turn scrollbar on/off automatically depending on the content.

--------------------------------------------------------------------------------

On 2024-05-26T18:59:51Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132364834>

    Understood. I don't need automation for the scollbars, and also I can fake it in some way calculating the length of the text with rough precision.   So ON/OFF automation is not a required feature.
    
    I have a small request while working on this part of VID. My application would need positioning the caret so the text scrolls to the new requested character position. Could this be implemented: https://github.com/red/REP/issues/76 please?
    
    

--------------------------------------------------------------------------------

On 2024-05-26T19:06:39Z, dockimbel, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132366953>

    New `no-auto-sb` flag added in branch `issue-5507`. @qtxie If you don't have a way to speed it up in wrapping mode, I'll merge that code.
    
    The following modified code would now give satisfying performances:
    ```
    view [a1: area area-text-x 500x500 wrap with [flags: [no-sync no-auto-sb]]]
    ```

--------------------------------------------------------------------------------

On 2024-05-26T19:24:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132371134>

    > I have a small request while working on this part of VID. My application would need positioning the caret so the text scrolls to the new requested character position. Could this be implemented: https://github.com/red/REP/issues/76 please?
    
    It should be possible to override `/selected` facet for setting/getting the caret position (both components of the `pair!` being identical in such case). As the OS API for that is already implemented, it should be easy to extend for that purpose. Though, I'm not sure about the scrolling to caret support on Windows platform (EDIT: the OS does provide a message for that).
    
    I don't think we'll go further than that for `area`. It was never meant to be a text-editor. For such need, you should rather use the `rich-text` or a Draw-based custom style.

--------------------------------------------------------------------------------

On 2024-05-26T20:09:25Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132382678>

    I agree,  `area` component is not and should not be a full text editor. (There will be another component in the future as I have read)
    
    Back to the cursor position:
    
    During the years we (community) have talked about 2 solutions:
    
    - `/selected` could return a `pair!` with second element set to zero as `23x0` to set the caret position or when position is read.
    - writing an integer to `/selected`  could set the cursors and reading an integer means there is no selection and you obtain the cursor position.
    
    The scroll to the position of the selection is an important part of this request: when you search for a text and find it, you need to position to corresponding line and word. This happen either when you set the cursor to the start of found element or when you select the found text
    
    
    
    
    
    
    
     

--------------------------------------------------------------------------------

On 2024-05-26T20:45:28Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132390792>

    A small report on your fix:
    
    - Typing characters happens at FULL SPEED
    - Hitting return il 33% faster. So if you hit enter without the FIX it takes 2 seconds, with the fix it takes 1.2 seconds
    - I have noticed these are the performances when you hit enter at the start of the text. The more you do this near the end of the text, the faster it will be. So it heavily depends on the amount of characters that are from the position you hit enter to the end.
    

--------------------------------------------------------------------------------

On 2024-05-27T03:10:04Z, qtxie, commented:
<https://github.com/red/red/issues/5507#issuecomment-2132564030>

    > @qtxie Do you see any better way than the current one?
    
    No. I don't see a faster one.

--------------------------------------------------------------------------------

On 2024-05-28T02:34:43Z, qtxie, commented:
<https://github.com/red/red/issues/5507#issuecomment-2134252179>

    Improve the code. We can break the loop earlier as we don't care about the horizontal bar when it's WRAP mode.

--------------------------------------------------------------------------------

On 2024-05-28T19:17:10Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5507#issuecomment-2135944788>

    > > @qtxie Do you see any better way than the current one?
    > 
    > No. I don't see a faster one.
    
    Could I ask why if I delete a line on the top, this happens very slow and if I do it at the bottom of the text, it happens at the speed of light? Which is the calculation that in this situation runs for every character or line from the current position to the end that cannot be interrupted?
    
    (Also note: no-auto-sb has not been merged/implemented in the main branch)

--------------------------------------------------------------------------------

On 2024-05-31T06:52:37Z, qtxie, commented:
<https://github.com/red/red/issues/5507#issuecomment-2141342461>

    > Could I ask why if I delete a line on the top, this happens very slow and if I do it at the bottom of the text, it happens at the speed of light?
    
    @GiuseppeChillemi Do you know where the slowness happens? on Red side or the edit control?

--------------------------------------------------------------------------------

On 2024-05-31T09:05:39Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5507#issuecomment-2141553790>

    I don't know what Red does on line deletion. Specifically I don't know what happens between the hitting of the DEL key, the disappearing of the selected line and the redrawing of the current visibile area with the remaining text. Is It an all on the OS side or Red internal code interacts with the control during this process? 🤷🏻

