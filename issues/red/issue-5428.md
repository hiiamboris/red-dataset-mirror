
#5428: VID `focus` option does not work inside a panel.
================================================================================
Issue is closed, was reported by dockimbel and has 6 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5428>

Focusing using VID `focus` option does not work if the face is inside a `panel` or `group-box`.

Example:
```
view [panel [field focus]]
```
No focus in field when displayed.

It is a regression caused by the [fix](https://github.com/hiiamboris/red/commit/d2f50a46d28180d7e550a19bbadc253fe6857fb7) to #4321.


Comments:
--------------------------------------------------------------------------------

On 2023-11-20T12:39:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5428#issuecomment-1818990640>

    @hiiamboris Why did you change the focus handling code in [this commit](https://github.com/hiiamboris/red/commit/d2f50a46d28180d7e550a19bbadc253fe6857fb7)?

--------------------------------------------------------------------------------

On 2023-11-20T12:46:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5428#issuecomment-1819001546>

    You have one focus per `layout` call, it can't be global.

--------------------------------------------------------------------------------

On 2023-11-20T13:36:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5428#issuecomment-1819079325>

    I've changed the implementation to a cleaner and hopefully, more robust version.

