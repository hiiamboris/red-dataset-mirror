
#40: WISH: Transparency support for top windows in View
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
<https://github.com/red/REP/issues/40>

This may allow to create more **spectacular UIs** and make some users **happy**.
Current state as of 0.6.4 is that top level window is always fully opaque.

There are **2 modes** possible (supported separately or together):
1. Set a fixed transparency for the **whole window**, making it look translucent. This will affect everything inside the window and no child face will be fully opaque anymore.
2. Make ***only*** **the top window** translucent, while still allowing child faces to be as opaque as one wants them to be.

I have made only preliminary research on the topic, and only for Windows. Transparency support of **other platforms** should be evaluated before making any further decisions. More research on **compatibility** is also needed for **RichText and Draw**. Final code should tested against `to-image` to see if it is captured properly, as I know this can cause problems.

What I'm currently aware of:

#### Mode 1
- Is trivial to support on Windows by setting a WS_EX_LAYERED style for the window and calling [SetLayeredWindowAttributes](https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-setlayeredwindowattributes) func with desired maximum alpha value. Tested on W7, but should be compatible down to W2K.
- On W7 the same alpha value should also be used in the [base rendering code](https://github.com/red/red/blob/5e37a10f19f9a4f27d0fdc34e8c58797a0763824/modules/view/backends/windows/events.reds#L842) to limit the opacity of child bases.
- Possible point of insertion into the View engine is the `options` facet of the `window` face, e.g. `options: [transparency: 10%]`.

#### Mode 2
- It seems possible on Windows down to W2K using [UpdateLayeredWindow](https://docs.microsoft.com/en-us/windows/desktop/api/winuser/nf-winuser-updatelayeredwindow) function and [by sending WM_PRINT to native child windows to draw them on top of a custom DC](https://stackoverflow.com/a/7982811). Implementation will likely require some effort, especially to test all the changes.
- For Windows, if done this way, it will be possible to also specify the transparency of each native control individually.
- Possible point of insertion into the View engine is the `color` facet of the `window` face (aka `backdrop`), and the `color` facet of other native faces, using it's alpha channel value to control transparency.

Some simple Windows test script can be found here: https://gitlab.com/hiiamboris/red-alpha/tree/master


Comments:
--------------------------------------------------------------------------------

On 2022-05-03T15:38:00Z, hiiamboris, commented:
<https://github.com/red/REP/issues/40#issuecomment-1116243131>

    One application for this is having non-rectangular popup hints. E.g. hints with an angle pointing at the widget they refer to. For example in a toolbar with lots of icons it would point to a particular icon it is describing. This would add clarity to such hint.
    
    Also UI-introductory popups that describe what each UI element is used for, that you may see on the first run of some programs, *must* point to that UI element. There also may be a bunch of such popups shown at once. Of course this later case does not strictly require a top level window, so doable right now with some effort (but there will be a problem of portability: https://github.com/red/red/issues/4743).
    
    Another area is ring menus, and popups with rounded/beveled corners.

