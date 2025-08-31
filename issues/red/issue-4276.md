
#4276: [GTK] showing modal window blocks GUI console input
================================================================================
Issue is closed, was reported by 9214 and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4276>

**Describe the bug**

Displaying and closing modal window renders the GUI console input area unresponsive.

**To reproduce**

From the GUI console, type `view/flags [] 'modal` and close the popped up window. Note that you cannot type anything in the console after that.

**Expected behavior**

I expect the GUI console to be fully responsive after the modal window is closed.

**Platform version**

The latest build from GTK branch.



Comments:
--------------------------------------------------------------------------------

On 2020-01-31T13:28:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4276#issuecomment-580733232>

    that's not GTK-specific
    https://github.com/red/red/issues/3942#issuecomment-579964271

--------------------------------------------------------------------------------

On 2020-01-31T13:42:14Z, 9214, commented:
<https://github.com/red/red/issues/4276#issuecomment-580737985>

    @hiiamboris neither W10 nor macOS have this behavior, so you should clarify that it's W7-specific.

--------------------------------------------------------------------------------

On 2020-02-03T07:23:34Z, bitbegin, commented:
<https://github.com/red/red/issues/4276#issuecomment-581273589>

    need find a way to get the focus widget of a window, for example: put the focus widget handle to pane/status 

--------------------------------------------------------------------------------

On 2020-05-13T03:32:40Z, qtxie, commented:
<https://github.com/red/red/issues/4276#issuecomment-627724001>

    Fixed by commit e3692ffed5ad6c0e77bb7ce0549b7be80975b755 .

