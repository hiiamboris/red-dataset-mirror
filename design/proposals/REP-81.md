
#81: Q: Should Red allow windows to be attached to other windows?
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/REP/issues/81>

In the current build this is a bit crash-prone, but it kinda works.
`view [p: panel [] do [append p/pane layout [button]]]`

Currently it gives no advantages, but I can imagine a few separate windows being dragged as one, and being closed/minimized/hidden as soon as the parent window is closed/minimized/hidden.

What would be the best way to handle the above code?
1. Like R2 - append the contents of the pane instead of the window itself
2. Support windows within windows and give them some special properties (dunno how portable this is or how much effort requires)
3. Raise an error



Comments:
--------------------------------------------------------------------------------

On 2020-06-21T20:41:14Z, greggirwin, commented:
<https://github.com/red/REP/issues/81#issuecomment-647179049>

    For those who are too young to remember [MDI](https://en.wikipedia.org/wiki/Multiple-document_interface), this is how MS tried to solve it. Many other approaches exist as well. None are universally good. It seems best to do this the simplest way possible, by building a system that allows you to declare window relationships, handle events for them based on that, and use plain old windows for everything. Then we can make toolboxes, file pickers, plugins for apps, and have a well defined API for coordinating them.

--------------------------------------------------------------------------------

On 2020-06-21T20:42:57Z, greggirwin, commented:
<https://github.com/red/REP/issues/81#issuecomment-647179258>

    Drag and drop is another subsystem to consider here, and breaking things apart means it can work across apps as well, like file dragging in an OS.

