
#5134: [Draw] PUSH does not restore FONT
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5134>

**Describe the bug**

![](https://i.gyazo.com/2160f6ef2473e2b00b769d0a36c54c5d.png)
As a result, in Spaces everywhere a font is used, it has to be set explicitly, otherwise there's a risk that it was overridden somewhere.

**To reproduce**
```
? (draw 30x50 compose/deep [text 0x0 "ABC" push [font (make font! [size: 20])] text 0x15 "ABC"])
```

**Expected behavior**

Font must be restored

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
Red 0.6.4 for Linux built 15-Mar-2022/17:14:51+03:00  commit #af98e79
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-13T10:56:15Z, meijeru, commented:
<https://github.com/red/red/issues/5134#issuecomment-1125927458>

    This is the first time I see `?` used with an argument other than a word. The docstring says "Displays information about functions, values, objects, and datatypes." What it does here is evaluate/execute the parenthesized expression. Is that usage well-known? Is it encouraged? Will it remain possible forever?

--------------------------------------------------------------------------------

On 2022-05-13T11:15:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5134#issuecomment-1125944913>

    `?` takes lit-arg, which is evaluated unless it's a word or a path.

--------------------------------------------------------------------------------

On 2022-05-13T12:20:01Z, meijeru, commented:
<https://github.com/red/red/issues/5134#issuecomment-1125997170>

    Useful! Should the docstring be expanded accordingly?

--------------------------------------------------------------------------------

On 2022-05-13T12:59:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5134#issuecomment-1126030039>

    Lit-arg evaluation is not specific to `?`, it should better be documented in some kind of beginners manual.

--------------------------------------------------------------------------------

On 2022-05-13T18:45:52Z, greggirwin, commented:
<https://github.com/red/red/issues/5134#issuecomment-1126348004>

    @meijeru I think the doc string is OK as it since, because parens fall under "values". `Help` should support all types forever.  The exact behavior for each type, as `help` evaluates them (or not), _is_ open to change, because the output is only for humans. e.g., if we eventually decide that showing info for parens to match blocks, that could happen.

--------------------------------------------------------------------------------

On 2022-05-13T18:47:11Z, greggirwin, commented:
<https://github.com/red/red/issues/5134#issuecomment-1126348904>

    `Help` was changed some time ago to use an internal helper called `help-string`, which lets you get the content of what help displays for use in tools, logging, etc.

