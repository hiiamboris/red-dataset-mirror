
#1968: Problem with char U+005E (^)
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1968>

I notice that `mold #"^(005E)"` and `mold #"^(001E)"` are both `{#"^^^^"}`, because the control characters are simply molded as `#"^@"` etc, using the Unicode points `U+0040` to `U+005F`, leading to this overlap. Rebol2 uses `{#"^^!"}` for molding `U+001E`. Rebol3 molds it simply as `{#"^^(1E)"}` but accepts `#"^!"` on input, like Rebol2.  



