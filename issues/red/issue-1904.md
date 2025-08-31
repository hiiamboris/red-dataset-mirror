
#1904: Fix for #1797 (no vertical scroll-bar on area) not complete
================================================================================
Issue is open, was reported by meijeru and has 18 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/1904>

I still see no vertical scrollbar when I set the `/text` field of the `area` face (with `wrap`) to a sufficiently long string of characters. It does work when I type characters into the field by hand.



Comments:
--------------------------------------------------------------------------------

On 2016-05-13T13:52:48Z, meijeru, commented:
<https://github.com/red/red/issues/1904#issuecomment-219048952>

    In addition, `wrap` does NOT work with left-to-right texts, but only with right-to-left texts!!

--------------------------------------------------------------------------------

On 2016-05-14T03:31:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1904#issuecomment-219198113>

    @meijeru Please provide a code example to reproduce it (even if it seems obvious, this will save our time and prevent misunderstandings).

--------------------------------------------------------------------------------

On 2016-05-14T03:35:25Z, dockimbel, commented:
<https://github.com/red/red/issues/1904#issuecomment-219198230>

    Testing with the following codes shows a vertical scrollbar appearing each time:
    
    ```
    view [area 200x100 wrap "aa^/bb^/cc^/dd^/^/^/^/^/"]
    
    view [f: area 200x100 wrap button "fill" [f/text: "aa^/bb^/cc^/dd^/^/^/^/^/"]]
    ```

--------------------------------------------------------------------------------

On 2016-05-14T12:49:55Z, meijeru, commented:
<https://github.com/red/red/issues/1904#issuecomment-219218685>

    I tried with f/text: "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN", i.e. a long string WITHOUT newlines. With `wrap` and implicit `left` this does NOT wrap, and does NOT give a vertical scrollbar. With `wrap right` this DOES wrap, i.e. puts some of the string on the next line(s), but still does NOT give a scrollbar. So, what is the expected behaviour?

--------------------------------------------------------------------------------

On 2016-05-14T13:00:24Z, meijeru, commented:
<https://github.com/red/red/issues/1904#issuecomment-219219177>

    Moreover, with `wrap right` the horizontal scrollbar (which is not needed) is initially shown, and not "greyed out" to show it is unresponsive, as should be, but it shows a draggable button which disappears as soon as one clicks on it, and only then it is greyed out.
    
    In Rebol2 the equivalent exercise DOES wrap both left and right, and omits the horizontal scrollbar altogether.

--------------------------------------------------------------------------------

On 2018-12-30T17:26:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/1904#issuecomment-450574960>

    R2 does no scrollbars for me (in fact even if I fill it with newlines):
    ```
    view layout [f: area 200x100 wrap button "fill" [f/text: "" loop 1000 [append f/text "N"] show f]]
    ```
    ![](https://i.gyazo.com/e9406710b6f6bd675deedd4e9c9f8f1e.png)
    
    Red's no wiser...
    ```
    view [f: area 200x100 wrap button "fill" [f/text: append/dup "" "N" 1000]]
    ```
    ![](https://i.gyazo.com/f88c4acb52af8053560fef03ec9095d8.png)
    
    Right/left no longer matters. No scrollbars in any case :)
    But it at least does the newline counting to show scrollbars now.

--------------------------------------------------------------------------------

On 2019-01-08T09:02:46Z, DideC, commented:
<https://github.com/red/red/issues/1904#issuecomment-452223725>

    Rebol 2 `area` never show scrollbars, whatever is the text.
    I did a special area style for this (but not with autodetect behaviour to only show scrolbars while needed).
    http://www.rebol.org/view-script.r?script=area-scroll-style.r

--------------------------------------------------------------------------------

On 2019-01-09T07:42:45Z, DideC, commented:
<https://github.com/red/red/issues/1904#issuecomment-452601329>

    Rebol 2 `area` never show scrollbars, whatever is the text.
    I did a special area style for this (but not with autodetect behaviour to only show scrolbars while needed).
    http://www.rebol.org/view-script.r?script=area-scroll-style.r

--------------------------------------------------------------------------------

On 2022-03-30T17:17:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/1904#issuecomment-1083409717>

    Seems vertical scrollbar ignores wrap flag and only shows if number of lines exceeds it's height.

