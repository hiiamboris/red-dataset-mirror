
#2799: REJOIN keeps only TAG! content
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2799>

Unlike Rebol, in Red `rejoin` keeps only `tag!` content. This makes `tag!` usage very problematic.

Rebol:
```
>> rejoin ["" <div> "asd" </div>]
== "<div>asd</div>"
```

Red:
```
>> rejoin ["" <div> "asd" </div>]
== "divasd/div"
```


