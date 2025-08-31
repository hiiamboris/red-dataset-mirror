
#4251: GTK: set-focus does not work
================================================================================
Issue is closed, was reported by loziniak and has 18 comment(s).
[status.tested] [GUI.GTK]
<https://github.com/red/red/issues/4251>

After running this script, messages should be printed to the console, when clicking on a button and then pressing keys on a keyboard:
```
view [
    button "give focus to blue rectangle" [set-focus bb]
    bb: base blue on-key-down [print "Message: I'm blue!"]
]
```
It works fine in Windows (Wine), but fails in Linux.

Platform: `Red 0.6.4 for Linux built 10-Jan-2020/15:13:57+01:00`


Comments:
--------------------------------------------------------------------------------

On 2020-01-30T02:16:22Z, bitbegin, commented:
<https://github.com/red/red/issues/4251#issuecomment-580053109>

    @loziniak can't set-focus on `base` widget, because macOS/gtk3 not support set-focus on some widgets

--------------------------------------------------------------------------------

On 2020-01-30T02:17:46Z, bitbegin, commented:
<https://github.com/red/red/issues/4251#issuecomment-580053410>

    https://github.com/red/red/issues/2820

--------------------------------------------------------------------------------

On 2020-01-30T09:04:46Z, loziniak, commented:
<https://github.com/red/red/issues/4251#issuecomment-580152686>

    Perhaps Windows implementation should be updated then to keep constant behavior?

--------------------------------------------------------------------------------

On 2020-01-30T09:52:01Z, 9214, commented:
<https://github.com/red/red/issues/4251#issuecomment-580173902>

    @bitbegin both W10 and macOS 10.14 react to keystrokes as expected.
    
    > updated
    
    @loziniak "degraded" rather, in the light of the above.

--------------------------------------------------------------------------------

On 2020-01-30T10:14:38Z, loziniak, commented:
<https://github.com/red/red/issues/4251#issuecomment-580182719>

    It could be a better word, indeed. Thanks for testing on macOS, I was just depending on what bitbegin wrote.

--------------------------------------------------------------------------------

On 2020-05-13T07:20:17Z, qtxie, commented:
<https://github.com/red/red/issues/4251#issuecomment-627798071>

    @bitbegin We should be able to `set-focus` on base face. We have fully control on `base` face. 
    
    A widget has `focus` just means it's capturing the keyboard input. Some OS standard widgets don't accept keyboard input, that's why we cannot set focus on them. That's fine as set focus on those widgets is useless.

--------------------------------------------------------------------------------

On 2020-10-01T14:04:42Z, loziniak, commented:
<https://github.com/red/red/issues/4251#issuecomment-702159135>

    Giving focus to `base` or `panel` would allow them to receive keyboard events. It'd be nice to have this, for example when writing own custom widgets.

--------------------------------------------------------------------------------

On 2021-06-24T09:33:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/4251#issuecomment-867490377>

    I raise the priority for this issue is fundamental to Linux keyboard support in https://gitlab.com/hiiamboris/red-spaces project

--------------------------------------------------------------------------------

On 2021-06-27T19:17:19Z, gltewalt, commented:
<https://github.com/red/red/issues/4251#issuecomment-869212001>

    I believe that  #4917 fixes this issue for `base`

