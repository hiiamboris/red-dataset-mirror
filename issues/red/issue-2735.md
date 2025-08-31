
#2735: [macOS VID] RIGHT, LEFT, CENTER, BOTTOM, TOP, MIDDLE keywords do not work
================================================================================
Issue is closed, was reported by JenniferLee520 and has 8 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/2735>

```Red
view [ text 80x80 yellow right bottom "OK" ]
```

The problem only happens in macOS.


Comments:
--------------------------------------------------------------------------------

On 2018-12-30T17:10:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/2735#issuecomment-450574073>

    As of Dec 30, 2018 MacOS and Windows builds are consistent:
    `view [ text 80x80 yellow right bottom "OK" ]` honors right/left but always displays text from the top (intended behavior or not?)
    `view [ base 80x80 yellow right bottom "OK" ]` honors vertical alignment as well.

--------------------------------------------------------------------------------

On 2019-01-04T01:18:10Z, qtxie, commented:
<https://github.com/red/red/issues/2735#issuecomment-451329569>

    @hiiamboris The `text` face does not support all the alignments, it's a limitation of the native control.

--------------------------------------------------------------------------------

On 2019-01-04T02:14:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/2735#issuecomment-451336687>

    Hmm. Theoretically we could still emulate that, but I believe it's not worth the trouble, as base already supports all that. Then as everything that was fixable was fixed, this issue can be closed?

--------------------------------------------------------------------------------

On 2019-01-05T01:41:44Z, greggirwin, commented:
<https://github.com/red/red/issues/2735#issuecomment-451616912>

    I'll close this, and ask @gltewalt to note the limitation in docs.

