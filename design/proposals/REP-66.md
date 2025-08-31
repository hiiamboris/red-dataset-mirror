
#66: WISH: `tight` VID keyword applicable to `panel` style
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/REP/issues/66>

So that `panel tight [...]` will be equivalent to `panel [origin 0x0 space 0x0 ...]`. It will have the same meaning as `view/tight` then.

But how will it play along with `group-box` style that has both `text` and `pane` facets?
In reality, it is most likely that the `pane` content of group-box will be much bigger than it's `text`, so applying `tight` to `text` only seems like a waste of a good word. I propose `group-box` will try to occupy minimum size requirement for both it's pane and text to fit, applying both `origin 0x0 space 0x0` and `size-text` of it's text, which one is bigger.


