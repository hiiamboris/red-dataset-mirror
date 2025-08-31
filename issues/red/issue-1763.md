
#1763: Pixel gunk and strange highlight when entering/leaving window icon in Windows 10
================================================================================
Issue is closed, was reported by asampal and has 8 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1763>

When creating a window with something like `view [blah]` there is a dark pixel around the middle left edge of the window icon. Additionally, when entering or leaving the icon bounds, a translucent highlight appears momentarily around the icon area and sometimes exiting the icon area leaves a dark pixel in the bottom right of the icon. See attached animation.

![red-icon-hover](https://cloud.githubusercontent.com/assets/281639/14165205/4b775b98-f6d4-11e5-8590-64e0e7878a85.gif)

This happens with Red version 10471c731a91e8c7c8ad094388682f4a2173f6d9.



Comments:
--------------------------------------------------------------------------------

On 2016-03-31T05:10:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1763#issuecomment-203755145>

    @qtxie Please have a look at this one.

--------------------------------------------------------------------------------

On 2016-04-01T07:06:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1763#issuecomment-204278277>

    It's just the normal windows gadgets (minimize button) which are painted behind the logo icon. This is just Windows trying to cope with small window's width (and not doing a good job at it). You can remove those gadgets if needed: `view/flags [button "hi"] [no-min no-max]` (all windows flags are listed [here](https://github.com/red/red/wiki/Red-View-Graphic-System#window)).

--------------------------------------------------------------------------------

On 2016-04-01T16:49:46Z, asampal, commented:
<https://github.com/red/red/issues/1763#issuecomment-204467868>

    @dockimbel , IMO if there is window chrome to be displayed, the minimum size should account for this and not allow for such a small size (check out the behaviour of an explorer window as it's shrunk). Of course you can remove the chrome with the flags, but  really, that is not the same type of window anymore.
    ![min-size-window](https://cloud.githubusercontent.com/assets/281639/14213861/29b05228-f808-11e5-8beb-1d6ef05257aa.gif)

--------------------------------------------------------------------------------

On 2016-04-01T17:49:18Z, asampal, commented:
<https://github.com/red/red/issues/1763#issuecomment-204487853>

    I was thinking that proper handling here at least for the latest versions of Windows, would need to take into consideration hDPI screens (hard pixel sizes aren't enough), with reference to what I said in the gitter chat re. LiveCode (and others) not dealing with this properly.

