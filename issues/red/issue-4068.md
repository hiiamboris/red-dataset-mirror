
#4068: Mixed (scalar+vector) operations ignore commutativity rules
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.design]
<https://github.com/red/red/issues/4068>

**Describe the bug**

Operations in question are: `divide` and `remainder`
When:
- the 1st argument is a scalar
- the 2nd argument is either `pair!`, `tuple!` or `vector!`

It just swaps the arguments, producing an unexpected result:
```
>> divide 10 make vector! [11.0 22.0 33.0]
== make vector! [1.1 2.2 3.3]

>> remainder 10 11.22.33
== 1.2.3
>> remainder 10 11x22
== 1x2
>> remainder 10 make vector! [11 22 33]
== make vector! [1 2 3]
```

**Expected behavior**
Respectively:
`make vector! [0.9090909090909091 0.45454545454545453 0.30303030303030304]`
`10.10.10`
`10x10`
`make vector! [10 10 10]`

Either [`vector/do-math-scalar`](https://github.com/red/red/blob/27b18e2ddba7726066068818eef280d88af5bf10/runtime/datatypes/vector.reds#L416) should accept a flag that the arguments were swapped and consider that when it calls `float/do-math-op` and `integer/do-math-op`.
Or these operations should be forbidden (firing an error)


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



