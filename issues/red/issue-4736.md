
#4736: Always on TOP
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/4736>

I kindly request to add an "Always on TOP" option to Red GUI system.



Comments:
--------------------------------------------------------------------------------

On 2020-11-25T10:51:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4736#issuecomment-733630458>

    This should go into red/REP

--------------------------------------------------------------------------------

On 2020-11-25T18:59:20Z, greggirwin, commented:
<https://github.com/red/red/issues/4736#issuecomment-733894227>

    I think it's OK here as a simple wish ticket. No real discussion or impact. Just a decision to do or not.

--------------------------------------------------------------------------------

On 2020-11-26T14:09:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4736#issuecomment-734318883>

    There are different cases for "always on top" windows (I guess it's about windows, I have to guess given that the wish itself is described in only 3 words...). One is setting a View window to be "always on top" among the windows displayed from a given Red session. Another is setting a View window to be "always on top" across all the application currently running on the desktop. In each case, the way to support the feature would be different.

--------------------------------------------------------------------------------

On 2020-11-26T19:08:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4736#issuecomment-734446920>

    This is for the HWND_TOPMOST flag on Windows. I don't know the implementation on other platforms. Just a simple flag option for that value.

