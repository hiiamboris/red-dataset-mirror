
#3055: WISH: DRAW supports PERCENT! for SCALE
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[GUI] [type.task.wish]
<https://github.com/red/red/issues/3055>

Currently [documentation](https://doc.red-lang.org/en/draw.html#_scale) states that `scale` supports `number!` values, but it (and [`transform`](https://doc.red-lang.org/en/draw.html#_transform) with `<scale-x>` and `<scale-y>` args) will choke up on `percent!`, however:
```Red
>> number!
== make typeset! [integer! float! percent!]
```


