
#1981: VID 'origin value is not used on right/bottom side of the window, but 'space one
================================================================================
Issue is closed, was reported by DideC and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1981>

This code show that `space` value is used on right and bottom side of the window. `origin` value must be used there.

```
view layout [origin 0x0 space 25x25 button "Test this and you see the bug"]
```

In Rebol, (if you replace `button` by `btn` because `button` has a fixed width) the button is just centered and occupy the full window client area.
In Red, there is 25 pixel margin on right and bottom side.

workaround is simply to substract last spacing and add origin to last pane size, I guess.
So in [red/module/view/VID.red line 387:](https://github.com/red/red/blob/master/modules/view/VID.red#L387)
`if pane-size <> 0x0 [panel/size: pane-size]`
must be
`if pane-size <> 0x0 [panel/size: pane-size - spacing + origin]`
(not tested)



Comments:
--------------------------------------------------------------------------------

On 2016-06-09T08:24:54Z, DideC, commented:
<https://github.com/red/red/issues/1981#issuecomment-224830734>

    R2 `layout` use `span?` to compute the full size occupied by the faces in the window, and add the `origin` value to it.
    I thought it was overkill first, but imagine the following code:
    
    ```
    a: "text of the button in the window"
    view layout [
        b: button 100x100
        do [b/text: a b/size: 8x8 + size-text b b/text]
    ]
    ```
    
    In Rebol, the result is correct, but not in Red!

--------------------------------------------------------------------------------

On 2016-06-15T11:22:10Z, dockimbel, commented:
<https://github.com/red/red/issues/1981#issuecomment-226159398>

    The difference in your last code example between Red/View and Rebol/View is caused by the text size calculation, in Rebol the text wraps in buttons by default, in Red, it does not (we might change that in the future).

--------------------------------------------------------------------------------

On 2016-06-15T11:28:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1981#issuecomment-226160603>

    I used your fix, it was the right one. Thanks! ;-)

--------------------------------------------------------------------------------

On 2016-06-22T09:09:36Z, DideC, commented:
<https://github.com/red/red/issues/1981#issuecomment-227686404>

    As I said above, my first fix was a simple one that works in simple case.
    It does not solve the problem of delayed face sizing like:
    
    ```
    a: "text of the button in the window"
    view layout [
        b: button 100x100
        do [b/text: a b/size: 8x8 + size-text b b/text]
    ]
    ```
    
    Rebol use `span?` to compute the window final size before rendering, so it avoid this behaviour.

--------------------------------------------------------------------------------

On 2016-06-22T09:22:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1981#issuecomment-227689320>

    You should open a new ticket for delayed VID sizes calculation, as it's a different topic than this one.

--------------------------------------------------------------------------------

On 2016-06-22T12:59:48Z, DideC, commented:
<https://github.com/red/red/issues/1981#issuecomment-227735271>

    You are right, result would be different in Rebol and Red cause Rebol `button` style has a fixed size. Rebol `btn` is more like Red `button`.
    If you replace `button` by `area` in the code, it's more fair... and the problem stand.
    I will make another ticket for that, as you want.

