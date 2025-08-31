
#2653: DOC or BUG?     issue! is never equal to word with the same symbol
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/2653>

The first two cases of course need the `quote`
```
>> 'a = quote :a
== true
>> 'a = quote a:
== true
>> 'a = /a
== true
>> 'a = #a
== false
```



Comments:
--------------------------------------------------------------------------------

On 2017-05-06T04:30:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2653#issuecomment-299614974>

    That's intended, as issue! is word-like by implementation only, not by purpose or usage.

--------------------------------------------------------------------------------

On 2017-05-06T08:17:29Z, meijeru, commented:
<https://github.com/red/red/issues/2653#issuecomment-299624088>

    Thanks,I thought so.

