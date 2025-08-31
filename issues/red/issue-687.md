
#687: red console: multiline input is run together
================================================================================
Issue is closed, was reported by IngoHohmann and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/687>

```
red>> a: [
[       a
[       b
[       c
[       ]
== [abc]
red>> first a
== abc
```



Comments:
--------------------------------------------------------------------------------

On 2014-02-19T12:15:58Z, dockimbel, commented:
<https://github.com/red/red/issues/687#issuecomment-35492212>

    Good catch, it seems to be a recent regression.

