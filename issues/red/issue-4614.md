
#4614: GUI Console stays on top when unfocused
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[GUI.Win7]
<https://github.com/red/red/issues/4614>

**Describe the bug**

This is a very old issue, seemingly affecting W7 only. Maybe not every W7, but for me is very annoying.

What happens is that when GUI console window was focused, and I click outside of it, or Alt-Tab to another program, the console has a chance (~10-20%) to stay on top of the z-order, obstructing the window I'm working with. Then I have to click the console again and my window again to make the console go down properly.

**To reproduce**

Though the bug stayed for years, I haven't found a way to reliably reproduce it. It always happens when least expected and cannot be repeated.

I have experimentally found how to fix it though. If I comment out the following 4 lines, the bug never happens:
https://github.com/red/red/blob/48eb6f749d731806fe7322a7bf2af160de718ecc/environment/console/GUI/gui-console.red#L196-L199

I haven't identified which particular of these lines is the cause, as the testing takes weeks to be able to tell with certainty.

**Expected behavior**

When deactivated, console should not obstruct the other windows.

**Platform version (please complete the following information)**

All versions known to me, on W7.



Comments:
--------------------------------------------------------------------------------

On 2020-10-20T17:24:13Z, greggirwin, commented:
<https://github.com/red/red/issues/4614#issuecomment-713018636>

    I haven't seen this on Win10, and while Win7 is a low priority for this kind of thing, it makes sense that we should understand what's going on, as it may have other effects. e.g. main event loop and caret allocation interactions.

--------------------------------------------------------------------------------

On 2022-09-07T02:54:08Z, qtxie, commented:
<https://github.com/red/red/issues/4614#issuecomment-1238849369>

    The `caret` face is a layered window. I guess it's related to the [layered window](https://docs.microsoft.com/en-us/windows/win32/winmsg/window-features#layered-windows) issue on Win7. It cannot be used as a child window which mess up the z-order of windows. 

--------------------------------------------------------------------------------

On 2022-09-07T07:11:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4614#issuecomment-1238997477>

    Why a separate window for caret?

--------------------------------------------------------------------------------

On 2022-09-07T13:41:00Z, qtxie, commented:
<https://github.com/red/red/issues/4614#issuecomment-1239406632>

    It's a child window on win8+ platform.

--------------------------------------------------------------------------------

On 2022-09-07T13:52:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/4614#issuecomment-1239421332>

    But why? It's just one `box` command in draw.

--------------------------------------------------------------------------------

On 2022-09-07T14:03:13Z, qtxie, commented:
<https://github.com/red/red/issues/4614#issuecomment-1239435226>

    I don't want to redraw everything each time the caret blinking.

