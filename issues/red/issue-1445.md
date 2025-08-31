
#1445: VID style keywords and style options like font [... ] do not integrate
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1445>

In VID, one can specify certain font properties by keywords,e.g.  `text bold`. This is equivalent to `font [style: 'bold]`. However, if one specifies  `text bold "some text" font [color: red]` the `bold` is lost.



