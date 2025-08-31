
#5422: [Regression] FORALL stops now after a fixed number of iterations
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5422>

**Describe the bug**

Same code:
`i: last s: [1 2 3 4 5] forall s [if even? s/1 [append s i: i + 1]] s`

In Red 0.6.4 and R2:
```
== [1 2 3 4 5 6 7 8 9]
```
In today's Red:
```
== [1 2 3 4 5 6 7]
```

**Expected behavior**

`forall` checking the tail condition, rather than counting.

**Platform version**
```
Red 0.6.4 for Windows built 30-Oct-2023/11:45:38+03:00  commit #377b5ed
```


