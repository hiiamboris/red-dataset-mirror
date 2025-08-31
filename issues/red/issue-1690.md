
#1690: Bad error returned
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1690>

``` rebol
  a: [1 2] if i: find a 2 [a/i: 5]
*** Script error: if does not allow none for its cond argument
*** Where: if
  a/i: 5
*** Script error: do does not allow none for its value argument
*** Where: do
```



