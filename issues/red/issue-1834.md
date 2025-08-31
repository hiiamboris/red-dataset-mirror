
#1834: extend/case extends the map! even if the word already exists
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1834>

Here is the issue

```
red>> extend/case extend/case make map! [a 1] [a 2] [a 3]
== #(
    a: 1
    a: 2
    a: 3
)
```



