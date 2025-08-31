
#3229: WISH: unsigned integers in VECTOR!
================================================================================
Issue is open, was reported by 9214 and has 6 comment(s).
[type.task.wish]
<https://github.com/red/red/issues/3229>

Currently `vector!` constructor represents only signed integers, cutting provided range in half:
```Red
>> 2 ** 8
== 256
>> make vector! [integer! 8 [256]]
== make vector! [integer! 8 [0]]
>> make vector! [integer! 8 [128]]
== make vector! [integer! 8 [-128]]
```
I think Red should also support signed/unsigned integers [as in R3](https://github.com/gchiu/rebol.net/blob/master/wikipedia/Vectors.wiki) and extend constructor to:
```
make vector! [sign type bits size]
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-17T09:21:20Z, dockimbel, commented:
<https://github.com/red/red/issues/3229#issuecomment-373906425>

    I am not sure how is that helpful if we don't have unsigned support in Red numeric types?

--------------------------------------------------------------------------------

On 2018-03-17T13:15:06Z, 9214, commented:
<https://github.com/red/red/issues/3229#issuecomment-373919267>

    @dockimbel true.

--------------------------------------------------------------------------------

On 2018-03-20T21:27:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3229#issuecomment-374762689>

    Many issues like this we can "fix with langauge", where we identify the common need for a feature like this, and show how to make it work, noting any limitations. Especially helpful when talking about the intersection of Red and Red/System and how things translate.

