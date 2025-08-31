
#5526: Why does the output of the pwd function not have a line break effect in the gui console?
================================================================================
Issue is closed, was reported by ScriptGo and has 4 comment(s).
<https://github.com/red/red/issues/5526>

![Screenshot_2024-07-13_25991](https://github.com/user-attachments/assets/21112563-349a-4554-a967-be2fccfbd455)



Comments:
--------------------------------------------------------------------------------

On 2024-07-13T07:49:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5526#issuecomment-2226811875>

    Good catch!

--------------------------------------------------------------------------------

On 2024-07-13T07:53:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5526#issuecomment-2226812761>

    @qtxie There's something odd with the CLI console output, it does not honor `prin` and adds an extra LF. Once that fixed, we can replace `prin` by `print` in `pwd`.

