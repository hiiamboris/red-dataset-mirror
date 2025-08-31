
#3071: PARSE/TRACE appends TRUE to COLLECTed block instead of KEEPed value from paren! expression
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3071>

```Red
>> parse "abc" [collect some [skip keep ('ok)]] 
== [ok ok ok] 
>> parse/trace "abc" [collect some [skip keep ('ok)]] func [what the hell is this?][yes] 
== [true true true]
```
w/o `true` value returned from callback function it's `[unset unset unset]`.


