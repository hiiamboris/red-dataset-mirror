
#4901: [GTK] Draw pen does not affect the `text` color
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[GUI] [GUI.GTK]
<https://github.com/red/red/issues/4901>

**Describe the bug**
```
r1: rtd-layout ["ABC"]
r1/color: blue        ;) doesn't affect anything
r2: rtd-layout ["ABC"]
r2/font: make font! [color: blue]
view [base cyan draw compose/deep [pen magenta fill-pen yellow text 10x10 "ABC" text 10x30 (r1) text 10x50 (r2)]]
```
Result:

|Windows|GTK|
|-|-|
|![](https://i.gyazo.com/f662efbaae88b487cae7f1be9ac5957a.png) | ![](https://i.gyazo.com/34725f34a2d7acbae1012037ceb49a4d.png) |

So:
1. Windows ignores font color, uses `pen` only
2. GTK ignores pen, uses `font/color` only, and also draws a white background for no reason

**Expected behavior**

GTK works as Windows backend

**Platform version**
```
Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9
Red 0.6.4 for Linux built 11-May-2021/6:20:25+03:00  commit #81d0416
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-11T08:42:32Z, qtxie, commented:
<https://github.com/red/red/issues/4901#issuecomment-1211705034>

    > Windows ignores font color, uses pen only
    
    I think it should use the font color as it's more specific.

--------------------------------------------------------------------------------

On 2022-08-11T09:15:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/4901#issuecomment-1211735992>

    That IMO would be bad (as bad as current rich-text design) because to change the color I would have to change the font object (which is shared for obvious reasons), plus mind all the on-change triggers it may incur.
    
    Although... if font/color is `none`, and Draw `pen` still applies, that works for me too.

--------------------------------------------------------------------------------

On 2022-08-11T10:08:09Z, qtxie, commented:
<https://github.com/red/red/issues/4901#issuecomment-1211784592>

    > because to change the color I would have to change the font object
    
    No, you don't have to. It just takes the priority when you set it.

--------------------------------------------------------------------------------

On 2022-08-11T10:23:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/4901#issuecomment-1211802185>

    Should rich-text's face/color set the background too then, when not `none`?

--------------------------------------------------------------------------------

On 2022-08-11T14:37:32Z, qtxie, commented:
<https://github.com/red/red/issues/4901#issuecomment-1212077761>

    If face/size is set, yes.

--------------------------------------------------------------------------------

On 2022-08-11T17:24:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4901#issuecomment-1212273919>

    If not set, then for the single line.

