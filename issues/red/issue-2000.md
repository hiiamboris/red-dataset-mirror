
#2000: Float division by zero to return 1.#INF or -1.#INF
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2000>

Currently dividing a float value by zero raises a script error. It would be more consistent if it returned 1.#INF or -1.#INF when multiplicative overflow returns an infinity value.

```
red>> 1.0e250 * 1.0e250
== 1.#INF
```



