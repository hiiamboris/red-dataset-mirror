
#939: path! doesn't select char! from block!.
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/939>

In case the fix was the same, I almost appended to #938 that the same goes for `char!`.

```
red>> b: [#"x" #"y"]
== [#"x" #"y"]
red>> select b #"x"
== #"y"
red>> b/(#"x")
*** Error: invalid value in path!
```



