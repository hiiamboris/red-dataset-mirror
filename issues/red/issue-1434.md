
#1434: pairs and integers must be literal in draw blocks
================================================================================
Issue is open, was reported by WiseGenius and has 0 comment(s).
[status.reviewed] [GUI] [type.task.wish]
<https://github.com/red/red/issues/1434>

Using a word preset to a `pair!` or `integer!` value in a `draw` block in place of a literal pair or integer is not accepted as valid:

```
red>> p: 50x50
== 50x50
red>> draw 100x100 [circle p 20]
*** Script error: invalid Draw dialect input at: circle p 20
*** Where: draw-image
```

```
red>> r: 20
== 20
red>> draw 100x100 [circle 50x50 r]
*** Script error: invalid Draw dialect input at: circle 50x50 r
*** Where: draw-image
```

This despite the acceptance of words set to `tuple!`, `image!` and `object!`:

```
red>> c: 1.2.3.4
== 1.2.3.4
red>> i: draw 100x100 [circle 50x50 20]
== make image! [100x100 #{
000000000000000000000000000000000000000000...
red>> f: make font! [name: "Comic Sans MS"]
== make object! [
    name: "Comic Sans MS"
    size: none
    style:...
red>> draw 100x100 [pen c font f image i 50x50]
== make image! [100x100 #{
000000000000000000000000000000000000000000...
```



