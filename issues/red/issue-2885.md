
#2885: Linux/macOS: 'enable bracketed pasting' escape sequence gets included in red output
================================================================================
Issue is closed, was reported by x8x and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2885>

Given script `%test.red` containing:
```
Red []
prin ""
```
Running this:
```
rebol --do "print mold system/options/args/1 q" -- `red test.red`
```
returns:
```
"^[[?2004h"
```
expected:
```
""
```
This is problematic when passing the result of a red script to other commands that do not interpret ANSI escapes.


Comments:
--------------------------------------------------------------------------------

On 2017-07-12T19:48:10Z, x8x, commented:
<https://github.com/red/red/issues/2885#issuecomment-314876937>

    If there is no better low level solutions, here is one:
    instead of emitting the "start bracketed mode" in the console init routine, emit it at the first call to function `ask`

--------------------------------------------------------------------------------

On 2017-07-13T08:21:39Z, qtxie, commented:
<https://github.com/red/red/issues/2885#issuecomment-315007472>

    I run this command, seems works fine now.
    ```
    rebol --do "print mold system/options/args q" -- `red test.red`
    ```

--------------------------------------------------------------------------------

On 2017-07-13T12:22:19Z, x8x, commented:
<https://github.com/red/red/issues/2885#issuecomment-315061686>

    Did you try in macOS or Linux? I get same result as before.

--------------------------------------------------------------------------------

On 2017-07-14T00:57:42Z, qtxie, commented:
<https://github.com/red/red/issues/2885#issuecomment-315240662>

    I tried in macOS. Will try in Linux today.

