
#3726: [View] Some fonts are not rendered by `rich-text` and `base`
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/3726>

**Describe the bug**

![](https://i.gyazo.com/3523da2187d0245b8b20faea8acde613.png)
Line 5: `base` ignores "Terminal" font
Lines 7-8: `rich-text` renders default font instead of specified "Courier" and "Terminal"
Overall, all .fon and .otf fonts are ignored by `base` and replaced by `rich-text`.
See also related https://github.com/red/red/issues/3727

**To reproduce**

```
s: "123456789-123456789-123456789-"
f1: make font! [name: "Courier" size: 14]
f2: make font! [name: "Terminal" size: 14]
f3: make font! [name: "Comic Sans MS" size: 14]
view compose/deep [
	backdrop purple below
	box purple 300x20 draw [font f1 text 0x0 (s)]
	box purple 300x20 draw [font f2 text 0x0 (s)]
	box purple 300x20 draw [font f3 text 0x0 (s)]
	box purple 300x20 font f1 s
	box purple 300x20 font f2 s
	box purple 300x20 font f3 s
	rich-text 300x20 purple font f1 s
	rich-text 300x20 purple font f2 s
	rich-text 300x20 purple font f3 s
	field font f1 s
	field font f2 s
	field font f3 s
]
```

**Expected behavior**

I'm not sure if it's the limitation of underlying engines and if it's worth fixing, but it would be nice to support all the fonts available in the OS.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
W7
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-14T12:05:45Z, qtxie, commented:
<https://github.com/red/red/issues/3726#issuecomment-453983170>

    This is what I got:
    ![default](https://user-images.githubusercontent.com/1673525/51111412-f937e000-1836-11e9-8f46-f5415cf01d34.png)
    
    Use "Courier New" instead of "Courier". "Terminal" is a bitmap font, GDI should be support it. DirectWrite does not support old bitmap font. So base face should support it, rich-text does not.

--------------------------------------------------------------------------------

On 2019-01-14T13:53:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/3726#issuecomment-454011544>

    @qtxie is that on W10? It's even worse.. Looks like for newer GDI doesn't support "Courier" and also `size-text` breaks on it...

--------------------------------------------------------------------------------

On 2019-01-15T01:35:03Z, qtxie, commented:
<https://github.com/red/red/issues/3726#issuecomment-454234695>

    @hiiamboris No. I'm on W7 64bit.

--------------------------------------------------------------------------------

On 2019-01-15T03:26:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/3726#issuecomment-454254603>

    @qtxie Interesting. Some updates are to blame then..
    Anyway, I have found an [official MS statement](https://webcache.googleusercontent.com/search?q=cache:aKGCS3Vc5mcJ:https://blogs.msdn.microsoft.com/text/2009/04/13/directwrite-questions-and-answers/+&cd=1&hl=en&ct=clnk&gl=ru&client=ubuntu):
    > DirectWrite supports font files conformant to the OpenType specification version 1.5, which can be accessed here: http://www.microsoft.com/typography/otspec/default.htm. This support **includes OpenType** fonts with both TrueType and CFF outlines, and TrueType fonts with embedded bitmaps. Simply speaking, if your font has a TTF, OTF or TTC extension, DirectWrite should support it well.
    
    > DirectWrite **does not support bitmap** or vector .FON font files, and DirectWrite does not support Adobe Type 1 .PFM/.PFB font files.
    
    So regarding bitmap fonts, ideally I'd like GDI+ to detect unsupported fonts and draw in a fallback font, like D2D. It's hard to tell if it can or cannot be done, so I'm not insisting.
    
    OpenType fonts however (see screenshot in https://github.com/red/red/issues/3727) should be supported by both GDI+ and D2D. Maybe some flags are conflicting with it? Why does it not work with OpenType?

--------------------------------------------------------------------------------

On 2019-01-15T04:56:25Z, qtxie, commented:
<https://github.com/red/red/issues/3726#issuecomment-454267284>

    > OpenType fonts however (see screenshot in #3727) should be supported by both GDI+ and D2D. Maybe some flags are conflicting with it? Why does it not work with OpenType?
    
     I think the issue here is the OS API did not find a corresponding font file using the name. We only specify font name, not a OpenType fonts file directly. We don't know how does the OS API search the fonts by the name.

