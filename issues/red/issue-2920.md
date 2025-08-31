
#2920: [object][regression] Object's fields are not rebinded when new object is created
================================================================================
Issue is closed, was reported by maximvl and has 6 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2920>

It seems that `field` in `b` is not rebinded and keeps poiting to `state` in `a`:

```
>> a: object [ state: [] field: [state] test: func [] [probe reduce field] ]
== make object! [
    state: []
    field: [state]
    test: func [][probe reduce field]
]
>> a/test
[[]]
== [[]]
>> append a/state 5
== [5]
>> a/test
[[5]]
== [[5]]
>> b: make a []
== make object! [
    state: [5]
    field: [state]
    test: func [][probe reduce field]
]
>> b/test
[[5]]
== [[5]]
>> b/state
== [5]
>> append b/state 10
== [5 10]
>> b/test
[[5]]
== [[5]]
>> b/state
== [5 10]
>> 
```

Expected: `b/test` prints [[5 10]]


Comments:
--------------------------------------------------------------------------------

On 2017-07-24T06:19:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2920#issuecomment-317329457>

    A simplified demonstration of the issue:
    ```
    >> a: context [e: 1 d: [e]] b: make a [e: 2]
    == make object! [
        e: 2
        d: [e]
    ]
    >> do a/d
    == 1
    >> do b/d
    == 1
    ```

--------------------------------------------------------------------------------

On 2017-07-24T23:18:57Z, rgchris, commented:
<https://github.com/red/red/issues/2920#issuecomment-317582921>

    Not sure if this is need be a new issue—thought I'd comment here first—but should this hold for MAP! as well?
    
    ```rebol
    >> a: context [e: 1 d: make map! [c [e]]] b: make a [e: 2]
    == make object! [
        e: 2
        d: #(
            c: [e]
        )
    ]
    >> do a/d/c
    == 1
    >> do b/d/c
    == 1
    ```
    
    I notice the literal form doesn't work at all:
    
    ```rebol
    >> a: context [e: 1 d: #(c [e])] b: make a [e: 2]
    == make object! [
        e: 2
        d: #(
            c: [e]
        )
    ]
    >> do a/d/c
    *** Script Error: e has no value
    *** Where: do
    *** Stack: 
    ```

--------------------------------------------------------------------------------

On 2017-07-25T04:22:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2920#issuecomment-317625120>

    `bind/copy` is applied on series only when cloning an object, we consider (like in Rebol) that this operation is too costly to be applied by default on maps and other objects referred to by an object to be cloned.
    
    For the maps behavior you observed:
    * in the first case, there is no map inside the body block at the time the object is constructed, only words, set-words, integers and blocks. So you can consider that as a side-effect of the way the map is constructed there.
    * in the second case, a map is present inside the body block at the time the object is constructed, and currently the binding process does not rebind the map's content, as that would require a `bind/copy` operation. Same rule is applied if you substitute the map with an object (Rebol acts in the same way).
    
    It is actually a useful feature, if you want the map's values to be bound to the wrapping object's context, use the `make` constructor, otherwise use the literal syntax.

