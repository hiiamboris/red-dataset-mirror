
#2039: Maps created with copy inside objects are referenced when object used to create other objects
================================================================================
Issue is closed, was reported by Zamlox and has 4 comment(s).
<https://github.com/red/red/issues/2039>

```
red>> obj: object [a: copy #()]
== make object! [
    a: #(    )
]
red>> obj1: make obj []
== make object! [
    a: #(    )
]
red>> put obj1/a 'x 1
== 1
red>> obj1
== make object! [
    a: #(
        x: 1
    )
]
red>> obj
== make object! [
    a: #(
        x: 1
    )
]
```

`obj/a` and `obj1/a` references same map even their definition is `copy #()`

It works ok if map is replaced with block:

```
red>> obj: object [a: copy []]
== make object! [
    a: []
]
red>> obj1: make obj []
== make object! [
    a: []
]
red>> append obj1/a 1
== [1]
red>> obj1
== make object! [
    a: [1]
]
red>> obj
== make object! [
    a: []
]
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-17T15:09:01Z, dockimbel, commented:
<https://github.com/red/red/issues/2039#issuecomment-226795359>

    When you do `obj: object [a: copy []]`, the spec block is evaluated and the object is created. When you then do `obj1: make obj []`, you just create a clone of the prototype object, your `copy []` does not exist anymore.
    
    What happens is part of the creation rules for object: all referenced _series_ are copied (and not deep-copied). Map! or object! are not series, so they are shared by default on cloning objects. So, for such datatypes, if you want them to be copied instead of shared, you need to do it manually:
    
    ```
    obj: object [a: #()]
    obj1: make obj [a: copy a]
    put obj1/a 'x 1
    ?? obj1
    ?? obj
    ```

--------------------------------------------------------------------------------

On 2016-06-17T15:30:36Z, Zamlox, commented:
<https://github.com/red/red/issues/2039#issuecomment-226801324>

    Thanks for explanation.

