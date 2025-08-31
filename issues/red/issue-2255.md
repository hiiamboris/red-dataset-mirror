
#2255: FIND matches 1.#NAN for number! values
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2255>

1.#INF is OK.

```
red>> find [0 0 0 0 1.#NAN 1.#INF] 2
== [1.#NaN 1.#INF]
red>> find [0 0 0 0 1.#INF] 2
== none
red>> find [1.#NAN] 2.0
== [1.#NaN]
red>> find [1.#NAN] 4%
== [1.#NaN]
red>> find [a #b 4 5.0 6%] 1.#NAN
== [4 5.0 6%]
```



