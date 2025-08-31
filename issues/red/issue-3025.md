
#3025: menu on macOS 
================================================================================
Issue is closed, was reported by ralfwenske and has 12 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/3025>

menus on macOS only respond after switching to another app (window) and back.


Comments:
--------------------------------------------------------------------------------

On 2017-09-10T02:01:58Z, qtxie, commented:
<https://github.com/red/red/issues/3025#issuecomment-328314564>

    Do you use the latest version or 0.6.3 ?

--------------------------------------------------------------------------------

On 2017-09-10T03:53:19Z, ralfwenske, commented:
<https://github.com/red/red/issues/3025#issuecomment-328317964>

    qtixie,
    I just found out: 
    the above issue happens when I start the app on macOS from Visual Studio (F6 command).
    When I start from console the menu is immediately accessible (is working ok).
    (Starting on Win 10 via Visual Studio also is working as expected (ok).

--------------------------------------------------------------------------------

On 2017-09-10T04:29:08Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3025#issuecomment-328319099>

    @qtxie I see this behaviour on macOS using the latest master.

--------------------------------------------------------------------------------

On 2017-09-12T00:53:33Z, ralfwenske, commented:
<https://github.com/red/red/issues/3025#issuecomment-328699398>

    On macOS when I compile the app and start the app from console I also need to first activate another window before I can use the menus. 
    Yet when I start the code via REPL the menus are immediately functioning.
    REPL and compiled app on Win10 both work ok.

--------------------------------------------------------------------------------

On 2017-09-12T01:44:21Z, qtxie, commented:
<https://github.com/red/red/issues/3025#issuecomment-328706851>

    Thanks. I'll try to fix it.

--------------------------------------------------------------------------------

On 2019-08-04T06:19:43Z, ralfwenske, commented:
<https://github.com/red/red/issues/3025#issuecomment-517977410>

    Menus now working am macOS

