
#3861: Height of text face not adjusting to wrapped text.
================================================================================
Issue is open, was reported by fergus4 and has 28 comment(s).
[GUI]
<https://github.com/red/red/issues/3861>

When text face induces wrap due to length exceeding text face width, height is not adjusted to accommodate the wrapped text below and text is cut off.

Example:
```
view [
	size 100x300
	text 100 "sdsad sadsad  fghgfh gerr nghn fsdfsd fghfgh sfsdf"
	return
	text 100x100 "sdsad sadsad  fghgfh gerr nghn fsdfsd fghfgh sfsdf"
]
```

In rebol text face height will adjust to accommodate all the wrapped text.

Windows 10
All others not tested
```
Red 0.6.4 for Windows built 13-Apr-2019/2:27:16-04:00 commit #fb18d4e
```



Comments:
--------------------------------------------------------------------------------

On 2019-07-29T07:39:31Z, bitbegin, commented:
<https://github.com/red/red/issues/3861#issuecomment-515881341>

    some limits with "GdipMeasureString"
    
    Duplicate of #3760 

--------------------------------------------------------------------------------

On 2019-07-30T06:35:01Z, bitbegin, commented:
<https://github.com/red/red/issues/3861#issuecomment-516284133>

    Duplicate of #2757

--------------------------------------------------------------------------------

On 2019-07-30T07:12:30Z, bitbegin, commented:
<https://github.com/red/red/issues/3861#issuecomment-516295103>

    temp solution https://github.com/bitbegin/red/commit/13d0409610364e07d17429f5778c9fe13fe18582

--------------------------------------------------------------------------------

On 2020-02-25T20:15:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/3861#issuecomment-591047787>

    1) mentioned issues are not duplicates as they contain explicit lines, while this issue is about word wrapped text
    2) I don't think `text` face should be wrapped without the `wrap` flag, while it is - and I do consider this a bug: `view [text 100x100 "sdsad sadsad  fghgfh gerr nghn fsdfsd fghfgh sfsdf"]`:
    ![](https://i.gyazo.com/af632050ee72542d1ed081de08ed9a1f.png)
    3) GdipMeasureString has nothing to do with this issue. The issue is in `calc-size` calling `size-text` on a face that is not yet created and which handle is zero. `get-text-size` replaces zero with the handle of desktop window and ` uses width & height of desktop window: https://github.com/red/red/blob/3c68ef12a5ff0a09624359543c78e3ac25c23b53/modules/view/backends/windows/gui.reds#L298-L300 https://github.com/red/red/blob/3c68ef12a5ff0a09624359543c78e3ac25c23b53/modules/view/backends/windows/gui.reds#L306
    
    `size-text` is an unbelievable mess: it calls `gui/get-text-size`, which calls `base/render-text` (what base has to do with other faces text size??), which in turn calls `base/update-base-text`, which calls `GdipMeasureString`. Root problem is the complexity of this twisted chain of calls as it cries for refactoring ;)
    
    But a more immediate solution might be in passing planned face dimensions down the rabbit hole into `render-text` (which currently uses GetClientRect to obtain these).

--------------------------------------------------------------------------------

On 2020-07-09T21:44:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/3861#issuecomment-656366087>

    See also https://github.com/red/red/issues/4557

--------------------------------------------------------------------------------

On 2022-09-25T01:56:44Z, qtxie, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257099383>

    > size-text is an unbelievable mess: it calls gui/get-text-size, which calls base/render-text (what base has to do with other faces text size??), which in turn calls base/update-base-text, which calls GdipMeasureString.
    
    That's @hiiamboris who wrote the code... 
    https://github.com/red/red/commit/0f549f95cc27ffaf779faabf95e94fcffc7b3eb3#diff-f2e387060e079bd2b85d2637577a5538c9403cd7b7ad089d44461958938bf638R290

--------------------------------------------------------------------------------

On 2022-09-25T08:31:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257147008>

    Don't give me too much credit, I only replaced GDI measurement with GDI+ one.

--------------------------------------------------------------------------------

On 2022-09-25T09:38:49Z, qtxie, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257156772>

    Root problem is that we mix GDI, GDI+ and D2D together. The initial version only use GDI and just one get-text-size call, no this twisted chain of calls. I think now we can get rid of GDI+. GDI is still needed as we use native control.

--------------------------------------------------------------------------------

On 2022-09-25T09:44:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257157432>

    What View/Draw features would we loose if we drop GDI+?

--------------------------------------------------------------------------------

On 2022-09-25T09:46:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257157625>

    GDI has no wrapping for it's text label at all IIRC.

--------------------------------------------------------------------------------

On 2022-09-25T21:57:48Z, qtxie, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257287722>

    > What View/Draw features would we loose if we drop GDI+?
    
    Nothing as we use D2D now.
    
    > GDI has no wrapping for it's text label at all IIRC.
    
    Yes. That's the limitation of it. Working around it results in complex code. The native controls use GDI to draw the text. If we use GDI+ or D2D APIs to measure it, we'll get slightly different result. Which will cause other issues.

--------------------------------------------------------------------------------

On 2022-09-25T22:22:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257291581>

    I mean the reason we can write `base wrap` or `text wrap` in VID is because we're using GDI+ for their text. Or we could use D2D, but then @qtxie says it's heavy.

--------------------------------------------------------------------------------

On 2022-09-25T22:34:20Z, qtxie, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257293586>

    > I mean the reason we can write `base wrap` or `text wrap` in VID is because we're using GDI+ for their text. Or we could use D2D, but then @qtxie says it's heavy.
    
    Use D2D for base face, yes, we already use it. I always has no problem with heavy solution. But I'm sure someone will do some benchmarks and complain about it later. For text face, see my note above. `The native controls use GDI to draw the text. If we use GDI+ or D2D APIs to measure it, we'll get slightly different result. Which will cause other issues.`  We'll open a worm box by working around it.

--------------------------------------------------------------------------------

On 2022-09-26T07:27:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/3861#issuecomment-1257595128>

    Are you using D2D for `text` face too then? It can't be GDI, since it supports wrapping.

