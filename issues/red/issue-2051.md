
#2051: Resize event on gui-console is also handled by spawned window, leads to console crash
================================================================================
Issue is closed, was reported by asampal and has 4 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/2051>

Running Windows 10 64 bit, Red 8ec8635b4af8defb8b95b85824324f5eadb1fece

To reproduce:
Open gui-console
Paste source of [clock demo](https://github.com/red/code/blob/master/Scripts/clock.red) into console
Resize gui-console: you will see size event is also handled by clock. While resizing, the gui-console goes blank and remains blank even after resizing is stopped. Closing the clock window causes a crash in the gui-console.

![resize-event](https://cloud.githubusercontent.com/assets/281639/16201153/4c5d3b5a-36de-11e6-872d-0f5f173c9c1d.gif)



Comments:
--------------------------------------------------------------------------------

On 2016-06-21T10:55:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2051#issuecomment-227406344>

    The global handler in %clock.red is affecting boths windows, it needs to filter the events for the clock window only. The script will be fixed before the new release.

--------------------------------------------------------------------------------

On 2016-06-22T14:28:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2051#issuecomment-227761844>

    Fixed in branch `v0.6.1`, in red/code repo by commit https://github.com/red/code/commit/bfb129b57a6eb3443d8ef91f35aed211d5f8e8f2.

