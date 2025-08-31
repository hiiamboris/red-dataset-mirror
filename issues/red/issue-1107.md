
#1107: Memory error: series too big!
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
<https://github.com/red/red/issues/1107>

Would it be possible to enable support for big series and fix current odd results?

```
red>> s: make string! 200'000'000
Memory error: series too big!
red>> s: make string! 20'000'000
Memory error: series too big!
red>> s: make string! 2'000'000
== ""
red>> s: make string! 16777216
Memory error: series too big!
== {""}
red>> s: make string! 2097152
Memory error: series too big!
== {{""}}
red>> s
== string!
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-28T03:53:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1107#issuecomment-96901825>

    The big series! implementation is still incomplete, as this is quite low priority in short term, I have no ETA for it. Though, it will be done before the beta stage.

