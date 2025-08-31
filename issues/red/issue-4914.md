
#4914: Crash on MAP whose last key has been already used
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4914>

**Describe the bug**

Red crashes if you create a `MAP` whose end element is a key already assigned:

**To reproduce**

As exposed here:
:point_up: [Gitter/Bug](https://gitter.im/red/bugs?at=60c9295fbed13a2dba86d5a7)

`a: #(a: 22 b: 33 c: x: a)`

More examples and explanation from @toomasv 

:point_up: [Toomas gitter Message](https://gitter.im/red/bugs?at=60c96d6656df183c2318e38f)

**Platform version**

```
Red 0.6.4 for Windows built 26-May-2021/15:12:00+02:00  commit #9b645b9
```



