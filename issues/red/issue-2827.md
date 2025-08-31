
#2827: [macOS View] Clicking on the non-button part of a Drop-List component will not make the list shown.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 14 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/2827>

In the following code, clicking on the button of the drop-list is fine, but clicking on the field will not make the list popup.
```Red
view [ drop-list data [ "AA" "BB" "CC" ] select 1 ]
```
This bug is only on macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-25T09:11:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2827#issuecomment-310891582>

    That is how the macOS widget works. Native widgets can have some platform-specific behavior, that is part of that "native GUI" experience, and expected by end-users.

--------------------------------------------------------------------------------

On 2017-06-25T09:12:30Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2827#issuecomment-310891640>

    No, this is not the default behavior on macOS.

--------------------------------------------------------------------------------

On 2017-06-25T09:12:56Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2827#issuecomment-310891663>

    This ticket should be re-open.

--------------------------------------------------------------------------------

On 2017-06-25T09:23:31Z, dockimbel, commented:
<https://github.com/red/red/issues/2827#issuecomment-310892090>

    It is the right default behavior for drop lists on macOS. You must be talking about a different widget like the pop-up menu, which looks similar.

--------------------------------------------------------------------------------

On 2017-06-25T13:44:42Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2827#issuecomment-310903459>

    Nope, this is not the default behavior for drop-list on macOS. On Number (Apple's Excel), if you want to change the border style of a cell, there is a drop-list for it in the property panel. Click on the drop-list, and you will see that.

--------------------------------------------------------------------------------

On 2017-06-25T14:27:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2827#issuecomment-310905764>

    @qtxie You should have a look at this issue.

--------------------------------------------------------------------------------

On 2017-06-26T23:37:46Z, qtxie, commented:
<https://github.com/red/red/issues/2827#issuecomment-311211211>

    Ok. I'll use [Pull-Down Lists](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/MenuList/Articles/ManagingPopUpItems.html) instead of Combo Box.

