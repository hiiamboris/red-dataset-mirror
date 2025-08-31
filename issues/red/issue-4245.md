
#4245: [View] CHECK treats NONE as truthy
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
<https://github.com/red/red/issues/4245>

**Describe the bug**

Setting `data` facet of `check` face to `none` switches it to a toggled state.

**To reproduce**

```red
view [c: check data none button [c/data: none]]
```

Note that pre-setting it with `none` has no effect, facet needs to be set after low-level instantiation of the face. This issue affects all View backends.

**Expected behavior**

In fact, `none` is supposed to indicate the 3rd state for a tri-state checkbox. This functionality is available on all platforms (see [here](https://github.com/red/red/issues/4244#issuecomment-575745396)), but currently is not properly implemented.

**Platform version**

The latest release, all platforms.



Comments:
--------------------------------------------------------------------------------

On 2020-01-17T16:58:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4245#issuecomment-575709470>

    hmm... is there a principal difference between this and #4244 I'm missing?

