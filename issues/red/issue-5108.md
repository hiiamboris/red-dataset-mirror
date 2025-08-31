
#5108: Extra block copy in make map!
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5108>

**Describe the bug**

Looks like map is copying it's own spec on `make`:
```
>> recycle/off
>> prof/each/times [copy #(x: 1 y: 2) make map! [x: 1 y: 2] copy [x: 1 y: 2]] 10000
<10000> 20%      .00076ms         272 B [copy #(x: 1 y: 2)]
<10000> 40%      .00152ms         364 B [make map! [x: 1 y: 2]]
<10000> 40%      .00151ms          92 B [copy [x: 1 y: 2]]
>> 364 - 92
== 272
```

**To reproduce**

`s: stats loop n: 10000 [make map! [x: 1 y: 2]] stats - s / n`

**Expected behavior**

272 bytes from `make` as from `copy`

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-19T01:49:59Z, qtxie, commented:
<https://github.com/red/red/issues/5108#issuecomment-1072915864>

    If insert a `recycle` before `stats`, I got this:
    ```
    >> recycle s: stats loop n: 10000 [make map! [x: 1 y: 2]] recycle stats - s / n
    root: 3768/6544, runs: 0, mem: 1819248 => 1807840, mark: 2.0ms, sweep: 1.0ms
    root: 3768/6544, runs: 1, mem: 3284648 => 1808628, mark: 0.8ms, sweep: 1.0ms
    root: 3768/6544, runs: 2, mem: 3972516 => 1808536, mark: 2.0ms, sweep: 2.0ms
    == 0.0464
    >> recycle s: stats loop n: 10000 [make map! [x: 1 y: 2]] recycle stats - s / n
    root: 3768/6544, runs: 3, mem: 1809936 => 1808724, mark: 2.0ms, sweep: 1.0ms
    root: 3768/6544, runs: 4, mem: 5448724 => 1808724, mark: 2.0ms, sweep: 2.0ms
    == 0
    ```

--------------------------------------------------------------------------------

On 2022-03-19T08:17:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/5108#issuecomment-1072967344>

    What would be the point? Measuring memory that's not freed by recycle?

--------------------------------------------------------------------------------

On 2022-03-19T13:51:26Z, qtxie, commented:
<https://github.com/red/red/issues/5108#issuecomment-1073014145>

    Sorry, I misunderstood the issue. So it's about the implementation detail. You want that `make` takes the same amount of memory as `copy`?

--------------------------------------------------------------------------------

On 2022-03-19T16:00:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/5108#issuecomment-1073034713>

    Yeah. Extra block is just unnecessary GC pressure in this case.

