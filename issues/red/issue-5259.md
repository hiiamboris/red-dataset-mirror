
#5259: When comparing `map!`s with `none!` values, they are equal to anything
================================================================================
Issue is closed, was reported by loziniak and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5259>

```
>> b: #(x: "abc")
== #(
    x: "abc"
)
>> a: #(x: "def")
== #(
    x: "def"
)
>> a = b
== false
>> a: #(x: #[none])
== #(
    x: none
)
>> a = b
== true
```
discussion: https://gitter.im/red/help?at=63a63fa240557a3d5c41be5f

> platform: *Arch Linux*, `system/build/date`: 19-Dec-2022


