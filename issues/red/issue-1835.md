
#1835: map! regressions
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/1835>

Latest build have some regressions on map! type:

Problem with select/case:

```
red>> m: make map! [a 1 A 2]
red>> select/case m 'A ;== none
red>> select/case m 'a ;== none
```

Problem on overwriting a value:

```
red>> m: make map! [a: 1 a 2]
== #(
    a: 1
    a: 2
)

red>> m: make map! [a 1 a: 2]
== #(
    a: 2
)
```

Problem with set-/lit-/get- words

```
red>> m: make map! [a 1 A 2 a: 3 :a 4]
== #(
    a: 3
    A: 2
    a: 4
)
red>> select m 'a
== 3
red>> select m first [a:]
== 3
red>> select m first [:a]
== 3
red>> select/case m first [:a]
== none
red>> select/case m first [a:]
== 3
red>> select/case m first [A]
== none
red>> select/case m 'A
== none
```

Also look at #1834 for problems with `extend`



