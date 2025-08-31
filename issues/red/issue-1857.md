
#1857: WISH: A new type of face, EDIT
================================================================================
Issue is closed, was reported by SteeveGit and has 2 comment(s).
[status.deferred] [type.wish]
<https://github.com/red/red/issues/1857>

EDIT would behave like FIELD, emits the same flow of events and can be activated (focus/unfocus events emitted).
All that, without the look and feel of a Field. So en empty face (more like a container) which lets the user choose its look (using draw or sub faces).
Thanks



Comments:
--------------------------------------------------------------------------------

On 2016-05-12T06:50:05Z, dockimbel, commented:
<https://github.com/red/red/issues/1857#issuecomment-218674312>

    We cannot have the `field` features without its look, as it's a native widget. We will provide support for custom widgets creation in a later release. We may or may not implement support for a caret+editing system which could be re-used by any other custom widget. Anyway, decisions and architecture of the custom widget support is still a bit premature, so I'm closing this ticket for now. Feel free to open a new one when custom widgets will be officially supported if your needs are not met.

