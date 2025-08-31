
#1617: Red Gui Console did not start in Windows 2003 Server X64
================================================================================
Issue is closed, was reported by Josh1-rtd and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1617>

![redgui](https://cloud.githubusercontent.com/assets/17100026/12976820/baf47310-d0ec-11e5-9fa4-c8bf8c433993.png)



Comments:
--------------------------------------------------------------------------------

On 2016-02-11T13:10:32Z, WiseGenius, commented:
<https://github.com/red/red/issues/1617#issuecomment-182857587>

    Windows XP once had a [similar problem](https://gitter.im/red/red/gui-branch?at=563accc00800da954de6c306) with `SetGestureConfig` which was fixed.

--------------------------------------------------------------------------------

On 2016-02-15T15:15:42Z, dockimbel, commented:
<https://github.com/red/red/issues/1617#issuecomment-184249854>

    @RedJosh If your Windows flavor does not have gesture support, just compile with the `-t WindowsXP` target to avoid linking that API.
    
    In the above case, the console is auto-compiled by Red executable, so it needs to be adjusted for Windows 2003 Server.

--------------------------------------------------------------------------------

On 2016-02-15T15:22:03Z, dockimbel, commented:
<https://github.com/red/red/issues/1617#issuecomment-184251318>

    @RedJosh Could you please confirm that this fix works for you (using the latest Red  master build)?

--------------------------------------------------------------------------------

On 2016-02-15T17:45:37Z, Josh1-rtd, commented:
<https://github.com/red/red/issues/1617#issuecomment-184321701>

    @dockimbel The latest build (red-15feb16-230e521.exe) compiled Gui console successfully.
    There was an issue with the cursor initially. Cursor remained 2 characters to the left. 
    Same as #1618 
    The issue was solved by downloading and installing 'Consolas' font in windows.
    
    ![red](https://cloud.githubusercontent.com/assets/17100026/13056186/bf18e1c4-d439-11e5-84e2-d89b96ef2238.png)

--------------------------------------------------------------------------------

On 2016-02-16T05:17:42Z, dockimbel, commented:
<https://github.com/red/red/issues/1617#issuecomment-184525600>

    @RedJosh Great! 

