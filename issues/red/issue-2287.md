
#2287: Two broken links in View documentation
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [type.documentation]
<https://github.com/red/red/issues/2287>

I refer to the [Gitbook page](https://doc.red-lang.org/gui/View.html) on View.
1. The internal link from the contents to `Event! datatype` is wrong: there is a `!` missing (or too many). 
2. The external link on Windows GESTUREINFO is wrong, the characters  `(v=vs.85` in the url should be suppressed.



Comments:
--------------------------------------------------------------------------------

On 2016-10-24T09:53:00Z, geekyi, commented:
<https://github.com/red/red/issues/2287#issuecomment-255697162>

    1. Maybe a limitation of [github](https://github.com/red/docs/blob/master/gui/View.md#event-datatype) itself? Or the tools used to publish markdown.
       After much searching, found an [issue](https://github.com/thlorenz/anchor-markdown-header/issues/12) where they had a similar problem. They just adapted to not use `!` 
    2. Probably a problem with asciidoctor, as [github](https://github.com/red/docs/blob/master/gui/View.md#event-datatype) renders it ok. Seems to be caused by the `)`. I guess your solution of removing  (the version identifier?) also works

--------------------------------------------------------------------------------

On 2016-10-24T14:01:09Z, meijeru, commented:
<https://github.com/red/red/issues/2287#issuecomment-255748754>

    Looks fine to me.

--------------------------------------------------------------------------------

On 2016-10-26T02:46:12Z, dockimbel, commented:
<https://github.com/red/red/issues/2287#issuecomment-256235546>

    The `event!` link issue cannot be fixed AFAICT (I tried many times). 
    
    @geekyi Your fix for the MSDN link is fine.

