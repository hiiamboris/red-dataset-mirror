
#3680: REPEND can corrupt hash! series
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3680>

Appending an integer to a `hash!` using `repend` makes the subsequent lookups on that integer value fail. If the integer is added to the hash using `append`, it works as expected. 

```
>> items: make hash! []
== make hash! []
>> repend items [1]
== make hash! [1]
>> find items 1
== none
```
```
>> items: make hash! []
== make hash! []
>> append items [1]
== make hash! [1]
>> find items 1
== make hash! [1]
```

Relates to #2998.


