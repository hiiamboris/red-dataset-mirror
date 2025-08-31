
#2999: WISH: provide compile time option to choose View backend
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/2999>

In order to build a Red console to test the GTK backend on macOS, it is necessary to modify `platform.red` to include the GTK3 backend instead of the macOS backend and other items.

Please could a compile-time option be provided to override the "platform default" backend?


Comments:
--------------------------------------------------------------------------------

On 2017-09-13T12:24:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2999#issuecomment-329151045>

    It's already there (added after 0.6.3 release): https://github.com/red/red/blob/master/system/config.r#L35

