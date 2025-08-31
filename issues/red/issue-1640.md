
#1640: WISH: Tooltip support in Face
================================================================================
Issue is open, was reported by JenniferLee520 and has 12 comment(s).
[status.reviewed] [GUI] [type.task.wish]
<https://github.com/red/red/issues/1640>

I hope Face! have a TOOLTIP facet in the future release, as shown below:

``` Red
btn1: make face! [
    type:    'button
    text:    "Run+Debug"
    tooltip: "Execute in debugging mode"
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-17T07:00:40Z, dockimbel, commented:
<https://github.com/red/red/issues/1640#issuecomment-185061533>

    We can support that feature, but in `face/options` block rather.

--------------------------------------------------------------------------------

On 2022-03-16T16:37:37Z, hiiamboris, commented:
<https://github.com/red/red/issues/1640#issuecomment-1069332506>

    Still impossible to show a tooltip in Red.
    
    I've tried a few workarounds: all failed miserably.
    
    transparent base to render tooltips:
    `view [button all-over on-over [tip/draw: either event/away? [[]][compose [box (pos: event/offset + 10x10) (pos + 60x20) text (pos) "Hello?"]]] at 0x0 tip: box 200x200]`
    ![](https://i.gyazo.com/5d981dd44ac70f92e4c0c361b36a895c.gif)
    
    tooltip as a separate face:
    `view [button all-over on-over [tip/offset: event/offset + 10x10 tip/visible?: not event/away?] tip: base 60x20 white hidden "Hello?"] []`
    ![](https://i.gyazo.com/b29c91af6fe20aa687eef64d3e2ab27b.gif)
    
    Of course it should be a separate window, as tooltips commonly can stick out of it's parent window, and also should be able to have non-rectangular shape. But that is even more fantastical. Separate window would divert focus from the main one (unacceptable), and transparent windows are not supported.
    

--------------------------------------------------------------------------------

On 2022-03-16T16:47:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/1640#issuecomment-1069344147>

    Ah, flickering was because of the offset. With `event/offset + 15x15` both workarounds stop flickering. So only limited by window borders then.

--------------------------------------------------------------------------------

On 2024-03-30T12:41:13Z, 9214, commented:
<https://github.com/red/red/issues/1640#issuecomment-2028041855>

    Theoretically doable on all 3 View backends: [`Win32`](https://docs.microsoft.com/en-us/windows/win32/controls/tooltip-controls), [`Cocoa`](https://developer.apple.com/documentation/appkit/nsview/1483541-tooltip?language=objc), [`GTK`](https://docs.gtk.org/gtk3/class.Tooltip.html).

--------------------------------------------------------------------------------

On 2024-04-12T10:01:49Z, endo64, commented:
<https://github.com/red/red/issues/1640#issuecomment-2051452679>

    I prefer a non-custom solution using OS APIs.

--------------------------------------------------------------------------------

On 2024-04-12T20:56:49Z, greggirwin, commented:
<https://github.com/red/red/issues/1640#issuecomment-2052517736>

    While moving with the mouse would be useful for other scenarios, I don't remember ever seeing a tooltip move with it that way. For the native UI, a native solution seems best. For something like `spaces` this is useful.

