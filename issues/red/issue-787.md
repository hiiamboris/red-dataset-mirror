
#787: REDUCE/into and COMPOSE/into do not always return a block
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/787>

```
red>> head reduce/into "a" []
== "a"  ; should be ["a"]

red>> head compose/into "a" []
== "a"  ; should be ["a"]
```

See same issues in Rebol3 tickets [2061](http://issue.cc/r3/2061) and [2062](http://issue.cc/r3/2062).



