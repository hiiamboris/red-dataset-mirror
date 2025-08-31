
#2904: Cross-platform GUI capitalization rules are wrong
================================================================================
Issue is open, was reported by roryokane and has 4 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/2904>

Congratulations on releasing your new rule-oriented GUI rewriting engine. However, the announcement in your [v0.6.3 release blog post](http://www.red-lang.org/2017/07/063-macos-gui-backend.html) does a very poor job of promoting it, because the capitalization in your example is incorrect for both the macOS and Windows platforms:

![example from the announcement with incorrect capitalization](https://user-images.githubusercontent.com/79168/28389544-90dd8f80-6ca4-11e7-8cff-de70e94d98fb.png)

These are the correct capitalizations of various button names on various platforms:

| | “OK” | “cancel” | “blow up” |
| ---: | :---: | :---: | :---: |
| **Windows** | OK | Cancel | Blow up |
| **macOS** | OK | Cancel | Blow Up |
| **Linux – Gnome** | OK | Cancel | Blow Up |
| **Linux – KDE** | OK | Cancel | Blow Up |

## Sources

These pages give general rules for buttons and specific examples of "OK" and "Cancel" buttons. From these pages you can also find other OS-specific interface guidelines that you can use when writing other GUI rewriting rules. Some of the pages may also help you check the correct order of OK and Cancel buttons in dialogs.

### Windows

- [User Interface Text – Windows Design Guidelines](https://msdn.microsoft.com/en-us/library/windows/desktop/dn742478.aspx)
- [Command Buttons – Windows Design Guidelines](https://msdn.microsoft.com/en-us/library/windows/desktop/dn742402.aspx)
- These older documents describe the same capitalization rules:
    - [Capitalization – MMC 3.0 Guidelines](https://msdn.microsoft.com/en-us/library/windows/desktop/bb246428.aspx)
    - [Command Buttons – MMC 3.0 Guidelines](https://msdn.microsoft.com/en-us/library/windows/desktop/bb246415.aspx)

### macOS

There is no page about capitalization of text in general, but here are the pages most relevant to capitalization of buttons:

- [Buttons > Push Buttons – macOS Human Interface Guidelines](https://developer.apple.com/macos/human-interface-guidelines/buttons/push-buttons/)
- [Windows and Views > Dialogs – macOS Human Interface Guidelines](https://developer.apple.com/macos/human-interface-guidelines/windows-and-views/dialogs/)

### Gnome windowing manager for Linux

- [Writing Style > Capitalization – GNOME Human Interface Guidelines](https://developer.gnome.org/hig/stable/writing-style.html.en#capitalization)
- [Buttons – GNOME Human Interface Guidelines](https://developer.gnome.org/hig/stable/buttons.html.en)

### KDE windowing manager for Linux

- [KDE Visual Design Group/HIG/Capitalization](https://community.kde.org/KDE_Visual_Design_Group/HIG/Capitalization)
- [KDE Visual Design Group/HIG/Buttons](https://community.kde.org/KDE_Visual_Design_Group/HIG/Buttons)

## Changes to make

- The macOS developer guidelines link in a comment in [`macOS/rules.red`](https://github.com/red/red/blob/4cdb41930ad9fb466b0ad3a81123f5b0e1d25bec/modules/view/backends/macOS/rules.red#L37) is out of date and doesn't point to a page any more. Change the link to one the pages in my sources or to the [root of their HIG](https://developer.apple.com/macos/human-interface-guidelines/overview/themes/).

- If the repo contains any code examples of GUIs with labels similar to the `"ok"` and `"cancel"` on the announcement page, update those labels to use sentence case instead of being all lower-case. Then the `capitalize` function for macOS will turn them into title case on Mac and leave them alone on Windows.
    - This is better than moving the `capitalize` function into [`windows/rules.red`](https://github.com/red/red/blob/master/modules/view/backends/windows/rules.red) because converting from title case to sentence case would wrongly lower-case proper nouns, but there's no such problem the other way around.

- The `capitalize` function in [`macOS/rules.red`](https://github.com/red/red/blob/4cdb41930ad9fb466b0ad3a81123f5b0e1d25bec/modules/view/backends/macOS/rules.red#L35) might need to be updated too, depending on whether it leaves "OK" alone (correct) or converts it to "Ok" (incorrect).

- Depending on whether you think of release announcements as documentation for current users or historical documents, you might update the code and screenshots in the announcement with these fixes.


Comments:
--------------------------------------------------------------------------------

On 2017-07-20T03:22:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2904#issuecomment-316585560>

    Thank you very much for the extensive analysis and links! We will proceed with the corrections in the code and blog article asap.
    
    For the record, the capitalization rule was only available on macOS, the button ordering rule was defined on both platforms.

--------------------------------------------------------------------------------

On 2020-07-15T11:04:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/2904#issuecomment-658703863>

    On W7 no capitalization still:
    `view [button "cancel" button "ok" button "blow up"]`
    ![](https://i.gyazo.com/5ae92309a9290eec7d8047b67c014d44.png)
    
    The ordering is too aggressive I think. Order between "blow up" and other buttons is not defined and should not be messed with.
    
    Relates to https://github.com/red/red/issues/2937 (ordering)

