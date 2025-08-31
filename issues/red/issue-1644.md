
#1644: resize issue A
================================================================================
Issue is closed, was reported by WiseGenius and has 8 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/1644>

In the following code, the `resize` button will resize `a` as expected, but resizing the window by dragging the edges or clicking the maximize button will not:

```
l: layout [a: area "Hello, World!" b: button "resize" [l/size: 100x100]]
react [a/size: l/size - 20]
view/flags l [resize]
```

Same on Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-19T08:53:00Z, xqlab, commented:
<https://github.com/red/red/issues/1644#issuecomment-186120943>

    Probably this is also the same reason, that the active window of the gui-console under wine does not resize.

--------------------------------------------------------------------------------

On 2016-02-21T06:16:32Z, dockimbel, commented:
<https://github.com/red/red/issues/1644#issuecomment-186755698>

    There's currently no resize event handler provided, that is why the above code does not work. I could add a special one for reactors processing. A fully automated resizing handler will be provided in a future version of Red/View.
    
    I doubt the gui-console is affected by that as it uses its own resizing event handler.

--------------------------------------------------------------------------------

On 2019-05-10T19:16:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/1644#issuecomment-491401409>

    Works for me on W7. Anyone can still reproduce the issue?

--------------------------------------------------------------------------------

On 2019-05-11T03:31:30Z, greggirwin, commented:
<https://github.com/red/red/issues/1644#issuecomment-491475779>

    Fine here on Win10. Closing the ticket.

