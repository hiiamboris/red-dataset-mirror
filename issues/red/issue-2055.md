
#2055: read empty file shows warning
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2055>

Probably some debug switch leftover?

```
red>> write %file ""
red>> read %file
*** Warning: empty file
== ""
```



