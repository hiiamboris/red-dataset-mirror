
#2007: Attempting to make an empty image! value leads to crash
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2007>

Try the following:

```
img: make image! 0x0 ; or ...x0 or 0x...
```

With other series types, the value 0 for length (or size) leads to an empty series (block, string, etc.). An empty image! is not handled safely, apparently. The same crash occurs with `copy/part img 0`.



