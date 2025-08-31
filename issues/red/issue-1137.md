
#1137: Empty file! value wrongly compiled
================================================================================
Issue is closed, was reported by x8x and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1137>

For an empty file! `%""` compiler wrongly generate `% ""`
(notice the space between `%` and `""`)

See following example:

file %test.red :

``` rebol
Red []
a: func [f][append copy %"" f]
print mold body-of :a
```

compiled as:
`red -c test.red`

executed with:
`./test`

return:
`[append copy % "" f]`



Comments:
--------------------------------------------------------------------------------

On 2015-04-30T05:55:36Z, dockimbel, commented:
<https://github.com/red/red/issues/1137#issuecomment-97669886>

    File! implementation is not complete yet, it is a work in progress.

