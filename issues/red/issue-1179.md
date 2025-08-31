
#1179: Accessing elements of a series with a negative path value is inconsistent
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1179>

Accessing a block! or a vector! with a path value of 80000000h returns the first element of the series!. Using the same path with a string! returns none,

```
red>> b: [1 2 3 4]
== [1 2 3 4]
red>> v: make vector! b
== make vector! [1 2 3 4]
red>> s: "1234"
== "1234"
red>> b/-2147483648
== 1
red>> v/-2147483648
== 1
red>> s/-2147483648
== none
```



