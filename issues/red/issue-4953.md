
#4953: Cursor blink doesn't respect Windows setting
================================================================================
Issue is closed, was reported by mark-summerfield and has 16 comment(s).
[status.built] [type.wish]
<https://github.com/red/red/issues/4953>

When I tried red-64.exe on Win7-64 it compiled and then the GUI console came up but with a blinking cursor. In my windows settings I have set the cursor blink rate to 0 (zero) since I can't work with blinking cursors. Red ought to respect this setting or at least provide an option to stop blink or set the rate down to 0.

I know that the great majority of people like blinking cursors but for the minority of us they are awful. See [jurta/noblink](https://jurta.org/en/prog/noblink).


Comments:
--------------------------------------------------------------------------------

On 2021-09-03T12:57:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/4953#issuecomment-912518518>

    As a temporary workaround I suggest creating an init script:
    ```
    Red []
    gui-console-ctx/caret/actors/on-time: func [face event] [face/color: gui-console-ctx/caret-clr 'done]
    ```
    And passing it to the GUI console on startup: `red --catch <full-pathname-of-the-script>`
    
    P.S. you can also change it's size in this script, e.g. `gui-console-ctx/caret/size/x: 10`

--------------------------------------------------------------------------------

On 2021-09-03T17:15:31Z, greggirwin, commented:
<https://github.com/red/red/issues/4953#issuecomment-912688756>

    Certainly an edge case setting I didn't know about. Thanks for the report @mark-summerfield.

--------------------------------------------------------------------------------

On 2021-09-03T17:15:42Z, greggirwin, commented:
<https://github.com/red/red/issues/4953#issuecomment-912688856>

    And thanks for the workaround @hiiamboris.

--------------------------------------------------------------------------------

On 2021-09-03T19:19:43Z, mark-summerfield, commented:
<https://github.com/red/red/issues/4953#issuecomment-912757789>

    Thank you that works fine.
    
    I now have:
    `noblink.red` with the code you gave me above and `red.bat` containing:
    `c:\bin\red-064.exe --catch c:\bin\noblink.red %*`
    So now I can have another go experimenting with Red.
    
    I've left this open though because I think that red should read the Windows CursorBlinkRate at GUI startup and respect it automatically.
    
    BTW I'm finding [Red from Python](https://github.com/red/red/wiki/Coming-to-Red-from-Python) very helpful.

--------------------------------------------------------------------------------

On 2021-09-03T19:28:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4953#issuecomment-912762432>

    If you have any comments, or want to improve the Python primers, I'm sure @galenivanov will be glad for any support and feedback.

--------------------------------------------------------------------------------

On 2021-09-03T22:06:53Z, mark-summerfield, commented:
<https://github.com/red/red/issues/4953#issuecomment-912835330>

    I just ran `red-064.exe --help` which lists lots of options but _not_ `--catch`. Should I report this as a bug?

--------------------------------------------------------------------------------

On 2021-09-04T07:52:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4953#issuecomment-912929552>

    `red-064` is nearly 3 years old. Use the nightly builds before reporting anything.

--------------------------------------------------------------------------------

On 2021-09-04T18:19:22Z, mark-summerfield, commented:
<https://github.com/red/red/issues/4953#issuecomment-913017319>

    > `red-064` is nearly 3 years old. Use the nightly builds before reporting anything.
    
    I went to the download page and there is a big link to red-064 at the top, so naturally I used it.
    Anyway, I'll try the nightly now.

