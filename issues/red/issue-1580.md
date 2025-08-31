
#1580: `title` ignored in `view/options`
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1580>

This works:

```
view [title "Hello, World!" text "Χαῖρε, κόσμε!" font-size 24]
```

This doesn't:

```
view/options [text "Χαῖρε, κόσμε!" font-size 24] [title: "Hello, World!"]
```

Instead of `Hello, World!`, the title is `Red: untitled`.



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T05:09:34Z, dockimbel, commented:
<https://github.com/red/red/issues/1580#issuecomment-179014879>

    `options` gives you direct access to window's facets, so there is no `title` property there, use `text` instead. Maybe `/facets` would be a more appropriate refinement name?.

--------------------------------------------------------------------------------

On 2016-02-03T07:09:40Z, WiseGenius, commented:
<https://github.com/red/red/issues/1580#issuecomment-179056083>

    Oops!
    I've used it properly in the past, and it's hard to tell whether I forgot the facet was called `text` or if I forgot it was setting facets. So I'm not sure whether or not changing the name would have prevented my mistake.
    `/facets` does seem like a better name, though, if that's all it is.

