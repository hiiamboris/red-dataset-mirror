
#5135: SELF is not reactive
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/5135>

**Describe the bug**

Another weird quirk of `self` - what seems to be the same object works differently when accessed:
```
>> r2: none
== none
>> r1: reactor [x: 0 y: is [x] set 'r2 self]
== make object! [
    x: 0
    y: 0
]
>> probe same? r1 r2 ()
true
>> r1/x: 1 ?? r1
r1: make object! [     ;) reaction works
    x: 1
    y: 1
]
>> r2/x: 2 ?? r2
r2: make object! [     ;) reaction is ignored
    x: 2
    y: 1
]
```

**To reproduce**
```
r2: none
r1: reactor [x: 0 y: is [x] set 'r2 self]
probe same? r1 r2 () 
r1/x: 1 ?? r1
r2/x: 2 ?? r2
```

**Expected behavior**

`on-change` triggered

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-06T16:18:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5135#issuecomment-1119784229>

    Somewhat related: https://github.com/red/red/issues/3804 https://github.com/red/red/issues/4552 https://github.com/red/red/issues/4501 https://github.com/red/red/issues/3797 https://github.com/red/red/issues/3634

--------------------------------------------------------------------------------

On 2022-08-22T17:08:36Z, dockimbel, commented:
<https://github.com/red/red/issues/5135#issuecomment-1222651522>

    It is possible to change the object implementation to support such use-case (though, only for the interpreter, not sure it's doable for the compiler, probably not), but not easily in the general case where `self` value gets copied in an external slot (by setting it in another context or in an external series slot).
    
    Consider the following (simpler) use-case:
    ```
    new: none
    obj: context [
        x: 0
        on-change*: func [word old new][print "on-change event!"]
        set 'new self
    ]
    ```
    
    At the moment `new` is set, `self` refers to a well-formed object with two words set to the right values but the object event system processes the eventual events definitions and "activates" them once the body block has been fully evaluated. Those extra events info are then stored in the object value slot, but too late for `new` as a copy of that object slot has already been done. So under the current implemenation, `self` cannot be made reactive in the general case.
    
    Things can get even more difficult if the event handler is set _after_ the `new` word is set. Imagine that `new` is reactive and triggers an event handler that relies on `obj`... it will get an incomplete version, as `obj` hasn't evaluated its spec block fully yet... 
    ```
    new: none
    obj: context [
        z: 0
        set 'new self
        on-change*: func [word old new][print "on-change event!"]
    ]
    ```
    Those are the dangers of implicit code execution, and we should keep those cases in mind when writing down the Red specs and reconsidering the design of object events. Until then, I'll mark this ticket as "deferred".

--------------------------------------------------------------------------------

On 2022-08-22T17:16:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5135#issuecomment-1222660170>

    Additional implementation notes
    ----
    
    After considering how the current implementation could be changed to "make SELF reactive", that would require removing the `on-set` field in the `red-object!` slot, which is a cache for the following information:
    1. Presence of events handler in the object
    2. Index of each event handler in the object context
    3. Number of local words for each event handler
    
    Given that all contexts now rely on hashtables for lookups, 1. and 2. could be realized using one hashtable lookup per event (we have only 2 events now, but more in the future...). For 3., there's no easy alternative, as `red-function!` struct doesn't store such info directly, it's part of the function spec vector cache (`/args` field). Having to lookup the number of locals in the handler spec block on each event call would have a significant run-time cost if the events are firing at high-speed.

--------------------------------------------------------------------------------

On 2022-08-22T20:07:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5135#issuecomment-1222902455>

    Thanks for the info.
    
    > At the moment `new` is set, `self` refers to a well-formed object with two words set to the right values but the object event system processes the eventual events definitions and "activates" them once the body block has been fully evaluated. Those extra events info are then stored in the object value slot, but too late for `new` as a copy of that object slot has already been done. So under the current implemenation, `self` cannot be made reactive in the general case.
    
    Read this a few times, still don't get it :D 
    
    By the way, what you're writing is related to this annoyance (I haven't reported):
    ```
    >> o: object [a: 1 on-change*: func [w o n] [print [w :n]] b: 2]
    == make object! [
        a: 1
        b: 2
    ]
    >> ;) no reactions fired!
    >> p: make object [a: 1 on-change*: does []] [on-change*: func [w o n] [print [w :n]] b: 2]
    on-change* ?function?
    b 2
    == make object! [
        a: 1
        b: 2
    ]
    >> ;) now every change is detected by the newly assigned on-change func!
    ```
    That is, first object's (`o`) initialization is simply unreliable! If I rely on on-change to enforce some state invariants for this object, they won't hold true.
    
    As a workaround, I create a dummy object with `on-change*` defined, and then `make` it with new spec, and that works fine.
    
    It would be nice if object `o` could start triggering it's `on-change*` right after it's definition (i.e. catch `b: 2` at least).

--------------------------------------------------------------------------------

On 2022-08-23T14:32:38Z, dockimbel, commented:
<https://github.com/red/red/issues/5135#issuecomment-1224162320>

    > That is, first object's (o) initialization is simply unreliable! If I rely on on-change to enforce some state invariants for this object, they won't hold true.
    
    It works as expected, it's your expectations that are not realistic. There is no magic involved in setting `on-change*` word in an object context, it's a word like any other until some specific processing happens to register it as an object event. Such processing cannot happen while the object spec block is evaluated, as it is not part of Red language semantics. Therefore, such processing (which will register the eventual event handlers) happens necessarily _after_ the body block was evaluated. I hope my explanations is clearer that way.
    
    In my personal notes for improving it, I've removed the event handlers declaration from within the object spec block, they are separated and can be easily attached to any object.

--------------------------------------------------------------------------------

On 2022-08-26T21:51:51Z, dockimbel, commented:
<https://github.com/red/red/issues/5135#issuecomment-1228989315>

    Original reported case now supported as a side-effect of fixing several object events and `self` issues.

