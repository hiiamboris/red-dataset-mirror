
#3194: WISH: expose more APIs to control area face.
================================================================================
Issue is closed, was reported by qtxie and has 6 comment(s).
[type.wish]
<https://github.com/red/red/issues/3194>

Provide a way to let user to have a fine control of the area. like:

- scroll-lineup
- scroll-linedown
- scroll-to-bottom
- scroll-to-top
- move-caret
- select-text
more......



Comments:
--------------------------------------------------------------------------------

On 2018-01-10T14:32:07Z, toomasv, commented:
<https://github.com/red/red/issues/3194#issuecomment-356619048>

    👍 

--------------------------------------------------------------------------------

On 2018-02-03T05:30:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3194#issuecomment-362781714>

    The `/selected` facet should be used to handle selection in a reflective way (read/write). It should be set to a `pair!` value holding the index of first and last selected characters, defining a selection range. When there is no selected text, the facet should be set to `none`. Such interface should be used for `field` widget too.
    
    For scrolling control, the new `scroller` face type should provide the right interface for fine control (work in progress).
    
    For caret, we need to find the facet that fits it the best, or provide separate conversion functions, if maintaining the realtime binding between the facet and the OS API is too expensive.

--------------------------------------------------------------------------------

On 2018-04-23T02:24:31Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3194#issuecomment-383436629>

    Moved to Red/REP repo issue [5](https://github.com/red/REP/issues/5).

