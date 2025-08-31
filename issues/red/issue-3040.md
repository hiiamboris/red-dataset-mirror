
#3040: `put/select` doesn't work together on hash!
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3040>

```
>> m: to-hash []
== make hash! []
>> put m 'a 1
== 1
>> select m 'a
== none  ; >> should be 1
>> find m 'a
== none  ; >> should be make hash! [a 1]
>> m
== make hash! [a 1]
>> to-block m
== [a 1]
>> n: make hash! [a 1] ; while literal hash works as expected
== make hash! [a 1]
>> select n 'a
== 1
>> find n 'a
== make hash! [a 1]
>> m = n
== true
>> about
Red for Windows version 0.6.3 built 17-Sep-2017/11:38:27+02:00
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-17T15:56:28Z, 9214, commented:
<https://github.com/red/red/issues/3040#issuecomment-330058327>

    Side note: looks like a regression in `hash!`, [see details](https://gitter.im/red/help?at=59be3d9ebc4647297443e15a).

