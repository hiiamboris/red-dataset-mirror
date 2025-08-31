
#2757: [GUI] WISH: face for multiple-line text rendering
================================================================================
Issue is open, was reported by JenniferLee520 and has 12 comment(s).
[GUI] [type.task.wish]
<https://github.com/red/red/issues/2757>

'TEXT face can show multiple lines, but I have to put LF characters in the string. 
'AREA face can show multiple lines, but It's for inputting, not for static text rendering. 
`TEXT-LIST face can show multiple lines, but It's a list, not a paragraph.


Comments:
--------------------------------------------------------------------------------

On 2017-06-06T02:20:55Z, dockimbel, commented:
<https://github.com/red/red/issues/2757#issuecomment-306362863>

    @qtxie Isn't that covered by `text-box` in 0.6.4?

--------------------------------------------------------------------------------

On 2017-06-06T03:09:47Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2757#issuecomment-306369385>

    I wish there would be an option
    ```Red
    [ auto-break-lines?: true ]
    ```
    to support this feature.

--------------------------------------------------------------------------------

On 2017-06-06T03:13:11Z, greggirwin, commented:
<https://github.com/red/red/issues/2757#issuecomment-306369806>

    @JenniferLee520, it can sometimes help to raise ideas like this in a chat room, rather than as tickets. Then they can be fleshed out a bit, and save the team time in reviewing open tickets.

--------------------------------------------------------------------------------

On 2017-06-06T06:42:51Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2757#issuecomment-306396689>

    On macOS, 'Text face is multi-line automatically. 
    But on Windows, it's not.

--------------------------------------------------------------------------------

On 2017-06-09T09:40:45Z, qtxie, commented:
<https://github.com/red/red/issues/2757#issuecomment-307344788>

    Use `wrap` can make it work.
    ```
    view [text "a very very very very very long string" 100x200 wrap]
    ```

--------------------------------------------------------------------------------

On 2018-12-30T16:15:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/2757#issuecomment-450570711>

    https://github.com/red/red/pull/3683 partially fixes this (for Windows systems).
    What's left is to bring MacOS backend to support the same wrapping rules: "^/" should always start a new line, `sp` and `tab` - depending on the `wrap` flag of the `para` facet.

