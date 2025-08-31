
#2046: MOVE returns the wrong result
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2046>

It should return the remove point of the origin arg, like REMOVE, per @dockimbel.

```
red>> b1: [a b c]
== [a b c]
red>> b2: []
== []
red>> move b1 b2
== [a]
red>> b1
== [b c]
red>> b2
== [a]


red>> s: "hello"
== "hello"
red>> move s tail s
== ""
```



