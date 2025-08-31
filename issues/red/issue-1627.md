
#1627: same? returns false when comparing none with #[none]
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/1627>

The same? function returns false when comparing none with #[none] or none

``` Red
red>> same? #[none] none
== false
red>> same? none none
== false
```



