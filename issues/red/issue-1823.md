
#1823: Base with transparent part is always on top of its opaque sibling.
================================================================================
Issue is open, was reported by JenniferLee520 and has 18 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/1823>

``` Red
RED[]

view [
    canvas: panel [
        circle: base 50x50 loose draw: [ line-width 5 circle 24x24 20 ]
            on-drag-start [
                remove find canvas/pane face
                append canvas/pane face
            ] 
        base red 50x50 loose "Drag Me"
            on-drag-start [
                remove find canvas/pane face
                append canvas/pane face
            ] 
        base green 50x50 loose "Drag Me"
            on-drag-start [
                remove find canvas/pane face
                append canvas/pane face
            ] 
    ]
    do [
        circle/color: none
    ]
]
```

Dragging object will be appended to the last for making it show on the top. but the circle is always on top. That's strange.



Comments:
--------------------------------------------------------------------------------

On 2016-04-18T13:31:57Z, JenniferLee520, commented:
<https://github.com/red/red/issues/1823#issuecomment-211380057>

    BTW. I am using Windows 10.

--------------------------------------------------------------------------------

On 2016-04-18T14:11:11Z, qtxie, commented:
<https://github.com/red/red/issues/1823#issuecomment-211397722>

    On Windows, the `BASE` face will use two different implements(normal window and layered window) internally according to the way to use it.
    The reason is we cannot make a normal window be a shaped window or a transparent window, only a [layered window](https://msdn.microsoft.com/en-us/library/ms997507.aspx) can do this. But layered window cannot be a child window, we make it as popup window to simulate it, this is why it is always on top of the normal window.
    In this case, one solution is make all the base faces be a layered window. Just specify the alpha channel in the background color. e.g change `red` to `255.0.0.0`.

--------------------------------------------------------------------------------

On 2016-04-18T14:16:29Z, qtxie, commented:
<https://github.com/red/red/issues/1823#issuecomment-211400062>

    Also there is a known issue when you remove the face in `on-drag-start` event, the face will lose mouse capture. @dockimbel Did we fix it? I don't remember. :confused: 

--------------------------------------------------------------------------------

On 2016-04-18T14:22:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1823#issuecomment-211401933>

    @qtxie IIRC, yes we've fixed it. For this ticket, the reported bug in on Win10, we don't use layered windows on that version of Windows, so it should work, right?

--------------------------------------------------------------------------------

On 2016-04-18T14:23:57Z, qtxie, commented:
<https://github.com/red/red/issues/1823#issuecomment-211402335>

    No. we use layered windows on all version of windows now. In order to support putting standard control(like button) as child window in the base face.

--------------------------------------------------------------------------------

On 2016-04-19T04:06:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1823#issuecomment-211721089>

    @qtxie Is there any way to put a transparent window behind a non-transparent one in Win10?

--------------------------------------------------------------------------------

On 2016-04-19T04:19:46Z, qtxie, commented:
<https://github.com/red/red/issues/1823#issuecomment-211723037>

    Yes. on Win8+, we can make a transparent window as child window, so it works well with a non-transparent.

--------------------------------------------------------------------------------

On 2016-04-19T10:20:37Z, qtxie, commented:
<https://github.com/red/red/issues/1823#issuecomment-211845482>

    @dockimbel For mouse capture issue, it's just partial fixed. https://github.com/red/red/issues/1513

--------------------------------------------------------------------------------

On 2018-03-08T07:21:44Z, toomasv, commented:
<https://github.com/red/red/issues/1823#issuecomment-371402278>

    @qtxie @dockimbel Is this connected to the above problem, that when specifying `transparent` for a panel, alpha channel is not recognized   on W10?
    ```
    view [base red at 10x10 panel transparent]
    ```
    shows black panel only, while red `base` is expected to be seen.
    (build: 3-Mar-2018)

