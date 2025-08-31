
#1222: selecting string! key from object!
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1222>

Is it too early to expect this to error instead of crash?:

```
red>> o: make object! [a: 1 b: 2]
== make object! [
    a: 1
    b: 2
]
red>> o/("c")

*** Runtime Error 1: access violation
*** at: 0041D777h
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-08T04:52:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1222#issuecomment-109861507>

    No, not too early. An error should be reported on invalid values in object accessing paths.

